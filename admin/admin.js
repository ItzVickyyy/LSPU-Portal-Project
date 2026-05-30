/**
 * =============================================================================
 * admin.js
 * LSPU Enrollment System — Admin Dashboard JavaScript
 * =============================================================================
 *
 * Project   : Laguna State Polytechnic University (LSPU) Enrollment System
 * Module    : Admin Dashboard
 * File      : admin.js
 * Depends on: admin_api.php  (REST-like PHP back-end endpoint)
 *             admin.css      (companion stylesheet)
 *
 * OVERVIEW
 * --------
 * Single-file front-end controller for the Admin Dashboard.
 * Communicates with admin_api.php via two thin HTTP wrappers:
 *   api()  – GET requests (fetches lists, detail records, dashboard stats)
 *   post() – POST/JSON requests (create, update, delete operations)
 * All dynamic content is rendered by writing HTML strings into pre-existing
 * DOM containers identified by stable kebab-case IDs.
 *
 * TABLE OF CONTENTS
 * -----------------
 *  1.  Config                    – API base URL constant
 *  2.  Helpers                   – toast(), api(), post(), pill(), fmt(),
 *                                  fmtDateTime(), empty(), infoRow(),
 *                                  debounce(), closeModal(), openModal()
 *  3.  College Cache             – getColleges(), _fillCollegeSel()
 *  4.  Navigation                – loaders map, showSection()
 *  5.  Campus Dropdown Init      – initCampusDropdowns()
 *  6.  DOMContentLoaded Bootstrap– nav wiring, initial section load
 *  7.  Dashboard                 – loadDashboard()
 *  8.  Applicants                – loadApplicants(), applSort(), filtering,
 *                                  openAddApplicantModal(), saveNewApplicant(),
 *                                  viewApplicant(), editApplicant(),
 *                                  saveEditApplicant(), deleteApplicant(),
 *                                  bulkSetStatus(), bulkDeleteApplicants(),
 *                                  exportApplicantsCSV(), date filters,
 *                                  clearBulkSelection(), pagination
 *  9.  Students                  – loadStudents(), stuSort(), filtering,
 *                                  viewStudent(), editStudent(),
 *                                  saveEditStudent(), stuBulkSetStatus(),
 *                                  exportStudentsCSV(), grade/payment panels,
 *                                  printStudentRecord() trigger
 * 10.  Programs                  – loadPrograms(), progSort(),
 *                                  openAddProgramModal(), saveNewProgram(),
 *                                  editProgram(), saveEditProgram(),
 *                                  deleteProgram(), bulkDeletePrograms(),
 *                                  specialisation CRUD, exportProgramsCSV()
 * 11.  Subjects                  – loadSubjects(), subjSort(),
 *                                  openAddSubjectModal(), saveNewSubject(),
 *                                  editSubject(), saveEditSubject(),
 *                                  deleteSubject(), bulkDeleteSubjects(),
 *                                  exportSubjectsCSV()
 * 12.  Instructors               – loadInstructors(), instSort(),
 *                                  openAddInstructorModal(), saveNewInstructor(),
 *                                  editInstructor(), saveEditInstructor(),
 *                                  deleteInstructor(), bulkDeleteInstructors(),
 *                                  exportInstructorsCSV()
 * 13.  Sections                  – loadSections(), loadStuSections(),
 *                                  add/edit/delete section
 * 14.  Colleges                  – loadColleges(), add/edit/delete,
 *                                  bulkDeleteColleges()
 * 15.  Campus                    – loadCampus(), add/edit/delete campus
 * 16.  Semesters                 – loadSemesters(), add/edit/delete,
 *                                  open/close toggle modal
 * 17.  Admins / User Management  – loadAdmins(), saveAdminAccount(),
 *                                  deactivate/activate, changeRole()
 * 18.  Logout                    – handleLogout(), confirmLogout()
 * 19.  Bulk Enrollment Modal     – openBulkEnrollModal(), confirmEnrollment()
 * 20.  Print / PDF               – _prCell(), printStudentRecord()
 *
 * CONVENTIONS
 * -----------
 *  • Pagination state: _<section>Page, _<section>Total (e.g. _applPage)
 *  • Sort state:       _<section>SortCol / _<section>SortDir
 *  • Private helpers prefixed with underscore (_prCell, _fillCollegeSel, …)
 *  • All fetch errors surface via toast(); console.error for detail
 *
 * =============================================================================
 */

// ── CONFIG ────────────────────────────────────────────────────────────────
const API = 'api.php';

// ── HELPERS ───────────────────────────────────────────────────────────────
function toast(msg, type = '') {
  const el = document.getElementById('toast');
  el.textContent = msg;
  el.className = 'show' + (type ? ' ' + type : '');
  setTimeout(() => el.className = '', 3200);
}

async function api(resource, params = {}, options = {}) {
  const url = new URL(API, location.href);
  url.searchParams.set('resource', resource);
  for (const [k, v] of Object.entries(params)) if (v !== undefined && v !== '') url.searchParams.set(k, v);
  try {
    const r = await fetch(url, options);
    const text = await r.text();
    try {
      return JSON.parse(text);
    } catch (jsonErr) {
      console.error(`[API] ${resource} — invalid JSON response:`, text);
      toast(`Server error on '${resource}' — check browser console (F12) for details.`, 'err');
      return { ok: false, msg: text };
    }
  } catch (e) {
    toast('Network error — is the server running?', 'err');
    return { ok: false };
  }
}

async function post(resource, body = {}) {
  const url = new URL(API, location.href);
  url.searchParams.set('resource', resource);
  try {
    const r = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    return await r.json();
  } catch (e) {
    toast('Network error', 'err');
    return { ok: false };
  }
}

function pill(status) {
  const map = {
    Active: 'pill-active', Inactive: 'pill-inactive', Enrolled: 'pill-enrolled',
    Pending: 'pill-pending', Draft: 'pill-draft', Submitted: 'pill-submitted',
    Rejected: 'pill-rejected', Paid: 'pill-paid', LOA: 'pill-loa'
  };
  const cls = map[status] || 'pill-pending';
  return `<span class="pill ${cls}">${status}</span>`;
}

function fmt(d) { return d ? new Date(d).toLocaleDateString('en-PH', { month: 'short', day: 'numeric', year: 'numeric' }) : '—'; }
function fmtDateTime(d) { return d ? new Date(d).toLocaleString('en-PH', { month: 'short', day: 'numeric', year: 'numeric', hour: 'numeric', minute: '2-digit' }) : '—'; }
function empty(cols, msg = 'No records found.') {
  return `<tr><td colspan="${cols}" class="empty"><i class="fas fa-inbox"></i><p>${msg}</p></td></tr>`;
}
function infoRow(k1, v1, k2, v2) {
  const cell = (k, v) => `<div class="info-cell"><div class="info-key">${k}</div><div class="info-val">${v || '—'}</div></div>`;
  return cell(k1, v1) + (k2 !== undefined ? cell(k2, v2) : '<div class="info-cell"></div>');
}

const timers = {};
function debounce(fn, delay) {
  return function (...args) {
    clearTimeout(timers[fn.name]);
    timers[fn.name] = setTimeout(() => fn(...args), delay);
  };
}

function closeModal(id) { document.getElementById(id).classList.remove('open'); }
function openModal(id) { document.getElementById(id).classList.add('open'); }

// ── COLLEGES CACHE ────────────────────────────────────────────────────────
// Fetched once at init; reused by Program, Subject, and Instructor modals.
let _collegesCache = null;
async function getColleges() {
  if (!_collegesCache) {
    const res = await api('colleges');
    _collegesCache = res.data || [];
  }
  return _collegesCache;
}
function _fillCollegeSel(selId, preSelectId) {
  getColleges().then(cols => {
    const sel = document.getElementById(selId);
    if (!sel) return;
    sel.innerHTML = '<option value="">— Select College —</option>';
    cols.forEach(c => {
      const val = c.college_id || c.college_code;
      sel.innerHTML += `<option value="${val}" ${(preSelectId != null && String(preSelectId) === String(val)) ? 'selected' : ''}>${c.college_name}</option>`;
    });
  });
}

// ── NAVIGATION ────────────────────────────────────────────────────────────
const loaders = {
  dashboard: loadDashboard,
  applicants: loadApplicants,
  students: loadStudents,

  programs: loadPrograms,
  subjects: loadSubjects,
  instructors: loadInstructors,
  colleges: loadColleges,
  campus: loadCampus,
  sections: loadSections,
  semesters: loadSemesters,
  registrar: () => { }, // deprecated — staff managed via User Management
  admins: loadAdmins,
};

let currentSection = 'dashboard';

function showSection(name) {
  document.querySelectorAll('.section').forEach(s => s.classList.remove('active'));
  document.querySelectorAll('.nav-item').forEach(n => n.classList.remove('active'));
  document.getElementById('sec-' + name)?.classList.add('active');
  document.querySelector(`[data-section="${name}"]`)?.classList.add('active');
  currentSection = name;
  // Replace state so back button always leaves the dashboard entirely (goes to login/index)
  history.replaceState({ section: name }, '', location.href);
  if (loaders[name]) loaders[name]();
}

// ── CAMPUS DROPDOWN INITIALISATION ────────────────────────────────────────
// Replaces all hardcoded campus <option> sets with live data from the API.
// Called once at page load; targets every select that has data-campus-sel.
async function initCampusDropdowns() {
  const res = await api('campus');
  const campuses = (res.data || []);
  if (!campuses.length) return; // API returned nothing — dropdowns stay at placeholder only

  const selectors = [
    'appl-campus',   // applicants filter
    'stu-campus',    // students filter
    'na-campus',     // Add Applicant modal
    'ea-campus',     // Edit Applicant modal
    'sect-campus',   // Add Section modal
    'inst-campus',   // Add Instructor modal
  ];
  selectors.forEach(id => {
    const sel = document.getElementById(id);
    if (!sel) return;
    const prev = sel.value;
    // Keep only the first "All Campuses / — Select Campus —" option
    while (sel.options.length > 1) sel.remove(1);
    campuses.forEach(c => {
      const o = document.createElement('option');
      o.value = c.Campus_Name;
      o.textContent = c.Campus_Name;
      sel.appendChild(o);
    });
    if (prev) sel.value = prev; // restore if already selected
  });
}

document.addEventListener('DOMContentLoaded', () => {
  // Wire nav items
  document.querySelectorAll('.nav-item[data-section]').forEach(el => {
    el.addEventListener('click', () => showSection(el.dataset.section));
  });
  initCampusDropdowns();
  loadStuSections(); // pre-populate sections dropdown
  showSection('dashboard');

  // Browser back button: replaceState is used in showSection so sections
  // don't pollute history. Intercept popstate so the browser back goes to
  // whatever page was visited before admin.html (i.e. the login page).
  window.addEventListener('popstate', () => {
    // Navigate away from admin back to the login / index page
    window.location.replace('../index.html');
  });
  // Set the initial history entry so a back-press triggers popstate
  history.pushState(null, '', location.href);
});

// ══════════════════════════════════════════════════════════════════════════
// DASHBOARD
// ══════════════════════════════════════════════════════════════════════════
async function loadDashboard() {
  const res = await api('dashboard');
  if (!res.ok) return;
  const d = res.data;

  document.getElementById('dash-stats').innerHTML = `
<div class="stat-card"><div class="sc-label">Pipeline Applicants</div><div class="sc-value">${d.total_applicants}</div><div class="sc-sub">Pending · Draft · Submitted · Rejected</div></div>
<div class="stat-card green" style="cursor:pointer" onclick="showSection('students')" title="View in Students"><div class="sc-label">Enrolled → Students</div><div class="sc-value">${d.enrolled}</div><div class="sc-sub">${d.total_students} total · ${d.active_students} active · ${d.active_enrollments} this semester</div></div>
<div class="stat-card gold"><div class="sc-label">Submitted</div><div class="sc-value">${d.submitted}</div><div class="sc-sub">Awaiting review</div></div>
<div class="stat-card red"><div class="sc-label">Pending Review</div><div class="sc-value">${d.pending || 0}</div><div class="sc-sub">Needs action</div></div>
  `;

  // Bar chart — exclude Enrolled since those aren't applicants anymore
  const pipelineStatuses = ['Pending', 'Draft', 'Submitted', 'Rejected'];
  const pipelineDist = Object.fromEntries(Object.entries(d.status_distribution).filter(([s]) => s !== 'Enrolled'));
  const total = Object.values(pipelineDist).reduce((a, b) => a + b, 0) || 1;
  const statusColors = { Submitted: '#0B5ED7', Pending: '#f4b400', Draft: '#6b7280', Rejected: '#dc3545' };
  document.getElementById('dash-bar').innerHTML = Object.entries(pipelineDist).map(([s, n]) => `
<div class="bar-row">
  <span class="bar-label">${s}</span>
  <div class="bar-track"><div class="bar-fill" style="width:${Math.round(n / total * 100)}%;background:${statusColors[s] || '#0B5ED7'}"></div></div>
  <span class="bar-val">${n}</span>
</div>
  `).join('') || '<p style="color:var(--muted);font-size:.85rem">No data</p>';

  // Recent
  document.getElementById('dash-recent').innerHTML = d.recent_applicants.length
    ? d.recent_applicants.map(a => `
    <div class="recent-item">
      <div>
        <div class="recent-name">${a.name}</div>
        <div class="recent-email">${a.Email}</div>
      </div>
      ${pill(a.application_status)}
    </div>
  `).join('')
    : '<p style="color:var(--muted);font-size:.85rem">No applicants yet</p>';
}

// ══════════════════════════════════════════════════════════════════════════
// APPLICANTS  (with client-side pagination + sortable columns)
// ══════════════════════════════════════════════════════════════════════════
let _applAllRows = [];   // full result set
let _applPage = 1;
let _applSortCol = 'id';
let _applSortDir = 'asc'; // 'asc' | 'desc'
const APPL_PER_PAGE = 50;

async function loadApplicants() {
  const search = document.getElementById('appl-search').value;
  const status = document.getElementById('appl-status').value;
  const campus = document.getElementById('appl-campus').value;
  const program = document.getElementById('appl-program').value;
  const dateFrom = document.getElementById('appl-date-from').value;
  const dateTo = document.getElementById('appl-date-to').value;
  const tbody = document.getElementById('appl-tbody');
  tbody.innerHTML = `<tr><td colspan="8" class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</td></tr>`;
  document.getElementById('appl-pagination').style.display = 'none';
  const applCntEl = document.getElementById('appl-result-count');
  if (applCntEl) applCntEl.textContent = '';

  // Populate program dropdown once (if empty)
  const progSel = document.getElementById('appl-program');
  if (progSel.options.length <= 1) {
    const pRes = await api('programs');
    (pRes.data || []).forEach(p => {
      const o = document.createElement('option');
      o.value = p.Program_Code;
      o.textContent = `${p.Program_Code} — ${p.Program_Name}`;
      progSel.appendChild(o);
    });
  }

  const res = await api('applicants', { search, status, campus, program, date_from: dateFrom, date_to: dateTo });
  if (!res.ok) { tbody.innerHTML = empty(9, `Failed to load: ${res.msg || 'unknown error'}`); return; }

  // Show enrolled-count banner
  const banner = document.getElementById('appl-enrolled-banner');
  const bannerText = document.getElementById('appl-enrolled-text');
  if (banner && bannerText && res.enrolled_count != null) {
    if (res.enrolled_count > 0) {
      bannerText.textContent = `${res.enrolled_count} applicant${res.enrolled_count !== 1 ? 's' : ''} enrolled this cycle — moved to Students`;
      banner.style.display = '';
    } else {
      banner.style.display = 'none';
    }
  }

  if (!res.data.length) {
    tbody.innerHTML = empty(9);
    const rc = document.getElementById('appl-result-count');
    if (rc) rc.textContent = '0 applicants found';
    return;
  }

  // Server handles search, status, campus, program, date range.
  // Client-side middle-name pass refines the search result (covers middle names
  // not included in the server-side LIKE on First_Name/Last_Name/Email).
  const q = search.trim().toLowerCase();
  let rows = q
    ? res.data.filter(r => {
      const fullName = [r.First_Name, r.Middle_Name, r.Last_Name, r.Suffix, r.full_name]
        .filter(Boolean).join(' ').toLowerCase();
      return fullName.includes(q) || (r.Email || '').toLowerCase().includes(q);
    })
    : res.data;

  _applAllRows = rows;
  _applPage = 1;
  _applRender();
}

function applSort(col) {
  if (_applSortCol === col) {
    _applSortDir = _applSortDir === 'asc' ? 'desc' : 'asc';
  } else {
    _applSortCol = col;
    _applSortDir = 'asc';
  }
  _applPage = 1;
  _applRender();
}

// ── Shared pagination builder ─────────────────────────────────────────────
// Builds the page-buttons-with-ellipsis markup and wires up the info text.
// Avoids copy-pasting the same block inside _applRender, _stuRender, etc.
//
//   cur        — current page number (1-based)
//   totalPages — total number of pages
//   total      — total number of records (for the "X–Y of Z" label)
//   perPage    — records per page (for the "X–Y of Z" label)
//   pgBar      — the outer pagination <div> element
//   pgInfo     — the <span> that shows "Showing X–Y of Z …"
//   pgControls — the <div> that receives the button HTML
//   onPage     — callback(pageNumber) called when a button is clicked
//   noun       — singular noun used in the info label, e.g. "applicant"
//
function buildPagination(cur, totalPages, total, perPage, pgBar, pgInfo, pgControls, onPage, noun) {
  if (totalPages <= 1) { pgBar.style.display = 'none'; return; }
  pgBar.style.display = 'flex';

  const from = (cur - 1) * perPage + 1;
  const to = Math.min(cur * perPage, total);
  pgInfo.textContent = `Showing ${from}–${to} of ${total} ${noun}${total !== 1 ? 's' : ''}`;

  let pages = [];
  if (totalPages <= 7) {
    pages = Array.from({ length: totalPages }, (_, i) => i + 1);
  } else {
    pages = [1];
    if (cur > 3) pages.push('…');
    for (let i = Math.max(2, cur - 1); i <= Math.min(totalPages - 1, cur + 1); i++) pages.push(i);
    if (cur < totalPages - 2) pages.push('…');
    pages.push(totalPages);
  }

  pgControls.innerHTML =
    `<button class="pg-btn" ${cur === 1 ? 'disabled' : ''} onclick="(${onPage})(${cur - 1})">
       <i class="fas fa-chevron-left"></i>
     </button>` +
    pages.map(p =>
      p === '…'
        ? `<span class="pg-ellipsis">…</span>`
        : `<button class="pg-btn ${p === cur ? 'active' : ''}" onclick="(${onPage})(${p})">${p}</button>`
    ).join('') +
    `<button class="pg-btn" ${cur === totalPages ? 'disabled' : ''} onclick="(${onPage})(${cur + 1})">
       <i class="fas fa-chevron-right"></i>
     </button>`;
}

function _applRender() {
  // --- sort ---
  const dir = _applSortDir === 'asc' ? 1 : -1;
  const col = _applSortCol;

  // Columns that should sort numerically
  const numericCols = new Set(['id']);
  // Columns that should sort as dates
  const dateCols = new Set(['created_at']);

  const sorted = [..._applAllRows].sort((a, b) => {
    if (numericCols.has(col)) {
      const na = Number(a[col] ?? 0);
      const nb = Number(b[col] ?? 0);
      return (na - nb) * dir;
    }
    if (dateCols.has(col)) {
      const da = a[col] ? new Date(a[col]).getTime() : 0;
      const db = b[col] ? new Date(b[col]).getTime() : 0;
      return (da - db) * dir;
    }
    const va = (a[col] ?? '').toString().toLowerCase();
    const vb = (b[col] ?? '').toString().toLowerCase();
    return va < vb ? -dir : va > vb ? dir : 0;
  });

  // --- update header indicators ---
  document.querySelectorAll('#sec-applicants th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === col) th.classList.add(_applSortDir === 'asc' ? 'sort-asc' : 'sort-desc');
  });

  // --- paginate ---
  const total = sorted.length;
  const totalPages = Math.ceil(total / APPL_PER_PAGE);
  if (_applPage > totalPages) _applPage = totalPages || 1;
  const start = (_applPage - 1) * APPL_PER_PAGE;
  const page = sorted.slice(start, start + APPL_PER_PAGE);

  // --- render rows ---
  const tbody = document.getElementById('appl-tbody');
  tbody.innerHTML = page.map((r) => `
<tr>
  <td class="col-check"><input type="checkbox" class="row-cb appl-cb" value="${r.id}" onchange="onApplCheckChange()" /></td>
  <td><strong>${r.full_name || '—'}</strong></td>
  <td style="font-size:.8rem;color:var(--muted)">${r.Email}</td>
  <td style="font-size:.8rem">${r.campus || '—'}</td>
  <td><code>${r.Program_Code || '—'}</code></td>
  <td>
    ${r.application_status === 'Enrolled'
      ? `<span class="pill pill-enrolled" style="font-size:.72rem">Enrolled</span>`
      : `<select class="status-select" onchange="updateApplicantStatus(${r.id},this.value)" style="color:${statusColor(r.application_status)}">
           ${['Pending', 'Draft', 'Submitted', 'Rejected'].map(s => `<option ${s === r.application_status ? 'selected' : ''}>${s}</option>`).join('')}
         </select>`
    }
  </td>
  <td style="font-size:.8rem;color:var(--muted)">${fmt(r.created_at)}</td>
  <td>
    <div class="action-btns">
      <button class="btn btn-outline btn-sm" onclick="viewApplicant(${r.id})"><i class="fas fa-eye"></i> View</button>
      ${r.application_status !== 'Enrolled'
      ? `<button class="btn btn-success btn-sm" onclick="enrollSingleApplicant(${r.id})" title="Convert to Student"><i class="fas fa-user-graduate"></i> Enroll</button>`
      : ''
    }
      ${r.application_status !== 'Enrolled'
      ? `<button class="btn btn-danger btn-sm" onclick="deleteApplicant(${r.id},'${(r.full_name || '').replace(/'/g, "\\\\'")}')"><i class="fas fa-trash"></i> Delete</button>`
      : `<button class="btn btn-danger btn-sm" disabled title="Cannot delete an enrolled applicant" style="opacity:.45;cursor:not-allowed"><i class="fas fa-trash"></i> Delete</button>`
    }
    </div>
  </td>
</tr>
  `).join('');

  // --- result count (always visible) ---
  const countEl = document.getElementById('appl-result-count');
  if (countEl) countEl.textContent = `${total} applicant${total !== 1 ? 's' : ''} found`;

  // --- pagination bar (shared helper) ---
  buildPagination(
    _applPage, totalPages, total, APPL_PER_PAGE,
    document.getElementById('appl-pagination'),
    document.getElementById('appl-pg-info'),
    document.getElementById('appl-pg-controls'),
    _applGoPage,
    'applicant'
  );
}

function _applGoPage(p) {
  _applPage = p;
  _applRender();
  // scroll table into view smoothly
  document.getElementById('sec-applicants').scrollIntoView({ behavior: 'smooth', block: 'start' });
}

function statusColor(s) {
  const m = { Enrolled: '#1a6b3c', Submitted: '#0B5ED7', Pending: '#7a5000', Draft: '#6b7280', Rejected: '#dc3545' };
  return m[s] || '#0b1f3a';
}

async function updateApplicantStatus(id, status) {
  if (status === 'Enrolled') {
    const res = await api('applicants', { id });
    if (!res.ok || !res.data) { toast('Could not load applicant.', 'err'); loadApplicants(); return; }
    await openEnrollModal(res.data);
    // Always reload after modal closes (whether confirmed or cancelled)
    // so the status dropdown snaps back if the user dismissed the modal.
    loadApplicants();
    return;
  }
  const res = await post('applicants', { action: 'update_status', applicant_id: id, status });
  toast(res.ok ? `Status set to ${status}` : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) loadApplicants();
}

async function enrollSingleApplicant(id) {
  const res = await api('applicants', { id });
  if (!res.ok || !res.data) { toast('Could not load applicant.', 'err'); return; }
  await openEnrollModal(res.data);
}

// ── BULK ACTIONS ──────────────────────────────────────────────────────────
function getCheckedIds() {
  return [...document.querySelectorAll('.appl-cb:checked')].map(cb => cb.value);
}

function onApplCheckChange() {
  const ids = getCheckedIds();
  const bar = document.getElementById('appl-bulk-bar');
  const countEl = document.getElementById('appl-bulk-count');
  if (ids.length > 0) {
    bar.classList.add('visible');
    countEl.textContent = `${ids.length} applicant${ids.length > 1 ? 's' : ''} selected`;
  } else {
    bar.classList.remove('visible');
  }
  // Sync select-all checkbox state
  const allCbs = document.querySelectorAll('.appl-cb');
  const allCheck = document.getElementById('appl-check-all');
  if (allCheck) {
    allCheck.indeterminate = ids.length > 0 && ids.length < allCbs.length;
    allCheck.checked = ids.length > 0 && ids.length === allCbs.length;
  }
}

function toggleAllCheckboxes(masterCb) {
  document.querySelectorAll('.appl-cb').forEach(cb => cb.checked = masterCb.checked);
  onApplCheckChange();
}

function clearBulkSelection() {
  document.querySelectorAll('.appl-cb').forEach(cb => cb.checked = false);
  const allCheck = document.getElementById('appl-check-all');
  if (allCheck) { allCheck.checked = false; allCheck.indeterminate = false; }
  document.getElementById('appl-bulk-bar').classList.remove('visible');
}

async function bulkSetStatus(status) {
  const ids = getCheckedIds();
  if (!ids.length) return;

  if (status === 'Enrolled') {
    await openEnrollModalBulk(ids);
    return;
  }

  if (!confirm(`Set ${ids.length} applicant(s) to "${status}"?`)) return;

  let successCount = 0;
  await Promise.all(ids.map(async id => {
    const res = await post('applicants', { action: 'update_status', applicant_id: id, status });
    if (res.ok) successCount++;
  }));

  toast(`${successCount} of ${ids.length} updated to "${status}"`, successCount === ids.length ? 'ok' : 'err');
  clearBulkSelection();
  loadApplicants();
}

async function bulkDeleteApplicants() {
  const ids = getCheckedIds();
  if (!ids.length) return;
  if (!confirm(`Permanently delete ${ids.length} applicant(s)? This cannot be undone.\n\nNote: enrolled applicants will be skipped automatically.`)) return;

  let deleted = 0, skipped = 0, failed = 0;
  await Promise.all(ids.map(async id => {
    const res = await post('applicants', { action: 'delete', applicant_id: id });
    if (res.ok) deleted++;
    else if (res.msg && res.msg.includes('enrolled')) skipped++;
    else failed++;
  }));

  let msg = `${deleted} deleted`;
  if (skipped) msg += `, ${skipped} skipped (enrolled)`;
  if (failed) msg += `, ${failed} failed`;
  toast(msg, failed ? 'err' : 'ok');
  clearBulkSelection();
  loadApplicants();
}

// ── STUDENT BULK ACTIONS ──────────────────────────────────────────────────

function getStuCheckedIds() {
  return [...document.querySelectorAll('.stu-cb:checked')].map(cb => parseInt(cb.value));
}

function onStuCheckChange() {
  const ids = getStuCheckedIds();
  const bar = document.getElementById('stu-bulk-bar');
  const countEl = document.getElementById('stu-bulk-count');
  if (ids.length > 0) {
    bar.classList.add('visible');
    countEl.textContent = `${ids.length} student${ids.length > 1 ? 's' : ''} selected`;
  } else {
    bar.classList.remove('visible');
  }
  // Sync select-all header checkbox state
  const allCbs = document.querySelectorAll('.stu-cb');
  const allCheck = document.getElementById('stu-check-all');
  if (allCheck) {
    allCheck.indeterminate = ids.length > 0 && ids.length < allCbs.length;
    allCheck.checked = ids.length > 0 && ids.length === allCbs.length;
  }
}

function toggleAllStuCheckboxes(masterCb) {
  document.querySelectorAll('.stu-cb').forEach(cb => cb.checked = masterCb.checked);
  onStuCheckChange();
}

function clearStuBulkSelection() {
  document.querySelectorAll('.stu-cb').forEach(cb => cb.checked = false);
  const allCheck = document.getElementById('stu-check-all');
  if (allCheck) { allCheck.checked = false; allCheck.indeterminate = false; }
  document.getElementById('stu-bulk-bar').classList.remove('visible');
}

async function stuBulkSetStatus(status) {
  const ids = getStuCheckedIds();
  if (!ids.length) return;
  if (!confirm(`Set ${ids.length} student${ids.length > 1 ? 's' : ''} to "${status}"?`)) return;

  let successCount = 0;
  await Promise.all(ids.map(async id => {
    const res = await post('students', { action: 'update_status', student_id: id, status });
    if (res.ok) successCount++;
  }));

  toast(`${successCount} of ${ids.length} updated to "${status}"`, successCount === ids.length ? 'ok' : 'err');
  clearStuBulkSelection();
  loadStudents();
}

// ── CSV EXPORT ────────────────────────────────────────────────────────────
function exportApplicantsCSV() {
  if (!_applAllRows.length) { toast('No data to export.', 'err'); return; }

  const headers = ['ID', 'Student ID', 'Last Name', 'First Name', 'Middle Name', 'Email',
    'Campus', 'Program Code', 'Status', 'Student Type', 'Year Level',
    'Admission Type', 'Contact Number', 'Sex', 'Birthdate', 'Registered'];

  const escape = v => {
    const s = (v === null || v === undefined) ? '' : String(v);
    return s.includes(',') || s.includes('"') || s.includes('\n')
      ? `"${s.replace(/"/g, '""')}"` : s;
  };

  const rows = _applAllRows.map(r => [
    r.id, r.student_id || '', r.Last_Name || '', r.First_Name || '',
    r.Middle_Name || '', r.Email || '', r.campus || '',
    r.Program_Code || '', r.application_status || '',
    r.student_type || '', r.year_level || '', r.admission_type || '',
    r.Contact_Number || '', r.Sex || '',
    r.Birthdate ? r.Birthdate.substring(0, 10) : '',
    r.created_at ? new Date(r.created_at).toLocaleDateString('en-PH') : ''
  ].map(escape).join(','));

  const csv = [headers.join(','), ...rows].join('\r\n');
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  const now = new Date();
  a.download = `applicants_${now.getFullYear()}${String(now.getMonth() + 1).padStart(2, '0')}${String(now.getDate()).padStart(2, '0')}.csv`;
  a.click();
  URL.revokeObjectURL(url);
  toast(`Exported ${_applAllRows.length} records to CSV`, 'ok');
}

// ── DATE FILTER CLEAR ─────────────────────────────────────────────────────
function clearDateFilters() {
  document.getElementById('appl-date-from').value = '';
  document.getElementById('appl-date-to').value = '';
  loadApplicants();
}

function clearStudentDateFilters() {
  document.getElementById('stu-date-from').value = '';
  document.getElementById('stu-date-to').value = '';
  loadStudents();
}

async function deleteApplicant(id, name) {
  document.getElementById('delete-msg').textContent = `You are about to permanently delete the applicant record of "${name}" (ID: ${id}). All related admission, family, education, and course data will also be removed.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    const res = await post('applicants', { action: 'delete', applicant_id: id });
    toast(res.ok ? 'Applicant deleted.' : (res.msg || 'Delete failed — check server logs.'), res.ok ? 'ok' : 'err');
    if (res.ok) loadApplicants();
  };
  openModal('delete-modal');
}

async function viewApplicant(id) {
  openModal('appl-modal');
  document.getElementById('appl-modal-id').value = id;
  document.getElementById('appl-modal-body').innerHTML = '<div class="loading">Loading…</div>';
  // Hide action buttons while loading
  document.getElementById('appl-modal-enroll-btn').style.display = 'none';
  const res = await api('applicants', { id });
  if (!res.ok || !res.data) { document.getElementById('appl-modal-body').innerHTML = '<p class="empty">Not found.</p>'; return; }
  const a = res.data;
  const statusLog = res.status_log || [];
  const fullName = [a.First_Name, a.Middle_Name, a.Last_Name, a.Suffix].filter(Boolean).join(' ');
  document.getElementById('appl-modal-title').textContent = fullName;
  // Show Enroll button only when the applicant has not yet been enrolled
  document.getElementById('appl-modal-enroll-btn').style.display =
    a.application_status !== 'Enrolled' ? '' : 'none';

  // Status icon map for timeline dots
  const statusIcon = {
    Pending: '⏳', Draft: '📝', Submitted: '📤', Enrolled: '🎓', Rejected: '✗'
  };

  // Build timeline HTML
  const timelineHTML = statusLog.length
    ? `<div class="status-timeline">` +
    statusLog.map(entry => `
        <div class="timeline-entry">
          <div class="timeline-dot ${entry.status}" title="${entry.status}">${statusIcon[entry.status] || '•'}</div>
          <div>
            <div class="timeline-label">${entry.status}</div>
            <div class="timeline-meta">${fmtDateTime(entry.changed_at)} · by ${entry.changed_by}</div>
          </div>
        </div>`).join('') +
    `</div>`
    : `<p style="font-size:.8rem;color:var(--muted);padding:10px 16px">No history recorded yet.</p>`;

  document.getElementById('appl-modal-body').innerHTML = `
<div class="detail-hero">
  <div class="detail-avatar"><i class="fas fa-user-circle"></i></div>
  <div>
    <div class="detail-name">${fullName}</div>
    <div class="detail-meta">
      <span><i class="fas fa-envelope"></i> ${a.Email || '—'}</span>
      <span><i class="fas fa-phone"></i> ${a.Contact_Number || '—'}</span>
      <span><i class="fas fa-venus-mars"></i> ${a.Sex || '—'}</span>
    </div>
    <div style="margin-top:8px">${pill(a.application_status)}</div>
  </div>
</div>
<div class="table-wrap" style="margin-bottom:16px">
  <div class="info-grid">
    <div class="info-section-title"><i class="fas fa-user"></i> Personal Information</div>
    ${infoRow('Birthdate', fmt(a.Birthdate), 'Birth Place', a.Birth_Place)}
    ${infoRow('Citizenship', a.Citizenship, 'Civil Status', a.Civil_Status)}
    ${infoRow('Religion', a.Religion, 'Disability', a.Disability || 'None')}
    ${infoRow('First Gen Student', a.First_Generation_Student, 'Landline', a.Landline_Number || '—')}
    <div class="info-section-title"><i class="fas fa-map-marker-alt"></i> Address</div>
    ${infoRow('House/Street', [a.House_Number, a.Street].filter(Boolean).join(' ') || '—', 'Barangay', a.Barangay || '—')}
    ${infoRow('Municipality', a.Municipality || '—', 'Province', a.Province || '—')}
    <div class="info-section-title"><i class="fas fa-graduation-cap"></i> Admission Info</div>
    ${infoRow('Campus', a.campus || '—', 'Student Type', a.student_type || '—')}
    ${infoRow('Year Level', a.year_level || '—', 'Admission Type', a.admission_type || '—')}
    ${infoRow('Program', a.Program_Name ? `${a.Program_Code} — ${a.Program_Name}` : '—', 'Specialization', a.Specialization || '—')}
    ${infoRow('College', a.college_name || '—', '', '')}
    <div class="info-section-title"><i class="fas fa-users"></i> Family</div>
    ${infoRow('Guardian', [a.guardian_first_name, a.guardian_last_name].filter(Boolean).join(' ') || '—', 'Guardian Contact', a.guardian_contact_number || '—')}
    ${infoRow('Father', [a.father_first_name, a.father_last_name].filter(Boolean).join(' ') || '—', 'Mother', [a.mother_first_name, a.mother_last_name].filter(Boolean).join(' ') || '—')}
    <div class="info-section-title"><i class="fas fa-school"></i> Education</div>
    ${infoRow('Elementary', a.elementary_school_name || '—', 'High School', a.high_school_name || '—')}
    ${infoRow('Senior High', a.senior_high_school_name || '—', 'Track/Strand', a.track_strand || '—')}
  </div>
</div>
<div class="table-wrap" style="margin-bottom:16px">
  <div class="info-section-title" style="border-radius:var(--radius) var(--radius) 0 0">
    <i class="fas fa-history"></i> Application History
  </div>
  ${timelineHTML}
  <p style="font-size:.75rem;color:var(--muted);padding:4px 16px 10px">
    Registered ${fmtDateTime(a.created_at)}
    ${a.updated_at && a.updated_at !== a.created_at ? `· Last updated ${fmtDateTime(a.updated_at)}` : ''}
  </p>
</div>
  `;
}

// ── EDIT APPLICANT ────────────────────────────────────────────────────────
function setVal(id, val) {
  const el = document.getElementById(id);
  if (el) el.value = val || '';
}
function setRadio(name, val) {
  if (!val) return;
  const r = document.querySelector('input[name="' + name + '"][value="' + val + '"]');
  if (r) r.checked = true;
}
async function editApplicant(id) {
  openModal('edit-appl-modal');
  const saveBtn = document.querySelector('#edit-appl-modal .modal-ftr .btn-primary');
  if (saveBtn) saveBtn.disabled = true;

  const res = await api('applicants', { id });
  if (!res.ok || !res.data) { toast('Could not load applicant data.', 'err'); closeModal('edit-appl-modal'); return; }
  const a = res.data;

  document.getElementById('ea-student-id').value = a.id;

  // Step 1 - Admission
  setVal('ea-campus', a.campus);
  setVal('ea-student-type', a.student_type);
  setVal('ea-year-level', a.year_level);
  setVal('ea-admission-type', a.admission_type);

  // Step 2 - Personal
  setVal('ea-first', a.First_Name);
  setVal('ea-middle', a.Middle_Name);
  setVal('ea-last', a.Last_Name);
  setVal('ea-suffix', a.Suffix);
  setVal('ea-email', a.Email);
  setVal('ea-birthday', a.Birthdate ? a.Birthdate.substring(0, 10) : '');
  setVal('ea-citizenship', a.Citizenship);
  setVal('ea-birthplace', a.Birth_Place);
  setVal('ea-contact', a.Contact_Number);
  setVal('ea-landline', a.Landline_Number);
  setRadio('ea-sex-radio', a.Sex);
  setVal('ea-civil', a.Civil_Status);
  setVal('ea-religion', a.Religion);
  setVal('ea-disability', a.Disability);
  setRadio('ea-firstgen-radio', a.First_Generation_Student);

  // Address
  setVal('ea-house', a.House_Number);
  setVal('ea-street', a.Street);
  setVal('ea-barangay', a.Barangay);
  setVal('ea-municipality', a.Municipality);
  setVal('ea-province', a.Province);
  setVal('ea-zip', a.Zip_Code);

  // Step 3 - Guardian
  setVal('ea-gfirst', a.guardian_first_name);
  setVal('ea-glast', a.guardian_last_name);
  setVal('ea-gcontact', a.guardian_contact_number);
  setVal('ea-gemail', a.guardian_email);
  setVal('ea-grel', a.guardian_relationship);
  setVal('ea-gbarangay', a.guardian_barangay);
  setVal('ea-gmunicipality', a.guardian_municipality);
  setVal('ea-gprovince', a.guardian_province);

  // Father
  setVal('ea-fffirst', a.father_first_name);
  setVal('ea-ffmiddle', a.father_middle_name);
  setVal('ea-fflast', a.father_last_name);
  setVal('ea-ffage', a.father_age);
  setVal('ea-ffcitizenship', a.father_citizenship);
  setVal('ea-ffedu', a.father_educational_attainment);
  setVal('ea-ffemp', a.father_employment_status);
  setVal('ea-ffocc', a.father_occupation);

  // Mother
  setVal('ea-mfirst', a.mother_first_name);
  setVal('ea-mmiddle', a.mother_middle_name);
  setVal('ea-mlast', a.mother_last_name);
  setVal('ea-mage', a.mother_age);
  setVal('ea-mcitizenship', a.mother_citizenship);
  setVal('ea-medu', a.mother_educational_attainment);
  setVal('ea-memp', a.mother_employment_status);
  setVal('ea-mocc', a.mother_occupation);

  // Step 4 - Education
  setVal('ea-elem', a.elementary_school_name);
  setVal('ea-elem-addr', a.elementary_school_address);
  setVal('ea-elem-type', a.elementary_type);
  setVal('ea-elem-from', a.elementary_year_from);
  setVal('ea-elem-to', a.elementary_year_to);
  setVal('ea-hs', a.high_school_name);
  setVal('ea-hs-addr', a.high_school_address);
  setVal('ea-hs-type', a.high_school_type);
  setVal('ea-hs-from', a.high_school_year_from);
  setVal('ea-hs-to', a.high_school_year_to);
  setVal('ea-shs', a.senior_high_school_name);
  setVal('ea-shs-addr', a.senior_high_school_address);
  setVal('ea-shs-type', a.senior_high_school_type);
  setVal('ea-shs-from', a.senior_high_school_year_from);
  setVal('ea-shs-to', a.senior_high_school_year_to);
  setVal('ea-track', a.track_strand);

  // Step 5 - Program (load programs then set)
  const pRes = await api('programs');
  const pSel = document.getElementById('ea-program');
  pSel.innerHTML = '<option value="">Select Course</option>';
  (pRes.data || []).forEach(p => {
    const opt = document.createElement('option');
    opt.value = p.Program_Code;
    opt.textContent = p.Program_Code + ' — ' + p.Program_Name;
    if (p.Program_Code === a.Program_Code) opt.selected = true;
    pSel.appendChild(opt);
  });

  const sSel = document.getElementById('ea-spec');
  sSel.innerHTML = '<option value="">— None / N/A —</option>';
  if (a.Specialization) {
    const opt = document.createElement('option');
    opt.value = a.Specialization;
    opt.textContent = a.Specialization;
    opt.selected = true;
    sSel.appendChild(opt);
  }

  if (saveBtn) saveBtn.disabled = false;
}

async function saveEditApplicant() {
  function radioVal(name) {
    const r = document.querySelector('input[name="' + name + '"]:checked');
    return r ? r.value : '';
  }
  const id = document.getElementById('ea-student-id').value;
  if (!id) { toast('No applicant loaded.', 'err'); return; }

  const payload = {
    action: 'update_full',
    student_id: id,
    campus: document.getElementById('ea-campus').value,
    student_type: document.getElementById('ea-student-type').value,
    year_level: document.getElementById('ea-year-level').value,
    admission_type: document.getElementById('ea-admission-type').value,
    first_name: document.getElementById('ea-first').value,
    middle_name: document.getElementById('ea-middle').value,
    last_name: document.getElementById('ea-last').value,
    suffix: document.getElementById('ea-suffix').value,
    email: document.getElementById('ea-email').value,
    birthdate: document.getElementById('ea-birthday').value,
    citizenship: document.getElementById('ea-citizenship').value,
    birth_place: document.getElementById('ea-birthplace').value,
    contact_number: document.getElementById('ea-contact').value,
    landline_number: document.getElementById('ea-landline').value,
    sex: radioVal('ea-sex-radio'),
    civil_status: document.getElementById('ea-civil').value,
    religion: document.getElementById('ea-religion').value,
    disability: document.getElementById('ea-disability').value,
    first_gen: radioVal('ea-firstgen-radio'),
    house_number: document.getElementById('ea-house').value,
    street: document.getElementById('ea-street').value,
    barangay: document.getElementById('ea-barangay').value,
    municipality: document.getElementById('ea-municipality').value,
    province: document.getElementById('ea-province').value,
    zip_code: document.getElementById('ea-zip').value,
    guardian_first_name: document.getElementById('ea-gfirst').value,
    guardian_last_name: document.getElementById('ea-glast').value,
    guardian_contact_number: document.getElementById('ea-gcontact').value,
    guardian_email: document.getElementById('ea-gemail').value,
    guardian_relationship: document.getElementById('ea-grel').value,
    guardian_barangay: document.getElementById('ea-gbarangay').value,
    guardian_municipality: document.getElementById('ea-gmunicipality').value,
    guardian_province: document.getElementById('ea-gprovince').value,
    father_first_name: document.getElementById('ea-fffirst').value,
    father_middle_name: document.getElementById('ea-ffmiddle').value,
    father_last_name: document.getElementById('ea-fflast').value,
    father_age: document.getElementById('ea-ffage').value,
    father_citizenship: document.getElementById('ea-ffcitizenship').value,
    father_educational_attainment: document.getElementById('ea-ffedu').value,
    father_employment_status: document.getElementById('ea-ffemp').value,
    father_occupation: document.getElementById('ea-ffocc').value,
    mother_first_name: document.getElementById('ea-mfirst').value,
    mother_middle_name: document.getElementById('ea-mmiddle').value,
    mother_last_name: document.getElementById('ea-mlast').value,
    mother_age: document.getElementById('ea-mage').value,
    mother_citizenship: document.getElementById('ea-mcitizenship').value,
    mother_educational_attainment: document.getElementById('ea-medu').value,
    mother_employment_status: document.getElementById('ea-memp').value,
    mother_occupation: document.getElementById('ea-mocc').value,
    elementary_school_name: document.getElementById('ea-elem').value,
    elementary_school_address: document.getElementById('ea-elem-addr').value,
    elementary_type: document.getElementById('ea-elem-type').value,
    elementary_year_from: document.getElementById('ea-elem-from').value,
    elementary_year_to: document.getElementById('ea-elem-to').value,
    high_school_name: document.getElementById('ea-hs').value,
    high_school_address: document.getElementById('ea-hs-addr').value,
    high_school_type: document.getElementById('ea-hs-type').value,
    high_school_year_from: document.getElementById('ea-hs-from').value,
    high_school_year_to: document.getElementById('ea-hs-to').value,
    senior_high_school_name: document.getElementById('ea-shs').value,
    senior_high_school_address: document.getElementById('ea-shs-addr').value,
    senior_high_school_type: document.getElementById('ea-shs-type').value,
    senior_high_school_year_from: document.getElementById('ea-shs-from').value,
    senior_high_school_year_to: document.getElementById('ea-shs-to').value,
    track_strand: document.getElementById('ea-track').value,
    program_code: document.getElementById('ea-program').value,
    specialization: document.getElementById('ea-spec').value,
  };

  if (!payload.first_name || !payload.last_name || !payload.email) {
    toast('First name, last name, and email are required.', 'err'); return;
  }

  const res = await post('applicants', payload);
  toast(res.ok ? 'Applicant updated successfully!' : (res.msg || 'Save failed — check server logs.'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('edit-appl-modal'); loadApplicants(); }
}


// ══════════════════════════════════════════════════════════════════════════
// STUDENTS
// ══════════════════════════════════════════════════════════════════════════
const STU_PER_PAGE = 50;
let _stuAllRows = [];
let _stuPage = 1;
let _stuSortCol = 'Enrollment_Date';
let _stuSortDir = 'desc';

function stuSort(col) {
  if (_stuSortCol === col) {
    _stuSortDir = _stuSortDir === 'asc' ? 'desc' : 'asc';
  } else {
    _stuSortCol = col;
    _stuSortDir = 'asc';
  }
  _stuPage = 1;
  _stuRender();
}

async function loadStudents() {
  const search = document.getElementById('stu-search').value;
  const status = document.getElementById('stu-status').value;
  const campus = document.getElementById('stu-campus').value;
  const program = document.getElementById('stu-program').value;
  const section = document.getElementById('stu-section').value;
  const year = document.getElementById('stu-year').value;
  const dateFrom = document.getElementById('stu-date-from').value;
  const dateTo = document.getElementById('stu-date-to').value;
  const tbody = document.getElementById('stu-tbody');
  tbody.innerHTML = `<tr><td colspan="10" class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</td></tr>`;
  document.getElementById('stu-pagination').style.display = 'none';
  const stuCntEl = document.getElementById('stu-result-count');
  if (stuCntEl) stuCntEl.textContent = '';

  // Populate program dropdown once
  const progSel = document.getElementById('stu-program');
  if (progSel.options.length <= 1) {
    const pRes = await api('programs');
    (pRes.data || []).forEach(p => {
      const o = document.createElement('option');
      o.value = p.Program_Code;
      o.textContent = `${p.Program_Code} — ${p.Program_Name}`;
      progSel.appendChild(o);
    });
  }

  // All filters go to the server — no client-side filtering
  const res = await api('students', {
    search, status, campus, program, section,
    year_level: year, date_from: dateFrom, date_to: dateTo
  });
  if (!res.ok) { tbody.innerHTML = empty(10, `Failed to load: ${res.msg || 'unknown error'}`); return; }

  const rows = res.data || [];
  if (!rows.length) {
    tbody.innerHTML = empty(10);
    const rc = document.getElementById('stu-result-count');
    if (rc) rc.textContent = '0 students found';
    return;
  }

  _stuAllRows = rows;
  _stuPage = 1;
  clearStuBulkSelection();
  _stuRender();
}

// Load section dropdown for Students filtered by current campus selection
async function loadStuSections() {
  const campus = document.getElementById('stu-campus').value;
  const sectSel = document.getElementById('stu-section');
  const prev = sectSel.value;
  sectSel.innerHTML = '<option value="">All Sections</option>';
  const res = await api('sections', campus ? { campus } : {});
  (res.data || []).forEach(s => {
    const o = document.createElement('option');
    o.value = s.section_name;
    o.textContent = `${s.section_name} (${s.program_code || s.Program_Code || ''})`;
    sectSel.appendChild(o);
  });
  // Restore previous selection if it still exists in the new list
  if ([...sectSel.options].some(o => o.value === prev)) sectSel.value = prev;
}

function _stuRender() {
  // --- sort ---
  const dateCols = new Set(['Enrollment_Date']);
  const dir = _stuSortDir === 'asc' ? 1 : -1;
  const col = _stuSortCol;
  const sorted = [..._stuAllRows].sort((a, b) => {
    if (dateCols.has(col)) {
      const da = a[col] ? new Date(a[col]).getTime() : 0;
      const db = b[col] ? new Date(b[col]).getTime() : 0;
      return (da - db) * dir;
    }
    const va = (a[col] ?? '').toString().toLowerCase();
    const vb = (b[col] ?? '').toString().toLowerCase();
    return va < vb ? -dir : va > vb ? dir : 0;
  });

  // --- update header indicators ---
  document.querySelectorAll('#sec-students th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === col) th.classList.add(_stuSortDir === 'asc' ? 'sort-asc' : 'sort-desc');
  });

  const total = sorted.length;
  const totalPages = Math.ceil(total / STU_PER_PAGE);
  if (_stuPage > totalPages) _stuPage = Math.max(1, totalPages);
  const start = (_stuPage - 1) * STU_PER_PAGE;
  const page = sorted.slice(start, start + STU_PER_PAGE);

  const tbody = document.getElementById('stu-tbody');
  tbody.innerHTML = page.map(r => {
    const safeId = r.id;
    const safeName = (r.full_name || '').replace(/\\/g, '\\\\').replace(/'/g, "\\'");
    return `
<tr>
  <td class="col-check"><input type="checkbox" class="row-cb stu-cb" value="${safeId}" onchange="onStuCheckChange()" /></td>
  <td><code>${r.student_id || '—'}</code></td>
  <td><strong>${r.full_name || '—'}</strong><br><small style="color:var(--muted)">${r.Email || ''}</small></td>
  <td style="font-size:.8rem">${r.campus || '—'}</td>
  <td><code>${r.Program_Code || '—'}</code></td>
  <td style="font-size:.82rem">${r.section_name || '—'}</td>
  <td style="font-size:.82rem">${r.year_level || '—'}</td>
  <td>
    <select class="status-select" onchange="updateStudentStatus(${safeId},this.value)"
            style="color:${stuStatusColor(r.Status)}">
      ${['Active', 'Inactive', 'LOA'].map(s =>
      `<option value="${s}" ${s === r.Status ? 'selected' : ''}>${s === 'LOA' ? 'LOA' : s}</option>`
    ).join('')}
    </select>
  </td>
  <td style="font-size:.8rem;color:var(--muted)">${fmt(r.Enrollment_Date)}</td>
  <td>
    <div class="action-btns">
      <button class="btn btn-outline btn-sm" onclick="viewStudent(${safeId})"><i class="fas fa-eye"></i> View</button>
      <button class="btn btn-gold btn-sm" onclick="openStudentEdit(${safeId})"><i class="fas fa-pen"></i> Edit</button>
    </div>
  </td>
</tr>`;
  }).join('');

  // Pagination (shared helper)
  const stuCountEl = document.getElementById('stu-result-count');
  if (stuCountEl) stuCountEl.textContent = `${total} student${total !== 1 ? 's' : ''} found`;

  buildPagination(
    _stuPage, totalPages, total, STU_PER_PAGE,
    document.getElementById('stu-pagination'),
    document.getElementById('stu-pg-info'),
    document.getElementById('stu-pg-controls'),
    _stuGoPage,
    'student'
  );
}

function _stuGoPage(p) {
  _stuPage = p;
  _stuRender();
  document.getElementById('sec-students').scrollIntoView({ behavior: 'smooth', block: 'start' });
}

// ── Student View Modal (tabbed) ────────────────────────────────────────
let _stuViewData = null; // cached student record
let _stuViewId = null; // students.id (not applicant_id)
let _stuActiveTab = 'profile';

async function viewStudent(id) {
  _stuViewId = id;
  _stuActiveTab = 'profile';
  _stuViewData = null;

  // Reset tabs
  document.querySelectorAll('.stu-tab').forEach(t => t.classList.toggle('active', t.dataset.tab === 'profile'));

  openModal('stu-view-modal');
  const body = document.getElementById('stu-view-body');
  body.innerHTML = `<div class="loading" style="padding:40px 20px"><i class="fas fa-spinner fa-spin"></i> Loading…</div>`;

  const res = await api('students', { id });
  if (!res.ok || !res.data) {
    body.innerHTML = `<p style="color:var(--red);padding:20px">Could not load student.</p>`;
    return;
  }
  _stuViewData = res.data;
  const s = _stuViewData;
  const name = s.full_name
    || [s.First_Name, s.Middle_Name, s.Last_Name].filter(Boolean).join(' ')
    || '—';
  document.getElementById('stu-view-title').innerHTML =
    `<i class="fas fa-user-graduate"></i> ${name}`;

  _renderStuTab('profile');
}

function switchStuTab(tab) {
  if (!_stuViewData) return;
  _stuActiveTab = tab;
  document.querySelectorAll('.stu-tab').forEach(t => t.classList.toggle('active', t.dataset.tab === tab));
  _renderStuTab(tab);
}

async function _renderStuTab(tab) {
  const body = document.getElementById('stu-view-body');
  const s = _stuViewData;

  if (tab === 'profile') {
    // All fields are already returned by the single-student GET (api('students', { id })),
    // which JOINs applicants, admission_info, educational_background, and family_info.
    // No second API call needed — just read from _stuViewData (s) directly.

    const fullName = s.full_name
      || [s.First_Name, s.Middle_Name, s.Last_Name, s.Suffix].filter(Boolean).join(' ')
      || '—';

    // Helper: only render a section block if at least one value is non-empty
    const hasAny = (...vals) => vals.some(v => v && v !== '—');

    // Personal info — only present when the student was linked to an applicant record
    const hasPersonal = hasAny(s.Birthdate, s.Birth_Place, s.Citizenship, s.Civil_Status,
      s.Religion, s.Sex);
    const hasAddress = hasAny(s.House_Number, s.Street, s.Barangay, s.Municipality, s.Province);
    const hasFamily = hasAny(s.guardian_first_name, s.guardian_last_name,
      s.father_first_name, s.mother_first_name);
    const hasEdu = hasAny(s.elementary_school_name, s.high_school_name,
      s.senior_high_school_name);

    body.innerHTML = `
      <div class="stu-tab-panel active">
        <div class="detail-hero">
          <div class="detail-avatar"><i class="fas fa-user-graduate"></i></div>
          <div>
            <div class="detail-name">${fullName}</div>
            <div class="detail-meta">
              <span><i class="fas fa-id-card"></i> ${s.student_id || '—'}</span>
              <span><i class="fas fa-envelope"></i> ${s.Email || '—'}</span>
              <span><i class="fas fa-phone"></i> ${s.Contact_Number || '—'}</span>
              ${s.Sex ? `<span><i class="fas fa-venus-mars"></i> ${s.Sex}</span>` : ''}
            </div>
            <div style="margin-top:8px">${pill(s.Status)}</div>
          </div>
        </div>
        <div class="table-wrap" style="margin-bottom:16px">
          <div class="info-grid">

            <div class="info-section-title"><i class="fas fa-graduation-cap"></i> Academic Information</div>
            ${infoRow('Program', s.Program_Code ? `${s.Program_Code} — ${s.Program_Name || ''}` : '—', 'Section', s.section_name || '—')}
            ${infoRow('Year Level', s.year_level || '—', 'Campus', s.campus || '—')}
            ${infoRow('Semester', s.semester_name || '—', 'Academic Year', s.academic_year || '—')}
            ${infoRow('Student Type', s.student_type || '—', 'Admission Type', s.admission_type || '—')}
            ${infoRow('Enrollment Date', fmt(s.Enrollment_Date), 'Status', s.Status || '—')}

            ${hasPersonal ? `
            <div class="info-section-title"><i class="fas fa-user"></i> Personal Information</div>
            ${infoRow('Birthdate', fmt(s.Birthdate), 'Birth Place', s.Birth_Place || '—')}
            ${infoRow('Citizenship', s.Citizenship || '—', 'Civil Status', s.Civil_Status || '—')}
            ${infoRow('Religion', s.Religion || '—', 'Disability', s.Disability || 'None')}
            ${infoRow('First-Gen Student', s.First_Generation_Student || '—', 'Landline', s.Landline_Number || '—')}
            ` : ''}

            ${hasAddress ? `
            <div class="info-section-title"><i class="fas fa-map-marker-alt"></i> Address</div>
            ${infoRow('House / Street', [s.House_Number, s.Street].filter(Boolean).join(' ') || '—', 'Barangay', s.Barangay || '—')}
            ${infoRow('Municipality', s.Municipality || '—', 'Province', s.Province || '—')}
            ${s.Zip_Code ? infoRow('Zip Code', s.Zip_Code, '', '') : ''}
            ` : ''}

            ${hasFamily ? (() => {
        const guardianName = [s.guardian_first_name, s.guardian_last_name].filter(Boolean).join(' ') || '—';
        const guardianAddr = [s.guardian_barangay, s.guardian_municipality, s.guardian_province].filter(Boolean).join(', ') || '—';
        const fatherName = [s.father_first_name, s.father_middle_name, s.father_last_name].filter(Boolean).join(' ') || '—';
        const motherName = [s.mother_first_name, s.mother_middle_name, s.mother_last_name].filter(Boolean).join(' ') || '—';
        return `
            <div class="info-section-title"><i class="fas fa-users"></i> Family</div>
            ${infoRow('Guardian Name', guardianName, 'Relationship', s.guardian_relationship || '—')}
            ${infoRow('Guardian Contact', s.guardian_contact_number || '—', 'Guardian Email', s.guardian_email || '—')}
            ${infoRow('Guardian Address', guardianAddr, '', '')}
            ${infoRow('Father', fatherName, 'Mother', motherName)}
            ${(s.father_occupation || s.father_employment_status || s.mother_occupation || s.mother_employment_status) ? `
            ${infoRow('Father Occupation', [s.father_occupation, s.father_employment_status].filter(Boolean).join(' · ') || '—',
          'Mother Occupation', [s.mother_occupation, s.mother_employment_status].filter(Boolean).join(' · ') || '—')}
            ` : ''}
            ${(s.father_educational_attainment || s.mother_educational_attainment) ? `
            ${infoRow('Father Education', s.father_educational_attainment || '—', 'Mother Education', s.mother_educational_attainment || '—')}
            ` : ''}`;
      })() : ''}

            ${hasEdu ? (() => {
        const elemYears = [s.elementary_year_from, s.elementary_year_to].filter(Boolean).join(' – ');
        const hsYears = [s.high_school_year_from, s.high_school_year_to].filter(Boolean).join(' – ');
        const shsYears = [s.senior_high_school_year_from, s.senior_high_school_year_to].filter(Boolean).join(' – ');
        return `
            <div class="info-section-title"><i class="fas fa-school"></i> Education Background</div>
            ${infoRow('Elementary', s.elementary_school_name || '—', 'Years', elemYears || '—')}
            ${infoRow('High School', s.high_school_name || '—', 'Years', hsYears || '—')}
            ${infoRow('Senior High School', s.senior_high_school_name || '—', 'Years', shsYears || '—')}
            ${infoRow('Track / Strand', s.track_strand || '—', '', '')}`;
      })() : ''}

          </div>
        </div>
      </div>`;

  } else if (tab === 'grades') {
    body.innerHTML = `<div class="stu-tab-panel active"><div class="loading" style="padding:30px"><i class="fas fa-spinner fa-spin"></i> Loading grades…</div></div>`;
    const res = await api('grades', { student_id: _stuViewId });
    const rows = (res.ok && Array.isArray(res.data)) ? res.data : [];
    if (!rows.length) {
      body.innerHTML = `<div class="stu-tab-panel active"><p style="color:var(--muted);padding:30px 0;text-align:center"><i class="fas fa-info-circle"></i> No grade records found.</p></div>`;
      return;
    }
    body.innerHTML = `
      <div class="stu-tab-panel active">
        <div class="table-wrap" style="margin:0">
          <table class="stu-sub-table">
            <thead>
              <tr>
                <th>Subject</th>
                <th>Description</th>
                <th style="text-align:center">Units</th>
                <th style="text-align:center">Midterm</th>
                <th style="text-align:center">Final</th>
                <th style="text-align:center">Grade</th>
                <th style="text-align:center">Remarks</th>
              </tr>
            </thead>
            <tbody>
              ${rows.map(g => `
                <tr>
                  <td><code>${g.Subject_Code || '—'}</code></td>
                  <td style="font-size:.82rem">${g.Subject_Name || '—'}</td>
                  <td style="text-align:center">${g.Credits ?? '—'}</td>
                  <td style="text-align:center">${g.midterm != null ? Number(g.midterm).toFixed(2) : '—'}</td>
                  <td style="text-align:center">${g.final != null ? Number(g.final).toFixed(2) : '—'}</td>
                  <td style="text-align:center;font-weight:600">${g.final_grade != null ? Number(g.final_grade).toFixed(2) : '—'}</td>
                  <td style="text-align:center">${g.remarks || '—'}</td>
                </tr>`).join('')}
            </tbody>
          </table>
        </div>
      </div>`;

  } else if (tab === 'payments') {
    body.innerHTML = `<div class="stu-tab-panel active"><div class="loading" style="padding:30px"><i class="fas fa-spinner fa-spin"></i> Loading payments…</div></div>`;
    const res = await api('payments', { student_id: _stuViewId });
    const rows = (res.ok && Array.isArray(res.data)) ? res.data : [];
    if (!rows.length) {
      body.innerHTML = `<div class="stu-tab-panel active"><p style="color:var(--muted);padding:30px 0;text-align:center"><i class="fas fa-info-circle"></i> No payment records found.</p></div>`;
      return;
    }
    const total = rows.reduce((sum, r) => sum + (parseFloat(r.amount) || 0), 0);
    body.innerHTML = `
      <div class="stu-tab-panel active">
        <div style="display:flex;justify-content:flex-end;margin-bottom:10px">
          <span style="font-size:.85rem;color:var(--muted)">Total paid: </span>
          <strong style="margin-left:6px">₱${total.toLocaleString('en-PH', { minimumFractionDigits: 2 })}</strong>
        </div>
        <div class="table-wrap" style="margin:0">
          <table class="stu-sub-table">
            <thead>
              <tr>
                <th>Date</th>
                <th>Receipt #</th>
                <th>Semester</th>
                <th style="text-align:right">Amount</th>
                <th>Method</th>
                <th style="text-align:center">Status</th>
              </tr>
            </thead>
            <tbody>
              ${rows.map(p => `
                <tr>
                  <td style="font-size:.82rem">${fmt(p.payment_date)}</td>
                  <td><code>${p.receipt_number || '—'}</code></td>
                  <td style="font-size:.82rem">${p.semester_name || '—'}${p.academic_year ? ` <span style="color:var(--muted)">${p.academic_year}</span>` : ''}</td>
                  <td style="text-align:right;font-weight:600">₱${parseFloat(p.amount || 0).toLocaleString('en-PH', { minimumFractionDigits: 2 })}</td>
                  <td style="font-size:.82rem">${p.payment_method || '—'}</td>
                  <td style="text-align:center">${pill(p.status)}</td>
                </tr>`).join('')}
            </tbody>
          </table>
        </div>
      </div>`;

  } else if (tab === 'enrollment') {
    body.innerHTML = `<div class="stu-tab-panel active"><div class="loading" style="padding:30px"><i class="fas fa-spinner fa-spin"></i> Loading enrollment…</div></div>`;
    const res = await api('enrollment', { student_id: _stuViewId });
    const rows = (res.ok && Array.isArray(res.data)) ? res.data : [];
    if (!rows.length) {
      body.innerHTML = `<div class="stu-tab-panel active"><p style="color:var(--muted);padding:30px 0;text-align:center"><i class="fas fa-info-circle"></i> No enrollment records found.</p></div>`;
      return;
    }
    body.innerHTML = `
      <div class="stu-tab-panel active">
        <div class="table-wrap" style="margin:0">
          <table class="stu-sub-table">
            <thead>
              <tr>
                <th>Program</th>
                <th>Section</th>
                <th>Semester</th>
                <th>Academic Year</th>
                <th>Date Enrolled</th>
                <th style="text-align:center">Status</th>
              </tr>
            </thead>
            <tbody>
              ${rows.map(e => `
                <tr>
                  <td><code>${e.Program_Code || '—'}</code></td>
                  <td style="font-size:.82rem">${e.section_name || '—'}</td>
                  <td style="font-size:.82rem">${e.semester_name || '—'}</td>
                  <td style="font-size:.82rem">${e.academic_year || '—'}</td>
                  <td style="font-size:.82rem">${fmt(e.enrollment_date || e.created_at)}</td>
                  <td style="text-align:center">${pill(e.status)}</td>
                </tr>`).join('')}
            </tbody>
          </table>
        </div>
      </div>`;
  }
}

function stuStatusColor(s) {
  const m = { Active: '#1a6b3c', Inactive: '#dc3545', LOA: '#6d28d9' };
  return m[s] || '#0b1f3a';
}

async function updateStudentStatus(id, status) {
  const res = await post('students', { action: 'update_status', student_id: id, status });
  if (res.ok) {
    toast(`Status set to ${status}`, 'ok');
    loadStudents();
  } else {
    toast(res.msg || 'Failed to update status.', 'err');
    loadStudents(); // re-render to snap the select back
  }
}

// ── Student Edit Modal ────────────────────────────────────────────────────
async function openStudentEdit(id) {
  // Fetch the student record freshly (use cached _stuViewData if it matches)
  const s = (_stuViewData && _stuViewData.id === id) ? _stuViewData
    : await api('students', { id }).then(r => r.data);
  if (!s) { toast('Could not load student record.', 'err'); return; }

  document.getElementById('se-id').value = id;
  document.getElementById('se-name').textContent =
    s.full_name || [s.First_Name, s.Middle_Name, s.Last_Name].filter(Boolean).join(' ') || '—';

  // Pre-fill current values
  const yearSel = document.getElementById('se-year');
  yearSel.value = s.year_level || '';

  // Campus dropdown — reuse the already-populated list if present, else load
  const campSel = document.getElementById('se-campus');
  if (campSel.options.length <= 1) {
    const cRes = await api('campus');
    (cRes.data || []).forEach(c => {
      const o = document.createElement('option');
      o.value = c.Campus_Name; o.textContent = c.Campus_Name;
      campSel.appendChild(o);
    });
  }
  campSel.value = s.campus || '';

  // Program dropdown — reuse if already loaded
  const progSel = document.getElementById('se-program');
  if (progSel.options.length <= 1) {
    const pRes = await api('programs');
    (pRes.data || []).forEach(p => {
      const o = document.createElement('option');
      o.value = p.Program_Code;
      o.textContent = `${p.Program_Code} — ${p.Program_Name}`;
      progSel.appendChild(o);
    });
  }
  progSel.value = s.Program_Code || '';

  // Section dropdown — load scoped to current campus selection
  await _loadSeSections(campSel.value);
  const sectSel = document.getElementById('se-section');
  // Set by section_name match since we show names as values
  [...sectSel.options].forEach(o => { if (o.textContent.startsWith(s.section_name || '###')) o.selected = true; });

  document.getElementById('se-email').value = '';
  document.getElementById('se-contact').value = '';

  closeModal('stu-view-modal');
  openModal('stu-edit-modal');
}

async function _loadSeSections(campusFilter) {
  const sectSel = document.getElementById('se-section');
  sectSel.innerHTML = '<option value="">— unchanged —</option>';
  const res = await api('sections', campusFilter ? { campus: campusFilter } : {});
  (res.data || []).forEach(s => {
    const o = document.createElement('option');
    o.value = s.section_id;
    o.textContent = `${s.section_name} (${s.program_code || ''})`;
    sectSel.appendChild(o);
  });
}

async function saveStudentEdit() {
  const id = parseInt(document.getElementById('se-id').value) || 0;
  if (!id) return;
  const payload = {
    action: 'update',
    student_id: id,
    year_level: document.getElementById('se-year').value || undefined,
    campus: document.getElementById('se-campus').value || undefined,
    program_code: document.getElementById('se-program').value || undefined,
    section_id: parseInt(document.getElementById('se-section').value) || undefined,
    email: document.getElementById('se-email').value || undefined,
    contact_number: document.getElementById('se-contact').value || undefined,
  };
  // Strip undefined keys so the PHP handler doesn't see empty strings
  Object.keys(payload).forEach(k => payload[k] === undefined && delete payload[k]);

  if (Object.keys(payload).length <= 2) { // only action + student_id
    toast('No changes to save.', 'err'); return;
  }

  const res = await post('students', payload);
  toast(res.ok ? 'Student record updated.' : (res.msg || 'Update failed.'), res.ok ? 'ok' : 'err');
  if (res.ok) {
    closeModal('stu-edit-modal');
    loadStudents();
    // Refresh the view modal cache if it was open for this student
    if (_stuViewId === id) { _stuViewData = null; }
  }
}

// Status edit modal (used by the Student View modal footer)
let _stuStatusId = null;
function openStudentStatusModal(id, name, currentStatus) {
  _stuStatusId = id;
  document.getElementById('stu-status-name').textContent = name;
  document.getElementById('stu-status-sel').value = currentStatus;
  openModal('stu-status-modal');
}

async function confirmStudentStatus() {
  if (!_stuStatusId) return;
  const newStatus = document.getElementById('stu-status-sel').value;
  const res = await post('students', { action: 'update_status', student_id: _stuStatusId, status: newStatus });
  toast(res.ok ? `Status set to ${newStatus}` : (res.msg || 'Failed'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('stu-status-modal'); loadStudents(); }
}

// Legacy toggle kept for any stale references
async function toggleStudentStatus(id, newStatus) {
  const res = await post('students', { action: 'update_status', student_id: id, status: newStatus });
  toast(res.ok ? `Status set to ${newStatus}` : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) loadStudents();
}

// CSV export
function exportStudentsCSV() {
  if (!_stuAllRows.length) { toast('No data to export.', 'err'); return; }
  const headers = ['Student No.', 'Full Name', 'Email', 'Campus', 'Program', 'Section', 'Year Level', 'Status', 'Enrolled Since'];
  const escape = v => {
    const s = (v === null || v === undefined) ? '' : String(v);
    return s.includes(',') || s.includes('"') || s.includes('\n') ? `"${s.replace(/"/g, '""')}"` : s;
  };
  const rows = _stuAllRows.map(r => [
    r.student_id || '', r.full_name || '', r.Email || '', r.campus || '',
    r.Program_Code || '', r.section_name || '', r.year_level || '',
    r.Status || '',
    r.Enrollment_Date ? new Date(r.Enrollment_Date).toLocaleDateString('en-PH') : ''
  ].map(escape).join(','));
  const csv = [headers.join(','), ...rows].join('\r\n');
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  const now = new Date();
  a.download = `students_${now.getFullYear()}${String(now.getMonth() + 1).padStart(2, '0')}${String(now.getDate()).padStart(2, '0')}.csv`;
  a.click();
  URL.revokeObjectURL(url);
  toast(`Exported ${_stuAllRows.length} records to CSV`, 'ok');
}



async function openStudentGrades(studentId, name) {
  document.getElementById('grade-list-title').textContent = `Grades — ${name}`;
  document.getElementById('grade-list-body').innerHTML = '<div class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</div>';
  openModal('grade-list-modal');
  const res = await api('grades', { student_id: studentId });
  if (!res.ok || !res.data?.length) {
    document.getElementById('grade-list-body').innerHTML = '<p class="empty" style="text-align:center;padding:24px;color:var(--muted)"><i class="fas fa-inbox" style="font-size:2rem;display:block;margin-bottom:8px;opacity:.4"></i>No grade records found.</p>';
    return;
  }
  const rows = res.data;
  document.getElementById('grade-list-body').innerHTML = `
  <div class="table-wrap" style="overflow-x:auto">
    <table style="min-width:900px">
      <thead><tr>
        <th>Subject</th>
        <th style="text-align:center">Class Engagements<br><small style="font-weight:400;opacity:.7">(20%)</small></th>
        <th style="text-align:center">Learning Outputs<br><small style="font-weight:400;opacity:.7">(20%)</small></th>
        <th style="text-align:center">Quizzes<br><small style="font-weight:400;opacity:.7">(20%)</small></th>
        <th style="text-align:center">Midterm<br><small style="font-weight:400;opacity:.7">(20%)</small></th>
        <th style="text-align:center">Final<br><small style="font-weight:400;opacity:.7">(20%)</small></th>
        <th style="text-align:center">Total</th>
        <th style="text-align:center">Final Grade</th>
        <th>Remarks</th>
        <th>Edit</th>
      </tr></thead>
      <tbody>
        ${rows.map(r => `<tr>
          <td><code>${r.Subject_Code}</code><br><small style="color:var(--muted)">${r.Subject_Name}</small></td>
          <td style="text-align:center">${r.class_engagement ?? '—'}</td>
          <td style="text-align:center">${r.learning_outputs ?? '—'}</td>
          <td style="text-align:center">${r.quizzes ?? '—'}</td>
          <td style="text-align:center">${r.midterm ?? '—'}</td>
          <td style="text-align:center">${r.final ?? '—'}</td>
          <td style="text-align:center;font-weight:700">${r.total ? Number(r.total).toFixed(2) : '—'}</td>
          <td style="text-align:center;font-weight:700">${r.final_grade ?? '—'}</td>
          <td><span class="pill ${r.remarks === 'Passed' ? 'pill-enrolled' : r.remarks === 'Conditional Failure' ? 'pill-pending' : 'pill-rejected'}">${r.remarks || '—'}</span></td>
          <td>
            <button class="btn btn-outline btn-sm" onclick="openGradeEdit(${r.grade_id}, '${r.Subject_Name?.replace(/'/g, "\\'") || ''}', ${r.class_engagement ?? 0}, ${r.learning_outputs ?? 0}, ${r.quizzes ?? 0}, ${r.midterm ?? 0}, ${r.final ?? 0})">
              <i class="fas fa-edit"></i>
            </button>
          </td>
        </tr>`).join('')}
      </tbody>
    </table>
  </div>`;
}

function openGradeEdit(id, subject, ce, lo, qz, mt, fn) {
  document.getElementById('g-id').value = id;
  document.getElementById('grade-modal-subject').textContent = `Edit Grade — ${subject}`;
  document.getElementById('g-class-engagement').value = ce;
  document.getElementById('g-learning-outputs').value = lo;
  document.getElementById('g-quizzes').value = qz;
  document.getElementById('g-midterm').value = mt;
  document.getElementById('g-final').value = fn;
  openModal('grade-modal');
}

async function saveGrade() {
  const res = await post('grades', {
    action: 'update',
    grade_id: document.getElementById('g-id').value,
    class_engagement: document.getElementById('g-class-engagement').value,
    learning_outputs: document.getElementById('g-learning-outputs').value,
    quizzes: document.getElementById('g-quizzes').value,
    midterm: document.getElementById('g-midterm').value,
    final: document.getElementById('g-final').value,
  });
  toast(res.ok ? 'Grade updated!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('grade-modal'); }
}

// ══════════════════════════════════════════════════════════════════════════
// PAYMENTS
// ══════════════════════════════════════════════════════════════════════════

async function updatePaymentStatus(id, status) {
  const res = await post('payments', { action: 'update_status', payment_id: id, status });
  toast(res.ok ? `Payment marked as ${status}.` : res.msg, res.ok ? 'ok' : 'err');

}

// ══════════════════════════════════════════════════════════════════════════
// PROGRAMS
// ══════════════════════════════════════════════════════════════════════════
const PROG_PER_PAGE = 25;
let _progAllRows = [];
let _progPage = 1;
let _progSortCol = 'Program_Code';
let _progSortDir = 'asc';
let _progSelected = new Set();

function progSort(col) {
  if (_progSortCol === col) { _progSortDir = _progSortDir === 'asc' ? 'desc' : 'asc'; }
  else { _progSortCol = col; _progSortDir = 'asc'; }
  _progPage = 1; _progRender();
}

async function loadPrograms() {
  const search = document.getElementById('prog-search')?.value || '';
  const college = document.getElementById('prog-college-filter')?.value || '';
  const tbody = document.getElementById('prog-tbody');
  tbody.innerHTML = `<tr><td colspan="6" class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</td></tr>`;
  document.getElementById('prog-pagination').style.display = 'none';
  document.getElementById('prog-result-count').textContent = '';

  // Populate college filter — reset first to prevent duplicates on re-visit
  const collSel = document.getElementById('prog-college-filter');
  const _prevProgCollege = collSel.value;
  while (collSel.options.length > 1) collSel.remove(1);
  const cRes = await api('colleges');
  (cRes.data || []).forEach(c => {
    const o = document.createElement('option');
    o.value = String(c.college_id);
    o.textContent = c.college_name;
    collSel.appendChild(o);
  });
  if (_prevProgCollege) collSel.value = _prevProgCollege;

  const res = await api('programs', { search });
  if (!res.ok) { tbody.innerHTML = empty(6, `Failed to load: ${res.msg || 'unknown error'}`); return; }

  let rows = res.data || [];
  if (college) rows = rows.filter(r => String(r.college_id) === college);

  // Stats
  const uniqueColleges = new Set(rows.map(r => r.college_name).filter(Boolean)).size;
  const withSpecs = rows.filter(r => r.spec_count > 0).length;
  document.getElementById('prog-stat-total').textContent = rows.length;
  document.getElementById('prog-stat-colleges').textContent = uniqueColleges;
  document.getElementById('prog-stat-specs').textContent = withSpecs;
  document.getElementById('prog-result-count').textContent = `${rows.length} program${rows.length !== 1 ? 's' : ''} found`;

  _progAllRows = rows;
  _progPage = 1;
  _progSelected.clear();
  syncProgBulkBar();
  _progRender();
}

function _progRender() {
  const dir = _progSortDir === 'asc' ? 1 : -1;
  const col = _progSortCol;
  const sorted = [..._progAllRows].sort((a, b) => {
    const va = (a[col] ?? '').toString().toLowerCase();
    const vb = (b[col] ?? '').toString().toLowerCase();
    return va < vb ? -dir : va > vb ? dir : 0;
  });

  document.querySelectorAll('#sec-programs th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === col) th.classList.add(_progSortDir === 'asc' ? 'sort-asc' : 'sort-desc');
  });

  const total = sorted.length;
  const totalPages = Math.ceil(total / PROG_PER_PAGE) || 1;
  if (_progPage > totalPages) _progPage = totalPages;
  const start = (_progPage - 1) * PROG_PER_PAGE;
  const page = sorted.slice(start, start + PROG_PER_PAGE);

  const tbody = document.getElementById('prog-tbody');
  tbody.innerHTML = page.map(r => `
<tr>
  <td class="col-check"><input type="checkbox" class="row-cb prog-cb" value="${r.Program_Code}" ${_progSelected.has(r.Program_Code) ? 'checked' : ''} onchange="toggleProgRow(this)" /></td>
  <td><code>${r.Program_Code}</code></td>
  <td><strong>${r.Program_Name}</strong></td>
  <td style="font-size:.85rem">${r.college_name || '—'}</td>
  <td>
    <button class="btn btn-outline btn-sm" onclick="viewSpecializations(${r.Program_Code ? `'${r.Program_Code}'` : r.program_id},'${r.Program_Name?.replace(/'/g, "\\'") || ''}','${r.Program_Code}')">
      <i class="fas fa-list"></i> ${r.spec_count} Specs
    </button>
  </td>
  <td>
    <div class="action-btns">
      <button class="btn btn-outline btn-sm" onclick="editProgram('${r.Program_Code}','${r.Program_Name?.replace(/'/g, "\\'") || ''}',${r.college_id || 'null'})"><i class="fas fa-pen"></i> Edit</button>
      <button class="btn btn-danger btn-sm" onclick="deleteProgram('${r.Program_Code}','${r.Program_Name?.replace(/'/g, "\\'") || ''}')"><i class="fas fa-trash"></i> Delete</button>
    </div>
  </td>
</tr>
  `).join('') || empty(6);

  syncProgBulkBar();

  buildPagination(_progPage, totalPages, total, PROG_PER_PAGE,
    document.getElementById('prog-pagination'),
    document.getElementById('prog-pg-info'),
    document.getElementById('prog-pg-controls'),
    p => { _progPage = p; _progRender(); },
    'program');
}

function toggleAllProg(cb) {
  if (cb.checked) {
    // Select ALL rows across all pages
    _progAllRows.forEach(r => _progSelected.add(r.Program_Code));
  } else {
    // Deselect ALL rows across all pages
    _progSelected.clear();
  }
  _progRender(); // re-render so checkboxes reflect updated state
}
function toggleProgRow(cb, skipSync) {
  cb.checked ? _progSelected.add(cb.value) : _progSelected.delete(cb.value);
  if (!skipSync) syncProgBulkBar();
}
function syncProgBulkBar() {
  const bar = document.getElementById('prog-bulk-bar');
  const cnt = document.getElementById('prog-bulk-count');
  const n = _progSelected.size;
  bar.classList.toggle('visible', n > 0);
  cnt.textContent = `${n} selected`;
  const allCb = document.getElementById('prog-check-all');
  if (allCb) allCb.indeterminate = n > 0 && n < _progAllRows.length, allCb.checked = n === _progAllRows.length && n > 0;
}
function clearProgBulk() { _progSelected.clear(); _progRender(); }
async function bulkDeletePrograms() {
  if (!_progSelected.size) return;
  document.getElementById('delete-msg').textContent = `You are about to permanently delete ${_progSelected.size} program(s) and all their specializations.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    for (const code of _progSelected) {
      await post('programs', { action: 'delete', program_code: code });
    }
    toast(`${_progSelected.size} program(s) deleted.`, 'ok');
    _progSelected.clear();
    loadPrograms();
  };
  openModal('delete-modal');
}

function exportProgramsCSV() {
  if (!_progAllRows.length) { toast('No data to export.', 'err'); return; }
  const headers = ['Program Code', 'Program Name', 'College', 'Specializations'];
  const escape = v => { const s = v == null ? '' : String(v); return s.includes(',') || s.includes('"') ? `"${s.replace(/"/g, '""')}"` : s; };
  const rows = _progAllRows.map(r => [r.Program_Code, r.Program_Name, r.college_name || '', r.spec_count || 0].map(escape).join(','));
  const csv = [headers.join(','), ...rows].join('\r\n');
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a'); a.href = url;
  a.download = `programs_${new Date().toISOString().slice(0, 10)}.csv`;
  a.click(); URL.revokeObjectURL(url);
  toast(`Exported ${_progAllRows.length} programs to CSV`, 'ok');
}

function editProgram(code, name, collegeId) {
  document.getElementById('ep-orig-code').value = code;
  document.getElementById('ep-code').value = code;
  document.getElementById('ep-name').value = name;
  _fillCollegeSel('ep-college', collegeId);
  openModal('edit-prog-modal');
}

async function saveEditProgram() {
  const origCode = document.getElementById('ep-orig-code').value;
  const res = await post('programs', {
    action: 'update',
    orig_code: origCode,
    program_code: document.getElementById('ep-code').value,
    program_name: document.getElementById('ep-name').value,
    college_id: document.getElementById('ep-college').value,
  });
  toast(res.ok ? 'Program updated!' : (res.msg || 'Update failed.'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('edit-prog-modal'); loadPrograms(); }
}

async function viewSpecializations(programCode, programName) {
  document.getElementById('spec-modal-title').textContent = `Specializations — ${programName}`;
  document.getElementById('spec-modal-body').innerHTML = '<div class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</div>';
  openModal('spec-modal');
  const res = await api('programs', { specializations: 1, program_code: programCode });
  const specs = res.data || [];
  document.getElementById('spec-modal-body').innerHTML = specs.length
    ? `<ul style="padding-left:18px;line-height:2">${specs.map(s => `<li>${s.Specialization || s.specialization || s}</li>`).join('')}</ul>`
    + `<div style="margin-top:16px;padding-top:14px;border-top:1px solid var(--border)">
        <p style="font-size:.8rem;color:var(--muted);margin-bottom:8px">Add Specialization</p>
        <div style="display:flex;gap:8px">
          <input id="new-spec-input" type="text" placeholder="e.g. Web Development" style="flex:1;padding:8px 11px;border:1.5px solid var(--border);border-radius:8px;font-family:inherit;font-size:.875rem;outline:none" />
          <button class="btn btn-primary btn-sm" onclick="addSpecialization('${programCode}')"><i class="fas fa-plus"></i> Add</button>
        </div>
       </div>`
    : `<p style="color:var(--muted);font-size:.88rem">No specializations found.</p>
       <div style="margin-top:16px;padding-top:14px;border-top:1px solid var(--border)">
        <p style="font-size:.8rem;color:var(--muted);margin-bottom:8px">Add Specialization</p>
        <div style="display:flex;gap:8px">
          <input id="new-spec-input" type="text" placeholder="e.g. Web Development" style="flex:1;padding:8px 11px;border:1.5px solid var(--border);border-radius:8px;font-family:inherit;font-size:.875rem;outline:none" />
          <button class="btn btn-primary btn-sm" onclick="addSpecialization('${programCode}')"><i class="fas fa-plus"></i> Add</button>
        </div>
       </div>`;
}

async function addSpecialization(programCode) {
  const val = document.getElementById('new-spec-input')?.value?.trim();
  if (!val) return;
  const res = await post('programs', { action: 'add_specialization', program_code: programCode, specialization: val });
  toast(res.ok ? 'Specialization added!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) viewSpecializations(programCode, document.getElementById('spec-modal-title').textContent.replace('Specializations — ', ''));
}

async function deleteProgram(code, name) {
  document.getElementById('delete-msg').textContent = `You are about to permanently delete the program "${name}" (${code}) and all its specializations.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    const res = await post('programs', { action: 'delete', program_code: code });
    toast(res.ok ? 'Program deleted.' : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadPrograms();
  };
  openModal('delete-modal');
}

function openAddProgramModal() {
  _fillCollegeSel('prog-college');
  openModal('add-prog-modal');
}

async function saveNewProgram() {
  const res = await post('programs', {
    action: 'create',
    program_code: document.getElementById('prog-code').value,
    program_name: document.getElementById('prog-name').value,
    college_id: document.getElementById('prog-college').value,
    specializations: document.getElementById('prog-specs').value,
  });
  toast(res.ok ? 'Program created!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('add-prog-modal'); loadPrograms(); }
}

// ══════════════════════════════════════════════════════════════════════════
// SUBJECTS
// ══════════════════════════════════════════════════════════════════════════
const SUBJ_PER_PAGE = 25;
let _subjAllRows = [];
let _subjPage = 1;
let _subjSortCol = 'Subject_Code';
let _subjSortDir = 'asc';
let _subjSelected = new Set();

function subjSort(col) {
  if (_subjSortCol === col) { _subjSortDir = _subjSortDir === 'asc' ? 'desc' : 'asc'; }
  else { _subjSortCol = col; _subjSortDir = 'asc'; }
  _subjPage = 1; _subjRender();
}

async function loadSubjects() {
  const search = document.getElementById('subj-search')?.value || '';
  const college = document.getElementById('subj-college-filter')?.value || '';
  const credits = document.getElementById('subj-credits-filter')?.value || '';
  const tbody = document.getElementById('subj-tbody');
  tbody.innerHTML = `<tr><td colspan="7" class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</td></tr>`;
  document.getElementById('subj-pagination').style.display = 'none';
  document.getElementById('subj-result-count').textContent = '';

  // Populate college filter dropdown once
  const collSel = document.getElementById('subj-college-filter');
  if (collSel.options.length <= 1) {
    const cRes = await api('colleges');
    (cRes.data || []).forEach(c => {
      const o = document.createElement('option');
      o.value = c.college_name;
      o.textContent = c.college_name;
      collSel.appendChild(o);
    });
  }

  const res = await api('subjects', { search });
  if (!res.ok) { tbody.innerHTML = empty(7, `Failed to load: ${res.msg || 'unknown error'}`); return; }

  let rows = res.data || [];
  if (college) rows = rows.filter(r => (r.college_name || '') === college);
  if (credits) rows = rows.filter(r => String(r.Credits) === credits);

  // Stats
  const totalUnits = rows.reduce((s, r) => s + (parseFloat(r.Credits) || 0), 0);
  const uniqueColleges = new Set(rows.map(r => r.college_name).filter(Boolean)).size;
  document.getElementById('subj-stat-total').textContent = rows.length;
  document.getElementById('subj-stat-units').textContent = totalUnits;
  document.getElementById('subj-stat-colleges').textContent = uniqueColleges;
  document.getElementById('subj-result-count').textContent = `${rows.length} subject${rows.length !== 1 ? 's' : ''} found`;

  _subjAllRows = rows;
  _subjPage = 1;
  _subjSelected.clear();
  syncSubjBulkBar();
  _subjRender();
}

function _subjRender() {
  const dir = _subjSortDir === 'asc' ? 1 : -1;
  const col = _subjSortCol;
  const numericCols = new Set(['Credits']);
  const sorted = [..._subjAllRows].sort((a, b) => {
    if (numericCols.has(col)) return (Number(a[col] || 0) - Number(b[col] || 0)) * dir;
    const va = (a[col] ?? '').toString().toLowerCase();
    const vb = (b[col] ?? '').toString().toLowerCase();
    return va < vb ? -dir : va > vb ? dir : 0;
  });

  document.querySelectorAll('#sec-subjects th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === col) th.classList.add(_subjSortDir === 'asc' ? 'sort-asc' : 'sort-desc');
  });

  const total = sorted.length;
  const totalPages = Math.ceil(total / SUBJ_PER_PAGE) || 1;
  if (_subjPage > totalPages) _subjPage = totalPages;
  const start = (_subjPage - 1) * SUBJ_PER_PAGE;
  const page = sorted.slice(start, start + SUBJ_PER_PAGE);

  const tbody = document.getElementById('subj-tbody');
  tbody.innerHTML = page.map(r => `
<tr>
  <td class="col-check"><input type="checkbox" class="row-cb subj-cb" value="${r.Subject_Code}" ${_subjSelected.has(r.Subject_Code) ? 'checked' : ''} onchange="toggleSubjRow(this)" /></td>
  <td><code>${r.Subject_Code}</code></td>
  <td><strong>${r.Subject_Name}</strong></td>
  <td style="text-align:center"><span class="pill pill-submitted">${r.Credits} unit${r.Credits != 1 ? 's' : ''}</span></td>
  <td style="font-size:.82rem">${r.college_name || '—'}</td>
  <td style="font-size:.8rem;color:var(--muted);max-width:200px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap" title="${r.Description || ''}">${r.Description || '—'}</td>
  <td>
    <div class="action-btns">
      <button class="btn btn-outline btn-sm" onclick="editSubject('${r.Subject_Code}','${r.Subject_Name?.replace(/'/g, "\\'") || ''}',${r.Credits},'${(r.college_name || '').replace(/'/g, "\\'")}',${r.college_id || 'null'},'${(r.Description || '').replace(/'/g, "\\'")}')"><i class="fas fa-pen"></i> Edit</button>
      <button class="btn btn-danger btn-sm" onclick="deleteSubject('${r.Subject_Code}','${r.Subject_Name?.replace(/'/g, "\\'") || ''}')"><i class="fas fa-trash"></i> Delete</button>
    </div>
  </td>
</tr>
  `).join('') || empty(7);

  syncSubjBulkBar();

  buildPagination(_subjPage, totalPages, total, SUBJ_PER_PAGE,
    document.getElementById('subj-pagination'),
    document.getElementById('subj-pg-info'),
    document.getElementById('subj-pg-controls'),
    p => { _subjPage = p; _subjRender(); },
    'subject');
}

function toggleAllSubj(cb) {
  document.querySelectorAll('.subj-cb').forEach(el => { el.checked = cb.checked; toggleSubjRow(el, true); });
  syncSubjBulkBar();
}
function toggleSubjRow(cb, skipSync) {
  cb.checked ? _subjSelected.add(cb.value) : _subjSelected.delete(cb.value);
  if (!skipSync) syncSubjBulkBar();
}
function syncSubjBulkBar() {
  const bar = document.getElementById('subj-bulk-bar');
  const cnt = document.getElementById('subj-bulk-count');
  const n = _subjSelected.size;
  bar.classList.toggle('visible', n > 0);
  cnt.textContent = `${n} selected`;
  const allCb = document.getElementById('subj-check-all');
  if (allCb) allCb.indeterminate = n > 0 && n < _subjAllRows.length, allCb.checked = n === _subjAllRows.length && n > 0;
}
function clearSubjBulk() { _subjSelected.clear(); _subjRender(); }
async function bulkDeleteSubjects() {
  if (!_subjSelected.size) return;
  document.getElementById('delete-msg').textContent = `You are about to permanently delete ${_subjSelected.size} subject(s).`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    for (const code of _subjSelected) {
      await post('subjects', { action: 'delete', subject_code: code });
    }
    toast(`${_subjSelected.size} subject(s) deleted.`, 'ok');
    _subjSelected.clear();
    loadSubjects();
  };
  openModal('delete-modal');
}

function exportSubjectsCSV() {
  if (!_subjAllRows.length) { toast('No data to export.', 'err'); return; }
  const headers = ['Subject Code', 'Subject Name', 'Credits', 'College', 'Description'];
  const escape = v => { const s = v == null ? '' : String(v); return s.includes(',') || s.includes('"') || s.includes('\n') ? `"${s.replace(/"/g, '""')}"` : s; };
  const rows = _subjAllRows.map(r => [r.Subject_Code, r.Subject_Name, r.Credits, r.college_name || '', r.Description || ''].map(escape).join(','));
  const csv = [headers.join(','), ...rows].join('\r\n');
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a'); a.href = url;
  a.download = `subjects_${new Date().toISOString().slice(0, 10)}.csv`;
  a.click(); URL.revokeObjectURL(url);
  toast(`Exported ${_subjAllRows.length} subjects to CSV`, 'ok');
}

function editSubject(code, name, credits, collegeName, collegeId, desc) {
  document.getElementById('es-orig-code').value = code;
  document.getElementById('es-code').value = code;
  document.getElementById('es-name').value = name;
  document.getElementById('es-credits').value = credits;
  document.getElementById('es-desc').value = desc || '';
  _fillCollegeSel('es-college', collegeId);
  openModal('edit-subj-modal');
}

async function saveEditSubject() {
  const origCode = document.getElementById('es-orig-code').value;
  const res = await post('subjects', {
    action: 'update',
    orig_code: origCode,
    subject_code: document.getElementById('es-code').value,
    subject_name: document.getElementById('es-name').value,
    credits: document.getElementById('es-credits').value,
    college_id: document.getElementById('es-college').value,
    description: document.getElementById('es-desc').value,
  });
  toast(res.ok ? 'Subject updated!' : (res.msg || 'Update failed.'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('edit-subj-modal'); loadSubjects(); }
}

async function deleteSubject(code, name) {
  document.getElementById('delete-msg').textContent = `You are about to permanently delete the subject "${name}" (${code}).`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    const res = await post('subjects', { action: 'delete', subject_code: code });
    toast(res.ok ? 'Subject deleted.' : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadSubjects();
  };
  openModal('delete-modal');
}

function openAddSubjectModal() {
  _fillCollegeSel('subj-college');
  openModal('add-subj-modal');
}

async function saveNewSubject() {
  const res = await post('subjects', {
    action: 'create',
    subject_code: document.getElementById('subj-code').value,
    subject_name: document.getElementById('subj-name').value,
    credits: document.getElementById('subj-credits').value,
    college_id: document.getElementById('subj-college').value,
    description: document.getElementById('subj-desc').value,
  });
  toast(res.ok ? 'Subject created!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('add-subj-modal'); loadSubjects(); }
}

// ══════════════════════════════════════════════════════════════════════════
// INSTRUCTORS
// ══════════════════════════════════════════════════════════════════════════
const INST_PER_PAGE = 25;
let _instAllRows = [];
let _instPage = 1;
let _instSortCol = 'Last_Name';
let _instSortDir = 'asc';
let _instSelected = new Set();

function instSort(col) {
  if (_instSortCol === col) { _instSortDir = _instSortDir === 'asc' ? 'desc' : 'asc'; }
  else { _instSortCol = col; _instSortDir = 'asc'; }
  _instPage = 1; _instRender();
}

async function loadInstructors() {
  const search = document.getElementById('inst-search')?.value || '';
  const college = document.getElementById('inst-college-filter')?.value || '';
  const campus = document.getElementById('inst-campus-filter')?.value || '';
  const tbody = document.getElementById('inst-tbody');
  tbody.innerHTML = `<tr><td colspan="8" class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</td></tr>`;
  document.getElementById('inst-pagination').style.display = 'none';
  document.getElementById('inst-result-count').textContent = '';

  // Populate college filter — reset first to prevent duplicates on re-visit
  const collSel = document.getElementById('inst-college-filter');
  const _prevInstCollege = collSel.value;
  while (collSel.options.length > 1) collSel.remove(1);
  const cResCol = await api('colleges');
  (cResCol.data || []).forEach(c => {
    const o = document.createElement('option'); o.value = c.college_name; o.textContent = c.college_name;
    collSel.appendChild(o);
  });
  if (_prevInstCollege) collSel.value = _prevInstCollege;
  // Populate campus filter — reset first to prevent duplicates on re-visit
  const campSel = document.getElementById('inst-campus-filter');
  const _prevInstCampus = campSel.value;
  while (campSel.options.length > 1) campSel.remove(1);
  const cResCamp = await api('campus');
  (cResCamp.data || []).forEach(c => {
    const o = document.createElement('option'); o.value = c.Campus_Name; o.textContent = c.Campus_Name;
    campSel.appendChild(o);
  });
  if (_prevInstCampus) campSel.value = _prevInstCampus;

  const res = await api('instructors', { search });
  if (!res.ok) { tbody.innerHTML = empty(8, `Failed to load: ${res.msg || 'unknown error'}`); return; }

  let rows = res.data || [];
  if (college) rows = rows.filter(r => (r.college_name || '') === college);
  if (campus) rows = rows.filter(r => (r.Campus_Name || '') === campus);

  // Stats
  const uniqueColleges = new Set(rows.map(r => r.college_name).filter(Boolean)).size;
  const uniqueCampuses = new Set(rows.map(r => r.Campus_Name).filter(Boolean)).size;
  document.getElementById('inst-stat-total').textContent = rows.length;
  document.getElementById('inst-stat-colleges').textContent = uniqueColleges;
  document.getElementById('inst-stat-campuses').textContent = uniqueCampuses;
  document.getElementById('inst-result-count').textContent = `${rows.length} instructor${rows.length !== 1 ? 's' : ''} found`;

  _instAllRows = rows;
  _instPage = 1;
  _instSelected.clear();
  syncInstBulkBar();
  _instRender();
}

function _instRender() {
  const dir = _instSortDir === 'asc' ? 1 : -1;
  const col = _instSortCol;
  const sorted = [..._instAllRows].sort((a, b) => {
    const va = (a[col] ?? '').toString().toLowerCase();
    const vb = (b[col] ?? '').toString().toLowerCase();
    return va < vb ? -dir : va > vb ? dir : 0;
  });

  document.querySelectorAll('#sec-instructors th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === col) th.classList.add(_instSortDir === 'asc' ? 'sort-asc' : 'sort-desc');
  });

  const total = sorted.length;
  const totalPages = Math.ceil(total / INST_PER_PAGE) || 1;
  if (_instPage > totalPages) _instPage = totalPages;
  const start = (_instPage - 1) * INST_PER_PAGE;
  const page = sorted.slice(start, start + INST_PER_PAGE);

  const tbody = document.getElementById('inst-tbody');
  tbody.innerHTML = page.map(r => {
    const id = r.instructor_id || r.Instructor_ID;
    const name = `${r.Last_Name}, ${r.First_Name}${r.Middle_Name ? ' ' + r.Middle_Name : ''}`;
    return `
<tr>
  <td class="col-check"><input type="checkbox" class="row-cb inst-cb" value="${id}" ${_instSelected.has(String(id)) ? 'checked' : ''} onchange="toggleInstRow(this)" /></td>
  <td>
    <strong>${name}</strong>${r.Suffix_Title ? ` <small style="color:var(--muted)">${r.Suffix_Title}</small>` : ''}
  </td>
  <td><code>${r.Degree || '—'}</code></td>
  <td style="font-size:.8rem;color:var(--muted)">${r.Email || '—'}</td>
  <td style="font-size:.82rem"><code>${r.Subject_Code || '—'}</code>${r.Subject_Name ? `<br><small style="color:var(--muted)">${r.Subject_Name}</small>` : ''}</td>
  <td style="font-size:.82rem">${r.college_name || '—'}</td>
  <td style="font-size:.82rem">${r.Campus_Name || '—'}</td>
  <td>
    <div class="action-btns">
      <button class="btn btn-outline btn-sm" onclick="editInstructor(${id})"><i class="fas fa-pen"></i> Edit</button>
      <button class="btn btn-danger btn-sm" onclick="deleteInstructor(${id},'${name.replace(/'/g, "\\'")}')" ><i class="fas fa-trash"></i> Delete</button>
    </div>
  </td>
</tr>`;
  }).join('') || empty(8);

  syncInstBulkBar();

  buildPagination(_instPage, totalPages, total, INST_PER_PAGE,
    document.getElementById('inst-pagination'),
    document.getElementById('inst-pg-info'),
    document.getElementById('inst-pg-controls'),
    p => { _instPage = p; _instRender(); },
    'instructor');
}

function toggleAllInst(cb) {
  document.querySelectorAll('.inst-cb').forEach(el => { el.checked = cb.checked; toggleInstRow(el, true); });
  syncInstBulkBar();
}
function toggleInstRow(cb, skipSync) {
  cb.checked ? _instSelected.add(cb.value) : _instSelected.delete(cb.value);
  if (!skipSync) syncInstBulkBar();
}
function syncInstBulkBar() {
  const bar = document.getElementById('inst-bulk-bar');
  const cnt = document.getElementById('inst-bulk-count');
  const n = _instSelected.size;
  bar.classList.toggle('visible', n > 0);
  cnt.textContent = `${n} selected`;
  const allCb = document.getElementById('inst-check-all');
  if (allCb) allCb.indeterminate = n > 0 && n < _instAllRows.length, allCb.checked = n === _instAllRows.length && n > 0;
}
function clearInstBulk() { _instSelected.clear(); _instRender(); }
async function bulkDeleteInstructors() {
  if (!_instSelected.size) return;
  document.getElementById('delete-msg').textContent = `You are about to permanently delete ${_instSelected.size} instructor record(s).`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    for (const id of _instSelected) {
      await post('instructors', { action: 'delete', instructor_id: id });
    }
    toast(`${_instSelected.size} instructor(s) deleted.`, 'ok');
    _instSelected.clear();
    loadInstructors();
  };
  openModal('delete-modal');
}

function exportInstructorsCSV() {
  if (!_instAllRows.length) { toast('No data to export.', 'err'); return; }
  const headers = ['Last Name', 'First Name', 'Middle Name', 'Suffix', 'Degree', 'Email', 'Primary Subject', 'College', 'Campus'];
  const escape = v => { const s = v == null ? '' : String(v); return s.includes(',') || s.includes('"') ? `"${s.replace(/"/g, '""')}"` : s; };
  const rows = _instAllRows.map(r => [r.Last_Name, r.First_Name, r.Middle_Name || '', r.Suffix_Title || '', r.Degree || '', r.Email || '', r.Subject_Code || '', r.college_name || '', r.Campus_Name || ''].map(escape).join(','));
  const csv = [headers.join(','), ...rows].join('\r\n');
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a'); a.href = url;
  a.download = `instructors_${new Date().toISOString().slice(0, 10)}.csv`;
  a.click(); URL.revokeObjectURL(url);
  toast(`Exported ${_instAllRows.length} instructors to CSV`, 'ok');
}

async function editInstructor(id) {
  const r = _instAllRows.find(x => (x.instructor_id || x.Instructor_ID) == id);
  if (!r) { toast('Record not found.', 'err'); return; }
  document.getElementById('ei-id').value = id;
  document.getElementById('ei-first').value = r.First_Name || '';
  document.getElementById('ei-middle').value = r.Middle_Name || '';
  document.getElementById('ei-last').value = r.Last_Name || '';
  document.getElementById('ei-suffix').value = r.Suffix_Title || '';
  document.getElementById('ei-degree').value = r.Degree || '';
  document.getElementById('ei-email').value = r.Email || '';
  _fillCollegeSel('ei-college', r.college_id);
  // populate subject dropdown
  const sSel = document.getElementById('ei-subject');
  sSel.innerHTML = '<option value="">— Select Subject —</option>';
  const sRes = await api('subjects');
  (sRes.data || []).forEach(s => {
    const o = document.createElement('option');
    o.value = s.Subject_Code; o.textContent = `${s.Subject_Code} — ${s.Subject_Name}`;
    if (s.Subject_Code === r.Subject_Code) o.selected = true;
    sSel.appendChild(o);
  });
  // populate campus dropdown
  const cSel = document.getElementById('ei-campus');
  cSel.innerHTML = '<option value="">— Select Campus —</option>';
  const cRes = await api('campus');
  (cRes.data || []).forEach(c => {
    const o = document.createElement('option');
    o.value = c.Campus_Name; o.textContent = c.Campus_Name;
    if (c.Campus_Name === r.Campus_Name) o.selected = true;
    cSel.appendChild(o);
  });
  openModal('edit-inst-modal');
}

async function saveEditInstructor() {
  const id = document.getElementById('ei-id').value;
  const res = await post('instructors', {
    action: 'update',
    instructor_id: id,
    first_name: document.getElementById('ei-first').value,
    middle_name: document.getElementById('ei-middle').value,
    last_name: document.getElementById('ei-last').value,
    suffix_title: document.getElementById('ei-suffix').value,
    degree: document.getElementById('ei-degree').value,
    email: document.getElementById('ei-email').value,
    subject_code: document.getElementById('ei-subject').value,
    college_id: document.getElementById('ei-college').value,
    campus_name: document.getElementById('ei-campus').value,
  });
  toast(res.ok ? 'Instructor updated!' : (res.msg || 'Update failed.'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('edit-inst-modal'); loadInstructors(); }
}

function openAddInstructorModal() {
  _fillCollegeSel('inst-college');
  api('subjects').then(sRes => {
    const sSel = document.getElementById('inst-subject');
    sSel.innerHTML = '<option value="">— Select Subject —</option>';
    (sRes.data || []).forEach(s => sSel.innerHTML += `<option value="${s.Subject_Code}">${s.Subject_Code} — ${s.Subject_Name}</option>`);
  });
  api('campus').then(cRes => {
    const cSel = document.getElementById('inst-campus');
    cSel.innerHTML = '<option value="">— Select Campus —</option>';
    (cRes.data || []).forEach(c => cSel.innerHTML += `<option value="${c.Campus_Name}">${c.Campus_Name}</option>`);
  });
  openModal('add-inst-modal');
}

async function saveNewInstructor() {
  const res = await post('instructors', {
    action: 'create',
    first_name: document.getElementById('inst-first').value,
    middle_name: document.getElementById('inst-middle').value,
    last_name: document.getElementById('inst-last').value,
    suffix_title: document.getElementById('inst-suffix').value,
    degree: document.getElementById('inst-degree').value,
    email: document.getElementById('inst-email').value,
    subject_code: document.getElementById('inst-subject').value,
    college_id: document.getElementById('inst-college').value,
    campus_name: document.getElementById('inst-campus').value,
  });
  toast(res.ok ? 'Instructor created!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('add-inst-modal'); loadInstructors(); }
}

async function deleteInstructor(id, name) {
  document.getElementById('delete-msg').textContent = `You are about to permanently delete the instructor record of "${name}".`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    const res = await post('instructors', { action: 'delete', instructor_id: id });
    toast(res.ok ? 'Instructor deleted.' : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadInstructors();
  };
  openModal('delete-modal');
}

// ══════════════════════════════════════════════════════════════════════════
// COLLEGES
// ══════════════════════════════════════════════════════════════════════════
let _collData = [], _collSort = { col: 'college_name', dir: 'asc' }, _collPage = 1;
const COLL_PER_PAGE = 15;
let _collSelected = new Set();

async function loadColleges() {
  const search = document.getElementById('coll-search')?.value?.toLowerCase() || '';
  const tbody = document.getElementById('coll-tbody');
  tbody.innerHTML = `<tr><td colspan="6" class="loading">Loading…</td></tr>`;
  const res = await api('colleges');
  if (!res.ok) { tbody.innerHTML = empty(6); return; }
  let data = res.data || [];

  // Stats
  document.getElementById('coll-stat-total').textContent = data.length;
  document.getElementById('coll-stat-programs').textContent = data.reduce((s, r) => s + (parseInt(r.program_count) || 0), 0);

  // Filter
  if (search) data = data.filter(r => (r.college_code || '').toLowerCase().includes(search) || (r.college_name || '').toLowerCase().includes(search));

  // Sort
  const sc = _collSort.col, sd = _collSort.dir === 'asc' ? 1 : -1;
  data.sort((a, b) => {
    const av = sc === 'program_count' ? (parseInt(a[sc]) || 0) : (a[sc] || '').toString().toLowerCase();
    const bv = sc === 'program_count' ? (parseInt(b[sc]) || 0) : (b[sc] || '').toString().toLowerCase();
    return av < bv ? -sd : av > bv ? sd : 0;
  });

  _collData = data;
  document.getElementById('coll-result-count').textContent = data.length ? `${data.length} college${data.length !== 1 ? 's' : ''} found` : '';
  _collPage = 1;
  renderColleges();
  updateCollSortUI();
}

function renderColleges() {
  const tbody = document.getElementById('coll-tbody');
  const total = _collData.length;
  const pages = Math.ceil(total / COLL_PER_PAGE) || 1;
  if (_collPage > pages) _collPage = pages;
  const slice = _collData.slice((_collPage - 1) * COLL_PER_PAGE, _collPage * COLL_PER_PAGE);

  tbody.innerHTML = slice.length ? slice.map(r => `
    <tr>
      <td class="col-check"><input type="checkbox" class="row-cb coll-cb" data-id="${r.college_code}" ${_collSelected.has(r.college_code) ? 'checked' : ''} onchange="toggleCollRow(this)" /></td>
      <td><code>${r.college_code || '—'}</code></td>
      <td><strong>${r.college_name}</strong></td>
      <td style="font-size:.82rem">${r.college_email || '—'}</td>
      <td><span class="pill pill-submitted">${r.program_count} program${r.program_count != 1 ? 's' : ''}</span></td>
      <td>
        <div class="action-btns">
          <button class="btn btn-gold btn-sm" onclick="editCollege('${r.college_code}','${(r.college_name || '').replace(/'/g, "\\'")}','${(r.college_email || '')}')"><i class="fas fa-pen"></i> Edit</button>
          <button class="btn btn-danger btn-sm" onclick="deleteCollege('${r.college_code}','${(r.college_name || '').replace(/'/g, "\\'")}')"><i class="fas fa-trash"></i> Delete</button>
        </div>
      </td>
    </tr>`).join('') : empty(6);

  buildPagination(_collPage, pages, total, COLL_PER_PAGE,
    document.getElementById('coll-pagination'),
    document.getElementById('coll-pg-info'),
    document.getElementById('coll-pg-controls'),
    p => { _collPage = p; renderColleges(); },
    'college');
}

function collSort(col) {
  if (_collSort.col === col) _collSort.dir = _collSort.dir === 'asc' ? 'desc' : 'asc';
  else { _collSort.col = col; _collSort.dir = 'asc'; }
  const sc = _collSort.col, sd = _collSort.dir === 'asc' ? 1 : -1;
  _collData.sort((a, b) => {
    const av = sc === 'program_count' ? (parseInt(a[sc]) || 0) : (a[sc] || '').toString().toLowerCase();
    const bv = sc === 'program_count' ? (parseInt(b[sc]) || 0) : (b[sc] || '').toString().toLowerCase();
    return av < bv ? -sd : av > bv ? sd : 0;
  });
  _collPage = 1; renderColleges(); updateCollSortUI();
}

function updateCollSortUI() {
  document.querySelectorAll('#sec-colleges th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === _collSort.col) th.classList.add(_collSort.dir === 'asc' ? 'sort-asc' : 'sort-desc');
  });
}

function toggleAllColl(cb) {
  document.querySelectorAll('.coll-cb').forEach(el => { el.checked = cb.checked; toggleCollRow(el, true); });
  syncCollBulkBar();
}

function toggleCollRow(cb, skipSync) {
  cb.checked ? _collSelected.add(cb.dataset.id) : _collSelected.delete(cb.dataset.id);
  if (!skipSync) syncCollBulkBar();
}

function syncCollBulkBar() {
  const bar = document.getElementById('coll-bulk-bar');
  const cnt = document.getElementById('coll-bulk-count');
  const n = _collSelected.size;
  bar.classList.toggle('visible', n > 0);
  cnt.textContent = `${n} selected`;
  const allCb = document.getElementById('coll-check-all');
  if (allCb) allCb.indeterminate = n > 0 && n < _collData.length, allCb.checked = n === _collData.length && n > 0;
}

function clearCollBulk() { _collSelected.clear(); renderColleges(); }

async function bulkDeleteColleges() {
  if (!_collSelected.size) return;
  if (!confirm(`Delete ${_collSelected.size} college(s)? This cannot be undone.`)) return;
  let ok = 0;
  for (const code of _collSelected) {
    const r = await post('colleges', { action: 'delete', college_code: code });
    if (r.ok) ok++;
  }
  toast(ok ? `${ok} college(s) deleted.` : 'Delete failed.', ok ? 'ok' : 'err');
  _collSelected.clear(); loadColleges();
}

function exportCollegesCSV() {
  if (!_collData.length) { toast('No data to export.', 'err'); return; }
  const headers = ['Code', 'College Name', 'Email', 'Programs'];
  const rows = _collData.map(r => [r.college_code, r.college_name, r.college_email || '', r.program_count].map(v => `"${String(v).replace(/"/g, '""')}"`).join(','));
  const csv = [headers.join(','), ...rows].join('\n');
  const a = document.createElement('a');
  a.href = 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv);
  a.download = 'colleges.csv'; a.click();
}

function openAddCollegeModal() {
  ['coll-code', 'coll-name', 'coll-email'].forEach(id => document.getElementById(id).value = '');
  openModal('add-coll-modal');
}

async function saveNewCollege() {
  const code = document.getElementById('coll-code').value.trim();
  const name = document.getElementById('coll-name').value.trim();
  if (!code || !name) { toast('Code and Name are required.', 'err'); return; }
  const res = await post('colleges', { action: 'create', college_code: code, college_name: name, college_email: document.getElementById('coll-email').value.trim() });
  toast(res.ok ? 'College created!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { _collegesCache = null; closeModal('add-coll-modal'); loadColleges(); }
}

function editCollege(code, name, email) {
  document.getElementById('ec-orig-code').value = code;
  document.getElementById('ec-code').value = code;
  document.getElementById('ec-name').value = name;
  document.getElementById('ec-email').value = email;
  openModal('edit-coll-modal');
}

async function saveEditCollege() {
  const orig = document.getElementById('ec-orig-code').value;
  const code = document.getElementById('ec-code').value.trim();
  const name = document.getElementById('ec-name').value.trim();
  if (!code || !name) { toast('Code and Name are required.', 'err'); return; }
  const res = await post('colleges', { action: 'update', orig_code: orig, college_code: code, college_name: name, college_email: document.getElementById('ec-email').value.trim() });
  toast(res.ok ? 'College updated!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { _collegesCache = null; closeModal('edit-coll-modal'); loadColleges(); }
}

async function deleteCollege(code, name) {
  document.getElementById('delete-msg').textContent = `You are about to permanently delete college "${name}" (${code}). All associated programs may be affected.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    const res = await post('colleges', { action: 'delete', college_code: code });
    toast(res.ok ? 'College deleted.' : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) { _collegesCache = null; loadColleges(); }
  };
  openModal('delete-modal');
}

// ══════════════════════════════════════════════════════════════════════════
// CAMPUS
// ══════════════════════════════════════════════════════════════════════════
const CAMP_PER_PAGE = 20;
let _campAllRows = [];
let _campFiltered = [];
let _campPage = 1;
let _campSortCol = 'Campus_Name';
let _campSortDir = 'asc';
let _campSelected = new Set();

function campSort(col) {
  if (_campSortCol === col) { _campSortDir = _campSortDir === 'asc' ? 'desc' : 'asc'; }
  else { _campSortCol = col; _campSortDir = 'asc'; }
  _campPage = 1; renderCampus();
}

async function loadCampus() {
  const tbody = document.getElementById('camp-tbody');
  tbody.innerHTML = `<tr><td colspan="6" class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</td></tr>`;
  document.getElementById('camp-pagination').style.display = 'none';

  const res = await api('campus');
  if (!res.ok) { tbody.innerHTML = empty(6, `Failed to load: ${res.msg || 'unknown error'}`); return; }

  _campAllRows = res.data || [];
  _campPage = 1;
  renderCampus();
}

function renderCampus() {
  let rows = [..._campAllRows];

  // Sort
  const dir = _campSortDir === 'asc' ? 1 : -1;
  const col = _campSortCol;
  rows.sort((a, b) => {
    const va = (a[col] ?? '').toString().toLowerCase();
    const vb = (b[col] ?? '').toString().toLowerCase();
    if (col === 'Campus_Id') return (parseInt(a[col]) || 0) < (parseInt(b[col]) || 0) ? -dir : (parseInt(a[col]) || 0) > (parseInt(b[col]) || 0) ? dir : 0;
    return va < vb ? -dir : va > vb ? dir : 0;
  });

  document.querySelectorAll('#sec-campus th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === col) th.classList.add(_campSortDir === 'asc' ? 'sort-asc' : 'sort-desc');
  });

  _campFiltered = rows;
  const total = rows.length;
  const totalPages = Math.ceil(total / CAMP_PER_PAGE) || 1;
  if (_campPage > totalPages) _campPage = totalPages;
  const start = (_campPage - 1) * CAMP_PER_PAGE;
  const page = rows.slice(start, start + CAMP_PER_PAGE);

  document.getElementById('camp-result-count').textContent = total ? `${total} campus${total !== 1 ? 'es' : ''} found` : '';

  const tbody = document.getElementById('camp-tbody');
  tbody.innerHTML = page.map(r => {
    const id = r.Campus_Id || r.campus_id;
    return `
    <tr>
      <td><strong>${r.Campus_Name}</strong></td>
      <td style="font-size:.85rem">${r.Barangay || '—'}</td>
      <td style="font-size:.85rem">${r.Municipality || '—'}</td>
      <td style="font-size:.85rem">${r.Province || '—'}</td>
      <td style="font-size:.8rem;color:var(--muted)">${r.campus_email || '—'}</td>
      <td>
        <div class="action-btns">
          <button class="btn btn-outline btn-sm" onclick="editCampus(${id})"><i class="fas fa-pen"></i> Edit</button>
        </div>
      </td>
    </tr>`;
  }).join('') || empty(6);

  buildPagination(_campPage, totalPages, total, CAMP_PER_PAGE,
    document.getElementById('camp-pagination'),
    document.getElementById('camp-pg-info'),
    document.getElementById('camp-pg-controls'),
    p => { _campPage = p; renderCampus(); },
    'campus');
}

function toggleAllCamp(cb) {
  document.querySelectorAll('.camp-cb').forEach(el => { el.checked = cb.checked; toggleCampRow(el, true); });
  syncCampBulkBar();
}
function toggleCampRow(cb, skipSync) {
  cb.checked ? _campSelected.add(cb.value) : _campSelected.delete(cb.value);
  if (!skipSync) syncCampBulkBar();
}
function syncCampBulkBar() {
  const bar = document.getElementById('camp-bulk-bar');
  const cnt = document.getElementById('camp-bulk-count');
  if (!bar) return; // bulk bar removed from UI
  const n = _campSelected.size;
  bar.classList.toggle('visible', n > 0);
  if (cnt) cnt.textContent = `${n} selected`;
  const allCb = document.getElementById('camp-check-all');
  if (allCb) allCb.indeterminate = n > 0 && n < _campAllRows.length, allCb.checked = n === _campAllRows.length && n > 0;
}
function clearCampBulk() { _campSelected.clear(); renderCampus(); }
async function bulkDeleteCampuses() {
  if (!_campSelected.size) return;
  document.getElementById('delete-msg').textContent = `You are about to permanently delete ${_campSelected.size} campus(es). This may affect students, instructors, and sections linked to these campuses.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    for (const id of _campSelected) {
      await post('campus', { action: 'delete', campus_id: id });
    }
    toast(`${_campSelected.size} campus(es) deleted.`, 'ok');
    _campSelected.clear();
    loadCampus();
  };
  openModal('delete-modal');
}

function exportCampusCSV() {
  if (!_campFiltered.length) { toast('No data to export.', 'err'); return; }
  const headers = ['ID', 'Campus Name', 'Barangay', 'Municipality', 'Province', 'Email'];
  const escape = v => { const s = v == null ? '' : String(v); return s.includes(',') || s.includes('"') ? `"${s.replace(/"/g, '""')}"` : s; };
  const rows = _campFiltered.map(r => [r.Campus_Id, r.Campus_Name, r.Barangay || '', r.Municipality || '', r.Province || '', r.campus_email || ''].map(escape).join(','));
  const csv = [headers.join(','), ...rows].join('\r\n');
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a'); a.href = url;
  a.download = `campuses_${new Date().toISOString().slice(0, 10)}.csv`;
  a.click(); URL.revokeObjectURL(url);
  toast(`Exported ${_campFiltered.length} campuses to CSV`, 'ok');
}

function openAddCampusModal() {
  ['camp-name', 'camp-barangay', 'camp-municipality', 'camp-province', 'camp-email'].forEach(id => {
    const el = document.getElementById(id); if (el) el.value = '';
  });
  openModal('add-camp-modal');
}

async function saveNewCampus() {
  const res = await post('campus', {
    action: 'create',
    campus_name: document.getElementById('camp-name').value,
    barangay: document.getElementById('camp-barangay').value,
    municipality: document.getElementById('camp-municipality').value,
    province: document.getElementById('camp-province').value,
    campus_email: document.getElementById('camp-email').value,
  });
  toast(res.ok ? 'Campus created!' : (res.msg || 'Create failed.'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('add-camp-modal'); loadCampus(); }
}

async function editCampus(id) {
  const row = _campAllRows.find(r => (r.Campus_Id || r.campus_id) == id);
  if (!row) return;
  document.getElementById('ec-camp-id').value = id;
  document.getElementById('ec-camp-name').value = row.Campus_Name || '';
  document.getElementById('ec-camp-barangay').value = row.Barangay || '';
  document.getElementById('ec-camp-municipality').value = row.Municipality || '';
  document.getElementById('ec-camp-province').value = row.Province || '';
  document.getElementById('ec-camp-email').value = row.campus_email || '';
  openModal('edit-camp-modal');
}

async function saveEditCampus() {
  const id = document.getElementById('ec-camp-id').value;
  if (!id) { toast('No campus loaded.', 'err'); return; }
  const res = await post('campus', {
    action: 'update',
    campus_id: id,
    campus_name: document.getElementById('ec-camp-name').value,
    barangay: document.getElementById('ec-camp-barangay').value,
    municipality: document.getElementById('ec-camp-municipality').value,
    province: document.getElementById('ec-camp-province').value,
    campus_email: document.getElementById('ec-camp-email').value,
  });
  toast(res.ok ? 'Campus updated!' : (res.msg || 'Update failed.'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('edit-camp-modal'); loadCampus(); }
}

async function deleteCampus(id, name) {
  document.getElementById('delete-msg').textContent = `You are about to permanently delete the campus "${name}" (ID: ${id}). Students, instructors, and sections linked to this campus may be affected.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    const res = await post('campus', { action: 'delete', campus_id: id });
    toast(res.ok ? 'Campus deleted.' : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadCampus();
  };
  openModal('delete-modal');
}

// ══════════════════════════════════════════════════════════════════════════
// SECTIONS
// ══════════════════════════════════════════════════════════════════════════
let _sectData = [], _sectSort = { col: 'section_name', dir: 'asc' }, _sectPage = 1;
const SECT_PER_PAGE = 15;
let _sectSelected = new Set();

async function loadSections() {
  const search = document.getElementById('sect-search')?.value || '';
  const yearLevel = document.getElementById('sect-year')?.value || '';
  const campusFilter = document.getElementById('sect-campus-filter')?.value || '';
  const collegeFilter = document.getElementById('sect-college-filter')?.value || '';
  const tbody = document.getElementById('sect-tbody');
  tbody.innerHTML = `<tr><td colspan="7" class="loading">Loading…</td></tr>`;
  const res = await api('sections', { search, year_level: yearLevel });
  if (!res.ok) { tbody.innerHTML = empty(7); return; }
  let data = res.data || [];

  // Populate campus filter — reset first to prevent duplicates on re-visit
  const campusSel = document.getElementById('sect-campus-filter');
  const _prevSectCampus = campusSel ? campusSel.value : '';
  if (campusSel) {
    while (campusSel.options.length > 1) campusSel.remove(1);
    const campuses = [...new Set(data.map(r => r.Campus_Name).filter(Boolean))].sort();
    campuses.forEach(c => { const o = document.createElement('option'); o.value = c; o.textContent = c; campusSel.appendChild(o); });
    if (_prevSectCampus) campusSel.value = _prevSectCampus;
  }

  // Populate college filter — reset first to prevent duplicates on re-visit
  const collegeSel = document.getElementById('sect-college-filter');
  const _prevSectCollege = collegeSel ? collegeSel.value : '';
  if (collegeSel) {
    while (collegeSel.options.length > 1) collegeSel.remove(1);
    const colleges = [...new Set(data.map(r => r.college_name).filter(Boolean))].sort();
    colleges.forEach(c => { const o = document.createElement('option'); o.value = c; o.textContent = c; collegeSel.appendChild(o); });
    if (_prevSectCollege) collegeSel.value = _prevSectCollege;
  }

  // Further client-side campus filter
  if (campusFilter) data = data.filter(r => (r.Campus_Name || '') === campusFilter);

  // Further client-side college filter
  if (collegeFilter) data = data.filter(r => (r.college_name || '') === collegeFilter);

  // Stats
  document.getElementById('sect-stat-total').textContent = data.length;
  document.getElementById('sect-stat-programs').textContent = new Set(data.map(r => r.program_code || r.Program_Code).filter(Boolean)).size;
  document.getElementById('sect-stat-students').textContent = data.reduce((s, r) => s + (parseInt(r.student_count) || 0), 0);
  document.getElementById('sect-stat-campuses').textContent = new Set(data.map(r => r.Campus_Name).filter(Boolean)).size;

  // Sort
  const sc = _sectSort.col, sd = _sectSort.dir === 'asc' ? 1 : -1;
  data.sort((a, b) => {
    const av = (sc === 'year_level' || sc === 'student_count') ? (parseInt(a[sc]) || 0) : (a[sc] || '').toString().toLowerCase();
    const bv = (sc === 'year_level' || sc === 'student_count') ? (parseInt(b[sc]) || 0) : (b[sc] || '').toString().toLowerCase();
    return av < bv ? -sd : av > bv ? sd : 0;
  });

  _sectData = data;
  document.getElementById('sect-result-count').textContent = data.length ? `${data.length} section${data.length !== 1 ? 's' : ''} found` : '';
  _sectPage = 1;
  renderSections();
  updateSectSortUI();
}

function renderSections() {
  const tbody = document.getElementById('sect-tbody');
  const total = _sectData.length;
  const pages = Math.ceil(total / SECT_PER_PAGE) || 1;
  if (_sectPage > pages) _sectPage = pages;
  const slice = _sectData.slice((_sectPage - 1) * SECT_PER_PAGE, _sectPage * SECT_PER_PAGE);

  tbody.innerHTML = slice.length ? slice.map(r => {
    // Normalize year_level: if it's a number like 1/2/3/4 convert to ordinal string; avoid "Year 1st Year"
    const ylRaw = String(r.year_level || '');
    const ylMap = {'1':'1st Year','2':'2nd Year','3':'3rd Year','4':'4th Year','5':'5th Year'};
    const ylDisplay = ylMap[ylRaw] || (ylRaw.includes('Year') ? ylRaw : (ylRaw ? `Year ${ylRaw}` : '—'));
    return `
    <tr>
      <td class="col-check"><input type="checkbox" class="row-cb sect-cb" data-id="${r.section_id}" ${_sectSelected.has(String(r.section_id)) ? 'checked' : ''} onchange="toggleSectRow(this)" /></td>
      <td><code style="font-size:.95rem;font-weight:700">${r.section_name}</code></td>
      <td style="font-size:.85rem">${r.Program_Name || r.program_code || '—'} <small style="color:var(--muted)">(${r.program_code || ''})</small></td>
      <td style="text-align:center"><span class="pill pill-submitted">${ylDisplay}</span></td>
      <td style="font-size:.85rem">${r.Campus_Name || '—'}</td>
      <td style="text-align:center">
        <span style="font-weight:700;color:${(parseInt(r.student_count) || 0) > 0 ? 'var(--blue)' : 'var(--muted)'}">
          <i class="fas fa-user-graduate" style="font-size:.7rem;margin-right:3px;opacity:.7"></i>${parseInt(r.student_count) || 0}
        </span>
      </td>
      <td>
        <div class="action-btns">
          <button class="btn btn-primary btn-sm" onclick="viewSectionStudents(${r.section_id},'${(r.section_name || '').replace(/'/g, "\\'")}')"><i class="fas fa-users"></i> Students</button>
          <button class="btn btn-gold btn-sm" onclick="editSection(${r.section_id},'${(r.section_name || '').replace(/'/g, "\\'")}')" ><i class="fas fa-pen"></i> Edit</button>
          <button class="btn btn-danger btn-sm" onclick="deleteSection(${r.section_id},'${(r.section_name || '').replace(/'/g, "\\'")}')"><i class="fas fa-trash"></i> Delete</button>
        </div>
      </td>
    </tr>`;
  }).join('') : empty(7);

  buildPagination(_sectPage, pages, total, SECT_PER_PAGE,
    document.getElementById('sect-pagination'),
    document.getElementById('sect-pg-info'),
    document.getElementById('sect-pg-controls'),
    p => { _sectPage = p; renderSections(); },
    'section');
  syncSectBulkBar();
}

// ── Section: View Students ────────────────────────────────────────────────
let _sectStudentsData = [];
let _sectStudentsSort = { col: 'full_name', dir: 'asc' };
let _currentSectMeta = {};

async function viewSectionStudents(sectionId, sectionName) {
  const modal = document.getElementById('sect-students-modal');
  const title = document.getElementById('sect-students-title');
  const body  = document.getElementById('sect-students-body');
  title.textContent = sectionName;
  body.innerHTML = `<div class="loading"><i class="fas fa-spinner fa-spin"></i> Loading students…</div>`;
  openModal('sect-students-modal');

  // Populate section detail strip from cached _sectData
  const sectRow = _sectData.find(r => r.section_id == sectionId);
  if (sectRow) {
    const ylRaw = String(sectRow.year_level || '');
    const ylMap = {'1':'1st Year','2':'2nd Year','3':'3rd Year','4':'4th Year','5':'5th Year'};
    const ylDisplay = ylMap[ylRaw] || (ylRaw.includes('Year') ? ylRaw : (ylRaw ? `Year ${ylRaw}` : '—'));
    _currentSectMeta = { sectionId, sectionName, ylDisplay, program: sectRow.Program_Name || sectRow.program_code || '—', campus: sectRow.Campus_Name || '—' };
    document.getElementById('ssd-section').textContent = sectionName;
    document.getElementById('ssd-year').textContent = ylDisplay;
    document.getElementById('ssd-program').textContent = _currentSectMeta.program;
    document.getElementById('ssd-campus').textContent = _currentSectMeta.campus;
    document.getElementById('ssd-count').textContent = '…';
    document.getElementById('sect-students-detail-strip').style.display = 'block';
    // Show Edit button in footer
    const editBtn = document.getElementById('sect-students-edit-btn');
    if (editBtn) editBtn.style.display = '';
  }

  const res = await api('students', { section: sectionName });
  if (!res.ok) { body.innerHTML = `<p style="color:var(--red)">Failed to load students.</p>`; return; }
  _sectStudentsData = res.data || [];
  _sectStudentsSort = { col: 'full_name', dir: 'asc' };

  if (sectRow) document.getElementById('ssd-count').textContent = _sectStudentsData.length;

  if (!_sectStudentsData.length) {
    body.innerHTML = `<div style="text-align:center;padding:32px 0;color:var(--muted)"><i class="fas fa-users" style="font-size:2rem;display:block;margin-bottom:10px;opacity:.3"></i>No students enrolled in this section.</div>`;
    return;
  }

  _renderSectStudentsTable();
}

function editSectionFromStudentsModal() {
  const { sectionId } = _currentSectMeta;
  if (!sectionId) return;
  closeModal('sect-students-modal');
  editSection(sectionId);
}

function _sectStudentsDoSort(col) {
  if (_sectStudentsSort.col === col) _sectStudentsSort.dir = _sectStudentsSort.dir === 'asc' ? 'desc' : 'asc';
  else { _sectStudentsSort.col = col; _sectStudentsSort.dir = 'asc'; }
  _renderSectStudentsTable();
}

function _renderSectStudentsTable() {
  const { col, dir } = _sectStudentsSort;
  const sorted = [..._sectStudentsData].sort((a, b) => {
    const av = (a[col] ?? '').toString().toLowerCase();
    const bv = (b[col] ?? '').toString().toLowerCase();
    return dir === 'asc' ? (av < bv ? -1 : av > bv ? 1 : 0) : (av > bv ? -1 : av < bv ? 1 : 0);
  });
  const arrow = c => _sectStudentsSort.col === c ? `<i class="fas fa-sort-${_sectStudentsSort.dir === 'asc' ? 'up' : 'down'}" style="margin-left:4px;opacity:.7"></i>` : `<i class="fas fa-sort" style="margin-left:4px;opacity:.25"></i>`;
  const body = document.getElementById('sect-students-body');

  // Helper: format name as Surname, First [Middle initial.]
  const formatName = s => {
    const last  = (s.Last_Name  || '').trim();
    const first = (s.First_Name || '').trim();
    const mid   = (s.Middle_Name || '').trim();
    const suffix = (s.Suffix || '').trim();
    if (last || first) {
      let name = last ? `<strong>${last}</strong>, ${first}` : first;
      if (mid) name += ` ${mid.charAt(0).toUpperCase()}.`;
      if (suffix) name += ` ${suffix}`;
      return name;
    }
    // Fallback: full_name field (already formatted)
    return s.full_name || '—';
  };

  body.innerHTML = `
    <div class="table-wrap" style="margin:0">
      <table>
        <thead>
          <tr>
            <th style="width:2.5rem;text-align:center">#</th>
            <th class="sortable" onclick="_sectStudentsDoSort('student_id')" style="cursor:pointer">Student No. ${arrow('student_id')}</th>
            <th class="sortable" onclick="_sectStudentsDoSort('full_name')" style="cursor:pointer">Name ${arrow('full_name')}</th>
            <th class="sortable" onclick="_sectStudentsDoSort('Status')" style="cursor:pointer">Status ${arrow('Status')}</th>
            <th class="sortable" onclick="_sectStudentsDoSort('Email')" style="cursor:pointer">Email ${arrow('Email')}</th>
          </tr>
        </thead>
        <tbody>
          ${sorted.map((s, i) => {
            const statusCls = s.Status === 'Active' ? 'pill-active' : s.Status === 'LOA' ? 'pill-pending' : 'pill-inactive';
            return `
            <tr>
              <td style="text-align:center;color:var(--muted);font-size:.8rem">${i + 1}</td>
              <td><code style="font-size:.85rem">${s.student_id || '—'}</code></td>
              <td style="font-weight:500">${formatName(s)}</td>
              <td><span class="pill ${statusCls}">${s.Status || '—'}</span></td>
              <td style="font-size:.82rem;color:var(--muted)">${s.Email || '—'}</td>
            </tr>`;
          }).join('')}
        </tbody>
      </table>
    </div>`;
}

function printSectionStudents() {
  if (!_sectStudentsData.length) { toast('No students to print.', 'err'); return; }
  const { sectionName, ylDisplay, program, campus } = _currentSectMeta;
  const now = new Date().toLocaleDateString('en-PH', { year: 'numeric', month: 'long', day: 'numeric' });

  const formatPrintName = s => {
    const last   = (s.Last_Name   || '').trim();
    const first  = (s.First_Name  || '').trim();
    const mid    = (s.Middle_Name || '').trim();
    const suffix = (s.Suffix      || '').trim();
    if (last || first) {
      let name = last ? `${last}, ${first}` : first;
      if (mid)    name += ` ${mid.charAt(0).toUpperCase()}.`;
      if (suffix) name += ` ${suffix}`;
      return name;
    }
    return s.full_name || '—';
  };

  const rows = _sectStudentsData.map((s, i) => `
    <tr>
      <td style="text-align:center;color:#6b7280">${i + 1}</td>
      <td><code style="font-family:monospace;font-size:8.5pt">${s.student_id || '—'}</code></td>
      <td style="font-weight:600">${formatPrintName(s)}</td>
      <td>
        <span style="display:inline-block;padding:2px 8px;border-radius:4px;font-size:7.5pt;font-weight:700;
          background:${s.Status === 'Active' ? '#d1fae5' : s.Status === 'LOA' ? '#ede9fe' : '#fee2e2'};
          color:${s.Status === 'Active' ? '#065f46' : s.Status === 'LOA' ? '#6d28d9' : '#991b1b'}">
          ${s.Status || '—'}
        </span>
      </td>
      <td style="color:#6b7280">${s.Email || '—'}</td>
    </tr>`).join('');

  const html = `
    <div class="pr-page">
      <!-- Letterhead -->
      <div class="pr-letterhead">
        <div>
          <div class="pr-school-name">Laguna State Polytechnic University</div>
          <div class="pr-school-sub">Office of the Registrar — Section Class List</div>
        </div>
        <div style="margin-left:auto;text-align:right">
          <div class="pr-doc-title">Class List</div>
          <div class="pr-doc-meta">Generated: ${now}</div>
        </div>
      </div>

      <!-- Section hero -->
      <div class="pr-hero">
        <div class="pr-hero-icon">&#x1F4CB;</div>
        <div>
          <div class="pr-hero-name">${sectionName}</div>
          <div class="pr-hero-meta">
            <b>Program:</b> ${program} &nbsp;|&nbsp;
            <b>Year Level:</b> ${ylDisplay} &nbsp;|&nbsp;
            <b>Campus:</b> ${campus}
          </div>
          <div class="pr-status-badge">${_sectStudentsData.length} Student${_sectStudentsData.length !== 1 ? 's' : ''} Enrolled</div>
        </div>
      </div>

      <!-- Student roster -->
      <div class="pr-section">
        <div class="pr-section-title">Student Roster</div>
        <table class="pr-table">
          <thead>
            <tr>
              <th style="text-align:center;width:2rem">#</th>
              <th>Student No.</th>
              <th>Name</th>
              <th>Status</th>
              <th>Email</th>
            </tr>
          </thead>
          <tbody>${rows}</tbody>
        </table>
      </div>

      <!-- Signature block -->
      <div class="pr-sig-block">
        <div>
          <div class="pr-sig-line">________________________________</div>
          <div class="pr-sig-role">Registrar / Authorized Officer</div>
        </div>
        <div>
          <div class="pr-sig-line">________________________________</div>
          <div class="pr-sig-role">Date Issued</div>
        </div>
      </div>

      <!-- Footer -->
      <div class="pr-footer">
        <span>LSPU Student Information System</span>
        <span>This document is computer-generated. ${now}</span>
      </div>
    </div>`;

  const frame = document.getElementById('print-frame');
  frame.innerHTML = html;
  frame.style.display = 'block';
  window.print();
  frame.style.display = 'none';
}

function sectSort(col) {
  if (_sectSort.col === col) _sectSort.dir = _sectSort.dir === 'asc' ? 'desc' : 'asc';
  else { _sectSort.col = col; _sectSort.dir = 'asc'; }
  const sc = _sectSort.col, sd = _sectSort.dir === 'asc' ? 1 : -1;
  _sectData.sort((a, b) => {
    const av = (sc === 'year_level' || sc === 'student_count') ? (parseInt(a[sc]) || 0) : (a[sc] || '').toString().toLowerCase();
    const bv = (sc === 'year_level' || sc === 'student_count') ? (parseInt(b[sc]) || 0) : (b[sc] || '').toString().toLowerCase();
    return av < bv ? -sd : av > bv ? sd : 0;
  });
  _sectPage = 1; renderSections(); updateSectSortUI();
}

function updateSectSortUI() {
  document.querySelectorAll('#sec-sections th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === _sectSort.col) th.classList.add(_sectSort.dir === 'asc' ? 'sort-asc' : 'sort-desc');
  });
}

function toggleAllSect(cb) {
  document.querySelectorAll('.sect-cb').forEach(el => { el.checked = cb.checked; toggleSectRow(el, true); });
  syncSectBulkBar();
}

function toggleSectRow(cb, skipSync) {
  cb.checked ? _sectSelected.add(cb.dataset.id) : _sectSelected.delete(cb.dataset.id);
  if (!skipSync) syncSectBulkBar();
}

function syncSectBulkBar() {
  const bar = document.getElementById('sect-bulk-bar');
  const cnt = document.getElementById('sect-bulk-count');
  const n = _sectSelected.size;
  bar.classList.toggle('visible', n > 0);
  cnt.textContent = `${n} selected`;
  const allCb = document.getElementById('sect-check-all');
  if (allCb) allCb.indeterminate = n > 0 && n < _sectData.length, allCb.checked = n === _sectData.length && n > 0;
}

function clearSectBulk() { _sectSelected.clear(); renderSections(); }

async function bulkDeleteSections() {
  if (!_sectSelected.size) return;
  if (!confirm(`Delete ${_sectSelected.size} section(s)? Students assigned to these sections will be unassigned.`)) return;
  let ok = 0;
  for (const id of _sectSelected) {
    const r = await post('sections', { action: 'delete', section_id: id });
    if (r.ok) ok++;
  }
  toast(ok ? `${ok} section(s) deleted.` : 'Delete failed.', ok ? 'ok' : 'err');
  _sectSelected.clear(); loadSections();
}

function exportSectionsCSV() {
  if (!_sectData.length) { toast('No data to export.', 'err'); return; }
  const headers = ['Section', 'Program Code', 'Program Name', 'Year Level', 'Campus', 'Students'];
  const rows = _sectData.map(r => [r.section_name, r.program_code || '', r.Program_Name || '', r.year_level, r.Campus_Name || '', r.student_count || 0].map(v => `"${String(v).replace(/"/g, '""')}"`).join(','));
  const csv = [headers.join(','), ...rows].join('\n');
  const a = document.createElement('a');
  a.href = 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv);
  a.download = 'sections.csv'; a.click();
}

async function editSection(id) {
  const row = _sectData.find(r => r.section_id == id);
  if (!row) return;
  // Load programs and campuses into edit modal
  const [pRes, cRes] = await Promise.all([api('programs'), api('campus')]);
  const pSel = document.getElementById('es-sect-program');
  pSel.innerHTML = '<option value="">— Select Program —</option>';
  (pRes.data || []).forEach(p => {
    const o = document.createElement('option');
    o.value = p.Program_Code; o.textContent = `${p.Program_Code} — ${p.Program_Name}`;
    if (p.Program_Code === (row.program_code || row.Program_Code)) o.selected = true;
    pSel.appendChild(o);
  });
  const cSel = document.getElementById('es-sect-campus');
  cSel.innerHTML = '<option value="">— Select Campus —</option>';
  (cRes.data || []).forEach(c => {
    const o = document.createElement('option');
    o.value = c.Campus_Name; o.textContent = c.Campus_Name;
    if (c.Campus_Name === row.Campus_Name) o.selected = true;
    cSel.appendChild(o);
  });
  document.getElementById('es-sect-id').value = id;
  document.getElementById('es-sect-name').value = row.section_name;
  document.getElementById('es-sect-year-level').value = row.year_level;
  openModal('edit-sect-modal');
}

async function saveEditSection() {
  const id = document.getElementById('es-sect-id').value;
  if (!id) { toast('No section loaded.', 'err'); return; }
  const res = await post('sections', {
    action: 'update',
    section_id: id,
    section_name: document.getElementById('es-sect-name').value,
    program_code: document.getElementById('es-sect-program').value,
    year_level: document.getElementById('es-sect-year-level').value,
    campus_name: document.getElementById('es-sect-campus').value,
  });
  toast(res.ok ? 'Section updated!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('edit-sect-modal'); loadSections(); }
}

async function deleteSection(id, name) {
  document.getElementById('delete-msg').textContent = `You are about to permanently delete section "${name}". Students assigned to this section will be unassigned.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    const res = await post('sections', { action: 'delete', section_id: id });
    toast(res.ok ? 'Section deleted.' : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadSections();
  };
  openModal('delete-modal');
}

function openAddSectionModal() {
  api('programs').then(res => {
    const sel = document.getElementById('sect-program');
    sel.innerHTML = '<option value="">— Select Program —</option>';
    (res.data || []).forEach(p => sel.innerHTML += `<option value="${p.Program_Code}">${p.Program_Code} — ${p.Program_Name}</option>`);
  });
  api('campus').then(res => {
    const sel = document.getElementById('sect-campus');
    sel.innerHTML = '<option value="">— Select Campus —</option>';
    (res.data || []).forEach(c => sel.innerHTML += `<option value="${c.Campus_Name}">${c.Campus_Name}</option>`);
  });
  const el = document.getElementById('sect-name'); if (el) el.value = '';
  document.getElementById('sect-year-level').value = '';
  openModal('add-sect-modal');
}

async function saveNewSection() {
  const res = await post('sections', {
    action: 'create',
    section_name: document.getElementById('sect-name').value,
    program_code: document.getElementById('sect-program').value,
    year_level: document.getElementById('sect-year-level').value,
    campus_name: document.getElementById('sect-campus').value,
  });
  toast(res.ok ? 'Section created!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('add-sect-modal'); loadSections(); }
}

// ══════════════════════════════════════════════════════════════════════════
// SEMESTERS
// ══════════════════════════════════════════════════════════════════════════
const SEM_PER_PAGE = 20;
let _semAllRows = [];
let _semFiltered = [];
let _semPage = 1;
let _semSortCol = 'semester_id';
let _semSortDir = 'desc';
let _semSelected = new Set();

function semSort(col) {
  if (_semSortCol === col) { _semSortDir = _semSortDir === 'asc' ? 'desc' : 'asc'; }
  else { _semSortCol = col; _semSortDir = 'asc'; }
  _semPage = 1; renderSemesters();
}

async function loadSemesters() {
  const tbody = document.getElementById('sem-tbody');
  tbody.innerHTML = `<tr><td colspan="6" class="loading"><i class="fas fa-spinner fa-spin"></i> Loading…</td></tr>`;
  document.getElementById('sem-pagination').style.display = 'none';

  const res = await api('semesters');
  if (!res.ok) { tbody.innerHTML = empty(6, `Failed to load: ${res.msg || 'unknown error'}`); return; }

  _semAllRows = res.data || [];
  _semPage = 1;
  renderSemesters();
}

function renderSemesters() {
  const status = document.getElementById('sem-status-filter')?.value || '';

  let rows = _semAllRows.filter(r => {
    const matchStatus = !status || (r.status || '') === status;
    return matchStatus;
  });

  // Sort
  const dir = _semSortDir === 'asc' ? 1 : -1;
  const col = _semSortCol;
  rows.sort((a, b) => {
    if (col === 'semester_id') return ((parseInt(a[col]) || 0) - (parseInt(b[col]) || 0)) * dir;
    if (col === 'start_date' || col === 'end_date') {
      return (new Date(a[col] || 0) - new Date(b[col] || 0)) * dir;
    }
    const va = (a[col] ?? '').toString().toLowerCase();
    const vb = (b[col] ?? '').toString().toLowerCase();
    return va < vb ? -dir : va > vb ? dir : 0;
  });

  document.querySelectorAll('#sec-semesters th.sortable').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.dataset.col === col) th.classList.add(_semSortDir === 'asc' ? 'sort-asc' : 'sort-desc');
  });

  _semFiltered = rows;
  const total = rows.length;
  const totalPages = Math.ceil(total / SEM_PER_PAGE) || 1;
  if (_semPage > totalPages) _semPage = totalPages;
  const start = (_semPage - 1) * SEM_PER_PAGE;
  const page = rows.slice(start, start + SEM_PER_PAGE);

  document.getElementById('sem-result-count').textContent = total ? `${total} semester${total !== 1 ? 's' : ''} found` : '';

  const tbody = document.getElementById('sem-tbody');
  tbody.innerHTML = page.map(r => {
    const id = r.semester_id;
    const isOpen = (r.status || '').toLowerCase() === 'open';
    const pillCls = isOpen ? 'pill-active' : 'pill-inactive';
    const pillLbl = isOpen ? 'Open' : (r.status || 'Closed');
    return `
    <tr>
      <td><strong>${r.semester_name || '—'}</strong></td>
      <td style="font-size:.85rem">${r.academic_year || '—'}</td>
      <td style="font-size:.85rem">${fmt(r.start_date)}</td>
      <td style="font-size:.85rem">${fmt(r.end_date)}</td>
      <td><span class="pill ${pillCls}">${pillLbl}</span></td>
      <td>
        <div class="action-btns">
          <button class="btn btn-outline btn-sm" onclick="editSemester(${id})"><i class="fas fa-pen"></i> Edit</button>
          <button class="btn btn-${isOpen ? 'gold' : 'success'} btn-sm" onclick="toggleSemesterStatus(${id},'${isOpen ? 'Closed' : 'Open'}','${(r.semester_name || '').replace(/'/g, "\\'")}')">
            <i class="fas fa-${isOpen ? 'lock' : 'lock-open'}"></i> ${isOpen ? 'Close' : 'Open'}
          </button>
          <button class="btn btn-danger btn-sm" onclick="deleteSemester(${id},'${(r.semester_name || '').replace(/'/g, "\\'")}')"><i class="fas fa-trash"></i> Delete</button>
        </div>
      </td>
    </tr>`;
  }).join('') || empty(6);

  buildPagination(_semPage, totalPages, total, SEM_PER_PAGE,
    document.getElementById('sem-pagination'),
    document.getElementById('sem-pg-info'),
    document.getElementById('sem-pg-controls'),
    p => { _semPage = p; renderSemesters(); },
    'semester');
}

function toggleAllSem(cb) {
  document.querySelectorAll('.sem-cb').forEach(el => { el.checked = cb.checked; toggleSemRow(el, true); });
  syncSemBulkBar();
}
function toggleSemRow(cb, skipSync) {
  cb.checked ? _semSelected.add(cb.value) : _semSelected.delete(cb.value);
  if (!skipSync) syncSemBulkBar();
}
function syncSemBulkBar() {
  const bar = document.getElementById('sem-bulk-bar');
  const cnt = document.getElementById('sem-bulk-count');
  if (!bar) return; // bulk bar removed from UI
  const n = _semSelected.size;
  bar.classList.toggle('visible', n > 0);
  if (cnt) cnt.textContent = `${n} selected`;
  const allCb = document.getElementById('sem-check-all');
  if (allCb) allCb.indeterminate = n > 0 && n < _semAllRows.length, allCb.checked = n === _semAllRows.length && n > 0;
}
function clearSemBulk() { _semSelected.clear(); renderSemesters(); }
async function bulkDeleteSemesters() {
  if (!_semSelected.size) return;
  document.getElementById('delete-msg').textContent = `You are about to permanently delete ${_semSelected.size} semester(s). Grades and payments linked to these semesters may be affected.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    for (const id of _semSelected) {
      await post('semesters', { action: 'delete', semester_id: id });
    }
    toast(`${_semSelected.size} semester(s) deleted.`, 'ok');
    _semSelected.clear();
    loadSemesters();
  };
  openModal('delete-modal');
}

function exportSemestersCSV() {
  if (!_semFiltered.length) { toast('No data to export.', 'err'); return; }
  const headers = ['ID', 'Semester', 'Academic Year', 'Start', 'End', 'Status'];
  const escape = v => { const s = v == null ? '' : String(v); return s.includes(',') || s.includes('"') ? `"${s.replace(/"/g, '""')}"` : s; };
  const rows = _semFiltered.map(r => [r.semester_id, r.semester_name || '', r.academic_year || '', r.start_date || '', r.end_date || '', r.status || ''].map(escape).join(','));
  const csv = [headers.join(','), ...rows].join('\r\n');
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a'); a.href = url;
  a.download = `semesters_${new Date().toISOString().slice(0, 10)}.csv`;
  a.click(); URL.revokeObjectURL(url);
  toast(`Exported ${_semFiltered.length} semesters to CSV`, 'ok');
}

function openAddSemesterModal() {
  ['sem-name', 'sem-academic-year', 'sem-start', 'sem-end'].forEach(id => {
    const el = document.getElementById(id); if (el) el.value = '';
  });
  document.getElementById('sem-status').value = 'Closed';
  openModal('add-sem-modal');
}

async function saveNewSemester() {
  const res = await post('semesters', {
    action: 'create',
    semester_name: document.getElementById('sem-name').value,
    academic_year: document.getElementById('sem-academic-year').value,
    start_date: document.getElementById('sem-start').value,
    end_date: document.getElementById('sem-end').value,
    status: document.getElementById('sem-status').value,
  });
  toast(res.ok ? 'Semester created!' : (res.msg || 'Create failed.'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('add-sem-modal'); loadSemesters(); }
}

async function editSemester(id) {
  const row = _semAllRows.find(r => r.semester_id == id);
  if (!row) return;
  document.getElementById('es-sem-id').value = id;
  document.getElementById('es-sem-name').value = row.semester_name || '';
  document.getElementById('es-sem-academic-year').value = row.academic_year || '';
  document.getElementById('es-sem-start').value = row.start_date ? row.start_date.substring(0, 10) : '';
  document.getElementById('es-sem-end').value = row.end_date ? row.end_date.substring(0, 10) : '';
  document.getElementById('es-sem-status').value = row.status || 'Closed';
  openModal('edit-sem-modal');
}

async function saveEditSemester() {
  const id = document.getElementById('es-sem-id').value;
  if (!id) { toast('No semester loaded.', 'err'); return; }
  const res = await post('semesters', {
    action: 'update',
    semester_id: id,
    semester_name: document.getElementById('es-sem-name').value,
    academic_year: document.getElementById('es-sem-academic-year').value,
    start_date: document.getElementById('es-sem-start').value,
    end_date: document.getElementById('es-sem-end').value,
    status: document.getElementById('es-sem-status').value,
  });
  toast(res.ok ? 'Semester updated!' : (res.msg || 'Update failed.'), res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('edit-sem-modal'); loadSemesters(); }
}

function toggleSemesterStatus(id, newStatus, name) {
  const isOpen = newStatus === 'Open';
  document.getElementById('sem-toggle-title').textContent = (isOpen ? 'Open' : 'Close') + ' Semester';
  const icon = document.getElementById('sem-toggle-icon');
  icon.className = isOpen ? 'fas fa-lock-open' : 'fas fa-lock';
  icon.style.color = isOpen ? 'var(--green)' : 'var(--red)';
  document.getElementById('sem-toggle-msg').innerHTML =
    `Are you sure you want to <strong>${isOpen ? 'open' : 'close'}</strong> the semester<br><strong>"${name}"</strong>?` +
    (isOpen
      ? `<div style="margin-top:10px;padding:10px 14px;background:var(--green-lt);border-radius:8px;font-size:.82rem;color:var(--green)"><i class="fas fa-info-circle"></i> Opening this semester will allow students to enroll.</div>`
      : `<div style="margin-top:10px;padding:10px 14px;background:var(--red-lt);border-radius:8px;font-size:.82rem;color:var(--red)"><i class="fas fa-exclamation-triangle"></i> Closing this semester will prevent new enrollments.</div>`);
  const confirmBtn = document.getElementById('sem-toggle-confirm-btn');
  confirmBtn.className = `btn ${isOpen ? 'btn-success' : 'btn-danger'}`;
  confirmBtn.innerHTML = `<i class="fas fa-${isOpen ? 'lock-open' : 'lock'}"></i> ${isOpen ? 'Open' : 'Close'} Semester`;
  confirmBtn.onclick = async () => {
    closeModal('sem-toggle-modal');
    const res = await post('semesters', { action: 'update_status', semester_id: id, status: newStatus });
    toast(res.ok ? `Semester ${isOpen ? 'opened' : 'closed'}.` : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadSemesters();
  };
  openModal('sem-toggle-modal');
}

async function deleteSemester(id, name) {
  document.getElementById('delete-msg').textContent = `You are about to permanently delete the semester "${name}" (ID: ${id}). Grades and payment records linked to this semester may be affected.`;
  document.getElementById('delete-confirm-btn').onclick = async () => {
    closeModal('delete-modal');
    const res = await post('semesters', { action: 'delete', semester_id: id });
    toast(res.ok ? 'Semester deleted.' : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadSemesters();
  };
  openModal('delete-modal');
}

// ══════════════════════════════════════════════════════════════════════════
// REGISTRAR
// ══════════════════════════════════════════════════════════════════════════
// ── USER MANAGEMENT (admins table, Super Admin only) ──────────────────────
async function loadAdmins() {
  const tbody = document.getElementById('admins-tbody');
  tbody.innerHTML = `<tr><td colspan="6" class="loading">Loading…</td></tr>`;
  const res = await api('admins');
  if (!res.ok) {
    tbody.innerHTML = `<tr><td colspan="6" style="text-align:center;color:var(--danger,#dc3545);padding:20px">${res.msg || 'Access denied.'}</td></tr>`;
    return;
  }
  const rows = res.data;
  if (!rows.length) { tbody.innerHTML = empty(6); return; }
  const rolePill = { 'Super Admin': 'pill-enrolled', 'Admin': 'pill-submitted', 'Registrar': 'pill-pending' };
  tbody.innerHTML = rows.map(r => `
    <tr>
      <td><strong>${r.first_name} ${r.last_name}</strong></td>
      <td style="font-size:.82rem">${r.email}</td>
      <td><span class="pill ${rolePill[r.role] || 'pill-draft'}">${r.role}</span></td>
      <td>${pill(r.status === 'Active' ? 'Active' : 'Inactive')}</td>
      <td style="font-size:.78rem">${r.created_at ? r.created_at.slice(0, 10) : ''}</td>
      <td style="display:flex;gap:6px;flex-wrap:wrap">
        <button class="btn btn-${r.status === 'Active' ? 'danger' : 'success'} btn-sm"
          onclick="toggleAdminStatus(${r.admin_id},'${r.status === 'Active' ? 'Inactive' : 'Active'}')">
          ${r.status === 'Active' ? 'Deactivate' : 'Activate'}
        </button>
        <button class="btn btn-outline btn-sm"
          onclick="changeAdminRole(${r.admin_id}, '${r.role}')">Role</button>
      </td>
    </tr>
  `).join('');
}

function openAdminModal() {
  ['adm-first', 'adm-last', 'adm-email', 'adm-pass'].forEach(id => document.getElementById(id).value = '');
  document.getElementById('adm-role').value = 'Admin';
  openModal('admin-modal');
}

async function saveAdminAccount() {
  const res = await post('admins', {
    action: 'create',
    first_name: document.getElementById('adm-first').value,
    last_name: document.getElementById('adm-last').value,
    email: document.getElementById('adm-email').value,
    password: document.getElementById('adm-pass').value,
    role: document.getElementById('adm-role').value,
  });
  toast(res.ok ? 'Account created!' : res.msg, res.ok ? 'ok' : 'err');
  if (res.ok) { closeModal('admin-modal'); loadAdmins(); }
}

function toggleAdminStatus(id, status) {
  const isDeactivate = status === 'Inactive';
  document.getElementById('admin-status-title').textContent = isDeactivate ? 'Deactivate Account' : 'Activate Account';
  const icon = document.getElementById('admin-status-icon');
  icon.className = isDeactivate ? 'fas fa-user-slash' : 'fas fa-user-check';
  icon.style.color = isDeactivate ? 'var(--red)' : 'var(--green)';
  document.getElementById('admin-status-msg').innerHTML = isDeactivate
    ? `Are you sure you want to <strong>deactivate</strong> this account?<div style="margin-top:10px;padding:10px 14px;background:var(--red-lt);border-radius:8px;font-size:.82rem;color:var(--red)"><i class="fas fa-exclamation-triangle"></i> The user will no longer be able to log in.</div>`
    : `Are you sure you want to <strong>activate</strong> this account?<div style="margin-top:10px;padding:10px 14px;background:var(--green-lt);border-radius:8px;font-size:.82rem;color:var(--green)"><i class="fas fa-info-circle"></i> The user will regain access to the admin panel.</div>`;
  const confirmBtn = document.getElementById('admin-status-confirm-btn');
  confirmBtn.className = `btn ${isDeactivate ? 'btn-danger' : 'btn-success'}`;
  confirmBtn.innerHTML = `<i class="fas fa-${isDeactivate ? 'user-slash' : 'user-check'}"></i> ${isDeactivate ? 'Deactivate' : 'Activate'}`;
  confirmBtn.onclick = async () => {
    closeModal('admin-status-modal');
    const res = await post('admins', { action: 'update_status', admin_id: id, status });
    toast(res.ok ? `Account ${status === 'Inactive' ? 'deactivated' : 'activated'}.` : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadAdmins();
  };
  openModal('admin-status-modal');
}

function changeAdminRole(id, currentRole) {
  document.getElementById('role-current').textContent = currentRole;
  document.getElementById('role-select').value = currentRole;
  document.getElementById('role-confirm-btn').onclick = async () => {
    const newRole = document.getElementById('role-select').value;
    if (newRole === currentRole) { closeModal('admin-role-modal'); return; }
    closeModal('admin-role-modal');
    const res = await post('admins', { action: 'update_role', admin_id: id, role: newRole });
    toast(res.ok ? 'Role updated.' : res.msg, res.ok ? 'ok' : 'err');
    if (res.ok) loadAdmins();
  };
  openModal('admin-role-modal');
}

// ══════════════════════════════════════════════════════════════════════════
// ADD APPLICANT
// ══════════════════════════════════════════════════════════════════════════
function openAddApplicantModal() {
  // Clear all form fields so stale data from a previous submission is not visible
  const modal = document.getElementById('add-appl-modal');
  modal.querySelectorAll('input:not([type="radio"]):not([type="checkbox"])').forEach(el => el.value = '');
  modal.querySelectorAll('textarea').forEach(el => el.value = '');
  modal.querySelectorAll('select').forEach(el => el.selectedIndex = 0);
  modal.querySelectorAll('input[type="radio"], input[type="checkbox"]').forEach(el => el.checked = false);

  // Populate program dropdown
  api('programs').then(res => {
    const sel = document.getElementById('na-program');
    sel.innerHTML = '<option value="">— Select Program —</option>';
    (res.data || []).forEach(p => sel.innerHTML += `<option value="${p.Program_Code}">${p.Program_Code} — ${p.Program_Name}</option>`);
  });
  openModal('add-appl-modal');
}

async function saveNewApplicant() {
  // Helper: read checked radio value by name
  function radioVal(name) {
    const checked = document.querySelector('input[name="' + name + '"]:checked');
    return checked ? checked.value : '';
  }

  const payload = {
    action: 'create_full',
    // Step 1 — campus & admission
    campus: document.getElementById('na-campus').value,
    student_type: document.getElementById('na-student-type').value,
    year_level: document.getElementById('na-year-level').value,
    admission_type: document.getElementById('na-admission-type').value,
    // Step 2 — identity
    first_name: document.getElementById('na-first').value,
    middle_name: document.getElementById('na-middle').value,
    last_name: document.getElementById('na-last').value,
    suffix: document.getElementById('na-suffix').value,
    email: document.getElementById('na-email').value,
    birthdate: document.getElementById('na-birthday').value,
    citizenship: document.getElementById('na-citizenship').value,
    birth_place: document.getElementById('na-birthplace').value,
    contact_number: document.getElementById('na-contact').value,
    landline_number: document.getElementById('na-landline').value,
    sex: radioVal('na-sex-radio'),
    civil_status: document.getElementById('na-civil').value,
    religion: document.getElementById('na-religion').value,
    disability: document.getElementById('na-disability').value,
    first_gen: radioVal('na-firstgen-radio'),
    // Address
    house_number: document.getElementById('na-house').value,
    street: document.getElementById('na-street').value,
    barangay: document.getElementById('na-barangay').value,
    municipality: document.getElementById('na-municipality').value,
    province: document.getElementById('na-province').value,
    zip_code: document.getElementById('na-zip').value,
    // Step 3 — guardian
    guardian_first_name: document.getElementById('na-gfirst').value,
    guardian_last_name: document.getElementById('na-glast').value,
    guardian_contact_number: document.getElementById('na-gcontact').value,
    guardian_email: document.getElementById('na-gemail').value,
    guardian_relationship: document.getElementById('na-grel').value,
    guardian_barangay: document.getElementById('na-gbarangay').value,
    guardian_municipality: document.getElementById('na-gmunicipality').value,
    guardian_province: document.getElementById('na-gprovince').value,
    // Father
    father_first_name: document.getElementById('na-fffirst').value,
    father_middle_name: document.getElementById('na-ffmiddle').value,
    father_last_name: document.getElementById('na-fflast').value,
    father_age: document.getElementById('na-ffage').value,
    father_citizenship: document.getElementById('na-ffcitizenship').value,
    father_educational_attainment: document.getElementById('na-ffedu').value,
    father_employment_status: document.getElementById('na-ffemp').value,
    father_occupation: document.getElementById('na-ffocc').value,
    // Mother
    mother_first_name: document.getElementById('na-mfirst').value,
    mother_middle_name: document.getElementById('na-mmiddle').value,
    mother_last_name: document.getElementById('na-mlast').value,
    mother_age: document.getElementById('na-mage').value,
    mother_citizenship: document.getElementById('na-mcitizenship').value,
    mother_educational_attainment: document.getElementById('na-medu').value,
    mother_employment_status: document.getElementById('na-memp').value,
    mother_occupation: document.getElementById('na-mocc').value,
    // Step 4 — education
    elementary_school_name: document.getElementById('na-elem').value,
    elementary_school_address: document.getElementById('na-elem-addr').value,
    elementary_type: document.getElementById('na-elem-type').value,
    elementary_year_from: document.getElementById('na-elem-from').value,
    elementary_year_to: document.getElementById('na-elem-to').value,
    high_school_name: document.getElementById('na-hs').value,
    high_school_address: document.getElementById('na-hs-addr').value,
    high_school_type: document.getElementById('na-hs-type').value,
    high_school_year_from: document.getElementById('na-hs-from').value,
    high_school_year_to: document.getElementById('na-hs-to').value,
    senior_high_school_name: document.getElementById('na-shs').value,
    senior_high_school_address: document.getElementById('na-shs-addr').value,
    senior_high_school_type: document.getElementById('na-shs-type').value,
    senior_high_school_year_from: document.getElementById('na-shs-from').value,
    senior_high_school_year_to: document.getElementById('na-shs-to').value,
    track_strand: document.getElementById('na-track').value,
    // Step 5 — program
    program_code: document.getElementById('na-program').value,
    specialization: document.getElementById('na-spec').value,
  };

  if (!payload.first_name || !payload.last_name || !payload.email) {
    toast('First name, last name, and email are required.', 'err'); return;
  }

  if (!payload.program_code) {
    toast('Please select a First Choice intended course (Step 5) before saving.', 'err');
    document.getElementById('na-program').focus();
    return;
  }

  const res = await post('applicants', payload);
  if (!res.ok) { toast(res.msg || 'Create failed — check server logs.', 'err'); return; }
  closeModal('add-appl-modal');
  loadApplicants();
  // Show the generated credentials — the temp password is only ever surfaced here
  document.getElementById('cred-name').textContent =
    [payload.first_name, payload.last_name].filter(Boolean).join(' ');
  document.getElementById('cred-email').textContent = payload.email;
  document.getElementById('cred-pass').textContent = res.temp_password || '—';
  document.getElementById('cred-id').textContent = res.id ? `#${res.id}` : '';
  openModal('cred-modal');
}

// ── CREDENTIALS COPY ──────────────────────────────────────────────────────
function copyCredentials() {
  const name = document.getElementById('cred-name').textContent;
  const email = document.getElementById('cred-email').textContent;
  const pass = document.getElementById('cred-pass').textContent;
  const text = `Applicant: ${name}\nLogin Email: ${email}\nTemporary Password: ${pass}`;
  navigator.clipboard.writeText(text).then(
    () => toast('Credentials copied to clipboard.', 'ok'),
    () => toast('Copy failed — please select and copy manually.', 'err')
  );
}

// ── LOGOUT ────────────────────────────────────────────────────────────────
function handleLogout() {
  openModal('logout-modal');
}

async function confirmLogout() {
  closeModal('logout-modal');
  try {
    const fd = new FormData();
    fd.append('action', 'logout');
    await fetch('../api/auth.php', { method: 'POST', body: fd });
  } catch (e) { /* ignore */ }
  window.location.href = '../portal/portal.html';
}

// ── SESSION GUARD ─────────────────────────────────────────────────────────
(async function checkAdminSession() {
  try {
    const res = await fetch('admin_check.php');
    const data = await res.json();
    if (!data.ok) {
      window.location.href = '../portal/portal.html';
      return;
    }
    // Show admin name and role badge in topbar
    if (data.admin_name) {
      document.getElementById('admin-name-display').textContent = data.admin_name;
    }
    // Store role globally so nav/action guards can reference it
    window._adminRole = data.role || 'Admin';
    applyRoleVisibility(window._adminRole);
  } catch (e) {
    console.warn('admin_check.php not reachable — running in dev mode (no session guard).');
    window._adminRole = 'Super Admin'; // dev fallback: show everything
  }
})();

/**
 * Show/hide nav items and action buttons based on the logged-in role.
 *
 * Visibility matrix:
 *   Super Admin  — everything
 *   Admin        — everything except User Management (admins resource)
 *   Registrar    — Dashboard, Applicants, Students; all reference-data sections hidden
 */
function applyRoleVisibility(role) {
  const isSuperAdmin = role === 'Super Admin';
  const isAdmin = role === 'Admin' || isSuperAdmin;
  const isRegistrar = role === 'Registrar';

  // Sections visible to Registrar (and everyone): dashboard + applicants + students
  const registrarVisible = ['dashboard', 'applicants', 'students'];

  // Sections restricted to Admin+
  const adminSections = ['programs', 'subjects', 'instructors',
    'sections', 'colleges', 'campus', 'semesters',
    'schedule'];

  // The User Management nav item (admins resource) — Super Admin only
  const saSections = ['admins'];

  document.querySelectorAll('.nav-item[data-section]').forEach(el => {
    const sec = el.dataset.section;
    if (saSections.includes(sec)) {
      el.style.display = isSuperAdmin ? '' : 'none';
    } else if (adminSections.includes(sec)) {
      el.style.display = isAdmin ? '' : 'none';
    }
    // registrarVisible sections are always visible, no need to hide
  });

  // Hide nav-group-label rows whose children are all hidden
  document.querySelectorAll('.nav-group-label').forEach(label => {
    let next = label.nextElementSibling;
    let hasVisible = false;
    while (next && !next.classList.contains('nav-group-label')) {
      if (next.style.display !== 'none') hasVisible = true;
      next = next.nextElementSibling;
    }
    label.style.display = hasVisible ? '' : 'none';
  });
}

// ══════════════════════════════════════════════════════════════════════════
// ENROLL CONVERSION MODAL
// ══════════════════════════════════════════════════════════════════════════
let _enrollMode = 'single';
let _enrollApplicant = null;
let _enrollBulkIds = [];
let _sectionsLoaded = false;
let _semestersLoaded = false;

async function preloadEnrollDropdowns() {
  if (!_sectionsLoaded) {
    const res = await api('sections');
    const sel = document.getElementById('enroll-section');
    sel.innerHTML = '<option value="">— choose section —</option>';
    (res.data || []).forEach(s => {
      const opt = document.createElement('option');
      opt.value = s.section_id;
      opt.textContent = `${s.section_name} (${s.program_code || s.Program_Code || ''}, Yr ${s.year_level})`;
      sel.appendChild(opt);
    });
    _sectionsLoaded = true;
  }

  if (!_semestersLoaded) {
    const res = await api('semesters');
    const sel = document.getElementById('enroll-semester');
    sel.innerHTML = '<option value="">— choose semester —</option>';
    (res.data || []).forEach(s => {
      const opt = document.createElement('option');
      opt.value = s.semester_id;
      opt.textContent = `${s.semester_name} (${s.status})`;
      if (s.status === 'Open') opt.selected = true;
      sel.appendChild(opt);
    });
    _semestersLoaded = true;
  }
}

async function openEnrollModal(applicantRow) {
  _enrollMode = 'single';
  _enrollApplicant = applicantRow;
  _enrollBulkIds = [];

  await preloadEnrollDropdowns();

  document.getElementById('enroll-modal-title').innerHTML = '<i class="fas fa-user-graduate"></i> Confirm Enrollment';
  document.getElementById('enroll-modal-desc').textContent =
    'Review the applicant details, assign a Section and Semester, then confirm.';

  document.getElementById('enroll-summary').style.display = 'block';
  document.getElementById('enroll-bulk-summary').style.display = 'none';

  const name = applicantRow.full_name ||
    [applicantRow.First_Name, applicantRow.Middle_Name, applicantRow.Last_Name]
      .filter(Boolean).join(' ');
  document.getElementById('enroll-name').textContent = name;
  document.getElementById('enroll-program').textContent = applicantRow.Program_Name || applicantRow.Program_Code || '—';
  document.getElementById('enroll-campus').textContent = applicantRow.campus || '—';
  document.getElementById('enroll-year-display').textContent = applicantRow.year_level || '—';
  document.getElementById('enroll-type').textContent = applicantRow.admission_type || '—';
  document.getElementById('enroll-year-level').value = '';

  // ── Completeness warnings ──
  const missing = [];
  if (!applicantRow.Program_Code && !applicantRow.Program_Name) missing.push('Program / Course');
  if (!applicantRow.campus) missing.push('Campus');
  if (!applicantRow.year_level) missing.push('Year Level');
  const warnEl = document.getElementById('enroll-warn');
  if (missing.length) {
    warnEl.innerHTML = `<i class="fas fa-exclamation-triangle"></i> <strong>Incomplete record:</strong> ${missing.join(', ')} ${missing.length === 1 ? 'is' : 'are'} missing. The student record will be created with blank fields for these. Consider editing the applicant first.`;
    warnEl.style.display = 'block';
  } else {
    warnEl.style.display = 'none';
  }

  openModal('enroll-modal');
}

async function openEnrollModalBulk(ids) {
  _enrollMode = 'bulk';
  _enrollApplicant = null;
  _enrollBulkIds = ids;

  await preloadEnrollDropdowns();

  document.getElementById('enroll-modal-title').innerHTML =
    `<i class="fas fa-users"></i> Bulk Enroll — ${ids.length} Applicant(s)`;
  document.getElementById('enroll-modal-desc').textContent =
    'Choose a Section and Semester to apply to all selected applicants. Each will receive a unique Student Number.';

  document.getElementById('enroll-summary').style.display = 'none';
  document.getElementById('enroll-bulk-summary').style.display = 'block';
  document.getElementById('enroll-warn').style.display = 'none';
  document.getElementById('enroll-bulk-count-text').textContent =
    `${ids.length} applicant(s) selected — one Section and Semester applied to all.`;
  document.getElementById('enroll-year-level').value = '';

  openModal('enroll-modal');
}

async function confirmEnrollment() {
  const sectionId = parseInt(document.getElementById('enroll-section').value) || 0;
  const semesterId = parseInt(document.getElementById('enroll-semester').value) || 0;
  const yearLevel = document.getElementById('enroll-year-level').value;

  if (!sectionId) { toast('Please choose a Section.', 'err'); return; }
  if (!semesterId) { toast('Please choose a Semester.', 'err'); return; }

  const btn = document.getElementById('enroll-confirm-btn');
  btn.disabled = true;
  btn.innerHTML = '<span class="spinner"></span> Enrolling…';

  try {
    if (_enrollMode === 'single') {
      const res = await post('students', {
        action: 'enroll_from_applicant',
        applicant_id: _enrollApplicant.id,
        section_id: sectionId,
        semester_id: semesterId,
        year_level: yearLevel,
      });
      closeModal('enroll-modal');
      if (res.ok) {
        toast(res.already_existed
          ? `Already enrolled — Student #${res.student_number}`
          : `✅ Enrolled! Student #${res.student_number}`, 'ok');
        loadApplicants();
        loadStudents();
      } else {
        toast(res.msg || 'Enrollment failed.', 'err');
      }
    } else {
      const res = await post('students', {
        action: 'bulk_enroll_from_applicants',
        applicant_ids: _enrollBulkIds,
        section_id: sectionId,
        semester_id: semesterId,
        year_level: yearLevel,
      });
      closeModal('enroll-modal');
      clearBulkSelection();
      if (res.ok) {
        let msg = `✅ ${res.enrolled} enrolled`;
        if (res.already_existed) msg += `, ${res.already_existed} already existed`;
        if (res.failed) msg += `, ${res.failed} failed`;
        toast(msg, res.failed ? 'err' : 'ok');
        loadApplicants();
        loadStudents();
      } else {
        toast(res.msg || 'Bulk enrollment failed.', 'err');
      }
    }
  } finally {
    btn.disabled = false;
    btn.innerHTML = '<i class="fas fa-user-graduate"></i> Confirm Enrollment';
  }
}
// ══════════════════════════════════════════════════════════════════════════
// PRINT / PDF — Student Record
// ══════════════════════════════════════════════════════════════════════════

function _prCell(key, val, full = false) {
  return `<div class="pr-cell${full ? ' pr-full' : ''}">
    <div class="pr-cell-key">${key}</div>
    <div class="pr-cell-val">${val || '—'}</div>
  </div>`;
}

async function printStudentRecord() {
  if (!_stuViewData) return;
  const s = _stuViewData;
  const name = s.full_name
    || [s.First_Name, s.Middle_Name, s.Last_Name].filter(Boolean).join(' ')
    || '—';
  const addr = [s.Barangay, s.Municipality, s.Province, s.Zip_Code].filter(Boolean).join(', ') || '—';
  const now = new Date().toLocaleDateString('en-PH', { year: 'numeric', month: 'long', day: 'numeric' });

  // ── Fetch grades & payments in parallel (ignore errors — show "not available") ──
  const [gRes, pRes] = await Promise.all([
    api('grades', { student_id: _stuViewId }).catch(() => ({ ok: false })),
    api('payments', { student_id: _stuViewId }).catch(() => ({ ok: false })),
  ]);
  const grades = (gRes.ok && Array.isArray(gRes.data)) ? gRes.data : [];
  const payments = (pRes.ok && Array.isArray(pRes.data)) ? pRes.data : [];

  // ── Build grade table ──
  let gradesHTML;
  if (grades.length) {
    const gws = grades.filter(g => g.Credits && g.final_grade != null);
    const totalUnits = gws.reduce((s, g) => s + parseFloat(g.Credits || 0), 0);
    const totalGradePoints = gws.reduce((s, g) => s + parseFloat(g.Credits || 0) * parseFloat(g.final_grade || 0), 0);
    const gwa = totalUnits ? (totalGradePoints / totalUnits).toFixed(4) : null;

    gradesHTML = `
      <table class="pr-table">
        <thead>
          <tr>
            <th>Subject Code</th><th>Description</th>
            <th style="text-align:center">Units</th>
            <th style="text-align:center">Midterm</th>
            <th style="text-align:center">Final</th>
            <th style="text-align:center">Grade</th>
            <th style="text-align:center">Remarks</th>
          </tr>
        </thead>
        <tbody>
          ${grades.map(g => `
            <tr>
              <td>${g.Subject_Code || '—'}</td>
              <td>${g.Subject_Name || '—'}</td>
              <td style="text-align:center">${g.Credits ?? '—'}</td>
              <td style="text-align:center">${g.midterm != null ? Number(g.midterm).toFixed(2) : '—'}</td>
              <td style="text-align:center">${g.final != null ? Number(g.final).toFixed(2) : '—'}</td>
              <td style="text-align:center;font-weight:700">${g.final_grade != null ? Number(g.final_grade).toFixed(2) : '—'}</td>
              <td style="text-align:center">${g.remarks || '—'}</td>
            </tr>`).join('')}
        </tbody>
        ${gwa ? `<tfoot><tr style="background:#f0f5fc">
          <td colspan="2" style="font-weight:700;font-size:8pt">General Weighted Average</td>
          <td style="text-align:center;font-weight:700">${totalUnits}</td>
          <td colspan="2"></td>
          <td style="text-align:center;font-weight:700">${gwa}</td>
          <td></td>
        </tr></tfoot>` : ''}
      </table>`;
  } else {
    gradesHTML = `<p class="pr-no-data">No grade records on file.</p>`;
  }

  // ── Build payment table ──
  let paymentsHTML;
  if (payments.length) {
    const total = payments.reduce((s, r) => s + (parseFloat(r.amount) || 0), 0);
    paymentsHTML = `
      <table class="pr-table">
        <thead>
          <tr>
            <th>Date</th><th>Receipt #</th><th>Semester</th>
            <th style="text-align:right">Amount</th><th>Method</th><th>Status</th>
          </tr>
        </thead>
        <tbody>
          ${payments.map(p => `
            <tr>
              <td>${p.payment_date ? new Date(p.payment_date).toLocaleDateString('en-PH') : '—'}</td>
              <td>${p.receipt_number || '—'}</td>
              <td>${p.semester_name || '—'}${p.academic_year ? ' ' + p.academic_year : ''}</td>
              <td style="text-align:right;font-weight:700">₱${parseFloat(p.amount || 0).toLocaleString('en-PH', { minimumFractionDigits: 2 })}</td>
              <td>${p.payment_method || '—'}</td>
              <td>${p.status || '—'}</td>
            </tr>`).join('')}
        </tbody>
        <tfoot><tr style="background:#f0f5fc">
          <td colspan="3" style="font-weight:700;font-size:8pt">Total Paid</td>
          <td style="text-align:right;font-weight:700">₱${total.toLocaleString('en-PH', { minimumFractionDigits: 2 })}</td>
          <td colspan="2"></td>
        </tr></tfoot>
      </table>`;
  } else {
    paymentsHTML = `<p class="pr-no-data">No payment records on file.</p>`;
  }

  // ── Assemble the full print document ──
  const html = `
    <div class="pr-page">
      <!-- Letterhead -->
      <div class="pr-letterhead">
        <div>
          <div class="pr-school-name">Laguna State Polytechnic University</div>
          <div class="pr-school-sub">Office of the Registrar — Student Record</div>
        </div>
        <div style="margin-left:auto;text-align:right">
          <div class="pr-doc-title">Student Record</div>
          <div class="pr-doc-meta">Generated: ${now}</div>
        </div>
      </div>

      <!-- Hero -->
      <div class="pr-hero">
        <div class="pr-hero-icon">&#x1F393;</div>
        <div>
          <div class="pr-hero-name">${name}${s.Suffix ? ` <small style="font-size:11pt">${s.Suffix}</small>` : ''}</div>
          <div class="pr-hero-meta">
            <b>Student No.:</b> ${s.student_id || '—'} &nbsp;|&nbsp;
            <b>Email:</b> ${s.Email || '—'} &nbsp;|&nbsp;
            <b>Contact:</b> ${s.Contact_Number || '—'}
          </div>
          <div class="pr-status-badge">${s.Status || 'Active'}</div>
        </div>
      </div>

      <!-- Academic Information -->
      <div class="pr-section">
        <div class="pr-section-title">Academic Information</div>
        <div class="pr-grid">
          ${_prCell('Program', s.Program_Code ? `${s.Program_Code} — ${s.Program_Name || ''}` : s.Program_Name)}
          ${_prCell('Section', s.section_name)}
          ${_prCell('Year Level', s.year_level)}
          ${_prCell('Campus', s.campus)}
          ${_prCell('Semester', s.semester_name)}
          ${_prCell('Academic Year', s.academic_year)}
          ${_prCell('Student Type', s.student_type)}
          ${_prCell('Admission Type', s.admission_type)}
          ${_prCell('Enrollment Date', s.Enrollment_Date ? new Date(s.Enrollment_Date).toLocaleDateString('en-PH') : '—')}
          ${_prCell('Status', s.Status)}
        </div>
      </div>

      <!-- Personal Information -->
      <div class="pr-section">
        <div class="pr-section-title">Personal Information</div>
        <div class="pr-grid">
          ${_prCell('Sex', s.Sex)}
          ${_prCell('Civil Status', s.Civil_Status)}
          ${_prCell('Birthdate', s.Birthdate ? s.Birthdate.substring(0, 10) : '')}
          ${_prCell('Religion', s.Religion)}
          ${_prCell('Address', addr, true)}
        </div>
      </div>

      <!-- Grades -->
      <div class="pr-section">
        <div class="pr-section-title">Academic Grades</div>
        ${gradesHTML}
      </div>

      <!-- Payments -->
      <div class="pr-section">
        <div class="pr-section-title">Payment History</div>
        ${paymentsHTML}
      </div>

      <!-- Signature block -->
      <div class="pr-sig-block">
        <div>
          <div class="pr-sig-line">________________________________</div>
          <div class="pr-sig-role">Registrar / Authorized Officer</div>
        </div>
        <div>
          <div class="pr-sig-line">________________________________</div>
          <div class="pr-sig-role">Date Issued</div>
        </div>
      </div>

      <!-- Footer -->
      <div class="pr-footer">
        <span>LSPU Student Information System</span>
        <span>This document is computer-generated. ${now}</span>
      </div>
    </div>`;

  // ── Inject into print frame and trigger print ──
  const frame = document.getElementById('print-frame');
  frame.innerHTML = html;
  frame.style.display = 'block';
  window.print();
  frame.style.display = 'none';
}
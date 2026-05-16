document.getElementById('applicationPage').classList.remove('hidden');

/* ══════════════════════════════════════════════════════════
   STUDENT ID — stamp the hidden applicant_id fields in every
   step form so they are ready before the user submits.
══════════════════════════════════════════════════════════ */
document.querySelectorAll('.js-student-id').forEach(function (el) {
    el.value = APPLICANT_ID;
});

/* ══════════════════════════════════════════════════════════
   PRE-FILL FORM FROM DATABASE ON PAGE LOAD
══════════════════════════════════════════════════════════ */
(async function loadProfile() {
    try {
        const res  = await fetch('save_profile.php');
        const data = await res.json();
        if (!data.ok) return;

        const d = data.data;

        function set(name, val) {
            if (val == null || val === '') return;
            const strVal = String(val);

            // Radio / checkbox — check the element whose value matches
            const radios = document.querySelectorAll(
                '[name="' + name + '"][type="radio"], [name="' + name + '"][type="checkbox"]'
            );
            if (radios.length > 0) {
                radios.forEach(function (r) {
                    if (r.value === strVal) r.checked = true;
                });
                return;
            }

            // Select, text, date, tel — set value on ALL matching inputs
            document.querySelectorAll('[name="' + name + '"]').forEach(function (el) {
                el.value = strVal;
            });
        }

        // Step 1 — admission
        if (d.admission) {
            set('campus',         d.admission.campus);
            set('student_type',   d.admission.student_type);
            set('year_level',     d.admission.year_level);
            set('admission_type', d.admission.admission_type);
        }

        // Step 2 — personal info
        if (d.applicant) {
            const a = d.applicant;
            set('First_Name',               a.First_Name);
            set('Middle_Name',              a.Middle_Name);
            set('Last_Name',                a.Last_Name);
            set('Suffix',                   a.Suffix);
            set('Birthdate',                a.Birthdate);
            set('Birth_Place',              a.Birth_Place);
            set('Citizenship',              a.Citizenship);
            set('Sex',                      a.Sex);
            set('Civil_Status',             a.Civil_Status);
            set('Religion',                 a.Religion);
            set('Disability',               a.Disability);
            set('First_Generation_Student', a.First_Generation_Student);
            set('Contact_Number',           a.Contact_Number);
            set('Landline_Number',          a.Landline_Number);
            set('Email',                    a.Email);
            set('House_Number',             a.House_Number);
            set('Street',                   a.Street);
            set('Barangay',                 a.Barangay);
            set('Municipality',             a.Municipality);
            set('Province',                 a.Province);
            set('Zip_Code',                 a.Zip_Code);
        }

        // Profile card — name, contact, address
        if (d.applicant) {
            const a  = d.applicant;
            const mi = a.Middle_Name
                ? a.Middle_Name.trim().charAt(0).toUpperCase() + '.'
                : '';
            const fullName = [a.First_Name, mi, a.Last_Name, a.Suffix]
                .filter(Boolean).join(' ');

            document.getElementById('pc-name').textContent   = fullName || '— — —';
            document.getElementById('pc-email').textContent  = a.Email          || '';
            document.getElementById('pc-mobile').textContent = a.Contact_Number || '';

            const addr = [a.Barangay, a.Municipality, a.Province]
                .filter(Boolean).join(', ');
            document.getElementById('pc-address').textContent = addr || '';
        }

        // Campus label from Step 1 admission data
        const campusMap = {
            'Sta Cruz Campus':  'Santa Cruz Campus',
            'Siniloan Campus':  'Siniloan Campus',
            'San Pablo Campus': 'San Pablo City Campus',
            'Los Banos Campus': 'Los Baños Campus',
        };
        if (d.admission && d.admission.campus) {
            const label = campusMap[d.admission.campus] || d.admission.campus;
            document.getElementById('pc-campus').textContent = label;
        }

        // Step 3 — family
        if (d.family) {
            Object.entries(d.family).forEach(([key, val]) => {
                if (key === 'id' || key === 'applicant_id' || key === 'student_id') return;
                set(key, val);
            });
        }

        // Step 4 — education
        if (d.education) {
            Object.entries(d.education).forEach(([key, val]) => {
                if (key === 'id' || key === 'applicant_id' || key === 'student_id') return;
                set(key, val);
            });
        }

        // Step 5 — course
        if (d.course) {
            const ps = document.getElementById('program-select');
            if (ps && d.course.Program_Code) {
                ps.value = d.course.Program_Code;
                ps.dispatchEvent(new Event('change')); // populate specializations
                setTimeout(() => set('Specialization', d.course.Specialization), 50);
            }
        }

    } catch (e) {
        console.warn('Could not pre-fill profile:', e);
    }
})();

/* ══════════════════════════════════════════════════════════
   ACCORDION — only one open at a time
══════════════════════════════════════════════════════════ */
document.querySelectorAll('.accordion-header').forEach(function (header) {
    header.addEventListener('click', function () {
        const thisContent = header.parentElement.querySelector('.accordion-content');
        const isOpen      = thisContent.classList.contains('show');

        // Close ALL accordions first
        document.querySelectorAll('.accordion-content').forEach(function (c) {
            c.classList.remove('show');
        });
        document.querySelectorAll('.accordion-header').forEach(function (h) {
            h.classList.remove('active', 'open');
        });

        // If this one was closed, open it; if it was open, leave it closed (toggle)
        if (!isOpen) {
            thisContent.classList.add('show');
            header.classList.add('active', 'open');
        }
    });
});

/* ══════════════════════════════════════════════════════════
   AJAX FORM SAVE — intercepts each step form, POSTs via fetch,
   shows a success/error toast instead of a full page redirect
══════════════════════════════════════════════════════════ */
let toastTimer;

function showToast(msg, type) {
    let t = document.getElementById('ap-toast');
    if (!t) {
        t = document.createElement('div');
        t.id = 'ap-toast';
        t.style.cssText =
            'position:fixed;bottom:24px;right:24px;padding:12px 20px;' +
            'border-radius:10px;color:#fff;font-weight:600;z-index:9999;' +
            'transition:opacity .3s;box-shadow:0 4px 16px rgba(0,0,0,.2);';
        document.body.appendChild(t);
    }
    t.textContent      = msg;
    t.style.background = type === 'success' ? '#1a6b3c' : '#c0392b';
    t.style.opacity    = '1';
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => { t.style.opacity = '0'; }, 3500);
}

document.querySelectorAll('form[action="save_profile.php"]').forEach(function (form) {
    form.addEventListener('submit', async function (e) {
        e.preventDefault();
        const fd  = new FormData(form);
        const btn = form.querySelector('button[type="submit"]');
        const orig = btn ? btn.textContent : '';
        if (btn) {
            btn.textContent = 'Saving…';
            btn.disabled    = true;
        }

        try {
            const res  = await fetch('save_profile.php', { method: 'POST', body: fd });
            const data = await res.json();
            showToast(data.msg, data.ok ? 'success' : 'error');

            if (data.ok) {
                refreshValidationSummary();

                // Advance to the next accordion step
                const currentItem = form.closest('.accordion-item');
                const nextItem    = currentItem && currentItem.nextElementSibling;

                // Close all first
                document.querySelectorAll('.accordion-content').forEach(c => c.classList.remove('show'));
                document.querySelectorAll('.accordion-header').forEach(h => h.classList.remove('active', 'open'));

                if (nextItem) {
                    const nextHeader  = nextItem.querySelector('.accordion-header');
                    const nextContent = nextItem.querySelector('.accordion-content');
                    if (nextHeader && nextContent) {
                        nextHeader.classList.add('active', 'open');
                        nextContent.classList.add('show');
                        nextHeader.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }
                }
            }
        } catch (e) {
            showToast('Connection error. Please try again.', 'error');
        } finally {
            if (btn) {
                btn.textContent = orig;
                btn.disabled    = false;
            }
        }
    });
});

/* ══════════════════════════════════════════════════════════
   STEP 5 — DYNAMIC SPECIALIZATION DROPDOWN
══════════════════════════════════════════════════════════ */
var specializationMap = {
    'BSIT': [
        { code: 'WMAD', name: 'Web and Mobile Application Development' },
        { code: 'SMP',  name: 'Service Management Program' },
        { code: 'AMG',  name: 'Animation Motion Graphics' },
    ],
    'BSED': [
        { code: 'MATH',  name: 'Mathematics' },
        { code: 'MAPEH', name: 'MAPEH' },
        { code: 'TLE',   name: 'Technology & Livelihood Education' },
        { code: 'ENG',   name: 'English' },
        { code: 'FIL',   name: 'Filipino' },
        { code: 'GS',    name: 'General Science' },
    ],
};

var programSelect        = document.getElementById('program-select');
var specializationSelect = document.getElementById('specialization-select');

programSelect.addEventListener('change', function () {
    var code    = this.value;
    var options = specializationMap[code] || [];
    specializationSelect.innerHTML = '<option value="">— None / N/A —</option>';
    options.forEach(function (s) {
        var opt         = document.createElement('option');
        opt.value       = s.code;
        opt.textContent = s.name;
        specializationSelect.appendChild(opt);
    });
    specializationSelect.disabled = options.length === 0;
});

/* ══════════════════════════════════════════════════════════
   STEP 6 — VALIDATION SUMMARY
   ─────────────────────────────────────────────────────────
   BUG FIX: labels are now read from the element's data-label
   attribute (set directly in the HTML) instead of being
   computed from textContent on first run. This prevents
   "(incomplete)" from being baked into the cached label when
   innerHTML is rewritten on subsequent calls.
══════════════════════════════════════════════════════════ */
async function refreshValidationSummary() {
    try {
        const res  = await fetch('save_profile.php');
        const data = await res.json();
        if (!data.ok) return;
        const d = data.data;

        const checks = {
            'val-step1': !!(d.admission && d.admission.campus && d.admission.student_type && d.admission.year_level && d.admission.admission_type),
            'val-step2': !!(d.applicant && d.applicant.First_Name && d.applicant.Last_Name && d.applicant.Sex && d.applicant.Birthdate && d.applicant.Contact_Number && d.applicant.Email && d.applicant.Barangay && d.applicant.Municipality && d.applicant.Province),
            'val-step3': !!(d.family    && d.family.guardian_first_name && d.family.guardian_last_name && d.family.father_first_name && d.family.father_last_name && d.family.mother_first_name && d.family.mother_last_name),
            'val-step4': !!(d.education && d.education.elementary_school_name && d.education.high_school_name),
            'val-step5': !!(d.course    && d.course.Program_Code),
        };

        let allDone = true;
        for (const [id, ok] of Object.entries(checks)) {
            const el = document.getElementById(id);
            if (!el) continue;

            // ── FIX: always read the label from the data-label attribute
            //    that was stamped in the HTML, never from textContent which
            //    may already contain previously injected icons / "(incomplete)".
            const label = el.dataset.label || el.textContent.trim();

            el.innerHTML = ok
                ? '<i class="fa fa-check-circle" style="color:#16a34a"></i> ' + label
                : '<i class="fa fa-times-circle" style="color:#dc2626"></i> ' + label +
                  ' <em style="color:#dc2626;font-size:.8em">(incomplete)</em>';

            if (!ok) allDone = false;
        }

        // Enable / disable the final submit button
        const submitBtn = document.querySelector('.final-submit-btn');
        if (submitBtn) {
            submitBtn.disabled      = !allDone;
            submitBtn.title         = allDone ? '' : 'Complete all steps before submitting.';
            submitBtn.style.opacity = allDone ? '1' : '0.45';
            submitBtn.style.cursor  = allDone ? 'pointer' : 'not-allowed';
        }

    } catch (e) {
        console.warn('Validation summary failed:', e);
    }
}

// Run once on load, then refresh any time a step form is saved successfully
refreshValidationSummary();

/* ══════════════════════════════════════════════════════════
   SUBMIT APPLICATION (Save As Draft / Final Submit)
══════════════════════════════════════════════════════════ */
async function submitApplication(status) {
    if (status === 'Submitted') {
        // Re-validate before allowing final submit
        try {
            const res  = await fetch('save_profile.php');
            const data = await res.json();
            if (data.ok) {
                const d       = data.data;
                const allDone =
                    !!(d.admission && d.admission.campus) &&
                    !!(d.applicant && d.applicant.First_Name && d.applicant.Last_Name && d.applicant.Sex && d.applicant.Birthdate && d.applicant.Contact_Number && d.applicant.Email && d.applicant.Barangay && d.applicant.Municipality && d.applicant.Province) &&
                    !!(d.family    && d.family.guardian_first_name && d.family.guardian_last_name && d.family.father_first_name && d.family.father_last_name && d.family.mother_first_name && d.family.mother_last_name) &&
                    !!(d.education && d.education.elementary_school_name && d.education.high_school_name) &&
                    !!(d.course    && d.course.Program_Code);
                if (!allDone) {
                    showToast('Please complete all steps before submitting.', 'error');
                    return;
                }
            }
        } catch (e) {
            showToast('Connection error. Could not validate. Please try again.', 'error');
            return;
        }
    }

    try {
        const fd = new FormData();
        fd.append('applicant_id', APPLICANT_ID);
        fd.append('step',         'submit');
        fd.append('status',       status);

        const res  = await fetch('save_profile.php', { method: 'POST', body: fd });
        const data = await res.json();
        showToast(data.msg, data.ok ? 'success' : 'error');
    } catch (e) {
        showToast('Connection error. Please try again.', 'error');
    }
}

/* ══════════════════════════════════════════════════════════
   LOGOUT BUTTON
══════════════════════════════════════════════════════════ */
const logoutBtn = document.getElementById('logout-btn');
if (logoutBtn) {
    logoutBtn.addEventListener('click', async () => {
        await fetch('../api/auth.php', {
            method: 'POST',
            body: new URLSearchParams({ action: 'logout' }),
        });
        window.location.href = '../index.html';
    });
}
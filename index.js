/* ══════════════════════════════════════════════════════════
   PROGRAMS — for the Courses page (display only, no DB needed)
══════════════════════════════════════════════════════════ */
const PROGRAMS = {
  1: [{ code: 'BSP', name: 'Bachelor of Science in Psychology' }],
  2: [{ code: 'BSA', name: 'Bachelor of Science in Accountancy' },
  { code: 'BSBA', name: 'BS Business Administration' }],
  3: [{ code: 'BSIT', name: 'Bachelor of Science in Information Technology' },
  { code: 'BSCS', name: 'Bachelor of Science in Computer Science' }],
  4: [{ code: 'BSC', name: 'Bachelor of Science in Criminology' }],
  5: [{ code: 'BSF', name: 'BS Fisheries' },
  { code: 'BSAFBM', name: 'BS Agri-Fisheries Business Management' },
  { code: 'BSFE', name: 'BS Fishery Education' }],
  6: [{ code: 'BSFT', name: 'BS Food Technology' },
  { code: 'BSND', name: 'BS Nutrition and Dietetics' }],
  7: [{ code: 'BSHRM', name: 'BS Hotel and Restaurant Management' },
  { code: 'BST', name: 'Bachelor of Science in Tourism' }],
  8: [{ code: 'BSED', name: 'Bachelor of Secondary Education' },
  { code: 'BEED', name: 'Bachelor of Elementary Education' }],
};

/* ══════════════════════════════════════════════════════════
   NAVIGATION
══════════════════════════════════════════════════════════ */
function goTo(id) {
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  const target = document.getElementById(id);
  if (target) { target.classList.add('active'); window.scrollTo(0, 0); }
  if (id === 'page-courses') loadCourses();
}

/* ══════════════════════════════════════════════════════════
   TOAST
══════════════════════════════════════════════════════════ */
let toastTimer;
function showToast(msg, type = 'success') {
  const t = document.getElementById('toast');
  const icon = document.getElementById('toast-icon');
  document.getElementById('toast-msg').textContent = msg;
  t.className = 'toast show ' + type;
  icon.textContent = type === 'success' ? '✓' : '✕';
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => t.classList.remove('show'), 4000);
}

/* ══════════════════════════════════════════════════════════
   ALERT HELPERS
══════════════════════════════════════════════════════════ */
function showAlert(id, msg) {
  const el = document.getElementById(id);
  el.textContent = msg; el.classList.add('show'); el.style.display = 'block';
}
function hideAlert(id) {
  const el = document.getElementById(id);
  el.classList.remove('show'); el.style.display = 'none';
}

/* ══════════════════════════════════════════════════════════
   OTP HELPERS
══════════════════════════════════════════════════════════ */
function wireOtpRow(rowId) {
  const row = document.getElementById(rowId);
  if (!row) return;
  const inputs = row.querySelectorAll('input');
  inputs.forEach((inp, i) => {
    inp.addEventListener('input', () => {
      inp.value = inp.value.replace(/\D/g, '');
      if (inp.value && i < inputs.length - 1) inputs[i + 1].focus();
    });
    inp.addEventListener('keydown', e => {
      if (e.key === 'Backspace' && !inp.value && i > 0) inputs[i - 1].focus();
    });
  });
}
function getOtpValue(rowId) {
  return Array.from(document.getElementById(rowId).querySelectorAll('input')).map(i => i.value).join('');
}
function clearOtpRow(rowId) {
  document.getElementById(rowId).querySelectorAll('input').forEach(i => i.value = '');
  document.getElementById(rowId).querySelector('input').focus();
}

wireOtpRow('otp-row');
wireOtpRow('rec-otp-row');

/* ══════════════════════════════════════════════════════════
   API HELPER — posts FormData to auth.php
══════════════════════════════════════════════════════════ */
async function api(fields) {
  const fd = new FormData();
  Object.entries(fields).forEach(([k, v]) => fd.append(k, v));
  const res = await fetch('api/auth.php', { method: 'POST', body: fd });
  return res.json();
}

/* ══════════════════════════════════════════════════════════
   STATE
══════════════════════════════════════════════════════════ */
let state = { email: '', resendInterval: null };

/* ══════════════════════════════════════════════════════════
   LOGIN
══════════════════════════════════════════════════════════ */
async function doLogin() {
  hideAlert('login-alert');
  const email = document.getElementById('login-email').value.trim().toLowerCase();
  const password = document.getElementById('login-password').value;
  if (!email || !password) { showAlert('login-alert', 'Please fill in all fields.'); return; }

  const btn = document.getElementById('login-btn');
  btn.innerHTML = '<span class="spinner"></span>Logging in…'; btn.disabled = true;

  try {
    const data = await api({ action: 'login', email, password });
    if (data.ok) {
      showToast('Welcome back!', 'success');
      // Use the redirect target supplied by the server (role-aware).
      // Falls back to applicant_profile.php if somehow absent.
      setTimeout(() => { window.location.href = data.redirect || 'applicant/applicant_profile.php'; }, 600);
    } else {
      showAlert('login-alert', data.msg);
    }
  } catch {
    showAlert('login-alert', 'Connection error. Please try again.');
  } finally {
    btn.innerHTML = 'Log In'; btn.disabled = false;
  }
}

/* ══════════════════════════════════════════════════════════
   PASSWORD RECOVERY — Step 1: send OTP
══════════════════════════════════════════════════════════ */
let recoveryEmail = '';

async function doRecovery() {
  hideAlert('rec-alert');
  const email = document.getElementById('rec-email').value.trim().toLowerCase();
  if (!email) { showAlert('rec-alert', 'Please enter your email.'); return; }

  const btn = document.getElementById('rec-btn');
  btn.innerHTML = '<span class="spinner"></span>Sending…'; btn.disabled = true;

  try {
    const data = await api({ action: 'reset_request', email });
    if (data.ok) {
      recoveryEmail = email;
      // dev_otp shown for XAMPP dev; remove in production
      const hint = data.dev_otp ? ` (Dev code: ${data.dev_otp})` : '';
      showAlert('rec-success', `Reset code sent to ${email}.${hint}`);
      document.getElementById('rec-success').style.display = 'block';
      document.getElementById('rec-alert').style.display = 'none';
      document.getElementById('rec-otp-section').style.display = 'block';
      document.getElementById('rec-email-field').style.display = 'none';
      btn.style.display = 'none';
    } else {
      showAlert('rec-alert', data.msg);
    }
  } catch {
    showAlert('rec-alert', 'Connection error. Please try again.');
  } finally {
    btn.innerHTML = 'Send Reset Code'; btn.disabled = false;
  }
}

/* ══════════════════════════════════════════════════════════
   PASSWORD RECOVERY — Step 2: verify OTP & set new password
══════════════════════════════════════════════════════════ */
async function doResetPassword() {
  hideAlert('rec-alert');
  const otp = getOtpValue('rec-otp-row');
  const password = document.getElementById('rec-newpass').value;
  const confirm = document.getElementById('rec-confirmpass').value;

  if (otp.length < 6) { showAlert('rec-alert', 'Please enter the full 6-digit code.'); return; }
  if (password.length < 6) { showAlert('rec-alert', 'Password must be at least 6 characters.'); return; }
  if (password !== confirm) { showAlert('rec-alert', 'Passwords do not match.'); return; }

  try {
    const data = await api({ action: 'reset_password', email: recoveryEmail, otp, password, confirm });
    if (data.ok) {
      showToast('Password reset successfully!', 'success');
      setTimeout(() => goTo('page-login'), 1200);
    } else {
      showAlert('rec-alert', data.msg);
    }
  } catch {
    showAlert('rec-alert', 'Connection error. Please try again.');
  }
}

/* ══════════════════════════════════════════════════════════
   APPLY — Step 1: check email & send OTP
══════════════════════════════════════════════════════════ */
async function submitApplyEmail() {
  hideAlert('s1-alert');
  const email = document.getElementById('s1-email').value.trim().toLowerCase();
  const consent = document.getElementById('s1-consent').checked;

  if (!email) { showAlert('s1-alert', 'Please enter your email address.'); return; }
  if (!consent) { showAlert('s1-alert', 'You must agree to the Data Privacy Consent.'); return; }

  try {
    // First check if email already exists
    const check = await api({ action: 'check_email', email });
    if (!check.ok) { showAlert('s1-alert', check.msg); return; }
    if (check.exists) { showAlert('s1-alert', 'An account with this email already exists. Please log in.'); return; }

    // Send OTP
    const data = await api({ action: 'send_otp', email });
    if (data.ok) {
      state.email = email;
      document.getElementById('s2-email-display').value = email;
      // dev_otp shown for XAMPP dev; remove in production
      const hint = data.dev_otp ? ` (Dev code: ${data.dev_otp})` : '';
      document.getElementById('s2-info').textContent = `Verification code sent to ${email}.${hint}`;
      clearOtpRow('otp-row');
      startResendTimer();
      goTo('page-apply-step2');
      showToast(`Code sent to ${email}`, 'success');
    } else {
      showAlert('s1-alert', data.msg);
    }
  } catch {
    showAlert('s1-alert', 'Connection error. Please try again.');
  }
}

/* ══════════════════════════════════════════════════════════
   RESEND TIMER
══════════════════════════════════════════════════════════ */
function startResendTimer() {
  clearInterval(state.resendInterval);
  let t = 60;
  document.getElementById('resend-timer').textContent = t;
  state.resendInterval = setInterval(() => {
    t--;
    document.getElementById('resend-timer').textContent = t;
    if (t <= 0) clearInterval(state.resendInterval);
  }, 1000);
}

async function resendCode() {
  const data = await api({ action: 'send_otp', email: state.email });
  if (data.ok) {
    const hint = data.dev_otp ? ` (Dev code: ${data.dev_otp})` : '';
    document.getElementById('s2-info').textContent = `New code sent to ${state.email}.${hint}`;
    clearOtpRow('otp-row');
    startResendTimer();
    showToast('New code sent!', 'success');
  } else {
    showToast(data.msg, 'error');
  }
}

/* ══════════════════════════════════════════════════════════
   APPLY — Step 2: verify OTP
══════════════════════════════════════════════════════════ */
async function verifyOtp() {
  hideAlert('s2-alert');
  const otp = getOtpValue('otp-row');
  if (otp.length < 6) { showAlert('s2-alert', 'Please enter the full 6-digit code.'); return; }

  try {
    const data = await api({ action: 'verify_otp', email: state.email, otp });
    if (data.ok) {
      showToast('Email verified!', 'success');
      goTo('page-apply-step3');
    } else {
      showAlert('s2-alert', data.msg);
    }
  } catch {
    showAlert('s2-alert', 'Connection error. Please try again.');
  }
}

/* ══════════════════════════════════════════════════════════
   APPLY — Step 3: register & redirect to profile
══════════════════════════════════════════════════════════ */
async function submitBasicInfo() {
  hideAlert('s3-alert');
  const first_name = document.getElementById('s3-firstname').value.trim();
  const middle_name = document.getElementById('s3-middlename').value.trim();
  const last_name = document.getElementById('s3-lastname').value.trim();
  const suffix = document.getElementById('s3-suffix').value.trim();
  const password = document.getElementById('s3-password').value;
  const confirm = document.getElementById('s3-confirm').value;

  if (!first_name) { showAlert('s3-alert', 'First Name is required.'); return; }
  if (!last_name) { showAlert('s3-alert', 'Last Name is required.'); return; }
  if (password.length < 6) { showAlert('s3-alert', 'Password must be at least 6 characters.'); return; }
  if (password !== confirm) { showAlert('s3-alert', 'Passwords do not match.'); return; }

  try {
    const data = await api({
      action: 'register',
      email: state.email,
      first_name, middle_name, last_name, suffix,
      password, confirm
    });

    if (data.ok) {
      showToast('Account created! Redirecting…', 'success');
      // Session is set server-side by auth.php; go straight to profile
      setTimeout(() => { window.location.href = 'applicant/applicant_profile.php'; }, 800);
    } else {
      showAlert('s3-alert', data.msg);
    }
  } catch {
    showAlert('s3-alert', 'Connection error. Please try again.');
  }
}

/* ══════════════════════════════════════════════════════════
   COURSES PAGE
══════════════════════════════════════════════════════════ */
function loadCourses() {
  const colleges = [
    [1, 'College of Arts and Science'],
    [2, 'College of Business Administration and Accountancy'],
    [3, 'College of Computer Studies'],
    [4, 'College of Criminal Justice Education'],
    [5, 'College of Fisheries'],
    [6, 'College of Food Nutrition and Dietetics'],
    [7, 'College of International Hospitality and Tourism Management'],
    [8, 'College of Teacher Education'],
  ];
  let html = '';
  colleges.forEach(([id, name]) => {
    html += `<div style="margin-bottom:14px;"><strong style="color:var(--blue);">${name}</strong><ul style="margin-top:6px;padding-left:18px;list-style:disc;">`;
    (PROGRAMS[id] || []).forEach(p => { html += `<li>${p.name} <span style="color:var(--gold);font-weight:600;">(${p.code})</span></li>`; });
    html += '</ul></div>';
  });
  document.getElementById('courses-list').innerHTML = html;
}

/* ══════════════════════════════════════════════════════════
   ENTER KEY SUPPORT
══════════════════════════════════════════════════════════ */
document.getElementById('login-password').addEventListener('keydown', e => { if (e.key === 'Enter') doLogin(); });
document.getElementById('login-email').addEventListener('keydown', e => { if (e.key === 'Enter') doLogin(); });
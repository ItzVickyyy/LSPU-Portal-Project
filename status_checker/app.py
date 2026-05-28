"""
app.py — LSPU Applicant Status Checker (Flask)
Connects to the same MySQL database as the main PHP portal.
Run: python app.py
Access on same network: http://<your-ip>:5000
"""

from flask import Flask, render_template, request, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# ── Database config — match your config.php values ──
DB_CONFIG = {
    'host':     'localhost',
    'user':     'root',
    'password': '',          # XAMPP default (blank)
    'database': 'lspu_portal',
    'charset':  'utf8mb4',
}

# ── Status display config ──
STATUS_META = {
    'Draft': {
        'label':   'Draft — Not Yet Submitted',
        'icon':    '📝',
        'color':   '#6b7280',
        'bg':      'rgba(107, 114, 128, 0.08)',
        'border':  'rgba(107, 114, 128, 0.25)',
        'message': 'Your application is still in draft. Please log in to the portal and complete all steps, then submit your application.',
    },
    'Submitted': {
        'label':   'Submitted — Under Review',
        'icon':    '📬',
        'color':   '#0B5ED7',
        'bg':      'rgba(11, 94, 215, 0.08)',
        'border':  'rgba(11, 94, 215, 0.25)',
        'message': 'Your application has been submitted and is currently under review by the Registrar. Please wait for further updates.',
    },
    'Enrolled': {
        'label':   'Enrolled — Congratulations!',
        'icon':    '🎓',
        'color':   '#1a6b3c',
        'bg':      'rgba(26, 107, 60, 0.08)',
        'border':  'rgba(26, 107, 60, 0.25)',
        'message': 'Your enrollment has been confirmed! Welcome to Laguna State Polytechnic University.',
    },
}


def get_db():
    """Open a short-lived DB connection."""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except Error as e:
        return None


# ── Routes ──────────────────────────────────────────────────────────────────

@app.route('/')
def index():
    return render_template('status_checker.html')


@app.route('/check', methods=['POST'])
def check_status():
    data  = request.get_json(silent=True) or {}
    email = (data.get('email') or '').strip().lower()

    if not email:
        return jsonify({'ok': False, 'msg': 'Please enter your email address.'})

    conn = get_db()
    if conn is None:
        return jsonify({'ok': False, 'msg': 'Database connection failed. Please try again later.'})

    try:
        cursor = conn.cursor(dictionary=True)

        cursor.execute(
            """
            SELECT
                a.First_Name,
                a.Last_Name,
                a.Email,
                a.application_status,
                ai.campus,
                ai.student_type,
                ai.year_level,
                ai.admission_type,
                ic.Program_Code,
                ic.Specialization
            FROM applicants a
            LEFT JOIN admission_info    ai ON ai.applicant_id = a.id
            LEFT JOIN intended_course   ic ON ic.applicant_id = a.id
            WHERE a.Email = %s
            LIMIT 1
            """,
            (email,)
        )

        row = cursor.fetchone()

        if not row:
            return jsonify({'ok': False, 'msg': 'No account found with that email address.'})

        status_key = row.get('application_status') or 'Draft'
        meta       = STATUS_META.get(status_key, STATUS_META['Draft'])

        return jsonify({
            'ok':         True,
            'name':       f"{row['First_Name']} {row['Last_Name']}",
            'email':      row['Email'],
            'status':     status_key,
            'label':      meta['label'],
            'icon':       meta['icon'],
            'color':      meta['color'],
            'bg':         meta['bg'],
            'border':     meta['border'],
            'message':    meta['message'],
            'campus':     row.get('campus')       or '—',
            'program':    row.get('Program_Code') or '—',
            'spec':       row.get('Specialization') or '',
            'year_level': row.get('year_level')   or '—',
            'student_type': row.get('student_type') or '—',
        })

    except Error as e:
        return jsonify({'ok': False, 'msg': f'Query error: {str(e)}'})

    finally:
        cursor.close()
        conn.close()


# ── Run ──────────────────────────────────────────────────────────────────────
if __name__ == '__main__':
    # host='0.0.0.0' makes it accessible from other devices on the same network
    app.run(host='0.0.0.0', port=5000, debug=True)
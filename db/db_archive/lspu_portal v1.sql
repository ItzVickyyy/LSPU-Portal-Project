-- ============================================================
--  LSPU APPLICANT PORTAL — MySQL Database
--  Compatible with XAMPP (MySQL / MariaDB)
--  Import via: phpMyAdmin > Import, or run in MySQL console
-- ============================================================

CREATE DATABASE IF NOT EXISTS lspu_portal
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE lspu_portal;

-- ============================================================
--  TABLE 1: applicants
--  Core account + personal information (index.html Step 1–3,
--  applicant_profile.html Step 2)
-- ============================================================
CREATE TABLE IF NOT EXISTS applicants (
  student_id              INT UNSIGNED      NOT NULL AUTO_INCREMENT,

  -- Account / Login (from index.html registration flow)
  Email                   VARCHAR(180)      NOT NULL UNIQUE,
  password_hash           VARCHAR(64)       NOT NULL,         -- SHA-256 hex
  application_status      ENUM(
                            'Pending',
                            'Draft',
                            'Submitted',
                            'Enrolled',
                            'Rejected'
                          )                 NOT NULL DEFAULT 'Pending',

  -- Step 2 — Personal Identity
  First_Name              VARCHAR(80)       NOT NULL,
  Middle_Name             VARCHAR(80)           NULL,
  Last_Name               VARCHAR(80)       NOT NULL,
  Suffix                  VARCHAR(20)           NULL,         -- Jr., Sr., III…

  -- Birthday & Demographics
  Birthday                DATE                  NULL,
  Birth_Place             VARCHAR(120)          NULL,
  Citizenship             VARCHAR(80)           NULL,
  Sex                     ENUM('Male','Female') NULL,
  Civil_Status            ENUM(
                            'Single','Married','Widowed'
                          )                     NULL,
  Religion                VARCHAR(80)           NULL,
  Disability              VARCHAR(120)          NULL,
  First_Generation_Student ENUM('Yes','No')     NULL,

  -- Contact Info
  Contact_Number          VARCHAR(15)           NULL,
  Landline_Number         VARCHAR(20)           NULL,

  -- Address
  House_Number            VARCHAR(20)           NULL,
  Street                  VARCHAR(100)          NULL,
  Barangay                VARCHAR(80)           NULL,
  Municipality            VARCHAR(80)           NULL,
  Province                VARCHAR(80)           NULL,
  Zip_Code                VARCHAR(10)           NULL,

  -- Timestamps
  created_at              DATETIME          NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at              DATETIME          NOT NULL DEFAULT CURRENT_TIMESTAMP
                                            ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (student_id),
  INDEX idx_email (Email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
--  TABLE 2: admission_info
--  applicant_profile.html — Step 1: Campus & Admission
-- ============================================================
CREATE TABLE IF NOT EXISTS admission_info (
  id                  INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  student_id          INT UNSIGNED  NOT NULL,

  campus              ENUM(
                        'Sta Cruz Campus',
                        'Siniloan Campus',
                        'San Pablo Campus',
                        'Los Banos Campus'
                      )             NOT NULL,
  student_type        ENUM(
                        'College',
                        'GSaR',
                        'Post Graduate'
                      )             NOT NULL,
  year_level          ENUM(
                        '1st Year','2nd Year','3rd Year',
                        '4th Year','5th Year'
                      )             NOT NULL,
  admission_type      VARCHAR(80)   NOT NULL,   -- Senior HS Graduate, Transferee, Shifter…

  created_at          DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at          DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP
                                    ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_student (student_id),
  CONSTRAINT fk_adm_student
    FOREIGN KEY (student_id) REFERENCES applicants (student_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
--  TABLE 3: family_info
--  applicant_profile.html — Step 3: Parents / Guardian
-- ============================================================
CREATE TABLE IF NOT EXISTS family_info (
  id                              INT UNSIGNED   NOT NULL AUTO_INCREMENT,
  student_id                      INT UNSIGNED   NOT NULL,

  -- Guardian
  guardian_first_name             VARCHAR(80)        NULL,
  guardian_last_name              VARCHAR(80)        NULL,
  guardian_contact_number         VARCHAR(15)        NULL,
  guardian_email                  VARCHAR(180)       NULL,
  guardian_relationship           ENUM(
                                    'Guardian','Father','Mother'
                                  )                  NULL,
  guardian_barangay               VARCHAR(80)        NULL,
  guardian_municipality           VARCHAR(80)        NULL,
  guardian_province               VARCHAR(80)        NULL,

  -- Father
  father_first_name               VARCHAR(80)        NULL,
  father_middle_name              VARCHAR(80)        NULL,
  father_last_name                VARCHAR(80)        NULL,
  father_age                      TINYINT UNSIGNED   NULL,
  father_citizenship              VARCHAR(80)        NULL,
  father_educational_attainment   VARCHAR(60)        NULL,
  father_employment_status        VARCHAR(80)        NULL,
  father_occupation               VARCHAR(120)       NULL,

  -- Mother
  mother_first_name               VARCHAR(80)        NULL,
  mother_middle_name              VARCHAR(80)        NULL,
  mother_last_name                VARCHAR(80)        NULL,
  mother_age                      TINYINT UNSIGNED   NULL,
  mother_citizenship              VARCHAR(80)        NULL,
  mother_educational_attainment   VARCHAR(60)        NULL,
  mother_employment_status        VARCHAR(80)        NULL,
  mother_occupation               VARCHAR(120)       NULL,

  created_at                      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at                      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP
                                                 ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_student (student_id),
  CONSTRAINT fk_fam_student
    FOREIGN KEY (student_id) REFERENCES applicants (student_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
--  TABLE 4: educational_background
--  applicant_profile.html — Step 4: Educational Background
-- ============================================================
CREATE TABLE IF NOT EXISTS educational_background (
  id                              INT UNSIGNED   NOT NULL AUTO_INCREMENT,
  student_id                      INT UNSIGNED   NOT NULL,

  -- Elementary
  elementary_school_name          VARCHAR(150)       NULL,
  elementary_school_address       VARCHAR(200)       NULL,
  elementary_type                 ENUM('Public','Private') NULL,
  elementary_year_from            SMALLINT UNSIGNED  NULL,
  elementary_year_to              SMALLINT UNSIGNED  NULL,

  -- High School
  high_school_name                VARCHAR(150)       NULL,
  high_school_address             VARCHAR(200)       NULL,
  high_school_type                ENUM('Public','Private') NULL,
  high_school_year_from           SMALLINT UNSIGNED  NULL,
  high_school_year_to             SMALLINT UNSIGNED  NULL,

  -- Senior High School
  senior_high_school_name         VARCHAR(150)       NULL,
  senior_high_school_address      VARCHAR(200)       NULL,
  senior_high_school_type         ENUM('Public','Private') NULL,
  senior_high_school_year_from    SMALLINT UNSIGNED  NULL,
  senior_high_school_year_to      SMALLINT UNSIGNED  NULL,
  track_strand                    VARCHAR(60)        NULL,  -- STEM, ABM, HUMSS…

  created_at                      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at                      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP
                                                 ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_student (student_id),
  CONSTRAINT fk_edu_student
    FOREIGN KEY (student_id) REFERENCES applicants (student_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
--  TABLE 5: intended_course
--  applicant_profile.html — Step 5: Intended Course Selection
-- ============================================================
CREATE TABLE IF NOT EXISTS intended_course (
  id                  INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  student_id          INT UNSIGNED  NOT NULL,

  -- Program codes match the <select> values in the HTML
  Program_Code        VARCHAR(20)   NOT NULL,  -- e.g. BSIT, BSCS, BSA…
  Specialization      VARCHAR(20)       NULL,  -- e.g. WMAD, MATH, ENG…

  created_at          DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at          DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP
                                    ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_student (student_id),
  CONSTRAINT fk_course_student
    FOREIGN KEY (student_id) REFERENCES applicants (student_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
--  TABLE 6: programs  (reference / lookup table)
--  Mirrors the college + program lists shown on both pages
-- ============================================================
CREATE TABLE IF NOT EXISTS programs (
  Program_Code        VARCHAR(20)   NOT NULL,
  Program_Name        VARCHAR(120)  NOT NULL,
  College             VARCHAR(100)  NOT NULL,

  PRIMARY KEY (Program_Code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Seed data — matches every <option> in applicant_profile.html Step 5
INSERT INTO programs (Program_Code, Program_Name, College) VALUES
  ('BSP',    'BS Psychology',                         'College of Arts and Science'),
  ('BSA',    'BS Accountancy',                        'College of Business Administration and Accountancy'),
  ('BSBA',   'BS Business Administration',            'College of Business Administration and Accountancy'),
  ('BSIT',   'BS Information Technology',             'College of Computer Studies'),
  ('BSCS',   'BS Computer Science',                   'College of Computer Studies'),
  ('BSC',    'BS Criminology',                        'College of Criminal Justice Education'),
  ('BSF',    'BS Fisheries',                          'College of Fisheries'),
  ('BSAFBM', 'BS Agri-Fisheries Business Management', 'College of Fisheries'),
  ('BSFE',   'BS Fishery Education',                  'College of Fisheries'),
  ('BSFT',   'BS Food Technology',                    'College of Food Nutrition and Dietetics'),
  ('BSND',   'BS Nutrition and Dietetics',            'College of Food Nutrition and Dietetics'),
  ('BSHRM',  'BS Hotel and Restaurant Management',    'College of International Hospitality and Tourism Management'),
  ('BST',    'BS Tourism',                            'College of International Hospitality and Tourism Management'),
  ('BSED',   'Bachelor of Secondary Education',       'College of Teacher Education'),
  ('BEED',   'Bachelor of Elementary Education',      'College of Teacher Education');


-- ============================================================
--  TABLE 7: specializations  (reference / lookup table)
--  Mirrors specializationMap in applicant_profile.html
-- ============================================================
CREATE TABLE IF NOT EXISTS specializations (
  id              INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  Program_Code    VARCHAR(20)   NOT NULL,
  spec_code       VARCHAR(20)   NOT NULL,
  spec_name       VARCHAR(120)  NOT NULL,

  PRIMARY KEY (id),
  UNIQUE KEY uq_spec (Program_Code, spec_code),
  CONSTRAINT fk_spec_program
    FOREIGN KEY (Program_Code) REFERENCES programs (Program_Code)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Seed data — matches specializationMap in applicant_profile.html
INSERT INTO specializations (Program_Code, spec_code, spec_name) VALUES
  ('BSIT', 'WMAD',  'Web and Mobile Application Development'),
  ('BSIT', 'SMP',   'Service Management Program'),
  ('BSIT', 'AMG',   'Animation Motion Graphics'),
  ('BSED', 'MATH',  'Mathematics'),
  ('BSED', 'MAPEH', 'MAPEH'),
  ('BSED', 'TLE',   'Technology & Livelihood Education'),
  ('BSED', 'ENG',   'English'),
  ('BSED', 'FIL',   'Filipino'),
  ('BSED', 'GS',    'General Science');


-- ============================================================
--  SAMPLE / TEST DATA
--  Remove this section before deploying to production
-- ============================================================

INSERT INTO applicants (
  Email, password_hash,
  First_Name, Last_Name,
  application_status
) VALUES (
  'juan.delacruz@example.com',
  -- SHA-256 of "password123" (placeholder — use real hash in production)
  'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f',
  'Juan', 'Dela Cruz',
  'Draft'
);

-- ============================================================
--  USEFUL VIEWS
-- ============================================================

-- Full applicant summary (joins all tables)
CREATE OR REPLACE VIEW v_applicant_summary AS
SELECT
  a.student_id,
  CONCAT(a.First_Name, ' ',
         IFNULL(CONCAT(a.Middle_Name, ' '), ''),
         a.Last_Name,
         IFNULL(CONCAT(' ', a.Suffix), ''))   AS full_name,
  a.Email,
  a.application_status,
  a.Sex,
  a.Birthday,
  a.Contact_Number,
  CONCAT_WS(', ',
    a.Barangay, a.Municipality, a.Province)   AS full_address,
  ai.campus,
  ai.student_type,
  ai.year_level,
  ai.admission_type,
  ic.Program_Code,
  p.Program_Name,
  ic.Specialization,
  a.created_at
FROM       applicants           a
LEFT JOIN  admission_info       ai ON ai.student_id = a.student_id
LEFT JOIN  intended_course      ic ON ic.student_id = a.student_id
LEFT JOIN  programs             p  ON p.Program_Code = ic.Program_Code;

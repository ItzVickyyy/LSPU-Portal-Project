<?php
require_once __DIR__ . "/../api/config.php";
if (empty($_SESSION["applicant_id"])) {
    header("Location: ../index.html");
    exit;
}
$applicant_id = (int) $_SESSION["applicant_id"];
$student_name = htmlspecialchars($_SESSION["name"] ?? "Applicant");
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LSPU Applicant Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="applicant_profile.css">
    <link rel="icon" href="../assets/src/LSPU_Logo.png" type="image/png">
</head>

<body>
    <!-- PROFILE APPLICATION PAGE -->
    <div class="application-page hidden" id="applicationPage">
        <!-- TOP NAV -->
        <div class="topbar">
            <div class="brand">
                <div class="brand-logo">
                    <img src="../assets/src/LSPU_Logo.png" alt="LSPU Logo">
                </div>
                <div>
                    <div class="brand-text">LSPU Online</div>
                    <div class="brand-sub">Applicant Portal</div>
                </div>
            </div>
            <div class="top-actions">
                <button id="logout-btn" class="logout-btn">
                    <i class="fa fa-power-off"></i> Logout
                </button>
            </div>
        </div>

        <!-- MAIN CONTENT -->
        <div class="application-wrapper">
            <!-- PROFILE CARD -->
            <div class="profile-card">
                <div class="profile-left">
                    <img src="../assets/src/No-Data.png" alt="Profile photo">
                </div>
                <div class="profile-right">
                    <h1 id="pc-name">— — —</h1>
                    <p><i class="fa fa-map-marker-alt"></i> <span id="pc-campus"></span></p>
                    <p><i class="fa fa-envelope"></i> <span id="pc-email"></span></p>
                    <p><i class="fa fa-mobile-alt"></i> <span id="pc-mobile"></span></p>
                    <p><i class="fa fa-home"></i> <span id="pc-address"></span></p>
                </div>
            </div>

            <!-- ACCORDION -->
            <div class="accordion-container">
                <!-- ══════════════════════════════════════════════
                     STEP 1 — CAMPUS SELECTION
                ══════════════════════════════════════════════ -->
                <div class="accordion-item">
                    <button class="accordion-header active open">
                        <span><span class="step-badge">Step 1</span> CAMPUS SELECTION</span>
                        <span class="accordion-chevron">⌄</span>
                    </button>
                    <div class="accordion-content show">
                        <form action="save_profile.php" method="POST" autocomplete="off">
                            <input type="hidden" name="applicant_id" class="js-student-id">
                            <input type="hidden" name="step" value="1">

                            <h2>Campus and Admission Information</h2>
                            <p class="section-desc">Please select your preferred campus and admission details.</p>

                            <label class="field-label">Preferred Campus <span class="req">*</span></label>
                            <div class="radio-grid campus-grid" style="margin-top:10px;">
                                <label>
                                    <input type="radio" name="campus" value="Sta Cruz Campus" required>
                                    Santa Cruz
                                </label>
                                <label>
                                    <input type="radio" name="campus" value="Siniloan Campus">
                                    Siniloan
                                </label>
                                <label>
                                    <input type="radio" name="campus" value="San Pablo Campus">
                                    San Pablo City
                                </label>
                                <label>
                                    <input type="radio" name="campus" value="Los Banos Campus">
                                    Los Baños
                                </label>
                            </div>

                            <hr>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Student Type <span class="req">*</span></label>
                                    <select name="student_type" required>
                                        <option value="" disabled selected>Select Student Type</option>
                                        <option value="College">College</option>
                                        <option value="GSaR">GSaR</option>
                                        <option value="Post Graduate">Post Graduate</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Year Level <span class="req">*</span></label>
                                    <select name="year_level" required>
                                        <option value="" disabled selected>Select Year Level</option>
                                        <option value="1st Year">1st Year</option>
                                        <option value="2nd Year">2nd Year</option>
                                        <option value="3rd Year">3rd Year</option>
                                        <option value="4th Year">4th Year</option>
                                        <option value="5th Year">5th Year</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Admission Type <span class="req">*</span></label>
                                    <select id="admission_type" name="admission_type" required>
                                        <option value="" selected disabled>Choose...</option>
                                        <optgroup label="New Student">
                                            <option value="Senior HS Graduate">Senior HS Graduate</option>
                                            <option value="HS Graduate">HS Graduate</option>
                                            <option value="Alternative Delivery Mode">Alternative Delivery Mode</option>
                                            <option value="ALS Passer">Alternative Learning System (ALS) Passer</option>
                                            <option value="Transferee">Transferee</option>
                                            <option value="Second Courser">Second Courser</option>
                                        </optgroup>
                                        <optgroup label="Old Student">
                                            <option value="Shifter">Shifter</option>
                                            <option value="Returnee">Returnee</option>
                                            <option value="Second Courser">Second Courser</option>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>

                            <div class="form-footer">
                                <p>Fields marked <span class="req">*</span> are required.</p>
                                <button type="submit" class="save-btn">Save Step 1</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- ══════════════════════════════════════════════
                     STEP 2 — PERSONAL INFORMATION
                ══════════════════════════════════════════════ -->
                <div class="accordion-item">
                    <button class="accordion-header">
                        <span><span class="step-badge">Step 2</span> PERSONAL INFORMATION</span>
                        <span class="accordion-chevron">⌄</span>
                    </button>
                    <div class="accordion-content">
                        <form action="save_profile.php" method="POST" autocomplete="off">
                            <input type="hidden" name="applicant_id" class="js-student-id">
                            <input type="hidden" name="step" value="2">

                            <h2>Your Identity</h2>
                            <p class="section-desc">Enter your full legal name as it appears on your official documents.</p>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>First Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="First_Name" placeholder="First Name" required>
                                </div>
                                <div class="form-group">
                                    <label>Middle Name</label>
                                    <input type="text" autocomplete="off" name="Middle_Name" placeholder="Middle Name (if any)">
                                </div>
                                <div class="form-group">
                                    <label>Last Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="Last_Name" placeholder="Last Name" required>
                                </div>
                                <div class="form-group">
                                    <label>Suffix</label>
                                    <input type="text" autocomplete="off" name="Suffix" placeholder="Jr., Sr., III…">
                                </div>
                            </div>

                            <hr>
                            <h2>Birth &amp; Contact Details</h2>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Birthdate <span class="req">*</span></label>
                                    <input type="date" autocomplete="off" name="Birthdate" required>
                                </div>
                                <div class="form-group">
                                    <label>Place of Birth <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="Birth_Place" placeholder="City/Municipality, Province" required>
                                </div>
                                <div class="form-group">
                                    <label>Citizenship <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="Citizenship" placeholder="e.g. Filipino" required>
                                </div>
                            </div>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Mobile Number <span class="req">*</span></label>
                                    <input type="tel" autocomplete="off" name="Contact_Number" maxlength="11" pattern="[0-9]{11}"
                                        placeholder="09XXXXXXXXX" required>
                                    <span>11-digit Philippine mobile number</span>
                                </div>
                                <div class="form-group">
                                    <label>Landline No.</label>
                                    <input type="text" autocomplete="off" name="Landline_Number" placeholder="e.g. (02) 1234-5678">
                                </div>
                                <div class="form-group">
                                    <label>E-Mail Address <span class="req">*</span></label>
                                    <input type="email" autocomplete="off" name="Email" placeholder="example@email.com" required>
                                </div>
                            </div>

                            <hr>
                            <h2>Current Home Address</h2>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>House / Unit No.</label>
                                    <input type="text" autocomplete="off" name="House_Number" placeholder="e.g. 123">
                                </div>
                                <div class="form-group">
                                    <label>Street</label>
                                    <input type="text" autocomplete="off" name="Street" placeholder="Street name">
                                </div>
                                <div class="form-group">
                                    <label>Barangay <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="Barangay" placeholder="Barangay" required>
                                </div>
                                <div class="form-group">
                                    <label>Municipality / City <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="Municipality" placeholder="City or Municipality" required>
                                </div>
                            </div>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Province <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="Province" placeholder="Province" required>
                                </div>
                                <div class="form-group">
                                    <label>Zip / Postal Code <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="Zip_Code" maxlength="4" placeholder="e.g. 4000" required>
                                </div>
                            </div>

                            <hr>
                            <h2>Other Personal Information</h2>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Sex <span class="req">*</span></label>
                                    <div class="radio-grid campus-grid">
                                        <label><input type="radio" name="Sex" value="Male" required> Male</label>
                                        <label><input type="radio" name="Sex" value="Female"> Female</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Civil Status <span class="req">*</span></label>
                                    <select name="Civil_Status" required>
                                        <option value="" selected disabled>Choose...</option>
                                        <option value="Single">Single</option>
                                        <option value="Married">Married</option>
                                        <option value="Widowed">Widowed</option>
                                        <option value="Separated">Separated</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Religion <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="Religion" placeholder="e.g. Roman Catholic" required>
                                </div>
                                <div class="form-group">
                                    <label>Disability / Special Need</label>
                                    <input type="text" autocomplete="off" name="Disability" placeholder="If applicable, otherwise leave blank">
                                </div>
                            </div>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Are you a first-generation incoming college student? <span class="req">*</span></label>
                                    <div class="radio-grid campus-grid">
                                        <label><input type="radio" name="First_Generation_Student" value="Yes" required> Yes</label>
                                        <label><input type="radio" name="First_Generation_Student" value="No"> No</label>
                                    </div>
                                    <span>Being a first-generation student means that your parent(s) did not complete a college degree.</span>
                                </div>
                            </div>

                            <div class="form-footer">
                                <p>Fields marked <span class="req">*</span> are required.</p>
                                <button type="submit" class="save-btn">Save Step 2</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- ══════════════════════════════════════════════
                     STEP 3 — PARENTS / GUARDIAN INFORMATION
                ══════════════════════════════════════════════ -->
                <div class="accordion-item">
                    <button class="accordion-header">
                        <span><span class="step-badge">Step 3</span> PARENTS &amp; GUARDIAN INFORMATION</span>
                        <span class="accordion-chevron">⌄</span>
                    </button>
                    <div class="accordion-content">
                        <form action="save_profile.php" method="POST" autocomplete="off">
                            <input type="hidden" name="applicant_id" class="js-student-id">
                            <input type="hidden" name="step" value="3">

                            <!-- ── GUARDIAN ── -->
                            <h2>Guardian Information</h2>
                            <p class="section-desc">Person responsible / emergency contact for the applicant.</p>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Guardian First Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="guardian_first_name" placeholder="First Name" required>
                                </div>
                                <div class="form-group">
                                    <label>Guardian Last Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="guardian_last_name" placeholder="Last Name" required>
                                </div>
                                <div class="form-group">
                                    <label>Guardian Mobile Number <span class="req">*</span></label>
                                    <input type="tel" autocomplete="off" name="guardian_contact_number" maxlength="11" pattern="[0-9]{11}"
                                        placeholder="09XXXXXXXXX" required>
                                </div>
                                <div class="form-group">
                                    <label>Guardian E-Mail</label>
                                    <input type="email" autocomplete="off" name="guardian_email" placeholder="example@email.com">
                                </div>
                            </div>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Relationship to Applicant <span class="req">*</span></label>
                                    <select name="guardian_relationship" required>
                                        <option value="" disabled selected>Select Relationship</option>
                                        <option value="Father">Father</option>
                                        <option value="Mother">Mother</option>
                                        <option value="Guardian">Guardian</option>
                                        <option value="Sibling">Sibling</option>
                                        <option value="Grandparent">Grandparent</option>
                                        <option value="Relative">Other Relative</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Guardian Barangay <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="guardian_barangay" placeholder="Barangay" required>
                                </div>
                                <div class="form-group">
                                    <label>Guardian Municipality / City <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="guardian_municipality" placeholder="City or Municipality" required>
                                </div>
                                <div class="form-group">
                                    <label>Guardian Province <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="guardian_province" placeholder="Province" required>
                                </div>
                            </div>

                            <hr>

                            <!-- ── FATHER ── -->
                            <h2>Father's Information</h2>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>First Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="father_first_name" placeholder="First Name" required>
                                </div>
                                <div class="form-group">
                                    <label>Middle Name</label>
                                    <input type="text" autocomplete="off" name="father_middle_name" placeholder="Middle Name">
                                </div>
                                <div class="form-group">
                                    <label>Last Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="father_last_name" placeholder="Last Name" required>
                                </div>
                                <div class="form-group">
                                    <label>Age <span class="req">*</span></label>
                                    <input type="number" autocomplete="off" name="father_age" min="1" max="120" placeholder="Age" required>
                                </div>
                            </div>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Citizenship <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="father_citizenship" placeholder="e.g. Filipino" required>
                                </div>
                                <div class="form-group">
                                    <label>Educational Attainment <span class="req">*</span></label>
                                    <select name="father_educational_attainment" required>
                                        <option value="" disabled selected>Select Educational Attainment</option>
                                        <option value="No formal education">No formal education</option>
                                        <option value="Elementary Level">Elementary Level</option>
                                        <option value="Elementary Graduate">Elementary Graduate</option>
                                        <option value="High School Level">High School Level</option>
                                        <option value="High School Graduate">High School Graduate</option>
                                        <option value="College Level">College Level</option>
                                        <option value="College Graduate">College Graduate</option>
                                        <option value="Masters Level">Master's Level</option>
                                        <option value="Masters Graduate">Master's Graduate</option>
                                        <option value="Doctorates Level">Doctorate's Level</option>
                                        <option value="Doctorates Graduate">Doctorate's Graduate</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Employment Status <span class="req">*</span></label>
                                    <select name="father_employment_status" required>
                                        <option value="" disabled selected>Select Employment Status</option>
                                        <option value="Unemployed (not seeking for employment)">Unemployed (not seeking for employment)</option>
                                        <option value="Unemployed (actively seeking for employment)">Unemployed (actively seeking for employment)</option>
                                        <optgroup label="Employed">
                                            <option value="Government">Government</option>
                                            <option value="Private">Private</option>
                                        </optgroup>
                                        <option value="Self-Employed">Self-Employed</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Occupation <span class="req">*</span></label>
                                    <select name="father_occupation" required>
                                        <option value="" disabled selected>Select Occupation</option>
                                        <option value="Armed Forces Occupations">Armed Forces Occupations</option>
                                        <optgroup label="Professionals">
                                            <option value="Science and Engineering Professionals">Science and Engineering Professionals</option>
                                            <option value="Health Professionals">Health Professionals</option>
                                            <option value="Teaching Professionals">Teaching Professionals</option>
                                            <option value="Business Administration Professionals">Business Administration Professionals</option>
                                            <option value="ICT Professionals">ICT Professionals</option>
                                            <option value="Legal, Social, and Cultural Professionals">Legal, Social, and Cultural Professionals</option>
                                        </optgroup>
                                        <option value="Managers">Managers</option>
                                        <option value="Technicians and Associate Professionals">Technicians and Associate Professionals</option>
                                        <option value="Clerical Support Workers">Clerical Support Workers</option>
                                        <option value="Service and Sales Workers">Service and Sales Workers</option>
                                        <option value="Skilled Agricultural, Forestry, and Fishery Workers">Skilled Agricultural, Forestry, and Fishery Workers</option>
                                        <option value="Craft and Related Trades Workers">Craft and Related Trades Workers</option>
                                        <option value="Plant and Machine Operators, and Assemblers">Plant and Machine Operators, and Assemblers</option>
                                        <option value="Elementary Occupations">Elementary Occupations</option>
                                        <option value="Unemployed">Unemployed</option>
                                    </select>
                                </div>
                            </div>

                            <hr>

                            <!-- ── MOTHER ── -->
                            <h2>Mother's Information</h2>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>First Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="mother_first_name" placeholder="First Name" required>
                                </div>
                                <div class="form-group">
                                    <label>Middle Name</label>
                                    <input type="text" autocomplete="off" name="mother_middle_name" placeholder="Middle Name">
                                </div>
                                <div class="form-group">
                                    <label>Last Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="mother_last_name" placeholder="Last Name" required>
                                </div>
                                <div class="form-group">
                                    <label>Age <span class="req">*</span></label>
                                    <input type="number" autocomplete="off" name="mother_age" min="1" max="120" placeholder="Age" required>
                                </div>
                            </div>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Citizenship <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="mother_citizenship" placeholder="e.g. Filipino" required>
                                </div>
                                <div class="form-group">
                                    <label>Educational Attainment <span class="req">*</span></label>
                                    <select name="mother_educational_attainment" required>
                                        <option value="" disabled selected>Select Educational Attainment</option>
                                        <option value="No formal education">No formal education</option>
                                        <option value="Elementary Level">Elementary Level</option>
                                        <option value="Elementary Graduate">Elementary Graduate</option>
                                        <option value="High School Level">High School Level</option>
                                        <option value="High School Graduate">High School Graduate</option>
                                        <option value="College Level">College Level</option>
                                        <option value="College Graduate">College Graduate</option>
                                        <option value="Masters Level">Master's Level</option>
                                        <option value="Masters Graduate">Master's Graduate</option>
                                        <option value="Doctorates Level">Doctorate's Level</option>
                                        <option value="Doctorates Graduate">Doctorate's Graduate</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Employment Status <span class="req">*</span></label>
                                    <select name="mother_employment_status" required>
                                        <option value="" disabled selected>Select Employment Status</option>
                                        <option value="Unemployed (not seeking for employment)">Unemployed (not seeking for employment)</option>
                                        <option value="Unemployed (actively seeking for employment)">Unemployed (actively seeking for employment)</option>
                                        <optgroup label="Employed">
                                            <option value="Government">Government</option>
                                            <option value="Private">Private</option>
                                        </optgroup>
                                        <option value="Self-Employed">Self-Employed</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Occupation <span class="req">*</span></label>
                                    <select name="mother_occupation" required>
                                        <option value="" disabled selected>Select Occupation</option>
                                        <option value="Armed Forces Occupations">Armed Forces Occupations</option>
                                        <optgroup label="Professionals">
                                            <option value="Science and Engineering Professionals">Science and Engineering Professionals</option>
                                            <option value="Health Professionals">Health Professionals</option>
                                            <option value="Teaching Professionals">Teaching Professionals</option>
                                            <option value="Business Administration Professionals">Business Administration Professionals</option>
                                            <option value="ICT Professionals">ICT Professionals</option>
                                            <option value="Legal, Social, and Cultural Professionals">Legal, Social, and Cultural Professionals</option>
                                        </optgroup>
                                        <option value="Managers">Managers</option>
                                        <option value="Technicians and Associate Professionals">Technicians and Associate Professionals</option>
                                        <option value="Clerical Support Workers">Clerical Support Workers</option>
                                        <option value="Service and Sales Workers">Service and Sales Workers</option>
                                        <option value="Skilled Agricultural, Forestry, and Fishery Workers">Skilled Agricultural, Forestry, and Fishery Workers</option>
                                        <option value="Craft and Related Trades Workers">Craft and Related Trades Workers</option>
                                        <option value="Plant and Machine Operators, and Assemblers">Plant and Machine Operators, and Assemblers</option>
                                        <option value="Elementary Occupations">Elementary Occupations</option>
                                        <option value="Unemployed">Unemployed</option>
                                    </select>
                                </div>
                            </div>

                            <div class="footer-actions">
                                <p>Fields marked <span class="req">*</span> are required.</p>
                                <button type="submit" class="save-btn">Save Step 3</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- ══════════════════════════════════════════════
                     STEP 4 — EDUCATIONAL BACKGROUND
                ══════════════════════════════════════════════ -->
                <div class="accordion-item">
                    <button class="accordion-header">
                        <span><span class="step-badge">Step 4</span> EDUCATIONAL BACKGROUND</span>
                        <span class="accordion-chevron">⌄</span>
                    </button>
                    <div class="accordion-content">
                        <form action="save_profile.php" method="POST" autocomplete="off">
                            <input type="hidden" name="applicant_id" class="js-student-id">
                            <input type="hidden" name="step" value="4">

                            <!-- ── ELEMENTARY ── -->
                            <h2>Elementary Level</h2>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>School Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="elementary_school_name" placeholder="School Name" required>
                                </div>
                                <div class="form-group">
                                    <label>School Address <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="elementary_school_address" placeholder="School Address" required>
                                </div>
                                <div class="form-group">
                                    <label>School Type <span class="req">*</span></label>
                                    <select name="elementary_type" required>
                                        <option value="" disabled selected>Select Type</option>
                                        <option value="Private">Private</option>
                                        <option value="Public">Public</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Year From <span class="req">*</span></label>
                                    <input type="number" autocomplete="off" name="elementary_year_from" min="1900" max="2099"
                                        placeholder="e.g. 2008" required>
                                </div>
                                <div class="form-group">
                                    <label>Year To <span class="req">*</span></label>
                                    <input type="number" autocomplete="off" name="elementary_year_to" min="1900" max="2099"
                                        placeholder="e.g. 2014" required>
                                </div>
                            </div>

                            <hr>

                            <!-- ── HIGH SCHOOL ── -->
                            <h2>High School Level</h2>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>School Name <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="high_school_name" placeholder="School Name" required>
                                </div>
                                <div class="form-group">
                                    <label>School Address <span class="req">*</span></label>
                                    <input type="text" autocomplete="off" name="high_school_address" placeholder="School Address" required>
                                </div>
                                <div class="form-group">
                                    <label>School Type <span class="req">*</span></label>
                                    <select name="high_school_type" required>
                                        <option value="" disabled selected>Select Type</option>
                                        <option value="Private">Private</option>
                                        <option value="Public">Public</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Year From <span class="req">*</span></label>
                                    <input type="number" autocomplete="off" name="high_school_year_from" min="1900" max="2099"
                                        placeholder="e.g. 2014" required>
                                </div>
                                <div class="form-group">
                                    <label>Year To <span class="req">*</span></label>
                                    <input type="number" autocomplete="off" name="high_school_year_to" min="1900" max="2099"
                                        placeholder="e.g. 2018" required>
                                </div>
                            </div>

                            <hr>

                            <!-- ── SENIOR HIGH SCHOOL ── -->
                            <h2>Senior High School Level</h2>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>School Name</label>
                                    <input type="text" autocomplete="off" name="senior_high_school_name" placeholder="School Name (if applicable)">
                                </div>
                                <div class="form-group">
                                    <label>School Address</label>
                                    <input type="text" autocomplete="off" name="senior_high_school_address" placeholder="School Address">
                                </div>
                                <div class="form-group">
                                    <label>School Type</label>
                                    <select name="senior_high_school_type">
                                        <option value="" disabled selected>Select Type</option>
                                        <option value="Private">Private</option>
                                        <option value="Public">Public</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Year From</label>
                                    <input type="number" autocomplete="off" name="senior_high_school_year_from" min="1900" max="2099"
                                        placeholder="e.g. 2018">
                                </div>
                                <div class="form-group">
                                    <label>Year To</label>
                                    <input type="number" autocomplete="off" name="senior_high_school_year_to" min="1900" max="2099"
                                        placeholder="e.g. 2020">
                                </div>
                                <div class="form-group">
                                    <label>Track or Strand <span class="req">*</span></label>
                                    <select name="track_strand" required>
                                        <option value="" disabled selected>Select Track</option>
                                        <optgroup label="Academic Track">
                                            <option value="STEM">STEM</option>
                                            <option value="ABM">ABM</option>
                                            <option value="HUMSS">HUMSS</option>
                                            <option value="GAS">GAS</option>
                                        </optgroup>
                                        <optgroup label="Technical-Vocational-Livelihood (TVL) Track">
                                            <option value="Home Economics">Home Economics</option>
                                            <option value="ICT">ICT</option>
                                            <option value="Agri-fishery Arts">Agri-fishery Arts</option>
                                            <option value="Industrial Arts">Industrial Arts</option>
                                        </optgroup>
                                        <optgroup label="Other Tracks">
                                            <option value="Arts and Design Track">Arts and Design Track</option>
                                            <option value="Sports Track">Sports Track</option>
                                        </optgroup>
                                        <option value="N/A (ALS / Transferee / 2nd Courser)">N/A (ALS / Transferee / 2nd Courser)</option>
                                    </select>
                                </div>
                            </div>

                            <div class="footer-actions">
                                <p>Fields marked <span class="req">*</span> are required.</p>
                                <button type="submit" class="save-btn">Save Step 4</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- ══════════════════════════════════════════════
                     STEP 5 — INTENDED COURSE
                ══════════════════════════════════════════════ -->
                <div class="accordion-item">
                    <button class="accordion-header">
                        <span><span class="step-badge gold">Step 5</span> INTENDED COURSE</span>
                        <span class="accordion-chevron">⌄</span>
                    </button>
                    <div class="accordion-content">
                        <form action="save_profile.php" method="POST" autocomplete="off">
                            <input type="hidden" name="applicant_id" class="js-student-id">
                            <input type="hidden" name="step" value="5">

                            <h2>Intended Course Selection</h2>
                            <p class="section-desc">Choose the program you wish to apply for. A specialization/major dropdown will appear if applicable.</p>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>First Choice Program <span class="req">*</span></label>
                                    <select name="Program_Code" id="program-select" required>
                                        <option value="" disabled selected>Select Course</option>
                                        <optgroup label="College of Arts and Science">
                                            <option value="BSP">BS Psychology</option>
                                        </optgroup>
                                        <optgroup label="College of Business Administration and Accountancy">
                                            <option value="BSA">BS Accountancy</option>
                                            <option value="BSBA">BS Business Administration</option>
                                        </optgroup>
                                        <optgroup label="College of Computer Studies">
                                            <option value="BSIT">BS Information Technology</option>
                                            <option value="BSCS">BS Computer Science</option>
                                        </optgroup>
                                        <optgroup label="College of Criminal Justice Education">
                                            <option value="BSC">BS Criminology</option>
                                        </optgroup>
                                        <optgroup label="College of Fisheries">
                                            <option value="BSF">BS Fisheries</option>
                                            <option value="BSAFBM">BS Agri-Fisheries Business Management</option>
                                            <option value="BSFE">BS Fishery Education</option>
                                        </optgroup>
                                        <optgroup label="College of Food Nutrition and Dietetics">
                                            <option value="BSFT">BS Food Technology</option>
                                            <option value="BSND">BS Nutrition and Dietetics</option>
                                        </optgroup>
                                        <optgroup label="College of International Hospitality and Tourism Management">
                                            <option value="BSHRM">BS Hotel and Restaurant Management</option>
                                            <option value="BST">BS Tourism</option>
                                        </optgroup>
                                        <optgroup label="College of Teacher Education">
                                            <option value="BSED">Bachelor of Secondary Education</option>
                                            <option value="BEED">Bachelor of Elementary Education</option>
                                        </optgroup>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Specialization / Major</label>
                                    <select name="Specialization" id="specialization-select" disabled>
                                        <option value="">— None / N/A —</option>
                                    </select>
                                    <span>Only shown for programs with available specializations.</span>
                                </div>
                            </div>

                            <div class="form-footer">
                                <p>Fields marked <span class="req">*</span> are required.</p>
                                <button type="submit" class="save-btn">Save Step 5</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- ══════════════════════════════════════════════
                     STEP 6 — SUBMIT APPLICATION
                ══════════════════════════════════════════════ -->
                <div class="accordion-item">
                    <button class="accordion-header">
                        <span><span class="step-badge red">Step 6</span> SUBMIT APPLICATION</span>
                        <span class="accordion-chevron">⌄</span>
                    </button>
                    <div class="accordion-content">
                        <div class="submit-alert">
                            <h3>Validation Summary</h3>
                            <p class="section-desc">All steps must be completed before you can submit your application.</p>
                            <ul>
                                <!-- data-label stores the clean text so JS never re-reads mutated innerHTML -->
                                <li id="val-step1" data-label="Campus Selection">⬜ Campus Selection</li>
                                <li id="val-step2" data-label="Personal Information">⬜ Personal Information</li>
                                <li id="val-step3" data-label="Parents &amp; Guardian Information">⬜ Parents &amp; Guardian Information</li>
                                <li id="val-step4" data-label="Educational Background">⬜ Educational Background</li>
                                <li id="val-step5" data-label="Intended Course">⬜ Intended Course</li>
                            </ul>
                        </div>
                        <div class="submit-actions">
                            <button class="draft-btn" onclick="submitApplication('Draft')">
                                <i class="fa fa-save"></i> Save as Draft
                            </button>
                            <button class="final-submit-btn" onclick="submitApplication('Submitted')">
                                <i class="fa fa-paper-plane"></i> Submit Application
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const APPLICANT_ID = <?php echo $applicant_id; ?>;
        const SESSION = {
            name: <?= json_encode($_SESSION['name']   ?? '') ?>,
            email: <?= json_encode($_SESSION['email']  ?? '') ?>,
            applicant_id: <?= $applicant_id ?>,
        };
    </script>
    <script src="applicant_profile.js" defer></script>
</body>
</html>
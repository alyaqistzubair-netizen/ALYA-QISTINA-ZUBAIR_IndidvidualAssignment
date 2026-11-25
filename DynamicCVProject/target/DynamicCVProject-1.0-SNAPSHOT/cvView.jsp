
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cvbuilder.model.CVBean" %>

<%
    CVBean cvData = (CVBean) request.getAttribute("cvData");

    if (cvData == null) {
        response.sendRedirect(request.getContextPath() + "/CVServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My CV</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 30px;
            background: #F7F6F2;
            font-family: Arial, sans-serif;
            color: #333;
        }

        .cv-container {
            max-width: 850px;
            min-height: 650px;
            margin: auto;
            background: white;
            display: grid;
            grid-template-columns: 1fr 2fr;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .sidebar {
            background: #F4F6F3;
            padding: 30px 25px;
        }

        .main-content {
            padding: 35px 30px;
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            display: block;
            margin: 0 auto 20px;
            border: 4px solid white;
        }

        .profile-placeholder {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: #DCE3E9;
            color: #526987;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 45px;
        }

        .name {
            text-align: center;
            color: #526987;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .job-title {
            text-align: center;
            color: #777;
            font-size: 14px;
            margin-bottom: 25px;
        }

        .section-title {
            color: #526987;
            font-size: 16px;
            font-weight: bold;
            border-bottom: 2px solid #526987;
            padding-bottom: 7px;
            margin-bottom: 15px;
        }

        .section {
            margin-bottom: 25px;
        }

        .info-item {
            margin-bottom: 12px;
            font-size: 13px;
            line-height: 1.5;
            overflow-wrap: anywhere;
        }

        .info-item i {
            color: #526987;
            width: 18px;
            margin-right: 5px;
        }

        .content-item {
            margin-bottom: 18px;
        }

        .content-item h3 {
            font-size: 15px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .content-item p {
            font-size: 13px;
            color: #666;
            line-height: 1.6;
            margin: 4px 0;
            white-space: pre-line;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 25px auto;
        }

        .print-btn, .back-btn {
            padding: 11px 20px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            font-weight: bold;
        }

        .print-btn {
            background: #526987;
            color: white;
        }

        .back-btn {
            background: #E9EDE7;
            color: #526987;
        }

        .print-btn:hover {
            background: #405570;
        }

        .back-btn:hover {
            background: #DCE3D9;
        }

        @media (max-width: 650px) {
            body {
                padding: 15px;
            }

            .cv-container {
                grid-template-columns: 1fr;
            }

            .actions {
                flex-direction: column;
            }
        }

        @media print {
            body {
                padding: 0;
                background: white;
            }

            .cv-container {
                box-shadow: none;
                max-width: 100%;
            }

            .actions {
                display: none;
            }
        }
    </style>
</head>

<body>

    <div class="cv-container">

        <!-- SIDEBAR -->
        <div class="sidebar">

            <!-- PROFILE IMAGE -->
            <%
                if (cvData.getProfileImage() != null &&
                    !cvData.getProfileImage().isEmpty()) {
            %>

                <img src="<%= request.getContextPath() + cvData.getProfileImage() %>"
                class="profile-image"
                alt="Profile Image">

            <%
                } else {
            %>

                <div class="profile-placeholder">
                    <i class="fa-solid fa-user"></i>
                </div>

            <%
                }
            %>

            <h1 class="name">${cvData.fullName}</h1>
            <p class="job-title">${cvData.professionalTitle}</p>

            <!-- CONTACT -->
            <div class="section">
                <h2 class="section-title">
                    <i class="fa-solid fa-address-card"></i>
                    Contact
                </h2>

                <div class="info-item">
                    <i class="fa-solid fa-envelope"></i>
                    ${cvData.email}
                </div>

                <div class="info-item">
                    <i class="fa-solid fa-phone"></i>
                    ${cvData.phoneNumber}
                </div>

                <%
                    if (cvData.getLinkedinGithub() != null &&
                        !cvData.getLinkedinGithub().isEmpty()) {
                %>

                    <div class="info-item">
                        <i class="fa-solid fa-link"></i>
                        ${cvData.linkedinGithub}
                    </div>

                <%
                    }
                %>
            </div>

            <!-- SKILLS -->
            <div class="section">
                <h2 class="section-title">
                    <i class="fa-solid fa-lightbulb"></i>
                    Skills
                </h2>

                <%
                    if (cvData.getTechnicalSkills() != null &&
                        !cvData.getTechnicalSkills().isEmpty()) {
                %>

                    <div class="content-item">
                        <h3>Technical Skills</h3>
                        <p>${cvData.technicalSkills}</p>
                    </div>

                <%
                    }

                    if (cvData.getSoftSkills() != null &&
                        !cvData.getSoftSkills().isEmpty()) {
                %>

                    <div class="content-item">
                        <h3>Soft Skills</h3>
                        <p>${cvData.softSkills}</p>
                    </div>

                <%
                    }
                %>
            </div>

        </div>

        <!-- MAIN CONTENT -->
        <div class="main-content">

            <!-- PROFILE SUMMARY -->
            <%
                if (cvData.getProfileSummary() != null &&
                    !cvData.getProfileSummary().isEmpty()) {
            %>

                <div class="section">
                    <h2 class="section-title">
                        <i class="fa-solid fa-user"></i>
                        Profile Summary
                    </h2>

                    <p>${cvData.profileSummary}</p>
                </div>

            <%
                }
            %>

            <!-- EDUCATION -->
            <div class="section">
                <h2 class="section-title">
                    <i class="fa-solid fa-graduation-cap"></i>
                    Education
                </h2>

                <div class="content-item">
                    <h3>${cvData.highestDegree}</h3>
                    <p>${cvData.institutionName}</p>
                    <p>${cvData.major}</p>
                    <p>${cvData.graduationYear}</p>
                </div>
            </div>

            <!-- WORK EXPERIENCE -->
            <%
                if ((cvData.getJobTitle() != null &&
                     !cvData.getJobTitle().isEmpty()) ||

                    (cvData.getCompanyName() != null &&
                     !cvData.getCompanyName().isEmpty()) ||

                    (cvData.getResponsibilities() != null &&
                     !cvData.getResponsibilities().isEmpty())) {
            %>

                <div class="section">
                    <h2 class="section-title">
                        <i class="fa-solid fa-briefcase"></i>
                        Work Experience
                    </h2>

                    <div class="content-item">
                        <h3>${cvData.jobTitle}</h3>
                        <p>${cvData.companyName}</p>
                        <p>${cvData.duration}</p>
                        <p>${cvData.responsibilities}</p>
                    </div>
                </div>

            <%
                }
            %>

        </div>

    </div>

    <!-- ACTION BUTTONS -->
    <div class="actions">

        <button class="print-btn" onclick="window.print()">
            <i class="fa-solid fa-print"></i>
            Print / Save as PDF
        </button>

        <a href="${pageContext.request.contextPath}/CVServlet"
           class="back-btn">
            <i class="fa-solid fa-arrow-left"></i>
            Back to Form
        </a>

    </div>

</body>
</html>

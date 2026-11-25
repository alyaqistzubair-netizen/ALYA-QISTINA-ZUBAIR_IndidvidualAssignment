
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.cvbuilder.model.CVBean" %>

<%
    CVBean previousData = (CVBean) session.getAttribute("cvData");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online CV Builder</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>

<body class="bg-[#F7F6F2] font-sans m-0">

    <!-- HEADER -->
    <header class="bg-[#526987] text-white py-4 px-8">

        <div>
            <h1 class="text-2xl font-bold">
                <i class="fa-solid fa-file-lines mr-2"></i>
                Online CV Builder
            </h1>

            <p class="text-sm mt-1">
                Create your professional CV.
            </p>
        </div>

    </header>


    <!-- MAIN CONTENT -->
    <main class="max-w-[950px] mx-auto my-7 px-5">

        <!-- INTRODUCTION -->
        <div class="mb-6">

            <p class="text-sm font-semibold text-[#8A9A86]">
                YOUR PERSONAL PROFILE
            </p>

            <h2 class="text-2xl font-bold text-[#526987] mt-2">
                Let's create your CV
            </h2>

            <p class="text-sm text-gray-500 mt-2">
                Enter your information to create your professional CV.
            </p>

            <p class="text-xs text-gray-400 mt-2">
                Fields marked with * are required.
            </p>

        </div>


        <!-- CV FORM -->
        <form action="${pageContext.request.contextPath}/CVServlet"
              method="post"
              enctype="multipart/form-data"
              class="bg-white p-8 rounded-xl shadow-sm">


            <!-- PERSONAL INFORMATION -->
            <div class="mb-8">

                <h2 class="text-lg font-bold text-[#526987] border-b-2 border-[#E9EDE7] pb-3 mb-5">
                    <i class="fa-solid fa-user mr-2"></i>
                    Personal Information
                </h2>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-5">

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            Full Name *
                        </label>

                        <input type="text"
                               name="fullName"
                               value="${sessionScope.cvData.fullName}"
                               placeholder="Enter your full name"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            Professional Title
                        </label>

                        <input type="text"
                               name="professionalTitle"
                               value="${sessionScope.cvData.professionalTitle}"
                               placeholder="e.g. TS. ,IR. , DR."
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-envelope mr-1"></i>
                            Email *
                        </label>

                        <input type="text"
                               name="email"
                               value="${sessionScope.cvData.email}"
                               placeholder="example@email.com"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-phone mr-1"></i>
                            Phone Number
                        </label>

                        <input type="text"
                               name="phoneNumber"
                               value="${sessionScope.cvData.phoneNumber}"
                               placeholder="e.g. 0123456789"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div class="md:col-span-2">
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-link mr-1"></i>
                            LinkedIn / GitHub URL
                        </label>

                        <input type="text"
                               name="linkedinGithub"
                               value="${sessionScope.cvData.linkedinGithub}"
                               placeholder="Enter your LinkedIn or GitHub URL"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <!-- PROFILE PICTURE -->
                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-camera mr-1"></i>
                            Profile Picture
                        </label>

                        <input type="file"
                               name="profileImage"
                               accept="image/jpeg,image/png,image/gif,image/webp"
                               class="w-full h-12 p-2 bg-[#F0F2F9] rounded-md text-xs text-gray-600">

                        <p class="text-xs text-gray-400 mt-2">
                            JPG, PNG, GIF or WEBP. Maximum 5 MB.
                        </p>

                        <!-- PREVIOUS UPLOADED IMAGE -->
                        <%
                            if (previousData != null &&
                                previousData.getProfileImage() != null &&
                                !previousData.getProfileImage().isEmpty()) {
                        %>

                            <div class="mt-4">

                                <p class="text-sm text-[#7189A8] mb-2">
                                    Uploaded Image:
                                </p>

                                <img src="<%= request.getContextPath() + previousData.getProfileImage() %>"
                                     alt="Previous Profile Image"
                                     class="w-24 h-24 rounded-full object-cover border-4 border-[#E9EDE7]">

                                <p class="text-xs text-gray-400 mt-2">
                                    Leave empty to keep the previous image.
                                </p>

                            </div>

                        <%
                            }
                        %>

                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-user-pen mr-1"></i>
                            Profile Summary
                        </label>

                        <textarea name="profileSummary"
                                  placeholder="Write a short introduction about yourself..."
                                  class="w-full h-24 p-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] resize-y outline-none focus:ring-1 focus:ring-[#8A9A86]">${sessionScope.cvData.profileSummary}</textarea>
                    </div>

                </div>
            </div>


            <!-- EDUCATION -->
            <div class="mb-8">

                <h2 class="text-lg font-bold text-[#526987] border-b-2 border-[#E9EDE7] pb-3 mb-5">
                    <i class="fa-solid fa-graduation-cap mr-2"></i>
                    Education
                </h2>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-5">

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            Highest Degree *
                        </label>

                        <input type="text"
                               name="highestDegree"
                               value="${sessionScope.cvData.highestDegree}"
                               placeholder="e.g. Bachelor of Computer Science"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            Institution Name
                        </label>

                        <input type="text"
                               name="institutionName"
                               value="${sessionScope.cvData.institutionName}"
                               placeholder="Enter your university or college"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-calendar-days mr-1"></i>
                            Year of Graduation
                        </label>

                        <input type="text"
                               name="graduationYear"
                               value="${sessionScope.cvData.graduationYear}"
                               placeholder="e.g. 2026"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            Major / Field of Study
                        </label>

                        <input type="text"
                               name="major"
                               value="${sessionScope.cvData.major}"
                               placeholder="e.g. Software Engineering"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                </div>
            </div>


            <!-- WORK EXPERIENCE -->
            <div class="mb-8">

                <h2 class="text-lg font-bold text-[#526987] border-b-2 border-[#E9EDE7] pb-3 mb-5">
                    <i class="fa-solid fa-briefcase mr-2"></i>
                    Work Experience
                </h2>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-5">

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            Most Recent Job Title
                        </label>

                        <input type="text"
                               name="jobTitle"
                               value="${sessionScope.cvData.jobTitle}"
                               placeholder="e.g. IT Intern"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            Company Name
                        </label>

                        <input type="text"
                               name="companyName"
                               value="${sessionScope.cvData.companyName}"
                               placeholder="Enter company name"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div class="md:col-span-2">
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-clock mr-1"></i>
                            Duration
                        </label>

                        <input type="text"
                               name="duration"
                               value="${sessionScope.cvData.duration}"
                               placeholder="e.g. January 2025 - June 2025"
                               class="w-full h-12 px-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] outline-none focus:ring-1 focus:ring-[#8A9A86]">
                    </div>

                    <div class="md:col-span-2">
                        <label class="block text-sm text-[#7189A8] mb-2">
                            Responsibilities / Achievements
                        </label>

                        <textarea name="responsibilities"
                                  placeholder="Describe your responsibilities and achievements..."
                                  class="w-full h-24 p-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] resize-y outline-none focus:ring-1 focus:ring-[#8A9A86]">${sessionScope.cvData.responsibilities}</textarea>
                    </div>

                </div>
            </div>


            <!-- SKILLS -->
            <div class="mb-8">

                <h2 class="text-lg font-bold text-[#526987] border-b-2 border-[#E9EDE7] pb-3 mb-5">
                    <i class="fa-solid fa-lightbulb mr-2"></i>
                    Skills
                </h2>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-5">

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-code mr-1"></i>
                            Technical Skills
                        </label>

                        <textarea name="technicalSkills"
                                  placeholder="Example: Java, HTML, CSS, MySQL"
                                  class="w-full h-24 p-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] resize-y outline-none focus:ring-1 focus:ring-[#8A9A86]">${sessionScope.cvData.technicalSkills}</textarea>
                    </div>

                    <div>
                        <label class="block text-sm text-[#7189A8] mb-2">
                            <i class="fa-solid fa-users mr-1"></i>
                            Soft Skills
                        </label>

                        <textarea name="softSkills"
                                  placeholder="Example: Communication, Teamwork"
                                  class="w-full h-24 p-4 bg-[#F0F2F9] rounded-md text-sm text-gray-700 placeholder-[#9AA8C0] resize-y outline-none focus:ring-1 focus:ring-[#8A9A86]">${sessionScope.cvData.softSkills}</textarea>
                    </div>

                </div>
            </div>


            <!-- BUTTONS -->
            <div class="flex flex-wrap items-center gap-3 mt-8">

                <button type="submit"
                        class="min-w-[160px] px-6 py-3 bg-[#526987] hover:bg-[#435A78] text-white text-sm font-bold rounded-md transition">

                    <i class="fa-solid fa-file-circle-check mr-2"></i>
                    Generate My CV

                </button>

                <a href="${pageContext.request.contextPath}/CVServlet?action=sample"
                   class="min-w-[160px] px-6 py-3 bg-[#8A9A86] hover:bg-[#788A74] text-white text-sm font-bold text-center rounded-md transition">

                    <i class="fa-solid fa-eye mr-2"></i>
                    Preview Sample CV

                </a>

            </div>

        </form>

    </main>


    <!-- FOOTER -->
    <footer class="text-center py-5 text-xs text-gray-400">
        Online CV Builder | Create Your Professional Profile
    </footer>

</body>
</html>

package com.cvbuilder.controller;

import com.cvbuilder.model.CVBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.RequestDispatcher;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.UUID;

@MultipartConfig
public class CVServlet extends HttpServlet {

    // Get the upload folder path from web.xml
    private File getUploadFolder() throws ServletException {

        String uploadPath =
                getServletContext().getInitParameter("cvUploadPath");

        if (uploadPath == null || uploadPath.trim().isEmpty()) {
            throw new ServletException(
                "cvUploadPath is not configured in web.xml."
            );
        }

        File folder = new File(uploadPath);

        if (!folder.exists()) {
            folder.mkdirs();
        }

        if (!folder.exists() || !folder.isDirectory()) {
            throw new ServletException(
                "Unable to access uploads folder: " + uploadPath
            );
        }

        return folder;
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get previous CV data from session
        CVBean previousCv = (CVBean) request.getSession()
                .getAttribute("cvData");

        CVBean cv = new CVBean();

        // Personal Information
        cv.setFullName(request.getParameter("fullName"));
        cv.setProfessionalTitle(request.getParameter("professionalTitle"));
        cv.setEmail(request.getParameter("email"));
        cv.setPhoneNumber(request.getParameter("phoneNumber"));
        cv.setLinkedinGithub(request.getParameter("linkedinGithub"));
        cv.setProfileSummary(request.getParameter("profileSummary"));

        // Education
        cv.setHighestDegree(request.getParameter("highestDegree"));
        cv.setInstitutionName(request.getParameter("institutionName"));
        cv.setGraduationYear(request.getParameter("graduationYear"));
        cv.setMajor(request.getParameter("major"));

        // Work Experience
        cv.setJobTitle(request.getParameter("jobTitle"));
        cv.setCompanyName(request.getParameter("companyName"));
        cv.setDuration(request.getParameter("duration"));
        cv.setResponsibilities(request.getParameter("responsibilities"));

        // Skills
        cv.setTechnicalSkills(request.getParameter("technicalSkills"));
        cv.setSoftSkills(request.getParameter("softSkills"));

        // Profile Image
        Part imagePart = request.getPart("profileImage");

        if (imagePart != null && imagePart.getSize() > 0) {

            String contentType = imagePart.getContentType();
            String extension;

            if ("image/jpeg".equalsIgnoreCase(contentType)) {
                extension = ".jpg";
            } else if ("image/png".equalsIgnoreCase(contentType)) {
                extension = ".png";
            } else if ("image/gif".equalsIgnoreCase(contentType)) {
                extension = ".gif";
            } else if ("image/webp".equalsIgnoreCase(contentType)) {
                extension = ".webp";
            } else {

                request.getSession().setAttribute("cvData", cv);

                request.setAttribute("errorMessage",
                    "Please upload a valid image (JPG, PNG, GIF or WEBP).");

                request.getRequestDispatcher("cvError.jsp")
                       .forward(request, response);
                return;
            }

            if (imagePart.getSize() > 5 * 1024 * 1024) {

                request.getSession().setAttribute("cvData", cv);

                request.setAttribute("errorMessage",
                    "Image size must not exceed 5 MB.");

                request.getRequestDispatcher("cvError.jsp")
                       .forward(request, response);
                return;
            }

            // Generate a unique file name
            String fileName =
                    UUID.randomUUID().toString() + extension;

            // Save image into uploads
            File uploadFolder = getUploadFolder();
            File imageFile = new File(uploadFolder, fileName);

            try (InputStream input = imagePart.getInputStream()) {
                Files.copy(input, imageFile.toPath());
            }

            // Store new image URL in CVBean
            cv.setProfileImage("/CVServlet?image=" + fileName);

        } else if (previousCv != null) {

            // Keep previous uploaded image if no new image is selected
            cv.setProfileImage(previousCv.getProfileImage());

        }

        // Validate CV information
        if (cv.validate()) {

            // Save updated CV data into session
            request.getSession().setAttribute("cvData", cv);

            request.setAttribute("cvData", cv);

            RequestDispatcher rd =
                    request.getRequestDispatcher("cvView.jsp");

            rd.forward(request, response);

        } else {

            // Keep data in session even when validation fails
            request.getSession().setAttribute("cvData", cv);

            request.setAttribute("errorMessage",
                "Please enter valid Name, Email, Degree and at least one Skill.");

            RequestDispatcher rd =
                    request.getRequestDispatcher("cvError.jsp");

            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        // Display uploaded image
        String imageName = request.getParameter("image");

        if (imageName != null) {

            // Only allow generated image file names
            if (!imageName.matches(
                    "[a-fA-F0-9-]+\\.(jpg|png|gif|webp)")) {

                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            File uploadFolder = getUploadFolder();
            File imageFile = new File(uploadFolder, imageName);

            if (!imageFile.exists() || !imageFile.isFile()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            String contentType =
                    getServletContext().getMimeType(imageName);

            if (contentType == null ||
                !contentType.startsWith("image/")) {

                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            response.setContentType(contentType);
            response.setContentLengthLong(imageFile.length());

            Files.copy(imageFile.toPath(), response.getOutputStream());
            return;
        }

        // Sample CV
        String action = request.getParameter("action");

        if ("sample".equals(action)) {

            CVBean cv = new CVBean();

            cv.setFullName("Alya Insyirah Zubair");
            cv.setProfessionalTitle("Junior Web Developer");
            cv.setEmail("insyirahz@gmail.com");
            cv.setPhoneNumber("0123456789");
            cv.setLinkedinGithub("linkedin.com/in/alyainsyirah");

            cv.setProfileSummary(
                "Motivated IT graduate with knowledge in web development and programming."
            );

            cv.setHighestDegree("Bachelor of Computer Science");
            cv.setInstitutionName("Universiti Teknologi MARA");
            cv.setGraduationYear("2026");
            cv.setMajor("Software Engineering");

            cv.setJobTitle("IT Intern");
            cv.setCompanyName("Petronas Technology Sdn. Bhd.");
            cv.setDuration("January 2025 - June 2025");

            cv.setResponsibilities(
                "Assisted in website development and database management."
            );

            cv.setTechnicalSkills("Java, HTML, CSS, JavaScript, MySQL");
            cv.setSoftSkills("Communication, Teamwork, Problem Solving");

            cv.setProfileImage(null);

            request.setAttribute("cvData", cv);

            RequestDispatcher rd =
                    request.getRequestDispatcher("cvView.jsp");

            rd.forward(request, response);

        } else {

            // Return to form with previous CV data
            CVBean cvData = (CVBean) request.getSession()
                    .getAttribute("cvData");

            request.setAttribute("cvData", cvData);

            RequestDispatcher rd =
                    request.getRequestDispatcher("cvForm.jsp");

            rd.forward(request, response);
        }
    }
}

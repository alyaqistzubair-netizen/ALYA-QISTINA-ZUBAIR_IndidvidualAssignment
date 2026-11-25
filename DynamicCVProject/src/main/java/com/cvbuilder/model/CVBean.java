package com.cvbuilder.model;

public class CVBean {

    // Personal Information
    private String fullName;
    private String professionalTitle;
    private String email;
    private String phoneNumber;
    private String linkedinGithub;
    private String profileSummary;
    private String profileImage;

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public String getProfileImage() {
        return profileImage;
    }

    // Education
    private String highestDegree;
    private String institutionName;
    private String graduationYear;
    private String major;

    // Experience
    private String jobTitle;
    private String companyName;
    private String duration;
    private String responsibilities;

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setProfessionalTitle(String professionalTitle) {
        this.professionalTitle = professionalTitle;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setLinkedinGithub(String linkedinGithub) {
        this.linkedinGithub = linkedinGithub;
    }

    public void setProfileSummary(String profileSummary) {
        this.profileSummary = profileSummary;
    }

    public void setHighestDegree(String highestDegree) {
        this.highestDegree = highestDegree;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public void setGraduationYear(String graduationYear) {
        this.graduationYear = graduationYear;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }

    public void setTechnicalSkills(String technicalSkills) {
        this.technicalSkills = technicalSkills;
    }

    public void setSoftSkills(String softSkills) {
        this.softSkills = softSkills;
    }

    public String getFullName() {
        return fullName;
    }

    public String getProfessionalTitle() {
        return professionalTitle;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getLinkedinGithub() {
        return linkedinGithub;
    }

    public String getProfileSummary() {
        return profileSummary;
    }

    public String getHighestDegree() {
        return highestDegree;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public String getGraduationYear() {
        return graduationYear;
    }

    public String getMajor() {
        return major;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getDuration() {
        return duration;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public String getTechnicalSkills() {
        return technicalSkills;
    }

    public String getSoftSkills() {
        return softSkills;
    }

    // Skills
    private String technicalSkills;
    private String softSkills;

    // Zero-argument constructor
    public CVBean() {
    }

    // Validation method
    public boolean validate() {

        return fullName != null && !fullName.trim().isEmpty()
            && email != null && !email.trim().isEmpty()
            && email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")
            && highestDegree != null && !highestDegree.trim().isEmpty()
            && ((technicalSkills != null && !technicalSkills.trim().isEmpty())
            || (softSkills != null && !softSkills.trim().isEmpty()));
    }
}

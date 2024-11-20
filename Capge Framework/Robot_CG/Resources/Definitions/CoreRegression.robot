*** Settings ***
Resource  ../PageObjects/SearchPage.robot
Resource  ../PageObjects/Role Emulator.robot
Resource  ../PageObjects/Authorization.robot
Resource  ../PageObjects/CommunicationRecord.robot
Resource  ../PageObjects/ClinicalReview.robot
Resource  ../PageObjects/DischargePlan.robot
Resource  ../PageObjects/Consultations.robot
Resource  ../PageObjects/ClinicalConsultation.robot
Resource  ../PageObjects/MemberCentral.robot
Resource  HumanaGui.robot
Resource  ../PageObjects/SC_E2E_Regession_PO.robot


*** Keywords ***
Core Regression IP Auth Validation
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}
    Create Letter   ${UserData}
    Create Communication Record    ${UserData}
    Create Clinical Review    ${UserData}
    Create Task    ${UserData}
    Validate Edit Task

Create BHIP Auth Attachment
    [Arguments]    ${UserData}
    Create Auth Attachment      ${UserData}
    Edit Attachment
    Void Attachment


Create Authorization for PPV Temp2
    [Arguments]    ${UserData}
    Click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}

Auth - BHOP Create Clinical Review
    [Arguments]    ${UserData}
    Create BHOP Clinical Review   ${UserData}

Auth - Create Discharge Plan
    [Arguments]    ${UserData}
    Create BHOP Discharge Plan
    Edit BHOP Discharge Plan

Auth - Create Consultations
    [Arguments]    ${UserData}
    Create BHOP Consultations     ${UserData}
    Edit BHOP Consultations
    Revert the Role


Auth - Communication Record
    [Arguments]    ${UserData}
    Create BHOP Communication Record    ${UserData}


MC - User Create Member Attachment
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Click on the Member Central
    Create the Member Attachment    ${UserData}
    MC - Edit Attachment
    MC - Void Attachment

#######    Amol Pawar changes for CGX Backog tets cases
TC_IPAuth with Temper Member
    [Arguments]    ${UserData}
    Search For Member    ${UserData}
    Select The Member
    Create Temp Member    ${UserData}
    SearchPage.Click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}

TC_IPAuth with Default Provider
    [Arguments]    ${UserData}
    Create Authorization    ${UserData}

TC_07_09 Verify BSM StaticField in Create Mode and withoutMember
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to Clinical Consultation
    Create Clinical Consultation    ${UserData}
    View Clinical Consultation    ${UserData}
    Edit Mode Clinical Consultation    ${UserData}
    BSM StaticField should be empty when member Not in focus

TC Semi-Automate Medicare Approval template UMMED85
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.Click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}
#    check if auth approved
    sleep    1m
    Create X_AUTO_Medicare Approval Letter    ${UserData}
    Semi-Automate Medicare Letter Validation    ${UserData}

TC Semi-Automate Medicare_Approval_template_UMMED54
    [Arguments]    ${UserData}
    Create Authorization    ${UserData}
    check if auth approved
    Create X_AUTO_Medicare Approval Letter    ${UserData}
    Semi-Automate Medicare Letter Validation    ${UserData}

TC Verify Dynamic fields for xMedicare-Pre-Claim Provider Dispute_Approval_E
    [Arguments]    ${UserData}
    Create Authorization    ${UserData}
    check if auth approved
    Create X_AUTO_Medicare Approval Letter    ${UserData}
    Semi-Automate Medicare Letter Validation    ${UserData}
    Dynamic Field values Validate    ${UserData}

###################################################
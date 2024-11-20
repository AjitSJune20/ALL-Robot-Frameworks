*** Settings ***
Documentation  This script is used to validate member details
Library  OperatingSystem
Library    SeleniumLibrary
Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown    End Web Test

#Notes....

# Command to run all the test under tests/00011_Smoke.robot
## robot -d results tests/00011_Smoke.robot

# Command to run test based on Tags
##  robot -d results -i Navigation tests/00011_Smoke.robot
##  robot -d results -i OPAuth tests/00011_Smoke.robot

## robot -d results -v environment:prod  tests/00011_Smoke.robot
## robot -d results -v instance:qa2 tests/00011_Smoke.robot





*** Test Cases ***
Navigation - My Work - Assessments
    [Tags]    Navigation
     My Work Assessments Navigation

Navigation - My Work - Authorizations
    [Tags]    Navigation
     My Work Authorizations Navigation

Navigation - My Work - Behavioral
    [Tags]    Navigation
     My Work Behavioral Navigation

Navigation - My Work - CP CM Cases
    [Tags]    Navigation
     My Work CP CM Cases Navigation

Navigation - My Work - Consultations
    [Tags]    Navigation
     My Work Consultations Navigation

Navigation - My Work - Fax
    [Tags]    Navigation
     My Work Fax Navigation

Navigation - My Work - LTSS
    [Tags]    Navigation
    My Work LTSS Navigation

Navigation - My Work - Manage Queues
    [Tags]    Navigation
    My Work Manage Queues Navigation

Navigation - My Work - Provider Search
    [Tags]    Navigation
    My Work Provider Search Navigation

Navigation - My Work - Recent Work
    [Tags]    Navigation
    My Work Recent Work Navigation

Navigation - My Work - Referral Requests
    [Tags]    Navigation
    My Work Referral Requests Navigation

Navigation - My Work - Referrals
    [Tags]    Navigation
    My Work Referrals Navigation

Navigation - My Work - Reset Global Settings
    [Tags]    Navigation
    My Work Reset Global Settings Navigation

Navigation - My Work - Tasks
    [Tags]    Navigation
    My Work Tasks Navigation

Navigation - My Work - Routes
    [Tags]    Navigation
    My Work Routes Navigation

############################################################

Navigation - Member Central - Alternate Infomation - Not in Focus
    [Tags]    Navigation
    Member Central Alternate Info Navigation - Not in Focus

Navigation - Member Central - MemberAssessment - Not in Focus
    [Tags]    Navigation
    Member Central MemberAssessment Navigation - Not in Focus

Navigation - Member Central - Authorizations - Not in Focus
    [Tags]    Navigation
    Member Central Authorizations Navigation - Not in Focus

Navigation - Member Central - Behavioral Segment - Not in Focus
    [Tags]    Navigation
    Member Central Behavioral Segment Navigation - Not in Focus

Navigation - Member Central - MemberCarePlan - Not in Focus
    [Tags]    Navigation
    Member Central MemberCarePlan Navigation - Not in Focus

Navigation - Member Central - Care Plan 3 - Not in Focus
    [Tags]    Navigation
    Member Central Care Plan 3 Navigation - Not in Focus

Navigation - Member Central - Clinical Consultation - Not in Focus
    [Tags]    Navigation
    Member Central Clinical Consultation Navigation - Not in Focus

Navigation - Member Central - Communication Record - Not in Focus
    [Tags]    Navigation
    Member Central Communication Record Navigation - Not in Focus

Navigation - Member Central - Considerations - Not in
    [Tags]    Navigation
    Member Central Considerations Navigation - Not in Focus

Navigation - Member Central - CPCM Cases - Not in Focus
    [Tags]    Navigation
    Member Central CPCM Cases Navigation - Not in Focus

Navigation - Member Central - ICT Request - Not in Focus
    [Tags]    Navigation
    Member Central ICT Request Navigation - Not in Focus

Navigation - Member Central - Letters - Not in Focus
    [Tags]    Navigation
    Member Central Letters Navigation - Not in Focus

Navigation - Member Central - LTSS Cases - Not in Focus
    [Tags]    Navigation
    Member Central LTSS Cases Navigation - Not in Focus

Navigation - Member Central - Medicaid Plan of Care - Not in Focus
    [Tags]    Navigation
    Member Central Medicaid Plan of Care Navigation - Not in Focus

Navigation - Member Central - Medical List - Not in Focus
    [Tags]    Navigation
    Member Central Medical List Navigation - Not in Focus

Navigation - Member Central - Medical List - OML - Not in Focus
    [Tags]    Navigation
    Member Central Medical List - OML Navigation - Not in Focus

Navigation - Member Central - Member Attachments - Not in Focus
    [Tags]    Navigation
    Member Central Member Attachments Navigation - Not in Focus

Navigation - Member Central - Member Consultation - Not in Focus
    [Tags]    Navigation
    Member Central Member Consultation Navigation - Not in Focus

Navigation - Member Central - Member Info - Not in Focus
    [Tags]    Navigation
    Member Central Member Info Navigation - Not in Focus

Navigation - Member Central - Member Movement - Not in Focus
    [Tags]    Navigation
    Member Central Member Movement Navigation - Not in Focus

Navigation - Member Central - Member Timeline - Not in Focus
    [Tags]    Navigation
    Member Central Member Timeline Navigation - Not in Focus

Navigation - Member Central - Notes - Not in Focus
    [Tags]    Navigation
    Member Central Notes Navigation - Not in Focus

Navigation - Member Central - Provider Search - Not in Focus
    [Tags]    Navigation
    Member Central Provider Search Navigation - Not in Focus

Navigation - Member Central - Referral Request - Not in Focus
    [Tags]    Navigation
    Member Central Referral Request Navigation - Not in Focus

Navigation - Member Central - Referrals - Not in Focus
    [Tags]    Navigation
    Member Central Referrals Navigation - Not in Focus

Navigation - Member Central - Risk Ranking - Not in Focus
    [Tags]    Navigation
    Member Central Risk Ranking Navigation - Not in Focus

Navigation - Member Central - Tasks - Not in Focus
    [Tags]    Navigation
    Member Central Tasks Navigation - Not in Focus

Navigation - Member Central - Plan of Care - Not in Focus
    [Tags]    Navigation
    Member Central Plan of Care Navigation - Not in Focus

############################################################
Navigation - Admin - Assessment Template Downmerge
    [Tags]    Navigation
    Admin Assessment Template Downmerge Navigation

Navigation - Admin - Care Plan Configuration
    [Tags]    Navigation
    Admin Care Plan Configuration Navigation

Navigation - Admin - Communication Record Configuration
    [Tags]    Navigation
    Admin Communication Record Configuration Navigation

Navigation - Admin - Letter Template Configuration
    [Tags]    Navigation
    Admin Letter Template Configuration Navigation

Navigation - Admin - Role Emulator
    [Tags]    Navigation
    Admin Role Emulator Navigation

############################################################

Navigation - Member Central - Alternate Infomation - In Focus
    [Tags]    Navigation
    Search For Member    ${TC_Smoke01}
    select the member
    Member Central Alternate Info Navigation

Navigation - Member Central - MemberAssessment - In Focus
    [Tags]    Navigation
    Member Central MemberAssessment Navigation

Navigation - Member Central - Authorizations - In Focus
    [Tags]    Navigation
    Member Central Authorizations Navigation

Navigation - Member Central - Behavioral Segment - In Focus
    [Tags]    Navigation
    Member Central Behavioral Segment Navigation

Navigation - Member Central - MemberCarePlan - In Focus
    [Tags]    Navigation
    Member Central MemberCarePlan Navigation

Nvigation - Member Central - Care Plan 3.0 - In Focus
    [Tags]    Navigation
    Member Central Care Plan 3 Navigation

Navigation - Member Central - Clinical Consultation - In Focus
    [Tags]    Navigation
    Member Central Clinical Consultation Navigation

Navigation - Member Central - Communication Record - In Focus
    [Tags]    Navigation
    Member Central Communication Record Navigation

Navigation - Member Central - Considerations - In Focus
    [Tags]    Navigation
    Member Central Considerations Navigation

Navigation - Member Central - CPCM Cases - In Focus
    [Tags]    Navigation
    Member Central CPCM Cases Navigation

Navigation - Member Central - ICT Request - In Focus
    [Tags]    Navigation
    Member Central ICT Request Navigation

Navigation - Member Central - Letters - In Focus
    [Tags]    Navigation
    Member Central Letters Navigation

Navigation - Member Central - LTSS Cases - In Focus
    [Tags]    Navigation
    Member Central LTSS Cases Navigation

Navigation - Member Central - Medicaid Plan of Care - In Focus
    [Tags]    Navigation
    Member Central Medicaid Plan of Care Navigation

Navigation - Member Central - Medical List - In Focus
    [Tags]    Navigation
    Member Central Medical List Navigation

Navigation - Member Central - Medical List - OML - In Focus
    [Tags]    Navigation
    Member Central Medical List - OML Navigation

Navigation - Member Central - Member Attachments - In Focus
    [Tags]    Navigation
    Member Central Member Attachments Navigation

Navigation - Member Central - Member Consultation - In Focus
    [Tags]    Navigation
    Member Central Member Consultation Navigation

Navigation - Member Central - Member Info - In Focus
    [Tags]    Navigation
    Member Central Member Info Navigation

Navigation - Member Central - Member Movement - In Focus
    [Tags]    Navigation
    Member Central Member Movement Navigation

Navigation - Member Central - Member Timeline - In Focus
    [Tags]    Navigation
    Member Central Member Timeline Navigation

Navigation - Member Central - Notes - In Focus
    [Tags]    Navigation
    Member Central Notes Navigation

Navigation - Member Central - Provider Search - In Focus
    [Tags]    Navigation
    Member Central Provider Search Navigation

Navigation - Member Central - Referral Request - In Focus
    [Tags]    Navigation
    Member Central Referral Request Navigation

Navigation - Member Central - Referrals - In Focus
    [Tags]    Navigation
    Member Central Referrals Navigation

Navigation - Member Central - Risk Ranking - In Focus
    [Tags]    Navigation
    Member Central Risk Ranking Navigation Non LTSS

Navigation - Member Central - Tasks - In Focus
    [Tags]    Navigation
    Member Central Tasks Navigation

Navigation - Member Central - Plan of Care - In Focus
    [Tags]    Navigation
    Member Central Plan of Care Navigation

Navigation - Member Central - Plan of Care LTSS - In Focus
    [Tags]    Navigation
     Member Central Plan of Care LTSS Navigation    ${TC_Smoke02}

Navigation - Member Central - Risk Ranking - In Focus
    [Tags]    Navigation
    Member Central Risk Ranking Navigation  ${TC_Smoke02}

Navigation - Member Central - Service Cart - In Focus
    [Tags]    Navigation
    Member Central Service Cart Navigation

############################################################
Quick Auth - IP
    [Tags]     IPAuth
    [Template]    Create Authorization
    ${TC_SmokeIP}

Reason to Void IP
    [Tags]     IPAuth
    [Template]    Smoke Void
    ${TC_SmokeIP}
Quick Auth - OP
    [Tags]    OPAuth   F
    [Template]    Create Authorization
    ${TC_SmokeOP}

Authorization_Details_NewAuth_Btn_Validate
    [Tags]    OPAuth    F
    TC_AuthorizationDetails_NewAuth_Button_Verify

Authorization_Details_BuildAuth_Btn_Validate
    [Tags]    OPAuth    F
    TC_AuthorizationDetails_BuildAuth_Button_Verify

Authorization_Details_Ownership_Btn_Validate
    [Tags]    OPAuth    F
    TC_AuthorizationDetails_TakeOwnership_RemoveOwnership_Button_Verify

Authorization_Details_History_Btns_Validate
    [Tags]    OPAuth    F
    TC_AuthorizationDetails_AuthHistory_OwnershipHistory_Button_Verify

#Reason to Void OP
#    [Tags]     OPAuth    F
#    [Template]    Smoke Void
#    ${TC_SmokeOP}

Quick Auth - BHIP
    [Tags]    BHIPAuth
    [Template]    Create Authorization
    ${TC_SmokeBHIP}
Reason to Void BHIP
    [Tags]    BHIPAuth
    [Template]    Smoke Void
    ${TC_SmokeBHIP}
Quick Auth - BHOP
    [Tags]    BHOPAuth
    [Template]    Create Authorization
    ${TC_SmokeBHOP}

Reason to Void BHOP
    [Tags]   BHOPAuth
    [Template]    Smoke Void
    ${TC-OP003}

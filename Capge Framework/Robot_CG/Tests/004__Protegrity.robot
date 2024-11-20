*** Settings ***
Documentation  This script is used to validate Protigrity Validation
Library  OperatingSystem
Library    SeleniumLibrary

Resource  ../Resources/Definitions/ProtigrityDefiniNavya.robot

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/ProtegrityValidations.robot
Resource  ../Data/TestData.robot

# Prerequsite
Test Setup  Begin Web Test
Test Teardown  End Web Test

#   robot -d results tests/004__Protegrity.robot


*** Test Cases ***

1995675 - DDM (CM) - Auth Create/Edit
    [Tags]    Protegrity
    Verify Fields on View Authorization    ${TC_PRO_003}

1998655 - DDM (CM) - Authorization/CDR
    [Tags]    Protegrity

1995700 - DDM (CM) - Clinical Consultations
    [Tags]    Protegrity
    Verify Fields on View Clinical Consult    ${TC_PRO_008}

1998745 - DDM (CM) - Discharge Plans
    [Tags]    Protegrity


1998474 - DDM (CM) - IMP Banner
    [Tags]    Protegrity
    IMP Banner screen      ${TC_PRO_IMP Banner}

1995579 - DDM (CM) - Member Banner
    [Tags]    Protegrity

1995596 - DDM (CM) - View Alternate Info Screen
    [Tags]    Protegrity
    Verify Fields on View Alternate Info    ${TC_PRO_001}

1995681 - DDM (CM) - View Authorization
    [Tags]    Protegrity
    Verify Fields on View Authorization    ${TC_PRO_003}

2220815 - DDM (Edit Screens - CM) - Create Letter
    [Tags]    Protegrity

2220826 - DDM (Edit Screens - CM) - Edit Authorization
    [Tags]    Protegrity

2220834 - DDM (Edit Screens - CM) - Edit Clinical Consultations
    [Tags]    Protegrity
    Verify Fields on Edit Clinical Consultation    ${TC_PRO_012}

2220838 - DDM (Edit Screens - CM) - Edit Discharge Plan
    [Tags]    Protegrity
    Verify Fields on Edit Discharge Plan    ${TC_PRO_015}

2220837 - DDM (Edit Screens - Medicaid) - Edit Comm Rec
    [Tags]    Protegrity
    Verify Fields on Edit Comm Record    ${TC_PRO_013}

2220840 - DDM (Edit Screens - Medicaid) - Edit Quality Review
    [Tags]    Protegrity
    Verify Fields on Edit Quality Review    ${TC_PRO_014}

1995523 - DDM (Medicaid) - Member Search
    [Tags]    Protegrity
    TC_1995523_Member Search Grid Screen Validation    ${TC_1995523}

1998693 - DDM (Medicaid) - Auth Attachments
    [Tags]    Protegrity
    Auth Attachment Screen Validation     ${TC_AuthAttachment}

1998735 - DDM (Medicaid) - Communication Records
    [Tags]    Protegrity
    MemberCentral Communication Record Screen Validation     ${TC_CommunicationRecord}

1998559 - DDM (Medicaid) - Member Central (Add Alternate Info)
    [Tags]    Protegrity
    Verify Fields on Add Alternate Info    ${TC_PRO_010}

1998838 - DDM (Medicaid) - Member Central (Consultations)
    [Tags]    Protegrity
    Verify Fields on View Member Consultation    ${TC_PRO_006}

1998862 - DDM (Medicaid) - Member Central (Notes)
    [Tags]    Protegrity
    Verify Fields on View Notes    ${TC_PRO_002}

1998524 - DDM (Medicaid) - Member Central (Tasks)
    [Tags]    Protegrity
    TC_1998524_MC Task Screen Validation    ${TC_1998524}

1998539 - DDM (Medicaid) - Member Central (Tasks - Additional)
    [Tags]    Protegrity
    TC_1998539_MC Task Screen Validation    ${TC_1998539}

1998583 - DDM (Medicaid) - Member Central (View Alternate Info)
    [Tags]    Protegrity
    Verify Fields on View Alternate Info

1995509 - DDM (Medicaid) - Member Information Tab
    [Tags]    Protegrity
    Member Information Screen Validation    ${TC_MemberInfoScreen}

1998820 - DDM (Medicaid) - MyWork (Consultations)
    [Tags]    Protegrity
    Verify Fields on My works Consultation    ${TC_PRO_004}

1998812 - DDM (Medicaid) - MyWork (CP CM Cases)
    [Tags]    Protegrity
    MyWork View CP CM Case Screen Validation     ${TC_ViewMYWorkCPCMCASE}

1998775 - DDM (Medicaid) - MyWork (Referrals)
    [Tags]    Protegrity
    View MyWorkReferral Validation    ${TC_ViewMyWorkReferral}

1998794 - DDM (Medicaid) - MyWork (Tasks)
    [Tags]    Protegrity
    MyWork TasK Screen Validation    ${TC_ViewMYWorkTask}

1998871 - DDM (Medicaid) - MyWork Authorizations
    [Tags]    Protegrity
    Verify Fields on View MyWorkAuthorization    ${TC_PRO_005}
    Verify Fields on View Manage Queue    ${TC_PRO_011}

1998568 - DDM (Medicaid) - Provider Search
    [Tags]    Protegrity

1995454 - DDM (Medicaid) - Quality Review Screens
    [Tags]    Protegrity
    Verify Fields on View Quality Review    ${TC_PRO_007}




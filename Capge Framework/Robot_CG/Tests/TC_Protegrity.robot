*** Settings ***
Documentation  This script is used to validate Protigrity Validation
Library  OperatingSystem
Library    SeleniumLibrary


Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/ProtegrityDefinition.robot
Resource  ../Data/TestData.robot

# Prerequsite
#Suite Setup    Begin Web Test
#Suite Teardown    End Web Test
Test Setup    Begin Web Test
#Test Teardown    End Web Test

#   robot -d results tests/TC_Protegrity.robot
#   robot -d results -i Protegrity1 tests/TC_Protegrity.robot


*** Test Cases ***

2540717-DDM Medicaid - Member Central View Alternate Info
	[Tags]    Protegrity11
    Verify Fields on View Alternate Info    ${TC_PRO_001}

2540701-DDM Medicaid - Member Central Tasks - Additional
	[Tags]    Protegrity1
    TC_1998539_MC Task Screen Validation    ${TC_PRO_002}

2540562-DDM Medicaid - Member Central Add Alternate Info        #check Userstory
	[Tags]    Protegrity1
	Verify Fields on Add Alternate Info    ${TC_PRO_003}
    reload page
2540709-DDM Medicaid - Member Central Tasks
	[Tags]    Protegrity1
    TC_1998524_MC Task Screen Validation    ${TC_PRO_004}

2536763-DDM Medicaid- Member Search
	[Tags]    Protegrity1
    TC_1995523_Member Search Grid Screen Validation    ${TC_PRO_005}

2540769-DDM CM - MyWork Authorizations
	[Tags]    Protegrity1
	Verify Fields on View MyWorkAuthorization    ${TC_PRO_006}

2540736-DDM Medicaid - Member Information Tab
	[Tags]    Protegrity2
    Member Information Screen Validation    ${TC_PRO_007}

2540752-DDM CM - MyWork Consultations
	[Tags]    Protegrity2
	Verify Fields on My works Consultation    ${TC_PRO_008}

2540691-DDM Medicaid - Member Central Notes      #Passed
	[Tags]    Protegrity2
	Verify Fields on View Notes    ${TC_PRO_009}

2540622-DDM Medicaid - Member Central Consultations      #Passed
	[Tags]    Protegrity2
	Verify Fields on View Member Consultation    ${TC_PRO_010}

2540763-DDM Medicaid - MyWork Tasks
	[Tags]    Protegrity2
    MyWork TasK Screen Validation    ${TC_PRO_011}

2536741-DDM Medicaid - MyWork Referrals
	[Tags]    Protegrity2
    View MyWorkReferral Validation    ${TC_PRO_012}

2536819-DDM Medicaid - Communication Records
	[Tags]    Protegrity3
    MemberCentral Communication Record Screen Validation     ${TC_PRO_013}

2220837 - DDM (Edit Screens - Medicaid) - Edit Comm Rec
	[Tags]    Protegrity3
	Verify Fields on Edit Comm Record    ${TC_PRO_014}

2536795-DDM Medicaid - Auth Attachments
	[Tags]    Protegrity3
    Auth Attachment Screen Validation     ${TC_PRO_015}

2540782-DDM Medicaid - Quality Review Screens
	[Tags]    Protegrity3
	Verify Fields on View Quality Review    ${TC_PRO_016}

2220840 - DDM (Edit Screens - Medicaid) - Edit Quality Review
	[Tags]    Protegrity3
	Verify Fields on Edit Quality Review    ${TC_PRO_017}

1995675 - DDM (CM) - Auth View
	[Tags]    Protegrity3
	Verify Fields on View Authorization    ${TC_PRO_018}

1995681 - DDM (CM) - View Authorization
	[Tags]    Protegrity4
	Verify Fields on View Authorization    ${TC_PRO_019}

2220815 - DDM (Edit Screens - CM) - Create Letter
     [Tags]    Protegrity4    #CreateLetter
     Verify Fields on Create Auth letter Screen    ${TC_PRO_020}

2220826 DDM (Edit Screens - CM) - Edit Authorization
     [Tags]    Protegrity4    #EditAuth
     Verify Fields on Edit Authrization Screen       ${TC_PRO_021}

2220838 - DDM (Edit Screens - CM) - Edit Discharge Plan
	[Tags]    Protegrity4
	Verify Fields on Edit Discharge Plan    ${TC_PRO_022}

2540758-DDM CM - MyWork CP CM Cases
     [Tags]    Protegrity4    #MyWorkCPCMCase
    MyWork View CP CM Case Screen Validation     ${TC_PRO_023}

1998655 - DDM (CM) - Authorization/ViewCDR
	[Tags]    Protegrity4    #ViewCDR
	TC_1998655 - DDM (CM) - Authorization/ViewCDR    ${TC_PRO_024}

1995700 - DDM (CM) - View Clinical Consultations
	[Tags]    Protegrity5
	Verify Fields on View Clinical Consult    ${TC_PRO_025}

1998745 - DDM (CM) - View Discharge Plans
	[Tags]    Protegrity5
	Verify Fields on Discharge Plan    ${TC_PRO_026}

2220834 - DDM (Edit Screens - CM) - Edit Clinical Consultations
	[Tags]    Protegrity5
	Verify Fields on Edit Clinical Consultation    ${TC_PRO_027}

1998474 -DDM (CM) - IMP Banner
    [Tags]     Protegrity5    #IMPBanner
     Verify Fields on IMP Banner      ${TC_PRO_028}

1995579 - DDM (CM) - Member Banner
	[Tags]    Protegrity5
	Member Banner screen      ${TC_PRO_029}

1995596 - DDM (CM) - View Alternate Info Screen
	[Tags]    Protegrity5
    Verify Fields on View Alternate Info    ${TC_PRO_030}

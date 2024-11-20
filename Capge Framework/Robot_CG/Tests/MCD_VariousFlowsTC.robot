*** Settings ***
Documentation    The script implements the various flows scenerios in MCD
Library    OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/MCD_VariousFlows.robot

# Preequisite
Test Setup    Begin Web Test
#Test Teardown    End Web Test

# robot -d results -i LTSSAuth_KeepAllNew tests/MCD_VariousFlowsTC.robot
# robot -d results -i CPCM tests/MCD_VariousFlowsTC.robot
# robot -d results -i Assessment tests/MCD_VariousFlowsTC.robot
# robot -d results -i CommRec tests/MCD_VariousFlowsTC.robot
# robot -d results -i Task_01 tests/MCD_VariousFlowsTC.robot


*** Test Cases ***
TC011_Various Flow_Comm Rec_[MY Work_Edit CPCM Case]
    [Template]    Various Flow_Member MY Work_Edit CPCM Case
    [Tags]    CPCM
    ${CPCM_11}

TC012_Various Flow_CPCM case_[My Work_Referral_Create Case]
    [Template]    Various Flow_Member MY Work_Referral_Create Case
    [Tags]    CPCM
    ${CPCM_12}

TC13_Various Flow_Task_[Member Central_Task]
    [Template]    Various Flow_Member Central_Task
    [Tags]    Task01
    ${Task_01_02}

TC14_Various Flow_Task_[Member Central_Auth_Task]
    [Template]    Various Flow_MemberCentral_Auth_Task
    [Tags]    Task01
    ${Task_01_02}

TC15_Various Flow_Task_[Member Central_CPCM Case_Task]
    [Template]    Various Flow_MemberCentral_CPCM Case_Task
    [Tags]    Task01
    ${Task_03}

TC16_Various Flow_Task_[Member Central_ LTSS Cases_Task]
    [Template]    Various Flow_MemberCentral_LTSS Cases_Task
    [Tags]    Task01
    ${Task_04}

TC17_Various Flow_Task_[My work_ LTSS Cases_Task]
    [Template]    Various Flow_My work LTSS Cases_Task
    [Tags]    Task01
    ${Task_05}

TC18_Various Flow_Task_[My work_ Authorization_Task]
    [Template]    Various Flow_My work_Authorization_Task
    [Tags]    Task01
    ${Task_01_02}

TC19_Various Flow_Task_[My work_ CPCM Case_Task]
    [Template]    Various Flow_My work_CPCM Case_Task
    [Tags]    Task
    ${Task_07}

TC20_ Various flows_[ select assessment from MyWork -> Assessment -> Take as New ]
    [Template]    Various Flow_assessment from MyWork-Assessment-Take as New
    [Tags]    Assessment
    ${TC_KY_Health}

TC21_ Various flows [My Work -> CPCM Cases -> Assessments]
    [Template]    Various Flow_assessment from MyWork-CPCM Cases-Assessment
    [Tags]    Assessment
    ${TC_KY_Health}

TC22_ Various flows [My Work -> Auth -> Assessments]
    [Template]    Various Flow_assessment from MyWork-Auth-Assessment
    [Tags]    Assessment
    ${TC_KY_Health_auth}

TC06_Various Flow_Comm Rec_[My Work_Auth_Comm Rec]
    [Template]    Various Flow_Comm Rec_My Work_Auth_Comm Rec
    [Tags]    CommRec
    ${CommRec_06}

TC07_Various Flow_Comm Rec_[My Work_LTSS_Comm Rec]
    [Template]    Various Flow_Comm Rec_My Work_LtssCase_Comm Rec
    [Tags]    CommRec
    ${CommRec_07}

TC08_Various Flow_Comm Rec_[My Work_CPCM Case_Add Comm Rec]
    [Template]    Various Flow_Comm Rec_My Work_CPCM Case_Add Comm Rec
    [Tags]    CommRec
    ${CommRec_08}

TC09_Various Flow_Comm Rec_[Case ID Search_Add_Comm Rec]
    [Template]    Various Flow_Comm Rec_Case ID Search_Add_Comm Rec
    [Tags]    CommRec
    ${CommRec_08}

TC10_Various Flow_Comm Rec_[Auth ID Search_Add_Comm Rec]
    [Tags]    CommRec01
    Various Flow_Comm Rec_Auth ID Search_Add_Comm Rec    ${CommRec_10}

*** Settings ***
Documentation    This script is used to validate FL Exploratory Scenerios
Library    OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/FL_Exploratory.robot

# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# robot -d results -i Comm_Rec_LtssCaseLevel tests/FL_ExploratoryTC.robot
# robot -d results -i Comm_Rec_MemberCentralLevel tests/FL_ExploratoryTC.robot
# robot -d results -i Comm_Rec_AuthLevel tests/FL_ExploratoryTC.robot
# robot -d results -i TC06 tests/FL_ExploratoryTC.robot
# robot -d results -i TC03 tests/FL_ExploratoryTC.robot
# robot -d results -i TC01 tests/FL_ExploratoryTC.robot
# robot -d results -i TC04 tests/FL_ExploratoryTC.robot



*** Test Cases ***
TC02_FL_Create comm rec at various level LTSS Case Level
    [Tags]    Comm_Rec_LtssCaseLevel
    [Template]    TC02_FL_Create comm rec at various level
    ${TC02_Comm_Rec_LtssCaseLevel}

TC05_FL_Create comm rec at Member Central Level
    [Tags]    Comm_Rec_MemberCentralLevel
    [Template]    TC05_FL_Create comm rec at Member Central Level
    ${TC02_Comm_Rec_MCLevel}

TC07_FL_Create comm rec at Autharization Level
    [Tags]    Comm_Rec_AuthLevel
    [Template]    TC07_FL_Create comm rec at Auth Level
    ${TC07_Comm_Rec_AuthLevel}

TC03_FL_Exploratory_Testing_Verify_Community_Living_Support_Plan_Comm_Rec_Comm rec_CLSP_Yes
    [Tags]   TC03
    [Template]   TC03 FL ET Verify Community Living Support Plan Comm Rec Comm rec CLSP Yes
    ${FL_TC_03_ET}

TC01_FL_Exploratory Testing Verify Units & frequency on Add Service Details Pop-Up_[MC_LTSS Auth_Freq = weekly
    [Tags]   TC01
    [Template]   TC01 FL ET Verify Units & frequency on Add Service Details Pop-Up
    ${TC_01_FL_ET}

TC04_I21.09_FL_Exploratory Testing Verify View Service and Edit Service pop-up for Non HCBS Service_Create and Edit PLOC
    [Tags]   TC04
    [Template]   TC04 FL ET Verify View Service and Edit Service pop-up for Non HCBS Service_Create
    ${TC_04_FL_ET}

TC06_I21.09_FL_Create communication record at CP CM case level and verify that user is able to view it in Member Central
    [Tags]   TC06
    [Template]   TC06 FL ET Create Comm record and verify that user is able to view it in Member Central
    ${TC_06_FL_ET}


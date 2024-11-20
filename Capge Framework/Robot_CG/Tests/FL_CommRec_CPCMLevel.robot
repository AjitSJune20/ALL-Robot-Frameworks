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
TC06_I21.09_FL_Create communication record at CP CM case level and verify that user is able to view it in Member Central
    [Tags]   TC06
    [Template]   TC06 FL ET Create Comm record and verify that user is able to view it in Member Central
    ${TC_06_FL_ET}


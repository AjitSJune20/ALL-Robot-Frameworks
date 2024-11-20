*** Settings ***
Documentation  This script is used for SC E2E MCD_Regression

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/SC_E2E_Regession.robot


#Prerequisite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

## robot -d results -i SC_E2E_IPAuth_01 tests/SC_E2E_Regession_TC.robot
## robot -d results -i SC_E2E_IPAuth_02 tests/SC_E2E_Regession_TC.robot
## robot -d results -i TC_SC_E2E_Comm_3 tests/SC_E2E_Regession_TC.robot
## robot -d results -i TC_SC_E2E_IPAuth_ObsRule_04 tests/SC_E2E_Regession_TC.robot
## robot -d results -i TC_SC_E2E_Temp_Member_05 tests/SC_E2E_Regession_TC.robot
## pabot --processes 3 --outputdir Results tests/SC_E2E*.robot


*** Test Cases ***
SC E2E IPAuth_FU_AprovedStatus
    [Template]    TC_SC_E2E_IPAuth_FU_AprovedStatus_01
    [Tags]    SC_E2E_IPAuth_01
    ${TC_SC_E2E_IPAuth_01}

SC E2E IPAuth_FU_AprovedStatus with Chk_Rank
    [Template]    TC_SC_E2E_IPAuth_FU_AprovedStatus_Chk_Rank_02
    [Tags]    SC_E2E_IPAuth_02
    ${TC_SC_E2E_IPAuth_02}

SC E2E Communication Record
    [Template]    TC_SC_E2E_Communication_Record_03
    [Tags]    TC_SC_E2E_Comm_3
    ${TC_SC_E2E_Comm}

SC E2E Observation Rule
    [Template]    TC SC E2E Observation Rule 04
    [Tags]    TC_SC_E2E_IPAuth_ObsRule_04
    ${TC_SC_E2E_IPAuth_ObsRule_04}

SC E2E Temp Member
    [Template]    TC_SC_E2E_Temp_Member_05
    [Tags]    TC_SC_E2E_Temp_Member_05
#    ${TC_TempMember_Auth}
    ${TC_O5_SC_EndToEnd}

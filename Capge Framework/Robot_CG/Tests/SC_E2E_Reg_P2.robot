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
## pabot --processes 2 --outputdir Results -i SC_E2E_IPAuth_01 tests/SC_E2E_Regession_TC.robot


*** Test Cases ***


SC E2E IPAuth_FU_AprovedStatus with Chk_Rank
    [Template]    TC_SC_E2E_IPAuth_FU_AprovedStatus_Chk_Rank_02
    [Tags]    SC_E2E_IPAuth_02
    ${TC_SC_E2E_IPAuth_02}
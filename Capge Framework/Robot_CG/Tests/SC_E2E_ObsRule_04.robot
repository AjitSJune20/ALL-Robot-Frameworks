*** Settings ***
Documentation  This script is used for SC E2E MCD_Regression

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/SC_E2E_Regession.robot


#Prerequisite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# pabot --processes 3 --outputdir Results tests/SC_E2E*.robot
## pabot --processes 2 --outputdir Results -i SC_E2E_IPAuth_01 tests/SC_E2E_Regession_TC.robot


*** Test Cases ***

SC E2E Observation Rule
    [Template]    TC SC E2E Observation Rule 04
    [Tags]    TC_SC_E2E_IPAuth_ObsRule_04
    ${TC_SC_E2E_IPAuth_ObsRule_04}
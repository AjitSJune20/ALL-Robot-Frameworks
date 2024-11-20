*** Settings ***
Documentation  Creating Auth in Avality
Library  OperatingSystem

Resource  ../Resources/Definitions/AvalityDef.robot
Resource  ../Resources/Definitions/Common.robot
Resource  ../Data/TestData.robot


# Prerequsite
Suite Setup   Lunch Avality
#Suite Teardown    End Web Test


##robot -d results -i TC_SC_E2E_BHOP_6 tests/CreateAuthinAvality.robot





*** Test Cases ***
Creating BHIP Auth in Avality
    [Tags]    BHIPAuthInAvality
    Create BHIP Auth in Avality    ${TC_AvailityAuth}

SC E2E BHOP Auth In Availity
    [Template]    TC_SC_E2E_Create BHOP Auth In Availity
    [Tags]    TC_SC_E2E_BHOP_6
#    ${TC_BHOPAvailityAuth}
    ${TC_BHOPAvailityAuth2}





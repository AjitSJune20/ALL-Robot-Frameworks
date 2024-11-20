*** Settings ***
Documentation    Generic test cases for Autharization, manage queue and Role Emulator scenerios
Library    OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/Generic_Def.robot


# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# robot -d results -i TC11 tests/Generic_TC.robot
# robot -d results -i TC12 tests/Generic_TC.robot
# robot -d results -i TC13 tests/Generic_TC.robot

*** Test Cases ***
TC11_Exploratory testing_Verify that the authorization functionality is working as expected_[Ownership, Edit, History & Filter]
    [Template]    TC11_Exploratory in Auth testing Ownership, Edit, History & Filter
    [Tags]    TC11
    ${TC11_Genetic}

#TC11_Exploratory testing_Verify that the authorization functionality is working as expected_[Ownership, Edit, History & Filter]
#    TC11_Exploratory in Auth testing Ownership, Edit, History & Filter    ${TC11_Genetic}
#    [Tags]    TC11

TC12_Verify Owner and Co-Owner details & verify Referral records under MW-Referrals_[Manage Queue verify referral records]
    [Template]    TC12_Verify Owner,Co-Owner details AND Manage Queue verify referral records
    [Tags]    TC12
    ${TC12_Genetic}

TC13_Exploratory Testing Role Emulator End to End Scenario_[Reset functionality]
    [Template]    TC13_Exploratory Testing Role Emulator End to End Scenario
    [Tags]    TC13
    ${TC13_Genetic}

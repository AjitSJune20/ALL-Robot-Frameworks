*** Settings ***
Documentation    This script is used to validate FL Exploratory Scenerios
Library    OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/ServiceCart_Def.robot

# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# robot -d results -i TC01 tests/ServiceCart.robot




*** Test Cases ***

TC01_Scenario (Final Approval)
    [Tags]   TC01
    TC01_Scenario Final Approval    ${ServiceCart_TC01}




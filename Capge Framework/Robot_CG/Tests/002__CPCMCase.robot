*** Settings ***
Documentation  This script is used to create the CP CM Case
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Data/TestData.robot

# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test



*** Test Cases ***
Cp Cm Case Creation
    [Tags]    CorePPV
    User Create Cases    ${TC_CorePPV01}


CpCmCase Edit Case
    [Tags]     CorePPV    CaseEdit
    User Edit CPCM Case     ${TC_CorePPV01}





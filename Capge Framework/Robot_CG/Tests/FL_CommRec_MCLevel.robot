*** Settings ***
Documentation    This script is used to validate FL Exploratory Scenerios
Library    OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/FL_Exploratory.robot

# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

#pabot --processes 3 --outputdir Results tests/FL_CommRec*.robot

*** Test Cases ***
TC05_FL_Create comm rec at Member Central Level
    [Tags]    Comm_Rec_MemberCentralLevel
    [Template]    TC05_FL_Create comm rec at Member Central Level
    ${TC02_Comm_Rec_MCLevel}

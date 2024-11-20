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
#TC07_FL_Create comm rec at Autharization Level
#    [Tags]    Comm_Rec_AuthLevel
#    [Template]    TC07_FL_Create comm rec at Auth Level
#    ${TC07_Comm_Rec_AuthLevel}
TC02_FL_Create comm rec at various level LTSS Case Level
    [Tags]    Comm_Rec_LtssCaseLevel
    [Template]    TC02_FL_Create comm rec at various level
    ${TC02_Comm_Rec_LtssCaseLevel}

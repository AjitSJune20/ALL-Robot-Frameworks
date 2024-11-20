*** Settings ***
Documentation  This script is used to Create FL PR Assessment
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/NFAssessmentCreation.robot
Resource  ../Resources/Definitions/ALFAssessmentCreation.robot
Resource  ../Data/TestData.robot

# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# Command to run all the test under tests/001_humanascript.robot
## robot -d results tests/003__FL_Assessment.robot
## robot -d results -i FLALF tests/003__FL_Assessment.robot

*** Test Cases ***
LTSS Assessment PR
    [Tags]    FLPR
    [Template]    User Take LTSS Assessment
    ${TC_LTSSPR}


*** Test Cases ***
LTSS Assessment ALF
    [Tags]    FLALF
    [Template]    User Take LTSS ALF Assessment
    ${TC_LTSSALF}



*** Test Cases ***
LTSS Assessment NF
    [Tags]    FLNF
    [Template]    User Take LTSS NF Assessment
    ${TC_LTSSNF}


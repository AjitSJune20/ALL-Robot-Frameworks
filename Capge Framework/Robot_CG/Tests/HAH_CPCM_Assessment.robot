*** Settings ***
Documentation  This script is used to Create Authorization
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/Assessment_Operations.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown    End Web Test

# Command to run all the test under tests/HAHCPCM Assessment_Operations.robot
# robot -d results tests/HAH_CPCM_Assessment.robot
# robot -d results -i CoreUAT tests/HAH_CPCM_Assessment.robot
# robot -d results -i Sanity tests/HAH_CPCM_Assessment.robot

*** Test Cases ***
User Create HAH CPCM Assessment
    [Tags]    CoreUAT
    Create_HAH_CPCM_Assessment    ${TC_ASS01}


User Create FL LTSS Disaster Preparedness Assessment
    [Tags]    Sanity
    Create FL LTSS Disaster Preparedness Assessment    ${TC_ASS02}




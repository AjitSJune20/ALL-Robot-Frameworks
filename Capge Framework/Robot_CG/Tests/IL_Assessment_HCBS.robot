*** Settings ***
Documentation  This script is used to Submit IL Assessment
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/IL_Assessment_Def.robot
Resource  ../Resources/PageObjects/IL_Assessment.robot
Resource  ../Resources/PageObjects/IL_Assessment_HCBS.robot
Resource  ../Resources/PageObjects/IL_Assessment_LTC.robot
#Resource  ../Data/TestData.robot


# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# Command to run all the test under tests/001_humanascript.robot
## Pabot --processes 2 --outputdir Results tests/IL_Ass*.robot
## robot -d results -i HCBS tests/IL_Assessment.robot


*** Test Cases ***
#
IL Assessment HCBS
      [Template]    User Take IL Assessment HCBS
      [Tags]    HCBS
      ${TC_IL_HCBS}

#TC09_IL_Exploratory Testing_Critical Services_Backup provider fields_Mandatory
#    [Template]    Critical Services_Backup provider fields_Mandatory
#    [Tags]    IL_Exploratory_02
#    ${Backup_provider_fields_Mandatory}




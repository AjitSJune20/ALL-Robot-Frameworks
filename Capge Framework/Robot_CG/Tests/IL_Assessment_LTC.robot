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

## robot -d results -i LTC tests/IL_Assessment.robot

*** Test Cases ***

IL Assessment LTC
      [Template]    User Take IL Assessment LTC
      [Tags]    LTC
      ${TC_IL_LTC}

#TC10_Exploratory Testng_Attachments not generated for pended ltss auths
#    [Template]    Attachments Not Generated For Pended LTSS Auths
#    [Tags]    IL_Exploratory_03
#    ${MC_Auth_Attachments}

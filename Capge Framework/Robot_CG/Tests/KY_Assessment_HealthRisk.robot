*** Settings ***
Documentation  This script is used to Submit KY Health Risk Assessment
Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/PageObjects/KY_Assessment_HealthRisk.robot

#Prerequisite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# Command to run all the test under tests/001_humanascript.robot
## robot -d results tests/KY_Assessment_HealthRisk.robot

*** Test Cases ***


IL Assessment PR
      [Template]    KY HealthRisk Assessment
      ${TC_KY_Health}

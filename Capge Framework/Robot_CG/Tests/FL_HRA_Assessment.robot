*** Settings ***
Documentation  This script is used to Submit FL Health Risk Assessment 3.0
Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/PageObjects/FL_HRA_Assessment.robot

#Prerequisite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# Command to run all the test under tests/001_humanascript.robot
## robot -d results tests/FL_HRA_Assessment.robot

*** Test Cases ***


1864528 FL HealthRisk Assessment
      [Template]    FL HealthRisk Assessment
      ${TC_FL_HRA}
*** Settings ***
Documentation  This script is used to validate member details
Library  OperatingSystem
## robot -d results Tests/ProtegrityValidation.robot
Resource  ../Resources/Definitions/Common.robot
Resource  ../Data/TestData.robot
Resource  ../Resources/Definitions/BehavioralTemplate.robot

# Prerequsite
Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
Behavioral Template
    [Template]    Behavioral Template
    ${TC_BehavioralTemplate}

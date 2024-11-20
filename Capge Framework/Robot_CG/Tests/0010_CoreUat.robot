*** Settings ***
Documentation  This script is used to validate member details
Library  OperatingSystem
Library    SeleniumLibrary
Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/MemberCentral.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/CoreRegression.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown   End Web Test


## Notes:
# Command to run test based on Tags
##  robot -d results -i CoreUAT tests/0010_CoreUat.robot


*** Test Cases ***
Member Central - Member Attachement
    [Tags]    CoreUAT1
    MC - User Create Member Attachment    ${TC_CorePPV01}


Member Central - Provider Search
    [Tags]    CoreUAT
    Member Central Provider Search     ${TC_CoreUAT01}

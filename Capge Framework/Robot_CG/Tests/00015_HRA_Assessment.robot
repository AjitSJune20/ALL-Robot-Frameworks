*** Settings ***
Documentation  This script is used to create the SNP/CPSNP HRA Assessments
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/HRADefinition.robot
Resource  ../Data/TestData.robot

# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# Note:
# Command to run all the test under tests
##  robot -d results tests
# Command to run all the test under tests/00015_HRA_Assessment.robot
## robot -d results -i LateEntry tests/00015_HRA_Assessment.robot

*** Test Cases ***
User Creates the SNP HRA Assessments
    [Tags]    SNP
    User Create SNP HRA Assessments     ${TC_SNPHRA01}
    User Void The Assessment    ${TC_SNPHRA01}

User Creates the CPSNP HRA Assessments
    [Tags]    CPSNP
    User Create CPSNP HRA Assessments     ${TC_CPSNPHRA01}
    User Void The Assessment    ${TC_CPSNPHRA01}

User Creates the CPSNP HRA Assessments for Late Entry
    [Tags]    LateEntry
     User Create CPSNP HRA with Late Entry Assessments    ${TC_CPSNPHRA01}


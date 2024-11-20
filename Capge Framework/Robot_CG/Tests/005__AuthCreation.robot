*** Settings ***
Documentation  This script is used to Create Authorization
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/CoreRegression.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup  Begin Web Test
#Test Teardown  End Web Test


#Notes....
# Command to run all the test under tests/001_humanascript.robot
## robot -d results tests/005__AuthCreation.robot
# Command to run all the test under tests/006__ManageQueues.robot
## robot -d results tests/005__AuthCreation.robot
# Command to run test based on Tags
##  robot -d results -i IPAuth1 tests/005__AuthCreation.robot


*** Test Cases ***
#Change role
#    [Tags]    IPAuth1
#    Navigate To Role
#    Applying the Role New   Senior Products Clinician

User Create IP Authorization
    [Tags]    IPAuth1
    [Template]    Create Authorization
    ${TC_SmokeIP}


#    ${TC_UM_01}
    #${TC_UM_02}
    #${TC_UM_03}
    #${TC_UM_04}
    #${TC_UM_05}
    #${TC_UM_06}
    #${TC_UM_07}
    #${TC_UM_08}
    #${TC_UM_09}
    #${TC_UM_10}
#    ${TC_UM_11}
    #${TC_UM_12}
    #${TC_UM_13}
    #${TC_UM_14}
#    ${TC_UM_15}
    #${TC_UM_16}
    #${TC_UM_17}
    #${TC_UM_18}
    #${TC_UM_19}


User Create OP Authorization
    [Tags]    IPAuth
    [Template]    Create Authorization
      ${TC_IP050}






User Void the Authorization
    [Tags]    Void
    [Template]    Void Authorization

Add Procedure
    [Tags]    TEST
    [Template]    Procedure code check
    ${TC_OP001}

Validate Regression
    [Tags]    Regression
    [Template]    Core Regression IP Auth Validation
    ${TC_IP011}

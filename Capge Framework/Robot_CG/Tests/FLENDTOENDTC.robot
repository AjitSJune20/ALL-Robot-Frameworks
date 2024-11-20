*** Settings ***
Documentation  This script is used to validate FL END to END Tcs
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/FLENDtoENDDefinition.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup  Begin Web Test
#Test Teardown  End Web Test

# Command to run all the test under tests/001_humanascript.robot
## robot -d results -i TC_01 tests/FLENDTOENDTC.robot
## robot -d results -i TC_01_Part tests/FLENDTOENDTC.robot
# robot -d results -i TC_02 tests/FLENDTOENDTC.robot
# robot -d results -i TC_02_Part tests/FLENDTOENDTC.robot


*** Test Cases ***
TC01_FL_End to End Regression_ [Comp Assessment 2.0 and Service Cart]
    [Tags]    TC_01
    [Template]    TC01 FL End to End Regression
    ${TC_01_FL_EndTOEnd}

TC01_FL_End to End Regression_Part_2
    [Tags]    TC_01_Part
    [Template]    TC01 FL End to End Regression Part_2
    ${TC_LTSSNF}


TC02_FL_regression_end to end _[Verify all the fields in PLOC in View, Print and History screen]
    [Tags]    TC_02
    [Template]    TC02 FL End to End Regression
    ${TC_02_FL_EndTOEnd}

TC02_FL_regression_end to end _[Verify all the fields in PLOC in View, Print and History screen]
    [Tags]    TC_02_Part
    [Template]    TC02 FL End to End Regression Part_2
    ${TC_02_FL_EndTOEndPart_2}

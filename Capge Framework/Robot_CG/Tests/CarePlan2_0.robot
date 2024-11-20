*** Settings ***
Documentation  Care Plan 2.0 Screen Validations
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/CarePlan2_0Definition.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown    End Web Test




##robot -d results -i 2210328 tests/CarePlan2_0.robot





*** Test Cases ***
4495688 CGX - MC - CarePlans - Create - Problems - Invalid
    [Tags]    InValid
    [Template]    CGX MC CarePlans Create Problems Invalid
    ${TC_4495688_Problem_InValid}



4495695_CGX - MC - CarePlans - Create - Problems - Valid
    [Tags]    Valid
    [Template]    CGX MC CarePlans Create Problems Valid
    ${TC_4495695_Problem_Valid}

4495696_CGX - MC - CarePlans - Create - Notes
    [Tags]    Notes
    [Template]   CGX MC CarePlans Create Notes
    ${TC_4495696_Notes}

4495705_CGX - MC - CarePlans - Create - Tasks
    [Tags]    Tasks
    [Template]   CGX MC CAREPLANS CREATE TASKS
    ${TC_4495705_Tasks}

4495900_CGX - MC - CarePlans -Goals - Valid
    [Tags]    Goals
    [Template]    CGX MC CarePlans Create Goals
    ${TC_4495900_Goals}
4495919_CGX - MC - CarePlans -Edut - Problems
    [Tags]    EditProblems
    [Template]    CGX MC CarePlans Edit Problems
    ${TC_4495919_EditProblem}

4495920_CGX - MC - CarePlans -Edit - Goals
    [Tags]    EditGoals
    [Template]    CGX MC CarePlans Edit Goals
    ${TC_4495920_EditGoals}

2210328_CGX 2.0 Regression - Member Central_View Care Plans
    [Tags]    2210328
    [Template]    CGX MC View CarePlan
    ${TC_2210328_ViewCarePlan}








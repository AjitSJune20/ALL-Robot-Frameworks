*** Settings ***
Documentation  This script is used to Create Update and Inativate Medical List operations.
Library  OperatingSystem
Library    SeleniumLibrary
Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/TaskDefinition.robot
#Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown    End Web Test


## robot -d results tests/TS_Tasks.robot


*** Test Cases ***

1754924_CGX 2.0 Regression - Member Central_Tasks
    [Tags]    CoreUAT
    CGX 2.0 Regression - Member Central_Tasks    ${TC_TASK_01}

4476136_CGX -MC- CPCM – Tasks – Valid - Tasks_Add_Save_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${TC_TASK_02}

4476142_CGX -MC- CPCM – Tasks – Valid - Tasks_Add_Save-Add_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Tasks_Add_Save-Add_Validation    ${TC_TASK_03}

4476145_CGX -MC- CPCM – Tasks – Valid - Cancel_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Cancel_Validation    ${TC_TASK_04}

4476147_CGX -MC- CPCM – Tasks – Valid - Edit_Save_Existing_Record_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Edit_Save_Existing_Record_Validation    ${TC_TASK_05}

4476149_CGX -MC- CPCM – Tasks – Valid - Edit_Cancel_Existing_Record_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Edit_Cancel_Existing_Record_Validation    ${TC_TASK_06}

4476150_CGX -MC- CPCM – Tasks – Valid - ChangeOwnerShip_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - ChangeOwnerShip_Validation    ${TC_TASK_07}
#************************************************************************************************
4476151_CGX -MC- CPCM – Tasks – Valid - TakeOwnerShip_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - TakeOwnerShip_Validation    ${TC_TASK_08}

4476152_CGX -MC- CPCM – Tasks – Valid - Change OwnerShip_Save_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Change OwnerShip_Save_Validation    ${TC_TASK_09}

4476163_CGX -MC- CPCM – Tasks – Valid - Change OwnerShip_Cancel_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Change OwnerShip_Cancel_Validation    ${TC_TASK_10}

4476169_CGX -MC- CPCM – Tasks – Valid - View-Take OwnerShip_Save_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - View-Take OwnerShip_Save_Validation    ${TC_TASK_11}

4476170_CGX -MC- CPCM – Tasks – Valid - View-CompleteTask_Cancel_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - View-CompleteTask_Cancel_Validation    ${TC_TASK_12}
#****************************************************************************************************
4476172_CGX -MC- CPCM – Tasks – Valid - View-VoidTask_Cancel_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - View-VoidTask_Cancel_Validation    ${TC_TASK_13}

4476173_CGX -MC- CPCM – Tasks – Valid - View- View-VoidTask_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - View- View-VoidTask_Validation    ${TC_TASK_14}

4476176_CGX -MC- CPCM – Tasks – Valid - History_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - History_Validation    ${TC_TASK_15}

4476177_CGX -MC- CPCM – Tasks – Valid - Show/Hide_Audit_Trial_validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Show/Hide_Audit_Trial_validation    ${TC_TASK_16}

4476178_CGX -MC- CPCM – Tasks – Valid - QuickComplete_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - QuickComplete_Validation    ${TC_TASK_17}

4476179_CGX -MC- CPCM – Tasks – Valid - View-CompleteTask_Save_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - View-CompleteTask_Save_Validation    ${TC_TASK_18}

4476180_CGX -MC- CPCM – Tasks – Valid - Set FollowUP_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Valid - Set FollowUP_Validation    ${TC_TASK_19}

4476183_CGX -MC- CPCM – Tasks – MaxLength_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – MaxLength_Validation    ${TC_TASK_20}

4476199_CGX -MC- CPCM – Tasks – Required Fields_ErrorMessage_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Required Fields_ErrorMessage_Validation    ${TC_TASK_21}

4476200_CGX -MC- CPCM – Tasks – Set FollowUP_Invalid_Time_Validation
    [Tags]    CoreUAT
    CGX -MC- CPCM – Tasks – Set FollowUP_Invalid_Time_Validation    ${TC_TASK_22}

1574428_CGX 2.0 Regression - CP CM Case_Tasks
    [Tags]    CoreUAT
    CGX 2.0 Regression - CP CM Case_Tasks    ${TC_TASK_23}
*** Settings ***
Resource  ../PageObjects/Task.robot
Resource  ../Definitions/Navigation.robot
Resource  ../Definitions/HumanaGui.robot
Resource  ../../Data/TestData.robot

*** Variables ***



*** Keywords ***

CGX 2.0 Regression - Member Central_Tasks
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    sleep    20s
    Navigate to Tasks
    Regression - Member Central_Tasks    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Tasks_Add_Save_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Tasks_Add_Save-Add_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Tasks_Add_Save-Add_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Cancel_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Cancel_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Edit_Save_Existing_Record_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Edit_Save_Existing_Record_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Edit_Cancel_Existing_Record_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Edit_Cancel_Existing_Record_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - ChangeOwnerShip_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - ChangeOwnerShip_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - TakeOwnerShip_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - TakeOwnerShip_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Change OwnerShip_Save_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Change OwnerShip_Save_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Change OwnerShip_Cancel_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Change OwnerShip_Cancel_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - View-Take OwnerShip_Save_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - View-Take OwnerShip_Save_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - View-CompleteTask_Cancel_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - View-CompleteTask_Cancel_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - View-VoidTask_Cancel_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - View-VoidTask_Cancel_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - View- View-VoidTask_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - View- View-VoidTask_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - History_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - History_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Show/Hide_Audit_Trial_validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Show/Hide_Audit_Trial_validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - QuickComplete_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - QuickComplete_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - View-CompleteTask_Save_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - View-CompleteTask_Save_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Valid - Set FollowUP_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Valid - Set FollowUP_Validation    ${UserData}

CGX -MC- CPCM – Tasks – MaxLength_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – MaxLength_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Required Fields_ErrorMessage_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Required Fields_ErrorMessage_Validation    ${UserData}

CGX -MC- CPCM – Tasks – Set FollowUP_Invalid_Time_Validation
    [Arguments]  ${UserData}
    CPCM – Tasks – Set FollowUP_Invalid_Time_Validation    ${UserData}

CGX 2.0 Regression - CP CM Case_Tasks
    [Arguments]  ${UserData}
    Regression - CP CM Case_Tasks    ${UserData}
*** Settings ***
Library  SeleniumLibrary
Resource    ../PageObjects/CPCMCases.robot

*** Variables ***


*** Keywords ***
TC_CPCM_Invalid_InvalidaData_Validation
    [Arguments]    ${UserData}
    CPCM_Invalid_InvalidaData_Validation    ${UserData}

TC_CPCM_Invalid_RequiredField_Error
    CPCM_Invalid_RequiredField_Error

TC_CPCM_Valid_Cancel
    [Arguments]   ${UserData}
    CPCM_Valid_Cancel    ${UserData}

TC_CPCM_Valid_Maxlength
    CPCM_Valid_Maxlength

TC_CPCM_Valid_Create_CPCM_Record
    [Arguments]    ${UserData}
    CPCM_Valid_Create_CPCM_Record    ${UserData}

TC_CPCM_Valid_Edit_Record
    [Arguments]    ${UserData}
    CPCM_Valid_Edit_Record    ${UserData}

TC_CPCM_Valid_Edit_Cancel_CPCM_Record
    [Arguments]    ${UserData}
    CPCM_Valid_Edit_Cancel_CPCM_Record    ${UserData}

TC_CPCM_CaseHistory
    [Arguments]    ${UserData}
    CPCM_CaseHistory    ${UserData}

TC_CPCM_Ownership_History_Count
    [Arguments]    ${UserData}
    CPCM_Ownership_History_Count    ${UserData}

TC_CPCM_Invalid_SearchDiag_InvalidaDataValdiation
    [Arguments]    ${UserData}
    CPCM_Invalid_SearchDiag_InvalidaDataValdiation    ${UserData}

TC_CPCM_Invalid_SearchDiag_RequiredFields
    [Arguments]    ${UserData}
    CPCM_Invalid_SearchDiag_RequiredFields    ${UserData}

TC_CPCM_Valid_SearchDiag_Cancel
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_Cancel    ${UserData}

TC_CPCM_Valid_SearchDiag_Add
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_Add    ${UserData}

TC_CPCM_Valid_SearchDiag_MaxLen
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_MaxLen    ${UserData}

TC_CPCM_Valid_SearchDiag_AddAsPrimary
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_AddAsPrimary    ${UserData}

TC_CPCM_Valid_SearchDiag_AddAsSecondary
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_AddAsSecondary   ${UserData}

TC_CPCM_Valid_SearchDiag_MakeAsPrimary
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_MakeAsPrimary    ${UserData}

TC_CPCM_Valid_SearchDiag_RemoveSecondary
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_RemoveSecondary    ${UserData}

TC_CPCM_Valid_SearchDiag_RemovePrimary
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_RemovePrimary    ${UserData}

TC_CPCM_Valid_Search_ProcCode_Cancel
    [Arguments]    ${UserData}
    CPCM_Valid_Search_ProcCode_Cancel    ${UserData}

TC_CPCM_Valid_Search_ProcCode_AddOnPopUp
    [Arguments]    ${UserData}
    CPCM_Valid_Search_ProcCode_AddOnPopUp    ${UserData}

TC_CPCM_Valid_Search_ProcCode_AddOnCreateCase
    [Arguments]    ${UserData}
    CPCM_Valid_Search_ProcCode_AddOnCreateCase    ${UserData}

TC_CPCM_Valid_Ownership_Cancel
    [Arguments]    ${UserData}
    CPCM_Valid_Ownership_Cancel    ${UserData}

TC_CPCM_Valid_Ownership_MaxLength
    [Arguments]    ${UserData}
    CPCM_Valid_Ownership_MaxLength    ${UserData}

TC_CPCM_Valid_Ownership_PrimQue_Change
    [Arguments]    ${UserData}
    CPCM_Valid_Ownership_PrimQue_Change    ${UserData}

TC_CPCM_Valid_Ownership_Take_Prim_Ownership
    CPCM_Valid_Ownership_Take_Prim_Ownership

TC_CPCM_Valid_Ownership_Take_Sec_Ownership
    CPCM_Valid_Ownership_Take_Sec_Ownership

TC_CPCM_Default_Case_Status
    [Arguments]    ${UserData}
    CPCM_Default_Case_Status    ${UserData}

TC_CPCM_Associated_Auth_Count
    CPCM_Associated_Auth_Count

TC_CPCM_Notes_Verify_Banner_Displays
    CPCM_Notes_Verify_Banner_Displays

TC_CPCM_Verfiy_Case_Notes
    [Arguments]    ${UserData}
    CPCM_Verfiy_Add_Save_Record_Confirmation_Message    ${UserData}
    CPCM_Very_Edit_Save_Confirmation_Message    ${UserData}
    CPCM_Verify_user_is_taken_to_Note_History_page

TC_CPCM_Verify_Case_Tasks
    [Arguments]    ${UserData}
    CPCM_Tasks_Valid_Tasks_Add_Save_Validation   ${UserData}
    CPCM_Tasks_Add_Save-Add_Validation    ${UserData}
    CPCM_Valid_Edit_Save_Existing_Record_Validation   ${UserData}
    CPCM_ChangeOwnerShip_Validation    ${UserData}
    CPCM_TakeOwnerShip_Validation    ${UserData}
    CPCM_Set FollowUP_Validation    ${UserData}
    CPCM_History_Validation    ${UserData}
    CPCM_QuickComplete_Validation    ${UserData}

TC_CPCM_Verify_CommRecord
    [Arguments]    ${UserData}
    CPCM_Verify_Items_are_Pre_Populated    ${UserData}
    CPCM_Verify_Type_Ahead_for_Inbound    ${UserData}
    CPCM_Verify_Type_Ahead_for_Outbound    ${UserData}
    CPCM_Verify_Type_Ahead_for_Search
    CPCM_Verify_Type_Ahead_for_Outbound_CommRecord
    CPCM_Create_Comm_Record    ${UserData}
    CPCM_Edit_Comm_Record    ${UserData}
    CPCM_Comm_Record_History    ${UserData}
    CPCM_Comm_Record_View_Call_OutComes
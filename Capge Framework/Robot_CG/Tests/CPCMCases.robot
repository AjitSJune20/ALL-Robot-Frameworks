*** Settings ***
Documentation  This script is used to create the CP CM Case
Library  OperatingSystem
Library  AngularJSLibrary
Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/CPCMCases.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup   Begin Web Test
#Test Teardown  End Web Test

*** Test Cases ***
TC_01_Invalid_InvalidData
    [Tags]    CreateCaseUI
    TC_CPCM_Invalid_InvalidaData_Validation    ${TC_4475456}

TC_02_Invalid_RequiredField_Error
    [Tags]    CreateCaseUI
    TC_CPCM_Invalid_RequiredField_Error

TC_03_valid_CPCM_Cancel
    [Tags]    CreateCaseUI
    TC_CPCM_Valid_Cancel    ${TC_4475456}

TC_04_CPCM_Valid_Maxlength
    [Tags]    CreateCaseUI
    TC_CPCM_Valid_Maxlength

TC_05_CPCM_Valid_Create
    [Tags]    CreateCaseUI
    TC_CPCM_Valid_Create_CPCM_Record   ${TC_4475456}

TC_06_CPCM_Edit_Edit_Case
    [Tags]    CreateCaseUI
    TC_CPCM_Valid_Edit_Record    ${TC_4475456}

TC_07_CPCM_Edit_Cancel_Case
    [Tags]    CreateCaseUI
    TC_CPCM_Valid_Edit_Cancel_CPCM_Record    ${TC_4475456}

TC_08_CPCM_CaseHistory
    [Tags]    CreateCaseUI
    TC_CPCM_CaseHistory    ${TC_4475456}

TC_09_CPCM_Ownership_History
    [Tags]    CreateCaseUI
    TC_CPCM_Ownership_History_Count    ${TC_4475456}

TC_10_CPCM_Invalid_SearchDiag_InvalidaDataValdiation
    [Tags]    MedicalCode
    TC_CPCM_Invalid_SearchDiag_InvalidaDataValdiation    ${TC_4475456}

TC_11_CPCM_Invalid_SearchDiag_RequiredFields
    [Tags]    MedicalCode
    TC_CPCM_Invalid_SearchDiag_RequiredFields    ${TC_4475456}

TC_12_CPCM_Valid_SearchDiag_Cancel
    [Tags]    MedicalCode
    TC_CPCM_Valid_SearchDiag_Cancel    ${TC_4475456}

TC_13_CPCM_Valid_SearchDiag_Add
    [Tags]    MedicalCode
    TC_CPCM_Valid_SearchDiag_Add    ${TC_4475456}

TC_14_CPCM_Valid_SearchDiag_MaxLen
    [Tags]    MedicalCode
    TC_CPCM_Valid_SearchDiag_MaxLen    ${TC_4475456}

TC_15_CPCM_Valid_SearchDiag_AddAsPrimary
    [Tags]    MedicalCode
    TC_CPCM_Valid_SearchDiag_AddAsPrimary    ${TC_4475456}

TC_16_CPCM_Valid_SearchDiag_AddAsSecondary
    [Tags]    MedicalCode
    TC_CPCM_Valid_SearchDiag_AddAsSecondary    ${TC_4475456}

TC_17_CPCM_Valid_SearchDiag_MakeAsPrimary
    [Tags]    MedicalCode
    TC_CPCM_Valid_SearchDiag_MakeAsPrimary    ${TC_4475456}

TC_18_CPCM_Valid_SearchDiag_RemoveSecondary
    [Tags]    MedicalCode
    TC_CPCM_Valid_SearchDiag_RemoveSecondary    ${TC_4475456}

TC_19_CPCM_Valid_SearchDiag_RemovePrimary
    [Tags]    MedicalCode
    TC_CPCM_Valid_SearchDiag_RemovePrimary    ${TC_4475456}

TC_20_CPCM_Valid_Search_ProcCode_Cancel
    [Tags]    MedicalCode
    TC_CPCM_Valid_Search_ProcCode_Cancel    ${TC_4475456}

TC_21_CPCM_Valid_Search_ProcCode_AddOnPopUp
    [Tags]    MedicalCode
    TC_CPCM_Valid_Search_ProcCode_AddOnPopUp    ${TC_4475456}

TC_22_CPCM_Valid_Search_ProcCode_AddOnCreateCase
    [Tags]    MedicalCode
    TC_CPCM_Valid_Search_ProcCode_AddOnCreateCase    ${TC_4475456}

TC_23_CPCM_CPCM_Valid_Ownership_Cancel
    [Tags]    Ownership
    TC_CPCM_Valid_Ownership_Cancel    ${TC_4475772}

TC_24_CPCM_CPCM_Valid_Ownership_MaxLength
    [Tags]    Ownership
    TC_CPCM_Valid_Ownership_MaxLength    ${TC_4475772}

TC_25_CPCM_CPCM_Valid_Ownership_PrimQue_Change
    [Tags]    Ownership
    TC_CPCM_Valid_Ownership_PrimQue_Change    ${TC_4475788}

TC_26_CPCM_Valid_Ownership_Take_Prim_Ownership
    [Tags]    Ownership
    TC_CPCM_Valid_Ownership_Take_Prim_Ownership

TC_27_CPCM_Valid_Ownership_PrimQue_Change
    [Tags]    Ownership
    TC_CPCM_Valid_Ownership_PrimQue_Change    ${TC_4475791}
#
TC_28_CPCM_Valid_Ownership_Take_Sec_Ownership
    [Tags]    Ownership
    TC_CPCM_Valid_Ownership_Take_Sec_Ownership

TC_29_CPCM_Default_Case_Status
    [Tags]    CreateCaseUI
    TC_CPCM_Default_Case_Status    ${TC_4475791}

TC_30_CPCM_Associated_Auth_Count
    [Tags]    CreateCaseUI
    TC_CPCM_Associated_Auth_Count

TC_31_CPCM_Notes_Verify_Banner_Displays
    [Tags]    Notes
    TC_CPCM_Notes_Verify_Banner_Displays

TC_32_CPCM_Verfiy_Case_Notes
    [Tags]    Notes
    TC_CPCM_Verfiy_Case_Notes    ${TC_1574430}

TC_33_CPCM_Verify_Case_Tasks
    [Tags]    Tasks
    TC_CPCM_Verify_Case_Tasks    ${TC_1574428}

TC_34_CPCM_Verify_CommRecord
    [Tags]    CommRecord
    TC_CPCM_Verify_CommRecord   ${TC_1574421}
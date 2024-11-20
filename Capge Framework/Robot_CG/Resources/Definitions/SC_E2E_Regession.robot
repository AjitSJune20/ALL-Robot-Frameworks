*** Settings ***
Resource  ../PageObjects/SC_E2E_Regession_PO.robot

*** Keywords ***
TC_SC_E2E_IPAuth_FU_AprovedStatus_01
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
    Get Auth Value after Submission    ${UserData}
    Check If Auth Approved
    sleep    15m
    Navigate to CPCM Cases
    Task Level Validation after Submitting Auth    ${UserData}
    Validate TaskLevel Description for TC_SC_E2E_IPAuth_FU_AprovedStatus_01    ${UserData}

TC_SC_E2E_IPAuth_FU_AprovedStatus_Chk_Rank_02
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
    Get Auth Value after Submission    ${UserData}
    Check If Auth Approved
#    sleep    15m
#    Navigate to CPCM Cases
#    Task Level Validation after Submitting Auth    ${UserData}
#    Task Level Validate Priority based on Rank After Submiting Auth    ${UserData}
#    Validate Description for TC_SC_E2E_IPAuth_FU_AprovedStatus_Chk_Rank_02    ${UserData}

TC_SC_E2E_Communication_Record_03
    [Arguments]    ${UserData}
    navigate to role
    applying the role    ${UserData}
    Search For Member    ${UserData}
    Select The Member
    Navigate to CPCM Cases
    Selecting CPCM Case
    Navigate to Communication record under CPCM case
    Create Outbound Communication record under cpcm Case level    ${UserData}

TC SC E2E Observation Rule 04
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
    SC E2E Observation Rule 04
    Handle Popups after submiting Auth
    Validate Busines Rules for SC E2E Observation Rule 04

TC_SC_E2E_Temp_Member_05
     [Arguments]    ${UserData}
     Search For Member    ${UserData}
     Select The Member
     Create Temp Member    ${UserData}
     MyWorkPage.Click on the Member Central
     Navigate Authorization Page
     User Inputs for Authorization    ${UserData}
     Validate Banner Message and Assigned queue for Temp Member      ${UserData}




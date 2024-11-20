*** Settings ***
Resource  ../PageObjects/MCD_RegressionPO.robot

*** Keywords ***
TC_Fragile Pediatric RuleOpAuth
    [Arguments]    ${UserData}
    Fragile Pediatric RuleOpAuth    ${UserData}

TC_SCPH_Routing_BariatrcRule
    [Arguments]    ${UserData}
    SCPH_Routing_BariatrcRule    ${UserData}

TC_FU_IPAuth_TC01_TaskGenerate
    [Arguments]    ${UserData}
    FU_IPAuth_TC01_TaskGenerate    ${UserData}

TC_1571736_CLIN_MF32_BHIP_Auth
    [Arguments]    ${UserData}
    1571736_CLIN_MF32_BHIP_Auth    ${UserData}

TC_1843173_Inpatient_Psych_Referal
    [Arguments]    ${UserData}
    1843173_Inpatient_Psych_Referal    ${UserData}
*** Settings ***
Documentation  This script is used for CGX Regression

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/CoreRegression.robot


#Prerequisite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

## robot -d results -i TC_TempMember_Auth tests/CGX_Regresstion.robot
## robot -d results -i TC_DefaultProvID_Auth tests/CGX_Regresstion.robot
## robot -d results -i TC_BSM_value_inCreateMode tests/CGX_Regresstion.robot
## robot -d results -i TC_948090_Semi-Automate_Template tests/CGX_Regresstion.robot
## robot -d results -i TC_SemiAutomate_Template_UMMED54 tests/CGX_Regresstion.robot
## robot -d results -i EML_xMedicare_Pre_ClaimProviderDispute_Approval_E tests/CGX_Regresstion.robot


*** Test Cases ***
IPAuth with Temper Member
    [Template]    TC_IPAuth with Temper Member
    [Tags]    TC_TempMember_Auth
    ${TC_TempMember_Auth}

IPAuth with Default Provider
    [Template]    TC_IPAuth with Default Provider
    [Tags]    TC_DefaultProvID_Auth
    ${TC_DefaultProvID_Auth}

Verify BSM StaticField in Create Mode and BSM StaticField should not display without Member
    [Template]    TC_07_09 Verify BSM StaticField in Create Mode and withoutMember
    [Tags]    TC_BSM_value_inCreateMode
    ${TC_BSM_value_inCreateMode}

Semi-Automate Medicare Approval template UMMED85
    [Template]   TC Semi-Automate Medicare Approval template UMMED85
    [Tags]    TC_948090_Semi-Automate_Template
    ${TC_SemiAutomte_Template_948090}

Semi-Automate Medicare Approval template UMMED54
    [Template]   TC Semi-Automate Medicare_Approval_template_UMMED54
    [Tags]    TC_SemiAutomate_Template_UMMED54
    ${TC_SemiAutomte_Template_UMMED54}

Verify Dynamic fields for xMedicare-Pre-Claim Provider Dispute_Approval_E
    [Template]   TC Verify Dynamic fields for xMedicare-Pre-Claim Provider Dispute_Approval_E
    [Tags]    EML_xMedicare_Pre_ClaimProviderDispute_Approval_E
    ${EML_xMedicare_Pre_ClaimProviderDispute_Approval_E}

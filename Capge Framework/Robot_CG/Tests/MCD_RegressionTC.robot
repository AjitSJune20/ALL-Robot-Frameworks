*** Settings ***
Documentation  This script is used for MCD_Regression for Auths

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/MCD_Regression.robot
#Resource  ../Resources/PageObjects/Fragile_Pediatric_Rule_Task.robot
#Resource  ../Resources/PageObjects/SC_PH_Routing_BariatrcRule.robot
#Resource  ../Resources/PageObjects/TaskGenerate_on_FU_IPAuth_TC01.robot
#Resource  ../Resources/PageObjects/1571736_CLIN_MF32_BHIP_Auth.robot

#Prerequisite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# Command to run all the test under tests/001_humanascript.robot
## robot -d results -i TC_1843173_KYRefer tests/MCD_RegressionTC.robot

*** Test Cases ***
# validating Task
1917368 Fragile_Pediatric_Rule OpAuth Creation     #Passed
    [Template]    TC_Fragile Pediatric RuleOpAuth
    [Tags]    TC_Fragile
    ${TC_Fragile}

#Not in PPV 2106
1649038 TC_SCPH_Routing_BariatrcRule        #Passed    SC not in 2106 ppv
    [Template]    TC_SCPH_Routing_BariatrcRule
    [Tags]    TC_SCPH_TC16
    ${TC_SCPH_TC16}

#Not in PPV 2106
1562707 TC01 FU_IPAuth_TC01_TaskGenerate    #Passed #  Discharge Date: Current or Prior within 7 days [No Future Dates]
    [Template]    TC_FU_IPAuth_TC01_TaskGenerate
    [Tags]    TC_TC01_2104
    ${TC_TC01_2104}

#Validate Task !
1571736 CLIN MF32 BHIP Auth     # DF-5387
    [Template]    TC_1571736_CLIN_MF32_BHIP_Auth
    [Tags]    TC_CLIN_MF32
    ${TC_CLIN_MF32}
#
1843173 Inpatient Psych BHIP Referal      # passed
    [Template]    TC_1843173_Inpatient_Psych_Referal
    [Tags]    TC_1843173_KYRefer
    ${TC_1843173_KYRefer}

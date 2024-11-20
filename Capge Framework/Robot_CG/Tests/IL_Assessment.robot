*** Settings ***
Documentation  This script is used to Submit IL Assessment
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/IL_Assessment_Def.robot
Resource  ../Resources/PageObjects/IL_Assessment.robot
Resource  ../Resources/PageObjects/IL_Assessment_HCBS.robot
Resource  ../Resources/PageObjects/IL_Assessment_LTC.robot
#Resource  ../Data/TestData.robot

# Prerequsite
Test Setup  Begin Web Test
#Test Teardown  End Web Test
#Test Teardown   Delete Unnecessary Screenshots

# Command to run all the test under tests/001_humanascript.robot
## robot -d results -i BHPrimary tests/IL_Assessment.robot
## robot -d results -i HCBS tests/IL_Assessment.robot
## robot -d results -i LTC tests/IL_Assessment.robot
## robot -d results -i POA_PHI_info_mapped_in_MPLOC tests/IL_Assessment.robot
## robot -d results -i IL_Exploratory_02 tests/IL_Assessment.robot
## robot -d results -i IL_Exploratory_03 tests/IL_Assessment.robot

#Pabot --processes 3 --outputdir Results tests/IL_Assess*.robot

*** Test Cases ***
IL Assessment BH Primary
      [Template]    User Take IL Assessment
      [Tags]    BHPrimary
      ${TC_IL}

IL Assessment HCBS
      [Template]    User Take IL Assessment HCBS
      [Tags]    HCBS
      ${TC_IL_HCBS}

IL Assessment LTC
      [Template]    User Take IL Assessment LTC
      [Tags]    LTC
      ${TC_IL_LTC}

TC08_I21.09_IL_Exploratory Testing_[POA/PHI information should mapped in MPLOC]
      [Template]    Exploratory Testing POA_PHI info mapped in MPLOC
      [Tags]    POA_PHI_info_mapped_in_MPLOC
      ${POA_PHI_info_mapped_in_MPLOC}

TC09_IL_Exploratory Testing_Critical Services_Backup provider fields_Mandatory
    [Template]    Critical Services_Backup provider fields_Mandatory
    [Tags]    IL_Exploratory_02
    ${Backup_provider_fields_Mandatory}

TC10_Exploratory Testng_Attachments not generated for pended ltss auths
    [Template]    Attachments Not Generated For Pended LTSS Auths
    [Tags]    IL_Exploratory_03
    ${MC_Auth_Attachments}


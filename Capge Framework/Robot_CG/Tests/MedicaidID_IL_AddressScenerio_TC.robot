*** Settings ***
Documentation    The test case covers the scenerio for Medicaid and Address on Member Banner
Library    OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/MedicaidID_IL_AddressScenerio.robot

# Prerequsite
Test Setup    Begin Web Test
#Test Teardown    End Web Test

# robot -d results -i TC02 tests/MedicaidID_IL_AddressScenerio_TC.robot
# robot -d results -i TC03 tests/MedicaidID_IL_AddressScenerio_TC.robot
# robot -d results -i TC04 tests/MedicaidID_IL_AddressScenerio_TC.robot



*** Test Cases ***
TC02_FL_Exploratory Testing _Check / Expand Member Banner and verify "Medicaid ID" from Member Information is displayed_[Medicaid ID]
    [Template]    Expand Member Banner and verify Medicaid ID from Member Information
    [Tags]    TC02
    ${TC02_McdID}

# Delete existing PrintEntity.pdf from downloads then execute the TC
TC03_FL_Exploratory Testing_Add Medicaid ID to Auth Print_[Create LTSS auth_verify Medicaid ID on LTSS – Service authorization Print]
    [Template]    Create LTSS auth_verify Medicaid ID on LTSS Service authorization Print
    [Tags]    TC03
    ${TC03_McdID_On_LtssAuth}

TC05_Verify the member having Mailing Address, Residential and Address State of Issue from same state in the Member Banner
     [Template]    Verify the member having Mailing Address, Residential and Address State of Issue from same state in the Member Banner
     [Tags]    TC04
     ${TC_IL_Address}


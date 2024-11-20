*** Settings ***
Documentation  This script is used for Referal Requests
Resource  ../Resources/Definitions/Common.robot
Resource  ../PageObjects/ReferalRequests_PO.robot

#Prerequisite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

*** Keywords ***
TC_ReferalRequest_Valid_Cancel
    [Arguments]    ${UserData}
    ReferalRequest_Valid_Cancel    ${UserData}


TC_ReferalRequest_Invalid_RequiredFields
    [Arguments]    ${UserData}
    ReferalRequest_Invalid_RequiredFields    ${UserData}

TC_RR_MemberQuality_Invalid_RequiredFields
    [Arguments]    ${UserData}
    RR_MemberQuality_Invalid_RequiredFields    ${UserData}

TC_RR_MemberQuality_Valid_MaxLength
    [Arguments]    ${UserData}
    RR_MemberQuality_Valid_MaxLength    ${UserData}

TC_RR_MemberQuality_Valid_QueueChange
    [Arguments]    ${UserData}
    RR_MemberQuality_Valid_QueueChange    ${UserData}

TC_RR_MemberQuality_Valid_Create
    [Arguments]    ${UserData}
    RR_MemberQuality_Valid_Create    ${UserData}

TC_Transitions_Invalid_RequiredFields
    [Arguments]    ${UserData}
    Transitions_Invalid_RequiredFields    ${UserData}

TC_Transitions_Valid_MaxLength
    [Arguments]    ${UserData}
    Transitions_Valid_MaxLength    ${UserData}
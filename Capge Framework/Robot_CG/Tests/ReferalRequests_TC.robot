*** Settings ***
Documentation  This script is used for Referal Requests

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/ReferalRequests.robot

#Prerequisite
Suite Setup    Begin Web Test
#Test Teardown  End Web Test

# Command to run all the test under tests/001_humanascript.robot
## robot -d results tests/ReferalRequests_TC.robot
# robot -d results -i Transitions tests/ReferalRequests_TC.robot
# robot -d results -i HAH tests/ReferalRequests_TC.robot


*** Test Cases ***
Referal Request Valid Cancel
    [Tags]    HAH
    [Template]    TC_ReferalRequest_Valid_Cancel
    ${TC_Referal_001}

Referal Request Invalid Required Fields
    [Tags]    HAH
    [Template]    TC_ReferalRequest_Invalid_RequiredFields
    ${TC_Referal_001}

RR Member Quality Invalid Required Fields
    [Tags]    HAH
    [Template]    TC_RR_MemberQuality_Invalid_RequiredFields
    ${TC_Referal_001}

RR Member Quality Valid Max Length
    [Tags]    HAH
    [Template]    TC_RR_MemberQuality_Valid_MaxLength
    ${TC_Referal_001}

RR Member Quality Valid Queue Change
    [Tags]    HAH
    [Template]    TC_RR_MemberQuality_Valid_QueueChange
    ${TC_Referal_001}

RR Member Quality Valid Create
    [Tags]    HAH
    [Template]    TC_RR_MemberQuality_Valid_Create
    ${TC_Referal_001}

RR Transitions Invalid Required Fields
    [Tags]    Transitions
    [Template]    TC_Transitions_Invalid_RequiredFields
    ${TC_Referal_002}

RR Transitions Valid Max Length
    [Tags]    Transitions
    [Template]    TC_Transitions_Valid_MaxLength
    ${TC_Referal_002}

#RR_Grid_Functionality
#    [Arguments]    ${UserData}
#    ${Before}    get text    //th[@class='k-header']/a/div
#    drag and drop    //th[@class='k-header']/a/div[contains(text(),'Created Date')]    //th[@class='k-header']/a/div[contains(text(),'Program Type')]
#    Sleep   2s
#    ${After}    get text    //th[@class='k-header']/a/div
#    should be equal as strings  ${Before}  Created Date
#    should be equal as strings  ${After}  Updated Date
#
#    click element    //a[@id='btnReferralRequestGridResetSorting']
#
#    reload page
#    ${After}    get text    //th[@class='k-header']/a/div
#    should be equal as strings  ${After}  Created Date
#    click element    //a[@id='btnReferralRequestGridSaveSettings']

#RR_HAH_Regression_UAT_ONLY
#    [Arguments]    ${UserData}
#    Navigate To Role
#    Applying the Role    ${UserData}
#    Search For Member   ${UserData}
#    Select The Member
#    Navigate to Referral Request
#    click element    ${Create_RR}
#    @{ReferralList} =  string_convert   ${UserData.ReferralList}
#    ${count}    get element count    //div[@class='infoText membermovementMenu']//a
#    FOR    ${i}    IN RANGE    ${count}
#        ${a}    get text    //div[@class='infoText membermovementMenu']//a['${i+1}']
#        should be equal as strings    ${a}    ${ReferralList}[${i}]
#    END
#    Role ICS SuperUser   ${UserData}
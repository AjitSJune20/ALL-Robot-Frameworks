*** Settings ***
Resource    ../Definitions/HumanaGui.robot
Resource    ../PageObjects/MedicaidID_IL_AddressScenerio_PO.robot
Resource    ../PageObjects/FLENDToENDPOM.robot

*** Keywords ***
Expand Member Banner and verify Medicaid ID from Member Information
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Verification of MCD_ID from MemberInfo section

#Create LTSS auth_verify Medicaid ID on LTSS – Service authorization Print
Create LTSS auth_verify Medicaid ID on LTSS Service authorization Print
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.click on the Member Central
    Navigate Authorization Page
#    Create LTSS Auth for FL Members    ${UserData}
    click element    //*[contains(text(),'100203829')]          #qaAuth=100203829    offcycleAuth: 088327910
#    Validate Medicaid ID On LTSS Service Authorization Print    #${UserData}
    Navigate to Alternate Info
    Fill Contact Information under Alternet Info screen    ${UserData}

    Navigate to Member Info
    wait until element is visible    ${Contact_AltInfoTab}    60s
    click link    ${Contact_AltInfoTab}
    sleep    2s
    Open Alternet information screen
    Verify details filled in Alternet info screen    ${UserData}
    Verify the fields in Additional care Details and submit the details    ${UserData}


Verify the member having Mailing Address, Residential and Address State of Issue from same state in the Member Banner
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Checking State in Member Banner
#    Navigate to Medicaid Plan of Care
#    sleep    2s
#    ${EditStatus} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
#    run keyword if    ${EditStatus}    click element    //a[@id="edit-plan-of-care-button"]
#    Adding Services    ${UserData}

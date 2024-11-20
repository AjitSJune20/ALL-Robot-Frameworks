*** Settings ***
Resource    ../Definitions/HumanaGui.robot
Resource    ../PageObjects/FL_ExploratoryPO.robot
Resource    ../PageObjects/ServiceCart_PO.robot
Resource  ../PageObjects/SC_E2E_Regession_PO.robot

Library    AutoItLibrary
Library    SeleniumLibrary
Library    OperatingSystem


*** Keywords ***
TC01_Scenario Final Approval
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
#    MyWorkPage.Click on the Member Central
#    Create Three Auths for Final Approval Scenerio    ${UserData}
    Navigate to LTSS Cases
    select the case
##    wait until element is visible    //a[contains(text(),'Comprehensive Assessment 2.0')]    50s
##    click element    //a[contains(text(),'Comprehensive Assessment 2.0')]

#    Create FL Assessment_ProvateResidence    ${UserData}
#    Verify service Cart for Final Approval
    Change role to LTSS Pilot CC     ${UserData}
    Navigate to Service Cart in Focus
#    Manage service from service cart for_Final Approval    ${UserData}
    Validate Processed Services from Service Cart    ${UserData}



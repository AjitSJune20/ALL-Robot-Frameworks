*** Settings ***
Resource  ../PageObjects/HAH Assessment Page.robot
Resource  ../PageObjects/Navigation.robot
Resource  ../Definitions/HumanaGui.robot
Resource  ../../Data/TestData.robot


*** Keywords ***
Create_HAH_CPCM_Assessment
    [Arguments]  ${UserData}
    set selenium speed    1s
    Search For Member   ${UserData}
    Select The Member
    sleep    25s
    Navigate to MemberAssessment
    click element    //a[@id='btnTakeAssessment']
    Submit HAH CPCM Assessment    ${UserData}


Create FL LTSS Disaster Preparedness Assessment
    [Arguments]  ${UserData}
    set selenium speed    1s
    Search For Member   ${UserData}
    Select The Member
    sleep    25s
    Navigate to MemberAssessment
    click element    //a[@id='btnTakeAssessment']
    sleep    3s
    select from list by label    //select[@id='Department']    LTSS
    sleep    2s
    click element    //u[contains(text(),'FL LTSS Disaster Preparedness 10.0')]
    sleep    4s
    FL LTSS Disaster Preparedness Assessment    ${UserData}
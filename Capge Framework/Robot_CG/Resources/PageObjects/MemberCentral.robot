*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library  ../../CustomLibs/DataCreation.py
Library    String


*** Variables ***
${MCAttachAdd} =    //a[@id="btnAddAttachment"]
${SelectFile} =    //input[@id="attachmentFile"]
${AttachAddFile} =    C:\\Users\\SNG9716\\RobotLocal\\Data\\Jan_2019_kNHOw_Calendar.pdf
${AttachExistingAuth} =    //*[@id="MemberCentralAuth"]/div[2]/div[1]/table/tbody/tr[1]/td[3]
${AttachFaxType} =    //select[@id="FaxType"]
${AttachDescr} =    //textarea[@id="AttachmentDescription"]
${Success} =    //div[@class="alert-box success"]
${AttachVoidRsn} =    //textarea[@id="VoidComments"]

*** Keywords ***
Create the Member Attachment
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    click link    Member Attachments
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${MCAttachAdd}
    wait until page contains    Add Attachment
    wait until page does not contain  //*[@id="loading-ajax"]
    choose file    ${SelectFile}   ${AttachAddFile}
    select from list by label    ${AttachFaxType}       Inbound
    input text   ${AttachDescr}    This is Automation Testing
    click link    Save
    wait until page does not contain  //*[@id="loading-ajax"]
    page should contain element    ${Success}


MC - Edit Attachment
    set selenium implicit wait    10 Seconds
    click link    Member Attachments
    page should contain element    //td[contains(text(),"This is Automation Testing")]
    click element     //td[contains(text(),"This is Automation Testing")]
    Sleep    2 Second
    page should contain    View Attachment
    page should contain link    Edit
    click link    Edit
    page should contain    Edit Attachment
    input text   ${AttachDescr}    This is Edit Automation Testing
    click link    Save
    page should contain element    ${Success}

MC - Void Attachment
    click link    Member Attachments
    page should contain element    //td[contains(text(),"This is Edit Automation Testing")]
    click element     //td[contains(text(),"This is Edit Automation Testing")]
    Sleep    1 Second
    click link    Void Attachment
    input text    ${AttachVoidRsn}    Void This is Automation Testing
    click link    //a[@id="btnVoidMemberAttachmentDetails"]
    page should contain element    ${Success}

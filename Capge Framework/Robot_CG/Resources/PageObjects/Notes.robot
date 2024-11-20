*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Data/TestData.robot

*** Variables ***
${Notes} =  //a[@href="/cgx/Notes/MemberNote/Index"]
${NotesAddBtn} =    //a[@id="add-notes"]
${Dpt} =    //select[@id="DepartmentId"]
${Subject} =    //input[@id="Subject"]
${Message} =    //textarea[@id="Message"]
${NotesSave} =    //a[@id="membersave-note-btn"]
${EditNotes} =    //a[@id="edit-note-btn"]


${Notes_FullName} =    //div[@class='member-banner']/div/div[1]
${Notes_MemberId} =    //div[@class='member-banner']/div/div[2]


*** Keywords ***
Create Notes
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    page should contain element    ${NotesAddBtn}
    click element    ${NotesAddBtn}
    page should not contain   //*[@id="loading-ajax"]    2 Seconds
    wait until page contains element    ${Dpt}
    select from list by label    ${Dpt}    ${UserData.NDepartment}
    input text    ${Subject}    ${UserData.NSubject}
    input text    ${Message}    ${UserData.NMessage}
    click link    Save


View Notes
    [Arguments]    ${UserData}
    page should contain element    ${NotesAddBtn}
    page should contain element    //td[contains(text(),'${UserData.NSubject}')]
    page should contain element    //td[contains(text(),'${UserData.NMessage}')]


Edit Notes
    [Arguments]    ${UserData}
    click element    //td[contains(text(),'${UserData.NSubject}')]
    click element    ${EditNotes}
    input text    ${Message}    THIS IS A PPV TEST - PLEASE IGNORE - EDIT
    click link    Save


Protegrity_View_Notes_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //div[@class='k-grid-content']//tr[1]/td[1]
    ${Notes_Member_Id}    get text    ${Notes_MemberId}
    ${FullName}    get text    ${Notes_FullName}
    ${Name}      split string   ${FullName}     ,
    ${Notes_LastName}    strip string     ${Name}[0]
    ${Notes_FirstName}    strip string     ${Name}[1]


    should be equal as strings  ${Notes_FirstName}  ${UserData.FirstName}
    should be equal as strings  ${Notes_LastName}  ${UserData.LastName}
    should be equal as strings  ${Notes_Member_Id}  ${UserData.SubscriberId}
    reload page
*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Data/TestData.robot

*** Variables ***
${CommAddBtn} =   //a[@id="add-new-communication-record"]
${CommName} =    //input[@id="ContactName"]
${CommNumber} =    //input[@id="ContactNumber"]
${CommExtn} =    //input[@id="Extension"]
${CommEmail} =    //input[@id="ContactEmail"]
${MemCommType} =    //select[@id="ControlId75"]
${MemCommMethod} =    //select[@id="ControlId76"]
${MemCommContactType} =    //select[@id="ControlId79"]
${MemCommCallAuth} =    //div[@id="ControlId83"]
${VoiceRec} =    //label[@for="checkbox-ControlId84-VO2630"]
${MemDob} =    //label[@for="checkbox-ControlId85-ME1350"]
${Memgrp} =    //label[@for="checkbox-ControlId85-ME1480"]
${MemCommCallRec} =    //div[@id="ControlId87"]
${CallOutcome} =    //select[@id="ControlId88"]
${ContactResult} =    //select[@id="ControlId89"]
${MemCommDesc} =    //select[@id="ControlId93"]
${MemCommLanguage} =    //div[@id="ControlId96"]
${Followup} =    //select[@id="ControlId99"]
${MemCommNotes} =    //textarea[@id="ControlId101"]
${BHOPExistingAuth} =   //*[@id="MemberCentralAuth"]/div[2]/div[1]/table/tbody/tr[4]/td[4]
${CommCancelBtn} =    //a[@id="btn-Cancel-Create-CommRec"]
${CommBackBtn} =    //img[@src="/cgx/Content/humana/images/Web/back_plum.png"]

*** Keywords ***
Create MC Communication Record
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    page should contain element    ${CommAddBtn}
    click element   ${CommAddBtn}
    wait until page contains element   ${CommName}
    input text    ${CommName}    ${UserData.CommName}
    input text    ${CommNumber}    ${UserData.CommNumber}
    input text    ${CommExtn}    ${UserData.CommExtn}
    input text    ${CommEmail}    ${UserData.CommEmail}
    select from list by label    ${MemCommType}  ${UserData.CommType}
    select from list by label    ${MemCommMethod}   ${UserData.CommMethod}
    select from list by label    ${MemCommContactType}   ${UserData.CommContactTyp}
    click element    ${MemCommCallAuth}//label[contains(text(),"${UserData.CommAuth}")]
    wait until page contains element  ${VoiceRec}
    scroll element into view    ${Memgrp}
    click element    ${VoiceRec}
    click element    ${MemDob}
    click element    ${Memgrp}
    click element    ${MemCommCallRec}//label[contains(text(),"${UserData.CommRec}")]
    select from list by label    ${CallOutcome}   ${UserData.CallOut}
    select from list by label    ${ContactResult}   ${UserData.ContactResult}
    select from list by label    ${MemCommDesc}   ${UserData.CommDesc}
    click element    ${MemCommLanguage}//label[contains(text(),"${UserData.CommLanguage}")]
    select from list by label    ${Followup}    ${UserData.CommFollowup}
    input text    ${MemCommNotes}    ${UserData.CommRecNotes}
    click link    Submit
    page should contain element    //div[@class="alert-box success"]


Cancel MC Communication Record
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    page should contain element    ${CommAddBtn}
    click element   ${CommAddBtn}
    wait until page contains element   ${CommName}
    input text    ${CommName}    ${UserData.CommName}
    input text    ${CommNumber}    ${UserData.CommNumber}
    input text    ${CommExtn}    ${UserData.CommExtn}
    input text    ${CommEmail}    testing the maximumlengthofthemailaddress@test.com
    page should contain element    //span [@id="ContactEmail-error"]
    input text    ${CommEmail}    ${UserData.CommEmail}
    select from list by label    ${MemCommType}  ${UserData.CommType}
    select from list by label    ${MemCommMethod}   ${UserData.CommMethod}
    select from list by label    ${MemCommContactType}   ${UserData.CommContactTyp}
    click element    ${MemCommCallAuth}//label[contains(text(),"${UserData.CommAuth}")]
    wait until page contains element  ${VoiceRec}
    scroll element into view    ${Memgrp}
    click element    ${VoiceRec}
    click element    ${MemDob}
    click element    ${Memgrp}
    click element    ${MemCommCallRec}//label[contains(text(),"${UserData.CommRec}")]
    select from list by label    ${CallOutcome}   ${UserData.CallOut}
    select from list by label    ${ContactResult}   ${UserData.ContactResult}
    select from list by label    ${MemCommDesc}   ${UserData.CommDesc}
    click element    ${MemCommLanguage}//label[contains(text(),"${UserData.CommLanguage}")]
    select from list by label    ${Followup}    ${UserData.CommFollowup}
    input text    ${MemCommNotes}    ${UserData.CommRecNotes}
    click link    ${CommCancelBtn}
    Sleep    1 Second
    page should contain    Confirmation
    click link    Yes
    page should not contain element  //div[@class="alert-box success"]

*** Variables ***
${MemCommEdit} =    //a[@id="edit-commRec"]
${TableRow} =    //*[@id="MemberCentralCommunicationRecord"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
${CorrectionRsn} =    //select[@id="ReasonForCorrection"]
${ViewCorrectionRsn} =    //div[@id="ReasonForCorrection"]
*** Keywords ***
Edit MC Communication Record
    set selenium implicit wait    10 Seconds
    click element    //tr[1]/td[contains(text(),"ICGS")]
    page should contain element    ${MemCommEdit}
    click link    ${MemCommEdit}
    wait until page contains    Edit Communication Record
    select from list by label    ${CorrectionRsn}    Additional Note
    input text    ${MemCommNotes}    THIS IS A PPV EDIT TEST - PLEASE IGNORE
    click link    Submit
    page should contain element    ${ViewCorrectionRsn}
    ${CommReason} =    get text    ${ViewCorrectionRsn}
    should be equal as strings    ${CommReason}    Additional Note
    click element    ${CommBackBtn}
    wait until page contains    Communication Record

Edit Cancel MC Communication Record

    set selenium implicit wait    10 Seconds
    click element    //tr[1]/td[contains(text(),"ICGS")]
    page should contain element    ${MemCommEdit}
    click link    ${MemCommEdit}
    wait until page contains    Edit Communication Record
    select from list by label    ${CorrectionRsn}    Incorrect Option Selected
    input text    ${MemCommNotes}    THIS IS A PPV EDIT TEST - PLEASE IGNORE
    click link    ${CommCancelBtn}
    Sleep    1 Second
    page should contain    Confirmation
    click link    Yes
    Sleep    1 Second
    page should contain element  ${ViewCorrectionRsn}
    ${CommReason} =    get text    ${ViewCorrectionRsn}
    should not be equal as strings   ${CommReason}    Incorrect Option Selected
    click element    ${CommBackBtn}
    wait until page contains    Communication Record




*** Variables ***
${CommHistory} =    //tr[1]//a[@class="viewHistoryAnchor "]
${CommuRow1} =    //input[@id="0-CommunicationRecordHistoryGrid-checkbox"]
${CommuRow2} =    //input[@id="1-CommunicationRecordHistoryGrid-checkbox"]
${CommCompare} =    //a[@id="btnCompareCommRec"]


*** Keywords ***

Compare History MC Communication
        click element    ${CommHistory}
        wait until page contains    Communication Record History
        click element    ${CommuRow1}
        click element    ${CommuRow2}
        click element    ${CommCompare}
        page should contain    Compare Communication Records
        page should contain element    //div[contains(text(),"THIS IS A PPV EDIT TEST")]
        click element    ${CommBackBtn}
        wait until page contains    Communication Record

*** Variables ***
${CommSidmenu} =    //ul[@class='side-nav']//a[contains(text(),'Communication Record')]
${BHCommType} =    //select[@id="ControlId102"]
${BHCommMethod} =    //select[@id="ControlId104"]
${BHCommContactType} =    //select[@id="ControlId107"]
${BHCommCallAuth} =    //div[@id="ControlId2856"]
${BHCommContactResult} =    //select[@id="ControlId117"]
${BHExistingAuth} =    //*[@id="MemberCentralAuth"]/div[2]/div[1]/table/tbody/tr[3]/td[3]
${BHVoiceRec} =    //label[@for="checkbox-ControlId112-VO2630"]
${BHMemDob} =    //label[@for="checkbox-ControlId113-ME1350"]
${BHMemgrp} =    //label[@for="checkbox-ControlId113-ME1480"]
${BHMemID} =    //label[@for="checkbox-ControlId113-ME1490"]
${BHMemZip} =    //label[@for="checkbox-ControlId113-ME1590"]
${CommAttempNo} =    //select[@id="ControlId2857"]
${BHCommNotes} =    //textarea[@id="ControlId131"]
${VoidError} =    //span[@id="unableToAuthenticatePanelError"]
*** Keywords ***

Create BHOP Communication Record
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    #click element    ${BHOPExistingAuth}
    wait until page does not contain  //*[@id="loading-ajax"]
    click element   ${CommSidmenu}
    page should contain element    ${CommAddBtn}
    click element   ${CommAddBtn}
    wait until page contains element   ${CommName}
    input text    ${CommName}    ${UserData.CommName}
    input text    ${CommNumber}    ${UserData.CommNumber}
    input text    ${CommExtn}    ${UserData.CommExtn}
    input text    ${CommEmail}    ${UserData.CommEmail}
    select from list by label    ${BHCommType}  ${UserData.CommType}
    wait until page does not contain  //*[@id="loading-ajax"]
    sleep  1 Second
    select from list by label    ${BHCommMethod}   ${UserData.CommMethod}
    select from list by label    ${BHCommContactType}   ${UserData.CommContactTyp}
    scroll element into view    ${BHMemgrp}
    click element    ${BHVoiceRec}
    #click element    ${BHMemID}
    #click element    ${BHMemDob}
    sleep    1 Second
    click element    ${BHMemgrp}
    click element    ${BHCommCallAuth}//label[contains(text(),"${UserData.CommRec}")]
    select from list by label    ${BHCommContactResult}   ${UserData.ContactResult}
    select from list by label    ${CommAttempNo}     ${UserData.CommAttemptNo}
    input text    ${BHCommNotes}    ${UserData.CommRecNotes}
    click link    Submit
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    click element   ${BHMemZip}
    page should contain element    //div[@class="alert-box success"]


Protegrity Edit Communication Record
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${TableRow_CommRcd}
    page should contain element    ${MemCommEdit}
    click link    ${MemCommEdit}
    wait until page contains    Edit Communication Record
    ${PhoneEditCR_Actual}      get value    //input[@id='ContactNumber']
    should be equal as strings  ${PhoneEditCR_Actual}  ${UserData.ContactPhone}
*** Settings ***
Library  SeleniumLibrary
Library  String

#Resource  ../Data/TestData.robot

*** Variables ***
${Tasks} =  //a[@href="/cgx/Notes/MemberNote/Index"]
${TasksAddBtn} =    //a[@id='add-new-tasks']
${TaskPriorityDropDn} =    //label[text()='Priority']/following::span[@class='select2-selection select2-selection--single']
${TaskTypeDropDn} =    //label[text()='Task Type']/following::span[@class='select2-selection select2-selection--single']
${FollowUpDt} =    //input[@id='FollowUpDate']
${Subject} =    //input[@id="Subject"]
${FollowUpTime} =    //input[@id='FollowUpTime']
${TaskSave} =    //a[@id='save-new-task-btn']
${EditNotes} =    //a[@id="edit-note-btn"]
${CancelBtn} =    //u[contains(text(),'Cancel')]
${TaskEdit} =    //a[@id='task-edit-btn']
${TaskVoid} =    //a[@id='task-void-btn']
${ChngOwnershipBtn} =    //a[@id='task-change-ownership-btn']
${TakeOwnershipBtn} =    //a[@id='task-take-ownership-btn']
${Char250} =    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${Char5000} =   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${Task_InvalidData} =    ñóǹ äŝçíì 汉语/漢語  华语/華語 Huáyǔ; 中文 Zhōngwén 漢字仮名交じり文 Lech Wałęsa æøå
${Task_InvalidTxtData} =  Lorem ipsum 1234567890 ~!@$%^&*()-_=+[]\{}|;':,./<>?




*** Keywords ***
Regression - Member Central_Tasks
    [Arguments]  ${UserData}
    set selenium speed    1s

CPCM – Tasks – Valid - Tasks_Add_Save_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    ${TasksAddBtn}
    sleep    2s
    click element    ${TaskPriorityDropDn}
    click element    //ul[@id='select2-PriorityType-results']/li[text()='Medium']
    click element    ${TaskTypeDropDn}
    input text    //input[@class='select2-search__field']    COB Status
    click element    //li[@class='select2-results__option select2-results__option--highlighted' and text()='COB Status']
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    ${task_Tomorrow} =      add time to date    ${task_Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    ${FollowUpDt}    ${task_Tomorrow}
#    input text    ${FollowUpTime}    08:00:00 AM
    input text    //textarea[@id='Comments']    THIS IS PPV TEST IGNORE
    click element    ${TaskSave}
    page should contain    Task 'COB Status' has been added successfully

CPCM – Tasks – Valid - Tasks_Add_Save-Add_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    ${TasksAddBtn}
    sleep    2s
    click element    ${TaskPriorityDropDn}
    click element    //ul[@id='select2-PriorityType-results']/li[text()='Medium']
    click element    ${TaskTypeDropDn}
    input text    //input[@class='select2-search__field']    COB Status
    click element    //li[@class='select2-results__option select2-results__option--highlighted' and text()='COB Status']
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    ${task_Tomorrow} =      add time to date    ${task_Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    ${FollowUpDt}    ${task_Tomorrow}
    input text    ${FollowUpTime}    08:00:00 AM
    input text    //textarea[@id='Comments']    THIS IS PPV TEST IGNORE
    click element    //a[@id='save-and-add-another-task-btn']
    page should contain    Task 'COB Status' has been added successfully

CPCM – Tasks – Valid - Cancel_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    ${rcdCntBefore}    get text    //h6/span[2]
    click element    ${TasksAddBtn}
    sleep    2s
    click element    ${TaskPriorityDropDn}
    click element    //ul[@id='select2-PriorityType-results']/li[text()='Medium']
    click element    ${TaskTypeDropDn}
    input text    //input[@class='select2-search__field']    COB Status
    click element    //li[@class='select2-results__option select2-results__option--highlighted' and text()='COB Status']
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    ${task_Tomorrow} =      add time to date    ${task_Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    ${FollowUpDt}    ${task_Tomorrow}
    input text    ${FollowUpTime}    08:00:00 AM
    input text    //textarea[@id='Comments']    THIS IS PPV TEST IGNORE
    click element    ${CancelBtn}
    ${rcdCntAfter}    get text    //h6/span[2]
    should be true    ${rcdCntBefore} == ${rcdCntAfter}

CPCM – Tasks – Valid - Edit_Save_Existing_Record_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    sleep    2s
    click element    ${TaskEdit}
    sleep    2s
    input text    ${FollowUpTime}    09:00:00 AM
    input text    //textarea[@id='Comments']    Follow Up Time Updated
    click element    //a[@id='edit-task-save-btn']
    page should contain element    //div[contains(text(),'has been modified successfully')]

CPCM – Tasks – Valid - Edit_Cancel_Existing_Record_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    sleep    2s
    click element    ${TaskEdit}
    sleep    2s
    input text    ${FollowUpTime}    10:00:00 AM
    input text    //textarea[@id='Comments']    Follow Up Time Updated
    click element    ${CancelBtn}

CPCM – Tasks – Valid - ChangeOwnerShip_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    sleep    2s
    ${OwnerName_Before}    get text    //div[@id='QueueNameAutoComplete']
    click element    ${ChngOwnershipBtn}
    input text    //input[@id='QueueName']    James Koeppel
    click element    //a[@id='QueueNamebtn']
    sleep    2s
    click element    //div/input[@id='0-QueueSearchGrid-checkbox']/following-sibling::label
    click element    //a[@id='button-change-ownership']
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    ${OwnerName_After}    get text    //div[@id='QueueNameAutoComplete']
    click element    //img[contains(@src,'popup_close.png')]
#    Should Be Equal As Strings    ${OwnerName_Before}==${OwnerName_After}
    Should not Be Equal As Strings    ${OwnerName_Before}    ${OwnerName_After}


CPCM – Tasks – Valid - TakeOwnerShip_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    sleep    2s
    ${OwnerName_Before}    get text    //div[@id='QueueNameAutoComplete']
    click element    ${ChngOwnershipBtn}
    input text    //input[@id='QueueName']    Praneeth Popuri
    click element    //a[@id='QueueNamebtn']
    sleep    2s
    click element    //div/input[@id='0-QueueSearchGrid-checkbox']/following-sibling::label
    click element    //a[@id='button-change-ownership']
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    ${OwnerName_After}    get text    //div[@id='QueueNameAutoComplete']
    click element    //img[contains(@src,'popup_close.png')]
#    should not be true    ${OwnerName_Before}!=${OwnerName_After}
    Should not Be Equal As Strings    ${OwnerName_Before}    ${OwnerName_After}

CPCM – Tasks – Valid - Change OwnerShip_Save_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    5s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    sleep    2s
    ${OwnerName_Before}    get text    //div[@id='QueueNameAutoComplete']
    click element    ${ChngOwnershipBtn}
    input text    //input[@id='QueueName']    AMOL SAHEBRAO
    click element    //a[@id='QueueNamebtn']
    sleep    2s
    click element    //div/input[@id='0-QueueSearchGrid-checkbox']/following-sibling::label
    click element    //a[@id='button-change-ownership']
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    ${OwnerName_After}    get text    //div[@id='QueueNameAutoComplete']
    click element    //img[contains(@src,'popup_close.png')]
#    should not be true    ${OwnerName_Before}!=${OwnerName_After}
    Should not Be Equal As Strings    ${OwnerName_Before}    ${OwnerName_After}


CPCM – Tasks – Valid - Change OwnerShip_Cancel_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    ${OwnerName_Before}    get text    //div[@id='QueueNameAutoComplete']
    click element    ${ChngOwnershipBtn}
    input text    //input[@id='QueueName']    James Koeppel
    click element    //a[@id='QueueNamebtn']
    sleep    2s
    click element    //div/input[@id='0-QueueSearchGrid-checkbox']/following-sibling::label
    click element    ${CancelBtn}
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    ${OwnerName_After}    get text    //div[@id='QueueNameAutoComplete']
    click element    //img[contains(@src,'popup_close.png')]
#    should not be true    ${OwnerName_Before}==${OwnerName_After}
    Should not Be Equal As Strings    ${OwnerName_Before}    ${OwnerName_After}

CPCM – Tasks – Valid - View-Take OwnerShip_Save_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    ${OwnerName_Before}    get text    //div[@id='QueueNameAutoComplete']
    click element    ${TakeOwnershipBtn}
#    input text    //input[@id='QueueName']    James Koeppel
#    click element    //a[@id='QueueNamebtn']
    sleep    2s
    click element    //div/input[@id='0-MemberCentralTask-checkbox']/following-sibling::label
    click element    //a[@id='button-change-ownership']
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    ${OwnerName_After}    get text    //div[@id='QueueNameAutoComplete']
    click element    //img[contains(@src,'popup_close.png')]
#    should be true    ${OwnerName_Before}!=${OwnerName_After}
    Should not Be Equal As Strings    ${OwnerName_Before}    ${OwnerName_After}


CPCM – Tasks – Valid - View-CompleteTask_Cancel_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //a[@id='edit-tasks-grid']
    click element    //input[@id='0-MemberCentralTask-checkbox']/following-sibling::label
    ${FollowupRcd_Before}    get text    //div[@class='k-grid-content']//tr[1]/td[7]
    click element    //div[@class='k-grid-content']//tr[1]/td[7]
    click element    //div[@id='TaskDetailComments-gridContent']//table
    click element    //a[@id='task-complete-btn']
    click element    ${CancelBtn}
    ${FollowupRcd_After}    get text    //div[@class='k-grid-content']//tr[1]/td[7]
#    should not be true    ${FollowupRcd_Before}==${FollowupRcd_After}
    Should not Be Equal As Strings    ${FollowupRcd_Before}    ${FollowupRcd_After}
    click element    //a[@id='edit-tasks-grid-done']


CPCM – Tasks – Valid - View-VoidTask_Cancel_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    click element    ${TaskVoid}
    click element    //a[@id='voidtaskcancelButton']
#    input text    ${FollowUpTime}    10:00:00 AM
#    input text    //textarea[@id='Comments']    Follow Up Time Updated
#    click element    //u[contains(text(),'No')]

CPCM – Tasks – Valid - View- View-VoidTask_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    click element    ${TaskVoid}
#    input text    ${FollowUpTime}    10:00:00 AM
#    input text    //textarea[@id='Comments']    Follow Up Time Updated
    click element    //a[@id='voidtaskconfirmButton']
    page should contain element    //div[contains(text(),'has been voided successfully')]

CPCM – Tasks – Valid - History_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]//img[contains(@src,'history.png')]
    ${rcdHistoryBefore}    get element count    //div[@id='TasksHistoryGrid-gridContent']//div[@class='k-grid-content']//tr
    click element    //a[@id='tasks-history-back-btn']
    CPCM – Tasks – Valid - Edit_Save_Existing_Record_Validation    ${UserData}
    sleep    5s
    click element    //div[@class='k-grid-content']//tr[1]//img[contains(@src,'history.png')]
    ${rcdHistoryAfter}    get element count    //div[@id='TasksHistoryGrid-gridContent']//div[@class='k-grid-content']//tr
    should be true    ${rcdHistoryBefore}<${rcdHistoryAfter}
    click element    //a[@id='tasks-history-back-btn']

CPCM – Tasks – Valid - Show/Hide_Audit_Trial_validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //div[@class='k-grid-content']//tr[1]//img[contains(@src,'history.png')]
    ${rcdHistoryBefore}    get element count    //div[@id='TasksHistoryGrid-gridContent']//div[@class='k-grid-content']//tr
    click element    //a[@id='show-audit-trial-btn']
    element should be visible    //a[@id='hide-audit-trial-btn']
    click element    //a[@id='tasks-history-back-btn']

CPCM – Tasks – Valid - QuickComplete_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${UserData}
    CPCM – Tasks – Valid - Edit_Save_Existing_Record_Validation    ${UserData}
    click element    //a[@id='edit-tasks-grid']
    click element    //div/input[@id='0-MemberCentralTask-checkbox']/following-sibling::label
    click element    //a[@id='button-task-quick-complete']
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    input text    //input[@id='CompleteDate']    ${task_Today}
    click element    //a[@id='button-quick-complete']
    click element    //a[@id='edit-tasks-grid-done']
    click element    //div[@class='k-grid-content']//tr[1]/td[4]
    page should contain element    //h4[contains(text(),'View Task')]
    page should contain element    //div[contains(text(),'Task was completed')]
    click element    //img[contains(@src,'popup_close.png')]

CPCM – Tasks – Valid - View-CompleteTask_Save_Validation  #pending
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${UserData}
    CPCM – Tasks – Valid - Edit_Save_Existing_Record_Validation    ${UserData}


CPCM – Tasks – Valid - Set FollowUP_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //a[@id='edit-tasks-grid']
    sleep    3s
    click element    //div/input[@id='0-MemberCentralTask-checkbox']/following-sibling::label
    ${FollowupDt_Before}    get text    //div[@class='k-grid-content']//tr[1]/td[7]
#    @{words} =  Split String    ${string}       /
#    ${FollowupDt_Before}
    click element    //a[@id='button-task-followup-date']
    page should contain element    //h4[contains(text(),'Set Follow-up Date')]
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    ${task_FollowupDt} =      add time to date    ${task_Today}   5 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    //input[@id='FollowUpDate']    ${task_FollowupDt}
    ${d} =    generate random string    4    0123456789
    ${str3} =   Catenate    SEPARATOR=  EDIT_TASK_   ${d}
    input text    //textarea[@id='Reason']    ${str3}
    click element    //a[@id='button-set-followUp-date']
    ${FolloupDt_After}    get text    //div[@class='k-grid-content']//tr[1]/td[7]
    should be true    ${FollowupDt_Before} != ${FolloupDt_After}
    click element    //div[@class='k-grid-content']//tr[1]/td[7]
    click element    ${TaskVoid}
#    input text    ${FollowUpTime}    10:00:00 AM
#    input text    //textarea[@id='Comments']    Follow Up Time Updated
    click element    //a[@id='voidtaskconfirmButton']
    page should contain element    //div[contains(text(),'has been voided successfully')]


CPCM – Tasks – MaxLength_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    ${TasksAddBtn}
    input text    //input[@id='Subject']    ${Char250}
    input text    //textarea[@id='Comments']    ${Char5000}
    page should contain element    //span[text()='Subject should not exceed 250 characters']
    page should contain element    //span[text()='Comments should not exceed 5000 characters']
    click element    ${CancelBtn}

CPCM – Tasks – Required Fields_ErrorMessage_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    ${TasksAddBtn}
    sleep    2s
    input text    //textarea[@id='Comments']    TEST-Tasks
    page should contain element    //span[contains(text(),'Some errors occurred. Please see below for details')]
    page should contain element    //span[text()='Priority is required']
    page should contain element    //span[text()='Task Type is required']
    page should contain element    //span[text()='Follow-up Date is required']
    page should contain element    //span[text()='Subject is required']
    click element    ${CancelBtn}

CPCM – Tasks – Set FollowUP_Invalid_Time_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    2s
    click element    //a[@id='edit-tasks-grid']
    click element    //div/input[@id='0-MemberCentralTask-checkbox']/following-sibling::label
    click element    //a[@id='button-task-followup-date']
    page should contain element    //h4[contains(text(),'Set Follow-up Date')]
    input text    //input[@id='FollowUpTime']    1
    input text    //textarea[@id='Reason']    EDIT_TASK
    page should contain element    //span[text()='Please enter a valid time']
    click element    ${CancelBtn}
    click element    //a[@id='edit-tasks-grid-done']

Regression - CP CM Case_Tasks
    [Arguments]  ${UserData}
    set selenium speed    1s

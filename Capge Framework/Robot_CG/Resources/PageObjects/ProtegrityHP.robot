*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource    ../Definitions/HumanaGui.robot
Resource    ../Definitions/Common.robot
Library  ../../CustomLibs/DataCreation.py
Library    ../PageObjects/SearchPage.robot

*** Variables ***
#Add Task(Member Central) Masked Fields
${MCTasksPageHeader} =    //div[@id="member-task-grid-container"]//child::h3[text() = "Tasks"]
${MCTasksAddBtn} =    //div[@id="member-task-grid-container"]//child::a[@id="add-new-tasks"]
${MCAddTasksPopUpTitle} =    //div[@id="member-add-tasks-modal"]//child::h4[@id="modal-header-title" and text()='Add Task']
${MCAddTaskBannerMemberName} =    //div[@id='member-add-tasks-modal']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][1]
${MCAddTaskBannerMemberDOB} =     //div[@id='member-add-tasks-modal']//child::div[@class='member-banner']//child::div[contains(text(),'Yrs,')]
${MCAddTaskBannerMemberHomePhone} =    //div[@id='member-add-tasks-modal']//child::div[@class='member-banner']//child::div[contains(text(),'-')]
${MCAddTaskBannerMemberStreetAddr} =    //div[@id='member-add-tasks-modal']//child::div[@class='member-banner']//child::div[contains(text(),'-')]
${MCAddTaskBannerMemberID} =    //div[@id='member-add-tasks-modal']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]

#View Task(Member Central) Masked Fields
#To Clik on the created task under Member entral Grid from the table
${MCCreatedTaskUnderGrid} =    //div[@id="MemberCentralTask-gridContent"]//child::td[text()="Task_2437"]    #text() is the comment value entered while creating Task
${MCFirstTaskUnderGrid} =    //div[@id="MemberCentralTask-gridContent"]//tr[@role="row"][1]
${MCViewTaskMemBannerMemberId} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCViewTaskBannerMemberName} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][1]
${MCViewTaskBannerMemberDOB} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[contains(text(),'Yrs,')]
${MCViewTaskBannerMemberContact} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[contains(text(),'-')]
${MCViewTaskBannerMemberStreetAddr} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCViewTaskPopUpTitle} =    //div[@id="view-task"]//child::h4[@id="modal-header-title" and text()="View Task"]


#Change Ownership(Member Central Task) Masked Fields
${MCViewTaskChngOwnershipBtn} =    //div[@id="view-task"]//child::a[@id="task-change-ownership-btn"]
${MCTaskChngOwnershipBannerMemberId} =    //div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCTaskChngOwnershipBannerContact} =    //div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div[contains(text(),'-')]
${MCTaskChngOwnershipBannerStreetAddr} =    //div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCTaskChngOwnershipPopUpTitle} =    //div[@id="task-change-ownership"]//child::h4[@id="modal-header-title" and text()="Change Ownership"]
${MCTaskChngOwnershipCancelBth} =    //a[@id="task-change-ownership-cancel-btn"]

#Edit Task(Member Central) Masked fields
${MCEditTaskBtn} =    //div[@id="view-task"]//child::a[@id="task-edit-btn"]
${MCEditTaskPopUpTitle} =    //div[@id="member-edit-tasks-modal"]//child::h4[@id="modal-header-title" and text()="Edit Task"]
${MCEditTaskBannerMemberId} =    //div[@id='member-edit-tasks-modal']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCEditTaskBannerStreetAddr} =    //div[@id='member-edit-tasks-modal']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCEditTaskBannerWorkPhn} =    //div[@id='member-edit-tasks-modal']//child::div[@class='member-banner']//child::div[contains(text(),'-')]


#Set Follow Up Date Taskk (Member Central) Masked Fields
${MCTaskGridEditBtn} =    //div[@id="member-task-grid-container"]//child::a[@id="edit-tasks-grid" and @class="button"]
${MCTaskGridChkBox} =    //div[@id="MemberCentralTask-gridContent"]//td[@class=" checkboxColumn checkboxCell "][1]
${MCFollowUpDateTask} =  //a[@id="button-task-followup-date"]
${MCFollowUpDateTaskPopUpTitle} =    //div[@id="task-followup-date"]//child::h4[@id="modal-header-title" and text()="Set Follow-up Date"]
${MCTaskGridDoneBtn} =    //div[@id="member-task-grid-container"]//child::ul[@class="button-group right"]//child::a[@id="edit-tasks-grid-done"]
${MCTaskFollowUpCancelLink} =    //a[@id="task-followup-date-cancel-btn"]
${MCFollowUpTaskBannerMemberId} =    //div[@id="task-followup-date"]//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCFollowUpTaskBannerStreetAddr} =    //div[@id="task-followup-date"]//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCFollowUpTaskBannerContact} =     //div[@id='task-followup-date']//child::div[@class='member-banner']//child::div[contains(text(),'-')]

#Task Grid (Member Central) Masked Fields
${MCTaskGridMemberID} =    //div[@id="member-information"]//child::div[@class="small-2 columns"][2]
${MCTaskGridStreetAddr} =    //div[@id="member-information"]//child::div[@class="small-2 columns"][4]
${MCTaskGridContact} =    //div[@id="member-information"]//child::div[@class="small-2 columns"][5]

#Task History (Member Central) Masked Fields
${MCTaskHistoryImage} =    //td[@class="center historyCell"][1]
${MCTaskHistoryTitle} =    //h3[@class="humana-green left hide-for-medium" and text()="Task History"]
${MCTaskHistoryMemberID} =    //div[@id="DisplayMemberId"]
${MCTaskHistoryBackLink} =    //a[@id="tasks-history-back-btn"]


#Seach Member Masked Fields
${MCTaskSearchMemberFirstName} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][1]
${MCTaskSearchMemberLastName} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][2]
${MCTaskSearchMemberSSN} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][3]
${MCTaskSearchDOB} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][4]
${MCTaskSearchMedicareID} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][5]

#View CDR Screen
${ViewCDRContactEmail} =    //label[@for="ContactEmail"]//ancestor::div[@class="small-6 columns"]//following-sibling::div[@class="small-6 columns valueField"]
${ViewCDRcontactNumber} =    //label[@for="ContactNumber"]//ancestor::div[@class="small-6 columns"]//following-sibling::div[@class="small-6 columns valueField"]
${ViewCDRNum} =    //span[@id="CdrAuthId"]

*** Keywords ***
View CDR Screen Mask
    [Arguments]    ${UserData}
    auth search modified    ${UserData.CDRNumber}
    wait until element is visible    ${ViewCDRNum}
    ${CDRContactMail} =  get text    ${ViewCDRContactEmail}
    ${CDRContactMail} =    strip string    ${CDRContactMail}     mode=both
    ${CDRContactNumber} =  get text    ${ViewCDRcontactNumber}
    ${CDRContactNumber} =    strip string    ${CDRContactNumber}     mode=both
    should be equal as strings    ${CDRContactMail}    ${UserData.ContactMail}
    should be equal as strings       ${CDRContactNumber}    ${UserData.ContactNumber}
    log to console    ${CDRContactMail}
    log to console    ${CDRContactNumber}

View Task Screen Mask
    [Arguments]    ${UserData}
    Get Member Details
    Navigate to Tasks
    sleep  5 seconds
    wait until element is visible    //a[@id="add-new-tasks"]    20 Seconds
    page should contain element    ${MCTasksPageHeader}
    click element    ${MCFirstTaskUnderGrid}
    sleep  5 seconds
    wait until element is visible    ${MCViewTaskPopUpTitle}    10 Seconds
    page should contain element    ${MCViewTaskPopUpTitle}
    ${MemberID} =    get text    ${MCViewTaskMemBannerMemberId}
    ${MemberID} =    strip string    ${MemberID}
    should be equal as strings    ${MemberID}    ${UserData.MemberID}
    ${MemberName} =    get text    ${MCViewTaskBannerMemberName}
    ${MemberName} =    split string    ${MemberName}    ,
    ${FirstName} =   set variable    ${MemberName}[0]
    ${LastName} =    set variable    ${MemberName}[1]
    ${FirstName} =   strip string    ${MemberName}[0]    mode=both
    ${LastName} =    strip string    ${MemberName}[1]    mode=both
    should be equal as strings    ${FirstName}    ${UserData.FirstName}
    should be equal as strings    ${LastName}    ${UserData.LastName}
    ${MemberContact} =    get text    ${MCViewTaskBannerMemberContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    should be equal as strings    ${MemberContact}    ${UserData.MemberContact}
    ${MemberAddress} =   get text    ${MCViewTaskBannerMemberStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[4]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[4]    mode=both
    should be equal as strings    ${MemberStreetAddress}    ${UserData.StreetAddress}
    should be equal as strings    ${MemberZipCode}    ${UserData.MemberZipCode}

    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberName}
    set local variable    ${FirstName}
    set local variable    ${LastName}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}

View Task Change Ownership Screen Mask
    [Arguments]    ${UserData}
    click element    ${MCViewTaskChngOwnershipBtn}
    wait until element is visible    ${MCTaskChngOwnershipPopUpTitle}    20 Seconds
    page should contain element    ${MCTaskChngOwnershipPopUpTitle}
    ${MemberID} =    get text    ${MCTaskChngOwnershipBannerMemberId}
    ${MemberID} =    strip string    ${MemberID}
    should be equal as strings   ${MemberID}    ${UserData.MemberId}
    ${MemberContact} =    get text    ${MCTaskChngOwnershipBannerContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    should be equal as strings    ${MemberContact}    ${UserData.MemberContact}
    ${MemberAddress} =   get text    ${MCTaskChngOwnershipBannerStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[4]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[4]    mode=both
    should be equal as strings    ${MemberStreetAddress}    ${UserData.StreetAddress}
    should be equal as strings    ${MemberZipCode}    ${UserData.MemberZipCode}

    log to console    ${MemberID}
    log to console    ${MemberContact}
    log to console    ${MemberStreetAddress}
    log to console    ${MemberZipCode}
    click element     ${MCTaskChngOwnershipCancelBth}
    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}

Set Follow Up Date Screen Mask
    [Arguments]    ${UserData}
    sleep    05 Seconds
    click element    ${MCTaskGridEditBtn}
    sleep    02 Seconds
    click element    ${MCTaskGridChkBox}
    sleep    02 Seconds
    click element    ${MCFollowUpDateTask}
    sleep    02 seconds
    wait until element is visible    ${MCFollowUpDateTaskPopUpTitle}    20 Seconds
    page should contain element    ${MCFollowUpDateTaskPopUpTitle}
    ${MemberID} =    get text    ${MCFollowUpTaskBannerMemberId}
    ${MemberID} =    strip string    ${MemberID}
    should be equal as strings    ${MemberID}    ${UserData.MemberId}
    ${MemberContact} =    get text    ${MCFollowUpTaskBannerContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    should be equal as strings    ${MemberContact}    ${UserData.MemberContact}
    ${MemberAddress} =   get text    ${MCFollowUpTaskBannerStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[4]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[4]    mode=both
    should be equal as strings    ${MemberStreetAddress}    ${UserData.StreetAddress}
    should be equal as strings    ${MemberZipCode}    ${UserData.MemberZipCode}

    log to console    ${MemberID}
    log to console    ${MemberContact}
    log to console    ${MemberStreetAddress}
    log to console    ${MemberZipCode}
    click element     ${MCTaskFollowUpCancelLink}
    sleep    03 Seconds
    click element     ${MCTaskGridDoneBtn}
    sleep    03 Seconds
    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}

Grid Task Screen Mask
    [Arguments]    ${UserData}
    sleep  5 seconds
    wait until element is visible    //a[@id="add-new-tasks"]    20 Seconds
    page should contain element    ${MCTasksPageHeader}
    ${MemberID} =    get text    ${MCTaskGridMemberID}
    ${MemberID} =    strip string    ${MemberID}
    should be equal as strings    ${MemberID}    ${UserData.MemberID}
    ${MemberContact} =    get text    ${MCTaskGridContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    should be equal as strings     ${MemberContact}    ${UserData.MemberContact}
    ${MemberAddress} =   get text    ${MCTaskGridStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[4]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[4]    mode=both
    should be equal as strings    ${MemberStreetAddress}    ${UserData.StreetAddress}
    should be equal as strings    ${MemberZipCode}    ${UserData.MemberZipCode}
    log to console    ${MemberID}
    log to console    ${MemberContact}
    log to console    ${MemberStreetAddress}
    log to console    ${MemberZipCode}

    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}

Member Level Task History Screen Mask
    [Arguments]    ${UserData}
    click element    ${MCTaskHistoryImage}
    wait until element is visible    ${MCTaskHistoryTitle}    20 Seconds
    page should contain element    ${MCTaskHistoryTitle}
    ${MemberIdOnHistory} =    get text    ${MCTaskHistoryMemberID}
    ${MemberIdOnHistory} =    strip string    ${MemberIdOnHistory}
    should be equal as strings    ${MemberIdOnHistory}    ${UserData.MemberIdOnHistory}
    ${MemberID} =    get text    ${MCTaskGridMemberID}
    ${MemberID} =    strip string    ${MemberID}
    should be equal as strings    ${MemberID}    ${UserData.MemberID}
    ${MemberContact} =    get text    ${MCTaskGridContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    should be equal as strings    ${MemberContact}    ${UserData.MemberContact}
    ${MemberAddress} =   get text    ${MCTaskGridStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[4]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[4]    mode=both
    should be equal as strings    ${MemberStreetAddress}    ${UserData.StreetAddress}
    should be equal as strings    ${MemberZipCode}    ${UserData.MemberZipCode}
    log to console    ${MemberID}
    log to console    ${MemberContact}
    log to console    ${MemberStreetAddress}
    log to console    ${MemberZipCode}
    log to console    ${MemberIdOnHistory}
    click element    ${MCTaskHistoryBackLink}
    wait until element is visible    ${MCTasksPageHeader}    10 Seconds
    Sleep    03 Seconds
    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}
    set local variable    ${MemberIdOnHistory}

Member Search Grid Screen Mask
    [Arguments]    ${UserData}
    ${FirstName} =   get text    ${MCTaskSearchMemberFirstName}
    ${LastName} =    get text    ${MCTaskSearchMemberLastName}
    ${FirstName} =   strip string    ${FirstName}    mode=both
    ${LastName} =    strip string    ${LastName}    mode=both
    should be equal as strings    ${FirstName}    ${UserData.FirstName}
    should be equal as strings    ${LastName}    ${UserData.LastName}
    ${MemberSSN} =    get text    ${MCTaskSearchMemberSSN}
    ${MemberSSN} =    strip string    ${MemberSSN}    mode=both
    should be equal as strings    ${MemberSSN}    ${UserData.SSN}
    ${MemberMedicareID} =   get text    ${MCTaskSearchMedicareID}
    ${MemberMedicareID} =   strip string    ${MemberMedicareID}    mode=both
    should be equal as strings    ${MemberMedicareID}    ${UserData.MedicareId}
    ${MemberDOB} =   get text    ${MCTaskSearchDOB}
    ${MemberDOB} =   strip string    ${MemberDOB}    mode=both

    log to console    ${FirstName}
    log to console    ${LastName}
    log to console    ${MemberSSN}
    log to console    ${MemberDOB}
    log to console    ${MemberMedicareID}
    # setting all variables locally

    set local variable    ${FirstName}
    set local variable    ${LastName}
    set local variable    ${MemberSSN}
    set local variable    ${MemberDOB}
    set local variable    ${MemberMedicareID}
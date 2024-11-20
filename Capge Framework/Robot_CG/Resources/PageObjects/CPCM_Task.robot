*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource    ../Definitions/HumanaGui.robot
Resource    ../Definitions/Common.robot
*** Variables ***
#CPCM Case Tasks :
${MCCPCMCaseHeader} =    //h3[@class="humana-green" and text()="CP CM Cases"]
${MCCPCMCreateCaseBtn} =    //a[@id="add-case"]
${MCCPCMCreatedCaseUnderGrid} =    //div[@id="MemberCentralCaseGrid"]//child::span[@class="cell-title-normal" and text()="CPCM _Mar_10_8:59:33 PM"]
${MCCPCMCaseDetailsTitle} =    //h3[@class="humana-green hide-for-medium-down" and text()="Case - Details"]
${MCCPCMLeftNavTaskLink} =    //a[@href="/cgx/Task/CpcmCaseTask"]
${MCCPCMTasksPageheader} =    //div[@id="case-task-grid-container"]//child::h3[@class="humana-green" and text()="Case - Tasks"]
${MCCPCMTasksAddBtn} =    //div[@id="case-task-grid-container"]//child::a[@id="add-new-tasks"]
${MCCPCMAddTaskPopUpTitle} =    //div[@id="Case-add-tasks-modal"]//child::h4[@id="modal-header-title" and text()="Add Task"]
${MCCPCMAddTaskBannerMemberName} =    //div[@id="Case-add-tasks-modal"]//child::div[@class='member-banner']//child::div[@class="small-2 columns"][1]
${MCCPCMAddTaskBannerMemberID} =    //div[@id='Case-add-tasks-modal']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCCPCMAddTaskBannerMemberDOB} =     //div[@id='Case-add-tasks-modal']//child::div[@class='member-banner']//child::div[contains(text(),'Yrs,')]
${MCCPCMAddTaskBannerMemberHomePhone} =    //div[@id='Case-add-tasks-modal']//child::div[@class='member-banner']//child::div[contains(text(),'-')]
${MCCPCMAddTaskBannerMemberStreetAddr} =    //div[@id="Case-add-tasks-modal"]//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]


#View CPCM Task
${MCCPCMCreatedTaskUnderGrid} =   //div[@id="CaseTask-gridContent"]//child::td[text()="Case Level Task"]     #comment field has been used to identify the specific task whic will be new each time
${MCCPCMViewTaskPopUpTitle} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id="view-task"]//child::h4[@id="modal-header-title" and text()="View Task"]
${MCCPCMViewTaskBannerMemberName} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][1]
${MCCPCMViewTaskMemBannerMemberId} =   //div[@data-grid="CaseTask"]//following-sibling::div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCCPCMViewTaskBannerMemberDOB} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id='view-task']//child::div[@class='member-banner']//child::div[contains(text(),'Yrs,')]
${MCCPCMViewTaskBannerMemberHomePhone} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id='view-task']//child::div[@class='member-banner']//child::div[contains(text(),'-')]
${MCCPCMViewTaskBannerMemberStreetAddr} =   //div[@data-grid="CaseTask"]//following-sibling::div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]


#Edit Task(Case Level) Masked fields
${MCCPCMEditTaskBtn} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id="view-task"]//child::a[@id="task-edit-btn"]
${MCCPCMEditTaskPopUpTitle} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id="member-edit-tasks-modal"]//child::h4[@id="modal-header-title" and text()="Edit Task"]
${MCCPCMEditTaskBannerMemberId} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id="member-edit-tasks-modal"]//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCCPCMEditTaskBannerStreetAddr} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id='member-edit-tasks-modal']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCCPCMEditTaskBannerWorkPhn} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id='member-edit-tasks-modal']//child::div[@class='member-banner']//child::div[contains(text(),'-')]


#Change Ownership(Member Central Task) Masked Fields
${MCCPCMViewTaskChngOwnershipBtn} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id="view-task"]//child::a[@id="task-change-ownership-btn"]
${MCCPCMTaskChngOwnershipBannerMemberId} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCCPCMTaskChngOwnershipBannerWorkPhone} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div[contains(text(),'-')]
${MCCPCMTaskChngOwnershipBannerStreetAddr} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCCPCMTaskChngOwnershipPopUpTitle} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id="task-change-ownership"]//child::h4[@id="modal-header-title" and text()="Change Ownership"]


#Set Follow Up Date Taskk (Case Level) Masked Fields
${MCCPCMTaskGridEditBtn} =    //div[@id="case-task-grid-container"]//child::a[@id="edit-tasks-grid" and @class="button"]
${MCCPCMTaskGridChkBox} =    //td[text()="Case Level Task"]//preceding-sibling::td[@class=" checkboxColumn checkboxCell "]
${MCCPCMFollowUpDateTaskBtn} =  //a[@id="button-task-followup-date"]
${MCCPCMFollowUpDateTaskTitle} =    //div[@data-grid="CaseTask"]//following-sibling::div[@id="task-followup-date"]//child::h4[@id="modal-header-title" and text()="Set Follow-up Date"]
${MCTaskGridDoneBtn} =    //div[@id="case-task-grid-container"]//child::ul[@class="button-group right"]//child::a[@id="edit-tasks-grid-done"]

*** Keywords ***
Add Task Screen Masking
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseHeader}
    click element    ${MCCPCMCreatedCaseUnderGrid}
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseDetailsTitle}
    click link    ${MCCPCMLeftNavTaskLink}
    page should contain element    ${MCCPCMTasksPageheader}
    click element    ${MCCPCMTasksAddBtn}
    wait until element is visible    //div[@id="Case-add-tasks-modal"]//child::a[@id="save-new-task-btn"]    10 seconds
    page should contain element    ${MCCPCMAddTaskPopUpTitle}


View Task Screen Masking
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseHeader}
    click element    ${MCCPCMCreatedCaseUnderGrid}
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseDetailsTitle}
    click link    ${MCCPCMLeftNavTaskLink}
    page should contain element    ${MCCPCMTasksPageheader}
    click element    ${MCCPCMCreatedTaskUnderGrid}
    wait until element is visible    ${MCCPCMEditTaskBtn}
    page should contain element    ${MCCPCMViewTaskPopUpTitle}


Edit Task Screen Masking
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseHeader}
    click element    ${MCCPCMCreatedCaseUnderGrid}
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseDetailsTitle}
    click link    ${MCCPCMLeftNavTaskLink}
    page should contain element    ${MCCPCMTasksPageheader}
    sleep  5 seconds
    click element    ${MCCPCMCreatedTaskUnderGrid}
    wait until element is visible    ${MCCPCMEditTaskBtn}
    page should contain element    ${MCCPCMViewTaskPopUpTitle}
    click element    ${MCCPCMEditTaskBtn}
    wait until element is visible    //a[@id="edit-task-save-btn"]
    page should contain element    ${MCCPCMEditTaskPopUpTitle}


Task Change Ownership Screen Mask
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseHeader}
    click element    ${MCCPCMCreatedCaseUnderGrid}
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseDetailsTitle}
    click link    ${MCCPCMLeftNavTaskLink}
    page should contain element    ${MCCPCMTasksPageheader}
    sleep  5 seconds
    click element    ${MCCPCMCreatedTaskUnderGrid}
    wait until element is visible    ${MCCPCMEditTaskBtn}
    page should contain element    ${MCCPCMViewTaskPopUpTitle}
    click element    ${MCCPCMViewTaskChngOwnershipBtn}
    page should contain element    ${MCCPCMTaskChngOwnershipPopUpTitle}


Grid FollowUp Date Task Screen Mask
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseHeader}
    click element    ${MCCPCMCreatedCaseUnderGrid}
    sleep  5 seconds
    page should contain element    ${MCCPCMCaseDetailsTitle}
    click link    ${MCCPCMLeftNavTaskLink}
    page should contain element    ${MCCPCMTasksPageheader}
    sleep  5 seconds
    click element    ${MCCPCMTaskGridEditBtn}
    click element    ${MCCPCMTaskGridChkBox}
    click element    ${MCCPCMFollowUpDateTaskBtn}
    sleep    2 seconds
    page should contain element    ${MCCPCMFollowUpDateTaskTitle}

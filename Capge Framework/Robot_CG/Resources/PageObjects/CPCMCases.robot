*** Settings ***
Library  SeleniumLibrary
Library  ../../CustomLibs/DataCreation.py
Resource    ../Definitions/HumanaGui.robot
Resource    ../Definitions/Common.robot
# Resource    ../../Data/GlobalVariables.robot

*** Variables ***
${CPCMAddButton}    //a[@id="add-case"]
${CPCMCreateCaseScreen}   //h3[@class="humana-green hide-for-medium-down" and text()="Create Case"]
${CPCMDiagCodeSearchEdit}    //input[@id="DiagnosisCodeSearch"]
${CPCMDiagCodeInvalidErrMsg}    //span[@id="DiagnosisCodeSearch-error" and text()="Please enter letters and numbers only"]
${CPCMProcCodeInvalidErrMsg}    //span[@id="ProcedureCodeSearch-error" and text()="Please enter letters and numbers only"]
${CPCMProcCodeSearchEdit}    //input[@id="ProcedureCodeSearch"]
${CPCMBackLink}    //a[@id="create-case-backutton"]

#Requireed Error Field Error Messages
${CPCMClinicalPrgmReqErr}    //span[text()="Clinical Program is required"]
${CPCMCaseTypeReqErr}    //span[text()="Case Type is required"]
${CPCMCaseSrcReqErr}    //span[text()="Case Source is required"]
${CPCMCaseReasonReqErr}    //span[text()="Case Reason is required"]
${CPCMAcuityErrReqErr}    //span[text()="Acuity is required"]
${CPCMParticipateReqErr}   //span[@id='ControlId606-error']
${CPCMSubmitBtn}    //a[@id="button-submit-cpcmcase"]

#Cancel scenario objects
${CPCMRecordsGridCnt}    //span[@id="MemberCentralCaseGrid-Total-span"]

# CPCM Create Form objects
${CPCMClinicalProgram} =  //select[@id="ControlId600"]
${CPCMCaseName} =  //input[@id="ControlId601"]
${CPCMCaseType} =  //select[@id="ControlId602"]
${CPCMCaseSource} =  //select[@id="ControlId603"]
${CPCMCaseReason} =  //select[@id="ControlId604"]
${CPCMAcuity} =  //select[@id="ControlId605"]
${CPCMParticipatingStatus} =  //select[@id="ControlId606"]
${CPCMStratificationLevel} =    //select[@id="ControlId607"]
${CPCMCaseName} =    //input[@id="ControlId601"]
${CPCMCancelLink} =    //a[@id="button-cancel-create-cpcmcase"]
${CPCMNotesEdit} =    //textarea[@id="Notes"]
${CPCMAdmitReasonEdit} =    //textarea[@id="AdmitReason"]
${CPCMSubmitBtn} =    //a[@id="button-submit-cpcmcase"]
${CPCMSuccessMsg} =    //div[contains(text(),"Case details have been saved successfully.")]
${CPCMCaseId} =    //span[@id="CaseId"]
${CPCMCaseStatus} =    //div[@id="Status"]
${CPCMClinicalProgramReflected} =    //div[@id="ControlId600"]
${CPCMCaseSourceReflected} =    //div[@id="ControlId603"]
${CPCMCaseTypeReflected} =    //div[@id="ControlId602"]
${CPCMCaseReasonReflected} =    //div[@id="ControlId604"]
${CPCMAcuityReflected} =    //div[@id="ControlId605"]
${CPCMParticipatingStatusReflected} =    //div[@id="ControlId606"]
${CPCMSatisLevelReflected} =  //div[@id="ControlId607"]
${CPCMAssociatedCarePlan} =   //a[@id="createCarePlanV3"]
${CPCMCaseNameReflected} =    //label[text()="Case Name"]//ancestor::div[@class="small-6 columns"][2]//following-sibling::div[@class="small-6 columns valueField"]
${CPCMCaseStatusReflected} =  //div[@id="Status"]
${CPCMCaseEditBtn} =    //a[@id="button-edit-cpcmcase"]
${CPCMCaseEditSucessMsg} =   //div[contains(text(),"Case details have been updated successfully")]
${CPCMCaseIdReturned} =    None
# Maxlength error Messages
${CPCMCaseNameMaxLenErr} =   //span[@id="ControlId601-error" and text()="Case Name should not exceed 100 characters"]
${CPCMNotesMaxLenErr} =    //span[@id="Notes-error" and text()="Notes should not exceed 1000 characters"]
${CPCMAdmitRasonMaxLenErr} =    //span[@id="AdmitReason-error" and text()="Admit Reason should not exceed 200 characters"]
${CPCMDiagCodeMaxLenErr} =    //span[@id="DiagnosisCodeSearch-error" and text()="Please enter letters and numbers only"]
${CPCMProcCodeMaxLenErr} =    //span[@id="ProcedureCodeSearch-error" and text()="Please enter letters and numbers only"]
${CPCMMaxLength} =  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore

# Care Plan 3.0
${CarePlanCaseID} =    //label[text()="Case ID:"]//parent::div[@class="col-sm-6"]//following-sibling::div[@class="col-sm-6 valueField"]
${CPCMCarePlanCreateBtn} =    //span[@class="humana-green careplanHeadingLabelStyle" and text()=" Create Care Plan "]
${CPCMAddAOFBtn} =    //a[@id="add-aof"]

#    Caompare History screen objects
${ComapreoldCaseTypeValue} =  //div[@class=" small-12 columns casecompare-row" and text()="Case Type"]//following-sibling::div[@class="small-12 columns casecompare-value-row-default comparecase-distinct-val"]//div[@class="small-6 columns casecompare-value-column"][2]
${CompareNewCaseTypeValue} =  //div[@class=" small-12 columns casecompare-row" and text()="Case Type"]//following-sibling::div[@class="small-12 columns casecompare-value-row-default comparecase-distinct-val"]//div[@class="small-6 columns casecompare-value-column"][1]
${CPCMCaseHistoryBtn} =  //a[@id="button-cpcmcase-history"]
${CPCMCaseHistoryScreen} =  //h3[@class="humana-green hide-for-medium-down" and text()="Case History Grid"]
${CPCMCaseHistoryGridCount} =  //div[@id="CaseHistory-Count-div"]
${CPCMCaseHistoryRecodChkBox1} =  //*[@id="CaseHistory"]/table/tbody/tr[1]/td[1]
${CPCMCaseHistoryRecodChkBox2} =  //*[@id="CaseHistory"]/table/tbody/tr[2]/td[1]
${CPCMCaseHistoryCompareBtn} =   //a[@id="button-cmcase-compare"]
${CPCMCaseHistoryBackLink1} =  //a[@id="compare-case-backbutton"]
${CPCMCaseHistoryBackLink2} =  //a[@id="case-history-back-btn"]
${CPCMCaseCompareCPCMCasesScreen} =    //h3[@class="humana-green hide-for-medium-down" and text()="Compare CP CM Cases"]

#Ownweship History related objects
${CPCMOwnershipHistBtn} =    //a[@id="button-cpcmcase-ownerhistory"]
${CPCMOwnershipHistPopUp} =    //h4[@id="modal-header-title" and text()="Ownership History"]
${CPCMOwnershipHistPopUpcloseLink} =    //a[@id="case-ownership-history-close-btn"]
${CPCMPrimaryQueChangBtn} =    //a[@id="PrimaryOwner-change-ownership"]
${CPCMChngOwnershipPopUp} =    //h4[@id="modal-header-title" and text()="Change Ownership"]
${CPCMFindQueueEdit} =    //input[@id="QueueName"]
${CPCMFindQueueBtn} =    //a[@id="QueueNamebtn"]
${CPCMChngOwnershipRecordFound} =    //*[@id="QueueSearchGrid"]/table/tbody/tr/td[1]
${CPCMChngOwnershipPopUpBtn} =    //a[@id="select-btn" and contains(text(),"Change Ownership")]
${CPCMPrimaryQueueName} =    //div[@id="PrimaryOwner_QueueName"]


#Search Diagnosis Scenario objects
${CPCMSearchDiagCodeBtn} =   //a[@id="search-diag-code-btn"]
${CPCMDiagCodeSearchPopUpSearchBtn} =   //a[@id="diagnosis-code-search-btn"]
${CPCMDiagCodeSearchPopUpScreen} =   //h4[@id="modal-header-title" and text()="Diagnosis Code Search"]
${CPCMDiagCodeSearchPopUpcodeEdit} =   //input[@id="Code"]
${CPCMDiagCodeSearchPopUpCodeInvalidErrMsg} =   //span[@id="Code-error" and text()="Please enter letters and numbers only"]
${CPCMDiagCodeSearchPopUpDescEdit} =   //input[@id="FullDescription"]
${CPCMDiagCodeSearchPopUpSearchBtn} =  //a[@id="diagnosis-code-search-btn"]
${CPCMDiagCodeSearchPopUpCancelLink} =    //a[@id="diag-code-search-modal-cancel-btn"]
${CPCMDiagCodeSearchPopupAddBtn} =    //a[@id="add-diagnosis-code-button"]
${CPCMDiagCodeSearchPopUpRequiredfieldErrMsg} =    //span[text()="Please select at least one Diagnosis Code."]
${CPCMDiagCodeSearchPopUpGridRecordFound} =    //*[@id="MedicalCodeSearchGrid"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
${CPCMDiagcodeSearchPopUpSetAsPrimCode} =    //a[@id="set-primary-diag-code-btn"]
${CPCMDiagCodeSearchPopupSetAsSecondCode} =    //a[@id="set-secondary-diag-code-btn"]
${CPCMDiagCoseSearchPopUpCodeResultsTable} =    //div[@id="MedicalCodeSearchGrid"]//table[@class="k-selectable"]
${CPCMDiagCodeSearchPopUpPrimaryResultstable} =    //div[@id="authprimarydiagsearchgrid"]//table[@class="k-selectable"]
${CPCMPrimMedicalCodesTable} =    //div[@id="AuthDirectPrimaryDiagnosisCodeGrid"]//table[@class="k-selectable"]
${CPCMSecondMedicalCodesTable} =    //div[@id="AuthDirectSecondaryDiagnosisCodeGrid"]//table[@class="k-selectable"]
${CPCMDiagCodeSearchPopUpCodeMaxLenErr} =    //span[@id="Code-error" and text()="Please enter letters and numbers only"]
${CPCMDiagCodeSearchPopUpDescMaxLenErr} =    //span[@id="FullDescription-error" and text()="Description must be between 3 and 500 characters"]
${CPCMMedicalCodeAddAsPrimary} =    //a[@id="medical-add-primary-button"]
${CPCMMedicalCodeAddAsSecondary} =    //a[@id="medical-add-secondary-button"]
${CPCMMDiagCodeSearchEdit} =    //input[@id="DiagnosisCodeSearch"]
${CPCMDiagCodeSearchMakePrimaryBtn} =    //div[@id="AuthDirectSecondaryDiagnosisCodeGrid"]//table[@class="k-selectable"]//td[@class="center templateCell maskable"]//img[@align="center"]
${CPCMDiagCodeSearchRemoveErrorSuccessMsg} =    //div[text()="The medical code 'D70.1' has been deleted successfully"]
${CPCMDiagCodeSearchRemoveCodeIcon} =    //a[@class="deleteRowAnchor"]

# Proc Code Objects
${CPCMProcCodeSearchBtn} =    //a[@id="search-procedure-code-btn"]
${CPCMProcCodeSearchPopUp} =    //h4[@id="modal-header-title" and text()="Procedure Code Search"]
${CPCMProcCodeSearchPopUpDescEdit} =    //input[@id="FullDescription"]
${CPCMProcCodeSearchPopUpSearchBtn} =    //a[@id="procedure-code-search-btn"]
${CPCMProcCodeSearchPopUpSetAsProcCodeBtn} =    //a[@id="set-procedure-code-btn"]
${CPCMProcCodeSearchPopUpAddBtn} =    //a[@id="add-procedure-code-button"]
${CPCMProcCodeSearchPopUpResultsTable} =    //div[@id="ProcedureCodeSearchGrid"]//table[@class="k-selectable"]
${CPCMProcCodeSearchPopUpGridRecordFirst} =    //*[@id="ProcedureCodeSearchGrid"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
${CPCMProcCodeSearchPopUpProcCodeResultsTable} =    //div[@id="procedurecodeselectiongrid"]//table[@class="k-selectable"]
${CPCMProcCodeSearchPopUpCancelLink} =    //a[@id="procedure-code-search-modal-cancel-btn"]
${CPCMProcCodeSearchTableViewCase} =    //div[@id="AuthDirectProcedureCodeGrid"]//table[@class="k-selectable"]
${CPCMProcCodeSearchEdit} =    //input[@id="ProcedureCodeSearch"]
${CPCMProcCodeSearchAddBtn} =    //a[@id="ProcedureCodeSearchbtn"]

# Ownership Objects
${CPCMOwnershipPrimQue} =    //div[@id="PrimaryOwner_QueueName"]
${CPCMOwnershipPrimQueChngBtn} =    //a[@id="PrimaryOwner-change-ownership"]
${CPCMOwnershipPopUpTitle} =    //h4[@id="modal-header-title" and text()="Change Ownership"]
${CPCMOwnershipPopUpSearchEdit} =    //input[@id="QueueName"]
${CPCMOwnershipPopUpFindBtn} =    //a[@id="QueueNamebtn"]
${CPCMOwnershipPopUpSearchGrid} =    //div[@id="QueueSearchGrid"]//table[@class="k-selectable"]
${CPCMOwnershipPopUpFirstRecordFoundChkBox} =    //*[@id="QueueSearchGrid"]/table/tbody/tr[1]/td[1]
${CPCMOnwershipPopUpChngOwnBtn} =    //a[@id="select-btn" and contains(text(),"Change Ownership")]
${CPCMOwnershipPopUpCancelLink} =    //a[@id="search-queue-modal-cancel-btn"]
${CPCMOwnershipPopUpMaxlenErr} =    //span[@id="QueueName-error" and text()="Search by Name must be between 3 and 50 characters"]
${CPCMOwnershipTakePrimOwnBtn} =    //a[@id="PrimaryOwner-take-ownership"]
${CPCMOwnershipSecQueChngBtn} =    //a[@id="SecondaryOwner-change-ownership"]
${CPCMOwnershipSecQue} =    //div[@id="SecondaryOwner_QueueName"]
${CPCMOwnershipTakeSecOwnBtn} =    //a[@id="SecondaryOwner-take-ownership"]
${CPCMOwnershipRemoveSecOwnBtn} =    //a[@id="SecondaryOwner-remove-ownership"]

##General Objects
${CPCMDefaultcasestatus} =    //div[@id="Status"]
${CPCMCalenderDatePicker} =    //span[@class="k-icon k-i-calendar"]
${CPCMAssociateAuthBtn} =    //a[@id="btnAssociateAuthorization"]
${CPCMAssociatedAuthCnt} =    //span[@id="associatedAuthCount"]
${CPCMManageAuthCntTitle} =    //h4[@id="modal-header-title" and text()="Associate Authorizations"]
${CPCMManageAuthRecordCheckBox} =    //input[@id="0-CpcmCaseAssociateAuth-checkbox"]
${CPCMManageAuthSubmitBtn} =    //a[@id="submitAuthAssociation"]


###CPCM Notes Ojects
${CPCMNotesNavLink} =    //a[@href="/cgx/Notes/CaseNote/GetCaseNotes"]
${CPCMNotesAddBtn} =    //a[@id="add-notes"]
${CPCMNotesNotesTitle} =    //h3[@class="humana-green" and text()="Case - Notes"]
${CPCMNotesAddNotesMemberIdField} =    //div[@id="member-add-notes-modal"]//div[@class="member-banner"]//input[@id="MemberId"]
${CPCMNotesAddNotesTitle} =    //h4[@class="humana-green center" and text()="Add Note"]
${CPCMNotesAddNoteSaveBtn} =    //a[@id="membersave-note-btn"]
${CPCMNotesAddNoteCaseIdField} =    //div[@id="CaseId"]
${CPCMNotesAddNoteDIRDate} =    //input[@name="LateEntryDate"]
${CPCMNotesAddNoteDIRError} =    //span[text()="The date must be less than or equal to today's date"]
${CPCMNotesAddNoteDepList} =    //select[@id="DepartmentId"]
${CPCMNotesAddNoteSubEdit} =    //input[@id="Subject"]
${CPCMNotesAddNoteMsgEdit} =    //textarea[@id="Message"]
${subject} =    EMPTY
${CPCMNotesAddNoteEditBtn} =    //a[@id="edit-note-btn"]
${CPCMNotesViewNoteDept} =    //div[@id="CaseNotesDepartmentName"]
${CPCMNotesViewNoteDIRDate} =    //div[@id="DisplayLateEntryDate"]
${CPCMNotesViewNoteSub} =    //label[@for="Subject"]//parent::div[@class="small-3 columns"]//following-sibling::div[@class="small-9 columns valueField"]
${CPCMNotesviewNoteMsg} =    //div[@class="small-9 columns valueField paragraph"]
${CPCMNotesViewNoteHistMemIDLabel} =    //div[@id="notes-version-details2"]//label[text()="Member ID"]
${CPCMNotesViewNoteHistMemNameLabel} =    //div[@id="notes-version-details2"]//label[text()="Member Name"]
${CPCMNotesViewNoteHistCaseIDLabel} =    //div[@id="notes-version-details2"]//label[text()="CP CM Case #"]
${CPCMNotesViewNoteHistAssessmentLabel} =    //div[@id="notes-version-details2"]//label[text()="Assessment Name"]
${CPCMNotesViewNoteHistCreatUpdtDttimelabel} =   //div[@id="notes-version-details2"]//label[text()="Created / Updated Date and Time"]
${CPCMNotesViewNoteHistCreatUpByLabel} =    //div[@id="notes-version-details2"]//label[text()="Created / Updated By"]
${CPCMNotesViewNoteHistCarePlanLabel} =    //div[@id="notes-version-details2"]//label[text()="Care Plan Title"]
${CPCMNotesViewNoteHistTitle} =    //h3[@class="humana-green hide-for-medium-down" and text()="Notes History"]
${CPCMNotesHisticon} =    //*[@id="CaseNote"]/div[2]/div[1]/table/tbody/tr[1]/td[6]
${CPCMNotesHistBackBtn} =    //a[@id="notes-history-back-btn"]

#####Case Level Task###########
${CPCMTaskNavLink} =    //a[@href="/cgx/Task/CpcmCaseTask"]
${CPCMTaskTitle} =    //h3[@class="humana-green" and text()="Case - Tasks"]
${CPCMTaskAddBtn} =    //a[@id="add-new-tasks"]
${CPCMTaskfilterBtn} =    //span[@class="i-buttons-web i-filter-web"]
${CPCMTaskAddTaskTitle} =    //h4[@class="humana-green center" and text()="Add Task"]
${CPCMTaskAddTaskCaseIdField} =    //form[@id="add-tasks-form"]//span[@id="CaseId"]
${CPCMTaskAddTaskPrimQue} =    //form[@id="add-tasks-form"]//span[@id="PrimaryQueueName"]
${CPCMTaskAddTaskCase#} =    //form[@id="add-tasks-form"]//div[@id="CpcmCaseNumber"]
${CPCMTaskAddTaskFollowUpDat} =   //input[@id="FollowUpDate"]
${CPCMTaskAddTaskFollowUptime} =    //input[@id="FollowUpTime"]
${CPCMTaskAddTaskComments} =    //textarea[@id='Comments']
${CPCMTaskAddTaskSaveBtn} =    //a[@id="save-new-task-btn"]
${CPCMTaskAddTaskSaveAndAddBtn} =    //a[@id="save-and-add-another-task-btn"]


#Case level Communication Record
${CPCMCommRecordNavLink} =    //a[@href="/cgx/CommRec/CommRec/CpcmCaseCommunicationRecord"]
${CPCMCommRecordTitle} =    //h3[text()="Case - Communication Record"]
${CPCMCommRecordAddBtn} =    //a[@id="add-new-communication-record"]
${CPCMCommRecordCaseId} =    //div[@id="CaseId"]
${CPCMCommRecordRecordType} =    //div[@id="RecordType"]
${CPCMCommRecordUpdatedBy} =    //div[@id="UpdatedBy"]
${CPCMCommRecorddepart} =    //label[text()="Department:"]//parent::div[@class="small-6 columns"]//following-sibling::div[@class="small-6 columns valueField"]
${CPCMCommRecordCaseType} =    //div[@id="CaseType"]

*** Keywords ***
CPCM_Invalid_InvalidaData_Validation
    [Arguments]    ${UseData}
    Member Search    ${UseData}
    Member Selection
    Get Member Details
    set up global variables
    sleep    20 Seconds
    Navigate to CPCM Cases
    click element    ${CPCMAddButton}
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    page should contain element    ${CPCMCreateCaseScreen}
    input text    ${CPCMDiagCodeSearchEdit}    ${InvalidTestDataTextBox}
    sleep    01 Seconds
    click element    //label[@for="ProcedureCodeSearch"]
    sleep    02 Seconds
    element should be visible    ${CPCMDiagCodeInvalidErrMsg}
    input text    ${CPCMProcCodeSearchEdit}    ${InvalidTestDataTextBox}
    sleep    01 Seconds
    click element    //label[@for="ProcedureCodeSearch"]
    element should be visible    ${CPCMProcCodeInvalidErrMsg}
    CPCM_LandOnCPCMHome_Page

CPCM_LandOnCPCMHome_Page
   click element    ${CPCMBackLink}
   wait until element is visible    ${CPCMAddButton}    10 Seconds

CPCM_Invalid_RequiredField_Error
    click element    ${CPCMAddButton}
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    page should contain element    ${CPCMCreateCaseScreen}
    click element    ${CPCMSubmitBtn}
    sleep    02 Seconds
    page should contain element    ${CPCMClinicalPrgmReqErr}
    page should contain element    ${CPCMCaseSrcReqErr}
    page should contain element    ${CPCMCaseReasonReqErr}
    page should contain element    ${CPCMCaseTypeReqErr}
    page should contain element    ${CPCMParticipateReqErr}
    page should contain element    ${CPCMAcuityErrReqErr}
    CPCM_LandOnCPCMHome_Page

CPCM_Valid_Cancel
     [Arguments]    ${UserData}
     sleep    02 Seconds
     ${status} =    run keyword and return status    page should contain element    //span[@class="slick-column-name" and text()="Case Name"]
     ${RecordCountBefore} =    get text    ${CPCMRecordsGridCnt}
     run keyword if    '${status}' == 'False'    Add_Column_To_Grid
     set local variable    ${status}
     click element    ${CPCMAddButton}
     wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
     page should contain element    ${CPCMCreateCaseScreen}
     select from list by label    ${CPCMClinicalProgram}    ${UserData.ClinicalProgram}
     select from list by label    ${CPCMCaseType}    ${UserData.CaseType}
     ${Randomnumber} =    GenerateRandomNumberFiveDigit
     ${CaseName}    set variable    Test CPCM_${Randomnumber}
     input text    ${CPCMCaseName}    ${CaseName}
     select from list by label    ${CPCMCaseSource}    ${UserData.CaseSource}
     select from list by label    ${CPCMCaseReason}    ${UserData.CaseReason}
     select from list by label    ${CPCMAcuity}    ${UserData.Acuity}
     select from list by label    ${CPCMParticipatingStatus}    ${UserData.ParticipatingStatus}
     select from list by label    ${CPCMStratificationLevel}    1
     set local variable    ${CaseName}
     set local variable    ${Randomnumber}
     click element    ${CPCMCancelLink}
     wait until element is visible    //a[@id="button-cancel-changes-yes"]    10 Seconds
     click element    //a[@id="button-cancel-changes-yes"]
     wait until element is visible    ${CPCMAddButton}    10 Seconds
     sleep    05 Seconds
     ${RecordCountAfter} =    get text    ${CPCMRecordsGridCnt}
     log to console    count before ${RecordCountBefore}
     log to console    count after ${RecordCountAfter}
     should be true    '${RecordCountBefore}' == '${RecordCountAfter}'
     log to console    Invalid data box value is ${InvalidTestDataTextBox}

Add_Column_To_Grid
    open context menu    //span[@class="slick-column-name" and text()="Clinical Program"]
    sleep    02 Seconds
    click element    //label[text()="Case Name"]
    sleep    02 Seconds
    click element    //a[@id="btnMemberCentralCaseGridSaveSettings"]
    wait until element is visible    //span[@class="slick-column-name" and text()="Case Name"]    10 Seconds
    sleep    03 Seconds

CPCM_Valid_Maxlength
    click element    ${CPCMAddButton}
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    page should contain element    ${CPCMCreateCaseScreen}
    press key    id:ControlId601    ${CPCMMaxLength}
    input text    ${CPCMNotesEdit}    ${CPCMMaxLength}
    input text  ${CPCMAdmitReasonEdit}    ${CPCMMaxLength}
    input text  ${CPCMDiagCodeSearchEdit}    ${CPCMMaxLength}
    input text  ${CPCMProcCodeSearchEdit}    ${CPCMMaxLength}
    click element    //label[@for="ProcedureCodeSearch"]
    sleep    02 Seconds
    element should be visible    ${CPCMCaseNameMaxLenErr}
    element should be visible    ${CPCMNotesMaxLenErr}
    element should be visible    ${CPCMAdmitRasonMaxLenErr}
    element should be visible    ${CPCMDiagCodeMaxLenErr}
    element should be visible    ${CPCMProcCodeMaxLenErr}
    cpcm_landoncpcmhome_page

CPCM_Valid_Create_CPCM_Record
    [Arguments]    ${UserData}
    click element    ${CPCMAddButton}
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    page should contain element    ${CPCMCreateCaseScreen}
    select from list by label    ${CPCMClinicalProgram}    ${UserData.ClinicalProgram}
    select from list by label    ${CPCMCaseType}    ${UserData.CaseType}
    ${Randomnumber} =    GenerateRandomNumberFiveDigit
    ${CaseName}    set variable    Test CPCM_${Randomnumber}
    input text    ${CPCMCaseName}    ${CaseName}
    select from list by label    ${CPCMCaseSource}    ${UserData.CaseSource}
    select from list by label    ${CPCMCaseReason}    ${UserData.CaseReason}
    select from list by label    ${CPCMAcuity}    ${UserData.Acuity}
    select from list by label    ${CPCMParticipatingStatus}    ${UserData.ParticipatingStatus}
    select from list by label    ${CPCMStratificationLevel}    1
    set local variable    ${CaseName}
    set local variable    ${Randomnumber}
    click element    ${CPCMSubmitBtn}
    wait until element is visible    ${CPCMCaseId}    20 Seconds
    element should be visible    ${CPCMSuccessMsg}
    wait until element is visible    ${CPCMCaseId}    10 Seconds
    element should be visible    ${CPCMCaseId}
    ${CPCMCaseIdReturned} =    get text    ${CPCMCaseId}
    ${CPCMCaseIdReturned} =    strip string    ${CPCMCaseIdReturned}    mode=both
    click element    //a[@id="CaseBtnBack"]
    wait until element is visible    ${CPCMAddButton}    10 Seconds
    click element    //div[@id="MemberCentralCaseGrid"]//span[@class="cell-title-normal" and text()='${CPCMCaseIdReturned}']
    wait until element is visible    ${CPCMCaseEditBtn}    20 Seconds
    element text should be    ${CPCMCaseNameReflected}    ${CaseName}
    element text should be    ${CPCMCaseStatusReflected}    Open
    element text should be    ${cpcmclinicalprogramreflected}   ${UserData.ClinicalProgram}
    element text should be    ${cpcmcasesourcereflected}    ${UserData.CaseSource}
    element text should be    ${CPCMCaseTypeReflected}    ${UserData.CaseType}
    element text should be    ${CPCMCaseReasonReflected}    ${UserData.CaseReason}
    element text should be    ${cpcmparticipatingstatusreflected}    ${UserData.ParticipatingStatus}
    element text should be    ${CPCMAcuityReflected}    ${UserData.Acuity}
    element text should be    ${CPCMSatisLevelReflected}    1
    page should contain element    ${CPCMAssociatedCarePlan}
    set global variable    ${CPCMCaseIdReturned}

Case ID
    Case ID Search    C000103328

CPCM_Valid_Edit_Record
    [Arguments]    ${UserData}
    click element    ${CPCMCaseEditBtn}
    wait until element is visible    ${CPCMCaseName}    20 Seconds
    select from list by label    ${CPCMCaseType}   ${UserData.EditCaseType}
    click element    ${CPCMSubmitBtn}
    wait until element is visible    ${CPCMCaseEditSucessMsg}    20 Seconds
    element should be visible    ${CPCMCaseEditSucessMsg}
    element text should be    ${CPCMCaseTypeReflected}    ${UserData.EditCaseType}

CPCM_Valid_Edit_Cancel_CPCM_Record
    [Arguments]    ${UserData}
    ${OldCaseType} =    get text    ${CPCMCaseTypeReflected}
    ${OldCaseType} =    strip string    ${OldCaseType}    mode=both
    click element    ${CPCMCaseEditBtn}
    wait until element is visible    ${CPCMCaseName}    20 Seconds
    select from list by label    ${CPCMCaseType}   Bariatric
    click element    ${CPCMCancelLink}
    wait until element is visible    //a[@id="button-cancel-changes-yes"]    10 Seconds
    click element    //a[@id="button-cancel-changes-yes"]
    ${NewCaseType} =    get text    ${CPCMCaseTypeReflected}
    ${NewCaseType} =    strip string    ${NewCaseType}    mode=both
    should be equal as strings   ${OldCaseType}    ${NewCaseType}

CPCM_Create_Care_Plan
    click element    ${CPCMAssociatedCarePlan}
    sleep    10 Seconds
    select window    title:Careplan
    wait until element is visible    //span[@class="humana-green careplanHeadingLabelStyle" and text()=" Create Care Plan "]    20 Seconds

CPCM_CaseHistory
    [Arguments]   ${UserData}
    click element    ${CPCMCaseHistoryBtn}
    wait until element is visible    ${cpcmcasehistorygridcount}    20 Seconds
    page should contain element    ${CPCMCaseHistoryScreen}
    sleep    03 Seconds
    click element    ${CPCMCaseHistoryRecodChkBox1}
    sleep    03 Seconds
    click element    ${CPCMCaseHistoryRecodChkBox2}
    sleep    02 Seconds
    click element    ${CPCMCaseHistoryCompareBtn}
    wait until element is visible    ${CPCMCaseCompareCPCMCasesScreen}    20 Seconds
    ${CaseTypeOld} =    get text    ${ComapreoldCaseTypeValue}
    ${CaseTypeNew} =    get text    ${CompareNewCaseTypeValue}
    ${CaseTypeOld} =    strip string    ${CaseTypeOld}    mode=both
    ${CaseTypeNew} =    strip string    ${CaseTypeNew}    mode=both
    should not be equal as strings    ${CaseTypeOld}   ${CaseTypeNew}
    click element    ${CPCMCaseHistoryBackLink1}
    wait until element is visible    ${CPCMCaseHistoryScreen}    20 Seconds
    click element    ${CPCMCaseHistoryBackLink2}
    wait until element is visible    ${CPCMCaseHistoryBtn}    20 Seconds
    set local variable     ${CaseTypeOld}
    set local variable     ${CaseTypeNew}

CPCM_Ownership_History_Count
    [Arguments]    ${Userdata}
    click element    ${CPCMOwnershipHistBtn}
    sleep    03 Seconds
    wait until element is visible    ${CPCMOwnershipHistPopUp}    20 Seconds
    ${OwnershipHistCntOld} =  get element count    //div[@id="caseownershiphistoryGrid-gridContent"]//table[@role="grid"]//tbody//tr
    click element    ${CPCMOwnershipHistPopUpcloseLink}
    sleep    1 Seconds
    click element    ${CPCMCaseEditBtn}
    wait until element is visible    ${CPCMCaseName}    20 Seconds
    click element    ${CPCMPrimaryQueChangBtn}
    wait until element is visible    ${CPCMFindQueueEdit}    20 Seconds
    page should contain element    ${CPCMChngOwnershipPopUp}
    input text    ${CPCMFindQueueEdit}    ${UserData.QueOwner1}
    click element    ${CPCMFindQueueBtn}
    sleep    03 Seconds
    click element    ${CPCMChngOwnershipRecordFound}
    click element    ${CPCMChngOwnershipPopUpBtn}
    wait until element is not visible    ${CPCMChngOwnershipPopUp}  20 Seconds
    element text should be    ${CPCMPrimaryQueueName}    ${UserData.QueOwner1}
    click element    ${CPCMSubmitBtn}
    wait until element is visible    ${CPCMCaseEditBtn}    20 Seconds
    element text should be    //div[@id="PrimaryQueue"]    ${UserData.QueOwner1}
    click element    ${CPCMOwnershipHistBtn}
    sleep   03 Seconds
    ${OwnershipHistCntNew} =  get element count    //div[@id="caseownershiphistoryGrid-gridContent"]//table[@role="grid"]//tbody//tr
    ${status} =   evaluate    ${OwnershipHistCntNew} > ${OwnershipHistCntOld}
    log to console    ${status}
    table cell should contain    //div[@id="caseownershiphistoryGrid-gridContent"]//table[@role="grid"]    2    1    ${UserData.QueOwner1}
    click element    ${CPCMOwnershipHistPopUpcloseLink}
    sleep    1 Seconds

    click element    ${CPCMCaseEditBtn}
    wait until element is visible    ${CPCMCaseName}    20 Seconds
    CPCM_Valid_Ownership_Take_Prim_Ownership
    click element    ${CPCMSubmitBtn}
    wait until element is visible    ${CPCMCaseEditBtn}    20 Seconds

    set local variable    ${status}
    set local variable    ${OwnershipHistCntNew}
    set local variable    ${OwnershipHistCntOld}

CPCM_Invalid_SearchDiag_InvalidaDataValdiation
    [Arguments]    ${UseData}
    click element    //a[@id="CaseBtnBack"]
    sleep  05 Seconds
    wait until element is visible    ${CPCMAddButton}    20 Seconds
    click element    ${CPCMAddButton}
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    click element    ${CPCMSearchDiagCodeBtn}
    wait until element is visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    20 Seconds
    page should contain element    ${CPCMDiagCodeSearchPopUpScreen}
    input text    ${CPCMDiagCodeSearchPopUpcodeEdit}    ${InvalidTestDataTextBox}
    input text    ${CPCMDiagCodeSearchPopUpDescEdit}    ${InvalidTestDataTextBox}
    element should be visible    ${CPCMDiagCodeSearchPopUpCodeInvalidErrMsg}
    click element    ${CPCMDiagCodeSearchPopUpCancelLink}
    wait until element is not visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    10 Seconds

CPCM_Invalid_SearchDiag_RequiredFields
    [Arguments]    ${UseData}
    click element    ${CPCMSearchDiagCodeBtn}
    wait until element is visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    20 Seconds
    page should contain element    ${CPCMDiagCodeSearchPopUpScreen}
    click element    ${CPCMDiagCodeSearchPopupAddBtn}
    sleep    02 Seconds
    element should be visible    ${CPCMDiagCodeSearchPopUpRequiredfieldErrMsg}
    click element    ${CPCMDiagCodeSearchPopUpCancelLink}
    wait until element is not visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    10 Seconds

CPCM_Valid_SearchDiag_Cancel
    [Arguments]    ${UseData}
    sleep    02 Seconds
    click element    ${CPCMSearchDiagCodeBtn}
    wait until element is visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    20 Seconds
    page should contain element    ${CPCMDiagCodeSearchPopUpScreen}
    input text    ${CPCMDiagCodeSearchPopUpDescEdit}    Cancer
    click element    ${CPCMDiagCodeSearchPopUpSearchBtn}
    wait until element is visible    ${CPCMDiagCoseSearchPopUpCodeResultsTable}    20 Seconds
    ${PrimDiagCode} =    get table cell    ${CPCMDiagCoseSearchPopUpCodeResultsTable}    1    2
    ${CodeDesc} =    get table cell    ${CPCMDiagCoseSearchPopUpCodeResultsTable}    1    3
    log to console    ${PrimDiagCode} In Upper table
    log to console    ${CodeDesc} In Upper table
    click element    ${CPCMDiagCodeSearchPopUpGridRecordFound}
    sleep    02 Seconds
    click element    ${CPCMDiagcodeSearchPopUpSetAsPrimCode}
    sleep    02 Seconds
    ${PrimDiagCodeAdded} =    get table cell    ${CPCMDiagCodeSearchPopUpPrimaryResultstable}    2    1
    ${CodeDescAdded} =    get table cell    ${CPCMDiagCodeSearchPopUpPrimaryResultstable}    2    2
    log to console    ${PrimDiagCodeAdded} In below table
    log to console    ${CodeDescAdded} In below table
    should be equal as strings     ${PrimDiagCodeAdded}    ${PrimDiagCode}
    should be equal as strings     ${CodeDescAdded}    ${CodeDesc}
    click element    ${CPCMDiagCodeSearchPopUpCancelLink}
    wait until element is not visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    10 Seconds
    page should not contain element    ${CPCMPrimMedicalCodesTable}
    set local variable    ${PrimDiagCode}
    set local variable    ${CodeDesc}
    set local variable    ${PrimDiagCodeAdded}
    set local variable    ${CodeDescAdded}

CPCM_Valid_SearchDiag_Add
    [Arguments]    ${UseData}
    sleep    02 Seconds
    click element    ${CPCMSearchDiagCodeBtn}
    wait until element is visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    20 Seconds
    page should contain element    ${CPCMDiagCodeSearchPopUpScreen}
    input text    ${CPCMDiagCodeSearchPopUpDescEdit}    Cancer
    click element    ${CPCMDiagCodeSearchPopUpSearchBtn}
    wait until element is visible    ${CPCMDiagCoseSearchPopUpCodeResultsTable}    20 Seconds
    ${PrimDiagCode} =    get table cell    ${CPCMDiagCoseSearchPopUpCodeResultsTable}    1    2
    ${CodeDesc} =    get table cell    ${CPCMDiagCoseSearchPopUpCodeResultsTable}    1    3
    log to console    ${PrimDiagCode} In Upper table
    log to console    ${CodeDesc} In Upper table
    click element    ${CPCMDiagCodeSearchPopUpGridRecordFound}
    sleep    02 Seconds
    click element    ${CPCMDiagcodeSearchPopUpSetAsPrimCode}
    sleep    02 Seconds
    ${PrimDiagCodeAdded} =    get table cell    ${CPCMDiagCodeSearchPopUpPrimaryResultstable}    2    1
    ${CodeDescAdded} =    get table cell    ${CPCMDiagCodeSearchPopUpPrimaryResultstable}    2    2
    log to console    ${PrimDiagCodeAdded} In below table
    log to console    ${CodeDescAdded} In below table
    should be equal as strings     ${PrimDiagCodeAdded}    ${PrimDiagCode}
    should be equal as strings     ${CodeDescAdded}    ${CodeDesc}
    click element    ${CPCMDiagCodeSearchPopupAddBtn}
    wait until element is not visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    10 Seconds
    ${CodeReflectedOnViewCase} =    get table cell    ${CPCMPrimMedicalCodesTable}    2    1
    ${CodeDescReflectedonViewCase} =    get table cell    ${CPCMPrimMedicalCodesTable}    2    2
    log to console    ${CodeReflectedOnViewCase} on View Case
    log to console     ${CodeDescReflectedonViewCase} on view Case
    should be equal as strings     ${PrimDiagCode}    ${CodeReflectedOnViewCase}
    should be equal as strings    ${CodeDesc}    ${CodeDescReflectedonViewCase}
    set local variable    ${PrimDiagCode}
    set local variable    ${CodeDesc}
    set local variable    ${CodeReflectedOnViewCase}
    set local variable    ${CodeDescReflectedonViewCase}
    set local variable    ${PrimDiagCodeAdded}
    set local variable    ${CodeDescAdded}


CPCM_Valid_SearchDiag_MaxLen
    [Arguments]    ${UseData}
    sleep    02 Seconds
    click element    ${CPCMSearchDiagCodeBtn}
    wait until element is visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    20 Seconds
    page should contain element    ${CPCMDiagCodeSearchPopUpScreen}
    input text    ${CPCMDiagCodeSearchPopUpcodeEdit}    ${CPCMMaxLength}
    input text    ${CPCMDiagCodeSearchPopUpDescEdit}    ${CPCMMaxLength}
    sleep    02 Seconds
    click element    //label[@for="FullDescription"]
    element should be visible    ${CPCMDiagCodeSearchPopUpCodeMaxLenErr}
    element should be visible    ${CPCMDiagCodeSearchPopUpDescMaxLenErr}
    click element    ${CPCMDiagCodeSearchPopUpCancelLink}
    wait until element is not visible    ${CPCMDiagCodeSearchPopUpcodeEdit}    10 Seconds

CPCM_Valid_SearchDiag_AddAsPrimary
    [Arguments]    ${UserData}
    reload page
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    input text    ${CPCMDiagCodeSearchEdit}    D70.1
    click element    ${CPCMMedicalCodeAddAsPrimary}
    wait until element is visible    //div[text()="The medical code 'D70.1' has been added successfully"]    20 Seconds
    page should contain element    //span[@class="boldFont" and text()="Primary Diagnosis Code:"]
    ${CodeReflectedOnViewCase} =    get table cell    ${CPCMPrimMedicalCodesTable}    2    1
    log to console    ${CodeReflectedOnViewCase}
    should be equal as strings    ${CodeReflectedOnViewCase}    D70.1

CPCM_Valid_SearchDiag_AddAsSecondary
    [Arguments]    ${UserData}
    reload page
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    input text    ${CPCMDiagCodeSearchEdit}    D70.1
    click element    ${CPCMMedicalCodeAddAsSecondary}
    wait until element is visible    //div[text()="The medical code 'D70.1' has been added successfully"]    20 Seconds
    page should contain element    //span[@class="boldFont" and text()="Secondary Diagnosis Codes: "]
    ${CodeReflectedOnViewCase} =    get table cell    ${CPCMSecondMedicalCodesTable}    2    1
    log to console    ${CodeReflectedOnViewCase}
    should be equal as strings    ${CodeReflectedOnViewCase}    D70.1

CPCM_Valid_SearchDiag_MakeAsPrimary
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_AddAsSecondary    ${UserData}
    click element    ${CPCMDiagCodeSearchMakePrimaryBtn}
    wait until element is visible    //span[@class="boldFont" and text()="Primary Diagnosis Code:"]    20 Seconds
    page should not contain element    page should contain element    //span[@class="boldFont" and text()="Secondary Diagnosis Codes: "]
    element should not be visible    ${CPCMDiagCodeSearchMakePrimaryBtn}

CPCM_Valid_SearchDiag_RemoveSecondary
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_AddAsSecondary    ${UserData}
    sleep    02 Seconds
    click element    ${CPCMDiagCodeSearchRemoveCodeIcon}
    wait until element is visible    ${CPCMDiagCodeSearchRemoveErrorSuccessMsg}
    page should not contain element  //span[@class="boldFont" and text()="Secondary Diagnosis Codes: "]
    page should not contain element    ${CPCMSecondMedicalCodesTable}

CPCM_Valid_SearchDiag_RemovePrimary
    [Arguments]    ${UserData}
    CPCM_Valid_SearchDiag_AddAsPrimary   ${UserData}
    sleep    02 Seconds
    click element    ${CPCMDiagCodeSearchRemoveCodeIcon}
    wait until element is visible    ${CPCMDiagCodeSearchRemoveErrorSuccessMsg}
    page should not contain element  //span[@class="boldFont" and text()="Secondary Diagnosis Codes: "]
    page should not contain element    ${CPCMPrimMedicalCodesTable}

CPCM_Valid_Search_ProcCode_Cancel
    [Arguments]    ${UserData}
    click element    ${CPCMProcCodeSearchBtn}
    wait until element is visible    ${CPCMProcCodeSearchEdit}    20 Seconds
    page should contain element    ${CPCMProcCodeSearchPopUp}
    input text    ${CPCMProcCodeSearchPopUpDescEdit}    asthma
    click element    ${CPCMProcCodeSearchPopUpSearchBtn}
    sleep   02 Seconds
    wait until element is visible    ${CPCMProcCodeSearchPopUpResultsTable}    20 Seconds
    ${PrimProcCode} =    get table cell    ${CPCMProcCodeSearchPopUpResultsTable}    1    2
    ${CodeDesc} =    get table cell    ${CPCMProcCodeSearchPopUpResultsTable}    1    3
    log to console    ${PrimProcCode} In Upper table
    log to console    ${CodeDesc} In Upper table
    click element    ${CPCMProcCodeSearchPopUpGridRecordFirst}
    sleep    02 Seconds
    click element    ${CPCMProcCodeSearchPopUpSetAsProcCodeBtn}
    sleep    02 Seconds
    ${ProcCodeAdded} =    get table cell    ${CPCMProcCodeSearchPopUpProcCodeResultsTable}    2    1
    ${CodeDescAdded} =    get table cell    ${CPCMProcCodeSearchPopUpProcCodeResultsTable}    2    2
    log to console    ${ProcCodeAdded} In below table
    log to console    ${CodeDescAdded} In below table
    should be equal as strings    ${ProcCodeAdded}     ${PrimProcCode}
    should be equal as strings    ${CodeDescAdded}     ${CodeDesc}
    click element    ${CPCMProcCodeSearchPopUpCancelLink}
    wait until element is not visible    ${CPCMProcCodeSearchPopUpDescEdit}    10 Seconds
    page should not contain element    ${CPCMProcCodeSearchTableViewCase}
    set local variable    ${PrimProcCode}
    set local variable    ${CodeDesc}
    set local variable    ${ProcCodeAdded}
    set local variable    ${CodeDescAdded}

CPCM_Valid_Search_ProcCode_AddOnPopUp
    [Arguments]    ${UserData}
    click element    ${CPCMProcCodeSearchBtn}
    wait until element is visible    ${CPCMProcCodeSearchEdit}    20 Seconds
    page should contain element    ${CPCMProcCodeSearchPopUp}
    input text    ${CPCMProcCodeSearchPopUpDescEdit}    asthma
    click element    ${CPCMProcCodeSearchPopUpSearchBtn}
    sleep   02 Seconds
    wait until element is visible    ${CPCMProcCodeSearchPopUpResultsTable}    20 Seconds
    ${PrimProcCode} =    get table cell    ${CPCMProcCodeSearchPopUpResultsTable}    1    2
    ${CodeDesc} =    get table cell    ${CPCMProcCodeSearchPopUpResultsTable}    1    3
    log to console    ${PrimProcCode} In Upper table
    log to console    ${CodeDesc} In Upper table
    click element    ${CPCMProcCodeSearchPopUpGridRecordFirst}
    sleep    02 Seconds
    click element    ${CPCMProcCodeSearchPopUpSetAsProcCodeBtn}
    sleep    02 Seconds
    ${ProcCodeAdded} =    get table cell    ${CPCMProcCodeSearchPopUpProcCodeResultsTable}    2    1
    ${CodeDescAdded} =    get table cell    ${CPCMProcCodeSearchPopUpProcCodeResultsTable}    2    2
    log to console    ${ProcCodeAdded} In below table
    log to console    ${CodeDescAdded} In below table
    should be equal as strings    ${ProcCodeAdded}     ${PrimProcCode}
    should be equal as strings    ${CodeDescAdded}     ${CodeDesc}
    click element    ${CPCMProcCodeSearchPopUpAddBtn}
    wait until element is not visible    ${CPCMProcCodeSearchPopUpDescEdit}    10 Seconds
    wait until element is visible    ${CPCMProcCodeSearchTableViewCase}
    ${CodeReflectedOnViewCase} =    get table cell    ${CPCMProcCodeSearchTableViewCase}    2    1
    ${CodeDescReflectedonViewCase} =    get table cell    ${CPCMProcCodeSearchTableViewCase}    2    2
    log to console    ${CodeReflectedOnViewCase} on View Case
    log to console     ${CodeDescReflectedonViewCase} on view Case
    should be equal as strings     ${ProcCodeAdded}    ${CodeReflectedOnViewCase}
    should be equal as strings    ${CodeDescAdded}    ${CodeDescReflectedonViewCase}
    set local variable    ${PrimProcCode}
    set local variable    ${CodeDesc}
    set local variable    ${ProcCodeAdded}
    set local variable    ${CodeDescAdded}
    set local variable    ${CodeReflectedOnViewCase}
    set local variable    ${CodeDescReflectedonViewCase}

CPCM_Valid_Search_ProcCode_AddOnCreateCase
    [Arguments]    ${UserData}
    click element    //div[@id="AuthDirectProcedureCodeGrid-gridContent"]//td[@title="Delete"]
    sleep    03 Seconds
    input text    ${CPCMProcCodeSearchEdit}    1038F
    click element    ${CPCMProcCodeSearchAddBtn}
    wait until element is visible    //div[text()="The medical code '1038F' has been added successfully"]
    wait until element is visible    ${CPCMProcCodeSearchTableViewCase}
    ${CodeReflectedOnViewCase} =    get table cell    ${CPCMProcCodeSearchTableViewCase}    2    1
    log to console    ${CodeReflectedOnViewCase}
    should be equal as strings    ${CodeReflectedOnViewCase}    1038F

CPCM_Valid_Ownership_Cancel
    [Arguments]    ${UserData}
    reload page
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    ${PrimQueName} =    get text    ${CPCMOwnershipPrimQue}
    click element    ${CPCMOwnershipPrimQueChngBtn}
    wait until element is visible    ${CPCMOwnershipPopUpSearchEdit}
    page should contain element    ${CPCMOwnershipPopUpTitle}
    input text    ${CPCMOwnershipPopUpSearchEdit}    ${UserData.QueName}
    click element    ${CPCMOwnershipPopUpFindBtn}
    wait until element is visible    ${CPCMOwnershipPopUpSearchGrid}    20 Seconds
    click element    ${CPCMOwnershipPopUpFirstRecordFoundChkBox}
    sleep    02 Seconds
    ${QueNameShownInGrid} =    get table cell    ${CPCMOwnershipPopUpSearchGrid}    2    2
    log to console    ${QueNameShownInGrid}
    log to console     ${PrimQueName}
    should contain    ${QueNameShownInGrid}    ${UserData.QueName}
    click element    ${CPCMOwnershipPopUpCancelLink}
    wait until element is not visible    ${CPCMOwnershipPopUpSearchEdit}    10 Seconds
    element text should be    ${CPCMOwnershipPrimQue}    ${PrimQueName}
    set local variable     ${QueNameShownInGrid}
    set local variable    ${PrimQueName}

CPCM_Valid_Ownership_MaxLength
    [Arguments]    ${UserData}
    ${PrimQueName} =    get text    ${CPCMOwnershipPrimQue}
    click element    ${CPCMOwnershipPrimQueChngBtn}
    wait until element is visible    ${CPCMOwnershipPopUpSearchEdit}
    page should contain element    ${CPCMOwnershipPopUpTitle}
    input text     ${CPCMOwnershipPopUpSearchEdit}    ${CPCMMaxLength}
    click element    ${CPCMOwnershipPopUpTitle}
    element should be visible    ${CPCMOwnershipPopUpMaxlenErr}
    click element    ${CPCMOwnershipPopUpCancelLink}
    wait until element is not visible    ${CPCMOwnershipPopUpSearchEdit}    10 Seconds

CPCM_Valid_Ownership_PrimQue_Change
    [Arguments]    ${UserData}
    ${PrimQueNameOnCaseOwnershipSection} =    get text    ${CPCMOwnershipPrimQue}
    run keyword if    '${UserData.Scenario}' == 'PrimaryQueueChange' or '${UserData.Scenario}' == 'TakePrimaryOwnership'   click element    ${CPCMOwnershipPrimQueChngBtn}
    ...    ELSE IF  '${UserData.Scenario}' == 'SecondaryQueueChange' or '${UserData.Scenario}' == 'TakeSecondaryOwnership'   click element    ${CPCMOwnershipSecQueChngBtn}
    wait until element is visible    ${CPCMOwnershipPopUpSearchEdit}    20 Seconds
    sleep    02 Seconds
    page should contain element    ${CPCMOwnershipPopUpTitle}
    input text    ${CPCMOwnershipPopUpSearchEdit}    ${UserData.QueName}
    click element    ${CPCMOwnershipPopUpFindBtn}
    wait until element is visible    ${CPCMOwnershipPopUpSearchGrid}    20 Seconds
    click element    ${CPCMOwnershipPopUpFirstRecordFoundChkBox}
    sleep    02 Seconds
    ${QueNameShownInGrid} =   get table cell    ${CPCMOwnershipPopUpSearchGrid}    2    2
    log to console    ${QueNameShownInGrid}
    log to console    ${PrimQueNameOnCaseOwnershipSection}
    should contain    ${QueNameShownInGrid}    ${UserData.QueName}
    set focus to element    ${CPCMChngOwnershipPopUpBtn}
    sleep    02 Seconds
    click element     ${CPCMChngOwnershipPopUpBtn}
    wait until element is visible    //div[@id="PrimaryOwner_QueueName"]    10 Seconds
    element should be visible    //div[text()="Ownership has been successfully changed for 1 Case(s)."]
    run keyword if    '${UserData.Scenario}' == 'PrimaryQueueChange' or '${UserData.Scenario}' == 'TakePrimaryOwnership'  element text should be    ${CPCMOwnershipPrimQue}    ${QueNameShownInGrid}
    ...    ELSE IF  '${UserData.Scenario}' == 'SecondaryQueueChange' or '${UserData.Scenario}' == 'TakeSecondaryOwnership'   element text should be    ${CPCMOwnershipSecQue}    ${QueNameShownInGrid}
    set local variable     ${QueNameShownInGrid}
    set local variable    ${PrimQueNameOnCaseOwnershipSection}

CPCM_Valid_Ownership_Take_Prim_Ownership
    click element    ${CPCMOwnershipTakePrimOwnBtn}
    wait until element is visible    //div[text()="Ownership has been successfully taken for 1 Case(s)."]
    element text should be    ${CPCMOwnershipPrimQue}    ${UniversalLoggedInUserName}

CPCM_Valid_Ownership_Take_Sec_Ownership
    reload page
    sleep    05 Seconds
    &{TempUserData}    create dictionary    QueName=Geoff   Scenario=PrimaryQueueChange
    CPCM_Valid_Ownership_PrimQue_Change    ${TempUserData}
    click element    ${CPCMOwnershipTakeSecOwnBtn}
    wait until element is visible    //div[text()="Ownership has been successfully taken for 1 Case(s)."]
    element text should be    ${CPCMOwnershipSecQue}    ${universalloggedinusername}
    set local variable    &{TempUserData}
    sleep    02 Seconds
    CPCM_Valid_Ownership_Remove_Sec_Ownership    ${universalloggedinusername}

CPCM_Valid_Ownership_Remove_Sec_Ownership
    [Arguments]    ${UserData}
    log to console   ${UserData}
    click element    ${CPCMOwnershipRemoveSecOwnBtn}
    wait until element is visible    //div[text()="Ownership has been successfully removed for 1 Case(s)."]
    element should not be visible    //div[@id="SecondaryOwner_QueueName" and text()='${UserData}']
    CPCM_Valid_Ownership_Take_Prim_Ownership

CPCM_Default_Case_Status
    [Arguments]    ${UserData}
    reload page
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    element text should be    ${CPCMDefaultcasestatus}    Open
    CPCM_Follow_up_date_calendar_picker

CPCM_Follow_up_date_calendar_picker
    click element    ${CPCMCalenderDatePicker}
    Sleep    02 Seconds
    element should be visible    //input[@id="ControlId608" and @aria-expanded="true"]
    click element    ${CPCMCalenderDatePicker}

CPCM_Associated_Auth_Count
    click element    ${CPCMAssociateAuthBtn}
    wait until element is visible    ${CPCMManageAuthCntTitle}    20 Seconds
    click element    //*[@id="CpcmCaseAssociateAuth"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
    sleep    02 Seconds
    click element    ${CPCMManageAuthSubmitBtn}
    wait until element is not visible    ${CPCMManageAuthCntTitle}    05 Seconds
    element text should be    ${CPCMAssociatedAuthCnt}    1
    CPCM_Default_name_of_Primary_queue

CPCM_Default_name_of_Primary_queue
    log to console    ${UniversalLoggedInUserName}
    element text should be   ${CPCMPrimaryQueueName}   ${UniversalLoggedInUserName}

CPCM_Notes_Verify_Banner_Displays
    cpcm_landoncpcmhome_page
    click element   //div[@id="MemberCentralCaseGrid"]//span[@class="cell-title-normal" and text()='${CPCMCaseIdReturned}']
    wait until element is visible    //span[@id="CaseId" and contains(text(),'${CPCMCaseIdReturned}')]    20 Seconds
    click element    ${CPCMNotesNavLink}
    wait until element is visible    ${CPCMNotesAddBtn}    20 Seconds
    page should contain element    ${CPCMNotesNotesTitle}
    click element    ${CPCMNotesAddBtn}
    sleep    03 Seconds
    wait until element is visible    ${CPCMNotesAddNoteSaveBtn}    20 Seconds
    page should contain element    ${CPCMNotesAddNotesTitle}
    element attribute value should be    ${CPCMNotesAddNotesMemberIdField}    value    ${UniversalMemberID}
    element text should be    ${CPCMNotesAddNoteCaseIdField}    ${CPCMCaseIdReturned}
    element attribute value should be    //span[@id="select2-NoteTypeCode-container"]    title    Case
    click element    //label[@for="LateEntry"]
    ${DIRDateToday} =     get current date    result_format=%m/%d/%Y
    ${DIRdateFuture} =    Add Time To Date  ${DIRDateToday}    30 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    log to console    ${DIRdateFuture}
    input text    ${CPCMNotesAddNoteDIRDate}    ${DIRdateFuture}
    sleep    02 Seconds
    click element    ${CPCMNotesAddNotesTitle}
    element should be visible    ${CPCMNotesAddNoteDIRError}
    input text    ${CPCMNotesAddNoteDIRDate}    ${DIRDateToday}
    click element    //a[@id="member-add-notes-modal-cancel-btn"]

CPCM_Verfiy_Add_Save_Record_Confirmation_Message
    [Arguments]    ${UserData}
    click element    ${CPCMNotesNavLink}
    wait until element is visible    ${CPCMNotesAddBtn}    20 Seconds
    page should contain element    ${CPCMNotesNotesTitle}
    click element    ${CPCMNotesAddBtn}
    sleep    03 Seconds
    wait until element is visible    ${CPCMNotesAddNoteSaveBtn}    20 Seconds
    page should contain element    ${CPCMNotesAddNotesTitle}
    select from list by label    ${CPCMNotesAddNoteDepList}   ${UserData.CaseNoteDept}
    click element    //label[@for="LateEntry"]
    ${DIRDateToday} =     get current date    result_format=%m/%d/%Y
    input text    ${CPCMNotesAddNoteDIRDate}    ${DIRDateToday}
    ${time} =    get current date    result_format=%I:%M:%S %p
    input text    //input[@name="LateEntryTime"]    ${time}
    ${RndNumber} =    GenerateRandomNumberFiveDigit
    ${subject} =  catenate    ${UserData.CaseNoteSub}    ${RndNumber}
    input text    ${CPCMNotesAddNoteSubEdit}    ${subject}
    input text    ${CPCMNotesAddNoteMsgEdit}    ${UserData.CaseNoteMsg}
    click element    ${CPCMNotesAddNoteSaveBtn}
    wait until element is visible    //div[@id="CaseNote-gridContent"]//table[@role="grid"]//td[text()='${subject}']    20 Seconds
    element should be visible    //div[text()="Note '${subject}' has been added successfully"]
    set global variable    ${subject}

CPCM_Very_Edit_Save_Confirmation_Message
    [Arguments]    ${UserData}
    click element    //div[@id="CaseNote-gridContent"]//table[@role="grid"]//td[text()='${subject}']
    wait until element is visible    ${CPCMNotesAddNoteEditBtn}    20 Seconds
    click element    ${CPCMNotesAddNoteEditBtn}
    wait until element is visible    ${CPCMNotesAddNoteDepList}    20 Seconds
    select from list by label    ${CPCMNotesAddNoteDepList}   ${UserData.CaseNoteDeptNew}
    ${DIRDateToday} =     get current date    result_format=%m/%d/%Y
    ${DIRdatePast} =    Add Time To Date  ${DIRDateToday}    -2 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    log to console    ${DIRdatePast}
    input text    ${CPCMNotesAddNoteDIRDate}    ${DIRdatePast}
    ${RndNumber} =    GenerateRandomNumberFiveDigit
    ${subject} =  catenate    ${UserData.CaseNoteSub}    ${RndNumber}
    input text    ${CPCMNotesAddNoteSubEdit}    ${subject}
    input text    ${CPCMNotesAddNoteMsgEdit}    ${UserData.CaseNoteMsgNew}
    click element    //a[@id="save-note-btn"]
    wait until element is visible    //div[@id="CaseNote-gridContent"]//table[@role="grid"]//td[text()='${subject}']    20 Seconds
    element should be visible    //div[text()="Note '${subject}' has been modified successfully"]
    click element    //div[@id="CaseNote-gridContent"]//table[@role="grid"]//td[text()='${subject}']
    wait until element is visible    ${CPCMNotesAddNoteEditBtn}    20 Seconds
    element text should be    ${CPCMNotesViewNoteDept}    ${UserData.CaseNoteDeptNew}
    element text should be    ${CPCMNotesViewNoteSub}    ${subject}
    element text should be    ${CPCMNotesviewNoteMsg}    ${UserData.CaseNoteMsgNew}
    element text should be    ${CPCMNotesViewNoteDIRDate}    ${DIRdatePast}
    click element    //a[@id="view-note-close-btn"]
    wait until element is visible    //div[@id="CaseNote-gridContent"]//table[@role="grid"]//td[text()='${subject}']    20 Seconds

CPCM_Verify_user_is_taken_to_Note_History_page
    click element     ${CPCMNotesHisticon}
    sleep    03 Seconds
    wait until element is visible    ${CPCMNotesViewNoteHistCaseIDLabel}    20 Seconds
    page should contain element    ${CPCMNotesViewNoteHistTitle}
    page should contain element    ${CPCMNotesViewNoteHistMemNameLabel}
    page should contain element    ${CPCMNotesViewNoteHistMemIDLabel}
    page should contain element    ${CPCMNotesViewNoteHistAssessmentLabel}
    page should contain element    ${CPCMNotesViewNoteHistCreatUpdtDttimelabel}
    page should contain element    ${CPCMNotesViewNoteHistCreatUpByLabel}
    page should contain element    ${CPCMNotesViewNoteHistCreatUpByLabel}
    page should contain element    //div[text()="Created / Updated By"]
    page should contain element    //div[text()="Created / Updated Date"]
    ${HistRecdVal} =    get text    //*[@id="noteshistorygrid"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
    ${HistRecdVal} =    strip string     ${HistRecdVal}    mode=both
    click element   //*[@id="noteshistorygrid"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
    wait until element is visible    //h4[text()="Note (Historical View)"]    20 Seconds
    element text should be    //div[@id="view-note"]//div[@id="DisplayUpdatedDateTime"]    ${HistRecdVal}
    click element    //a[@id="view-note-close-btn"]
    sleep    03 Seconds
    wait until element is visible    ${CPCMNotesViewNoteHistCaseIDLabel}    20 Seconds
    click element    ${CPCMNotesHistBackBtn}
    wait until element is visible    ${CPCMNotesHisticon}    20 Seconds

CPCM_Tasks_Valid_Tasks_Add_Save_Validation
    [Arguments]    ${UserData}
    click element   ${CPCMTaskNavLink}
    wait until element is visible   ${CPCMTaskAddBtn}    10 Seconds
    click element    ${CPCMTaskAddBtn}
    sleep    03 Seconds
    wait until element is visible   //span[@aria-labelledby="select2-PriorityType-container"]    20 Seconds
    element text should be    ${CPCMTaskAddTaskCase#}    ${CPCMCaseIdReturned}
    element text should be    ${CPCMTaskAddTaskCaseIdField}    ${CPCMCaseIdReturned}
    element text should be    ${CPCMTaskAddTaskPrimQue}    ${UniversalLoggedInUserName}
    click element    //span[@aria-labelledby="select2-PriorityType-container"]
    click element    //ul[@id='select2-PriorityType-results']//li[text()='${UserData.CaseTaskPriority}']
    select from list by label   //select[@name="TypeId"]    ${UserData.CaseTaskType}
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    ${task_Tomorrow} =      add time to date    ${task_Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    ${CPCMTaskAddTaskFollowUpDat}    ${task_Tomorrow}
    ${time} =    get current date    result_format=%I:%M:%S %p
    input text    ${CPCMTaskAddTaskFollowUptime}    ${time}
    input text    ${CPCMTaskAddTaskComments}    ${UserData.CaseTaskComments}
    click element   ${CPCMTaskAddTaskSaveBtn}
    sleep    03 Seconds
    page should contain    Task '${UserData.CaseTaskType}' has been added successfully
    page should contain element    //div[@id="CaseTask-gridContent"]//td[@class="maskable" and text()='${UserData.CaseTaskType}'][1]

CPCM_Tasks_Add_Save-Add_Validation
    [Arguments]    ${UserData}
    click element    ${CPCMTaskAddBtn}
    sleep    03 Seconds
    wait until element is visible   //span[@aria-labelledby="select2-PriorityType-container"]    20 Seconds
    element text should be    ${CPCMTaskAddTaskCase#}    ${CPCMCaseIdReturned}
    element text should be    ${CPCMTaskAddTaskCaseIdField}    ${CPCMCaseIdReturned}
    element text should be    ${CPCMTaskAddTaskPrimQue}    ${UniversalLoggedInUserName}
    click element    //span[@aria-labelledby="select2-PriorityType-container"]
    click element    //ul[@id='select2-PriorityType-results']//li[text()='${UserData.CaseTaskPriority}']
    select from list by label   //select[@name="TypeId"]    ${UserData.CaseTaskType2}
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    ${task_Tomorrow} =      add time to date    ${task_Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    ${CPCMTaskAddTaskFollowUpDat}    ${task_Tomorrow}
    ${time} =    get current date    result_format=%I:%M:%S %p
    input text    ${CPCMTaskAddTaskFollowUptime}    ${time}
    input text    ${CPCMTaskAddTaskComments}    ${UserData.CaseTaskComments}
    click element   ${CPCMTaskAddTaskSaveAndAddBtn}
    sleep    03 Seconds
    wait until element is visible    //div[@id="AddtaskAlertMessage"]//div[text()="Task '${UserData.CaseTaskType2}' has been added successfully"]    20 Seconds
    element should be visible    //div[@id="AddtaskAlertMessage"]//div[text()="Task '${UserData.CaseTaskType2}' has been added successfully"]
    page should contain element   ${CPCMTaskAddTaskSaveAndAddBtn}
    click element    //a[@id="Case-add-tasks-modal-cancel-btn"]
    wait until element is visible     //div[@id="CaseTask-gridContent"]//td[@class="maskable" and text()='${UserData.CaseTaskType2}'][1]    20 Seconds

CPCM_Valid_Edit_Save_Existing_Record_Validation
    [Arguments]    ${UserData}
    sleep    05 Seconds
    wait until element is visible    ${CPCMTaskAddBtn}    20 Seconds
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[14]/div/a/img
    sleep    03 Seconds
    ${PrevComments} =   get text   //span[@class="colHeadTxt" and @id="Comment"]//following-sibling::span[@class="colValTxt"]
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    wait until element is visible   //a[@id="task-edit-btn"]    20 Seconds
    click element   //a[@id="task-edit-btn"]
    sleep    03 Seconds
    wait until element is visible    //textarea[@id="Comments"]    60 Seconds
    input text    //textarea[@id="Comments"]    ${UserData.CaseTaskEditComment}
    sleep    05 Seconds
    click element    //a[@id="edit-task-save-btn"]
    wait until element is visible    //div[text()="Task '${UserData.CaseTaskType2}' has been modified successfully"]    20 Seconds
    sleep    03 Seconds
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[14]/div/a/img
    ${UpdatedComments} =    get text    //span[@class="colHeadTxt" and @id="Comment"]//following-sibling::span[@class="colValTxt"]
    ${UpdatedComments} =    strip string    ${UpdatedComments}    mode=both
    should be equal as strings    ${UpdatedComments}    ${UserData.CaseTaskEditComment}

CPCM_ChangeOwnerShip_Validation
    [Arguments]    ${UserData}
    set focus to element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    wait until element is visible    //a[@id="task-edit-btn"]    60 Seconds
    element text should be    //div[@id="QueueNameAutoComplete"]    ${UniversalLoggedInUserName}
    click element    //a[@id="task-change-ownership-btn"]
    sleep    03 Seconds
    wait until element is visible    //input[@id="QueueName"]    20 Seconds
    input text    //input[@id="QueueName"]    ${UserData.CaseTaskQueChng}
    sleep    03 Seconds
    click element    //a[@id="QueueNamebtn"]
    sleep    03 Seconds
    click element    //*[@id="QueueSearchGrid"]/table/tbody/tr/td[1]
    sleep    02 Seconds
    click element    //a[@id="button-change-ownership"]
    sleep    05 Seconds
    wait until element is visible    //span[text()=" Ownership has been successfully changed for 1 tasks "]    20 Seconds
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    wait until element is visible    //a[@id="task-edit-btn"]    20 Seconds
    element text should be    //div[@id="QueueNameAutoComplete"]    ${UserData.CaseTaskQueChng}
    click element    //a[@id="view-task-close-btn"]
    sleep    05 Seconds

CPCM_TakeOwnerShip_Validation
    [Arguments]    ${UserData}
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    wait until element is visible    //a[@id="task-edit-btn"]    20 Seconds
    click element    //a[@id="task-take-ownership-btn"]
    wait until element is visible    //span[text()=" Ownership has been successfully taken for 1 tasks "]    20 Seconds
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    wait until element is visible    //a[@id="task-edit-btn"]    20 Seconds
    element text should be    //div[@id="QueueNameAutoComplete"]   ${UniversalLoggedInUserName}
    click element    //a[@id="view-task-close-btn"]
    sleep    05 Seconds

CPCM_Set FollowUP_Validation
    [Arguments]    ${UserData}
    click element    //a[@id="edit-tasks-grid"]
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
    sleep    03 Seconds
    click element    //a[@id="button-task-followup-date"]
    wait until element is visible    //input[@id="FollowUpDate"]    20 Seconds
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    ${DateUpdated} =      add time to date    ${task_Today}   3 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    //input[@id="FollowUpDate"]    ${DateUpdated}
    input text    //textarea[@id="Reason"]    Test Reason
    click element    //a[@id="button-set-followUp-date"]
    wait until element is visible    //span[text()=" Follow-up date has been successfully updated for 1 tasks "]    20 Seconds
    click element    //a[@id="edit-tasks-grid-done"]
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    wait until element is visible    //a[@id="task-edit-btn"]    20 Seconds
    element text should be    //div[@id="FollowUpDate"]    ${DateUpdated}
    click element    //a[@id="view-task-close-btn"]
    sleep    05 Seconds

CPCM_History_Validation
    [Arguments]    ${UserData}
    sleep    05 Seconds
    click element   //div[@id="CaseTask-gridContent"]//table//tr[1]//td[13]
    wait until element is visible    //a[@id="show-audit-trial-btn"]    20 Seconds
    page should contain element    //h3[@class="humana-green left hide-for-medium" and text()="Task History"]
    click element   //a[@id="show-audit-trial-btn"]
    sleep    05 Seconds
    ${RowCountPrev} =    get element count    //div[@id="TasksHistoryGrid"]//table//tr
    click element    //a[@id="tasks-history-back-btn"]
    wait until element is visible    //div[@id="CaseTask-gridContent"]//table//tr[1]//td[13]    20 Seconds
    log to console    ${RowCountPrev}
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    wait until element is visible    //a[@id="task-edit-btn"]    20 Seconds
    click element    //a[@id="task-edit-btn"]
    sleep    03 Seconds
    wait until element is visible    //textarea[@id="Comments"]    20 Second
    sleep    05 Seconds
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    ${DateUpdated} =      add time to date    ${task_Today}   5 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    //input[@id="FollowUpDate"]    ${DateUpdated}
    sleep    05 seconds
    click element    //a[@id="edit-task-save-btn"]
    wait until element is visible    //div[text()="Task '${UserData.CaseTaskType2}' has been modified successfully"]    20 Seconds
    sleep    03 Seconds
    click element    //div[@id="CaseTask-gridContent"]//table//tr[1]//td[13]
    wait until element is visible    //a[@id="show-audit-trial-btn"]    20 Seconds
    click element    //a[@id="show-audit-trial-btn"]
    sleep    05 Seconds
    ${RowCountAfter} =    get element count    //div[@id="TasksHistoryGrid"]//table//tr
    click element    //a[@id="tasks-history-back-btn"]
    wait until element is visible    //div[@id="CaseTask-gridContent"]//table//tr[1]//td[13]    20 Seconds
    log to console    ${RowCountAfter}
    ${Diff} =  Evaluate   ${RowCountAfter} - ${RowCountPrev}
    ${Diff} =  convert to number    ${Diff}
    should be equal as numbers    ${Diff}    1
    log to console    ${Diff}

CPCM_QuickComplete_Validation
    [Arguments]    ${UserData}
    click element    //a[@id="edit-tasks-grid"]
    sleep    01 Seconds
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
    sleep    03 Seconds
    click element    //a[@id="button-task-quick-complete"]
    wait until element is visible    //a[@id="button-quick-complete"]    20 Seconds
    sleep    02 Seconds
    page should contain element    //h4[text()="Quick Complete"]
    click element    //a[@id="button-quick-complete"]
    wait until element is visible    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]    20 Seconds
    page should contain element    //span[text()=" 1 tasks completed successfully "]
    click element    //a[@id="edit-tasks-grid-done"]
    sleep    05 Seconds
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[text()='${UserData.CaseTaskType2}'][1]
    sleep    03 Seconds
    wait until element is visible    //div[@id="TypeDescription"]    20 Seconds
    page should not contain element    //a[@id="task-edit-btn"]
    click element    //a[@id="view-task-close-btn"]
    sleep    05 Seconds

CPCM_Verify_Items_are_Pre_Populated
    [Arguments]    ${UserData}
    click element    ${CPCMCommRecordNavLink}
    wait until element is visible    ${CPCMCommRecordAddBtn}    20 Seconds
    page should contain element    ${CPCMCommRecordTitle}
    click element    ${CPCMCommRecordAddBtn}
    wait until element is visible    ${CPCMCommRecordCaseId}    20 Seconds
    element text should be    ${CPCMCommRecordCaseId}    ${CPCMCaseIdReturned}
    element text should be    ${CPCMCommRecordCaseType}    Acute Case Manager-Utilization Management
    element text should be    ${CPCMCommRecordRecordType}    Case
    element text should be    ${CPCMCommRecordUpdatedBy}    ${UniversalLoggedInUserName}
    element text should be    ${CPCMCommRecorddepart}    ICS

CPCM_Verify_Type_Ahead_for_Inbound
    [Arguments]    ${UserData}
    wait until element is visible    ${CPCMCommRecordCaseId}    20 Seconds
    select from list by label    //select[@name="ControlId48"]    Inbound
    set focus to element    //select[@name="ControlId62"]
    sleep    02 Seconds
    click element    //span[@class="select2 select2-container select2-container--default select2-container--focus"]//ul[@class="select2-selection__rendered"]
    input text   //span[@aria-owns="select2-ControlId62-results"]//input[@role="textbox"]    Acute
    ${contactResults} =   get webelements    //li[contains(@id,"select2-ControlId62-result") and @role="treeitem"]
    FOR  ${element}    IN    @{contactResults}
        log to console  ${element.text}
        ${Search} =    split string    ${element.text}    ${SPACE}
        should be equal as strings    ${Search}[0]    Acute
        log to console    ${Search}
    END

CPCM_Verify_Type_Ahead_for_Outbound
    [Arguments]    ${UserData}
    reload page
    wait until element is visible     //select[@name="ControlId48"]    20 Seconds
    select from list by label    //select[@name="ControlId48"]    Outbound
    set focus to element    //select[@name="ControlId63"]
    sleep    02 Seconds
    click element    //span[contains(@class,"select2 select2-container select2-container--default select2-container")]
    input text   //span[contains(@aria-owns,"select2-ControlId63-results")]//input[@type="search"]    Acute
    ${contactResults} =   get webelements    //li[contains(@id,"select2-ControlId63-result") and @role="treeitem"]
    FOR  ${element}    IN    @{contactResults}
        log to console  ${element.text}
        ${Search} =    split string    ${element.text}    ${SPACE}
        should be equal as strings    ${Search}[0]    Acute
        log to console    ${Search}
    END

CPCM_Verify_Type_Ahead_for_Search
    reload page
    wait until element is visible     //select[@name="ControlId48"]    20 Seconds
    select from list by label    //select[@name="ControlId48"]    Research
    set focus to element    //select[@name="ControlId214"]
    sleep    02 Seconds
    click element   //span[contains(@class,"select2 select2-container select2-container--default")]//span[@class="select2-selection select2-selection--multiple"]
    input text    //span[@class="select2-selection select2-selection--multiple"]//input[@type="search"]    Acute
    ${contactResults} =   get webelements    //li[contains(@id,"select2-ControlId63-result") and @role="treeitem"]
    FOR  ${element}    IN    @{contactResults}
        log to console  ${element.text}
        ${Search} =    split string    ${element.text}    ${SPACE}
        should be equal as strings    ${Search}[0]    Acute
        log to console    ${Search}
    END

CPCM_Verify_Type_Ahead_for_Outbound_CommRecord
    reload page
    wait until element is visible     //select[@name="ControlId48"]    20 Seconds
    select from list by label    //select[@name="ControlId48"]    Outbound
    sleep    02 Seconds
    click element    //label[@for="ControlId69"]
    sleep    02 Seconds
    press keys    //label[@for="ControlId69"]    Acute
    ${contactResults} =   get webelements    //li[contains(@id,"select2-ControlId69-result") and @role="treeitem"]
    FOR  ${element}    IN    @{contactResults}
        log to console  ${element.text}
        ${Search} =    split string    ${element.text}    ${SPACE}
        should be equal as strings    ${Search}[0]    Acute
        log to console    ${Search}
    END

CPCM_Create_Comm_Record
    [Arguments]    ${UserData}
    wait until element is visible    ${CPCMCommRecordCaseId}    20 Seconds
    input text    //input[@id="ContactName"]    ${UserData.CaseCommContactName}
    input text    //input[@id="ContactNumber"]    ${UserData.CaseCommContactNum}
    select from list by label    //select[@name="ControlId48"]    ${UserData.CaseCommComType}
    select from list by label    //select[@name="ControlId49"]    ${UserData.CaseCommContactMethod}
    select from list by label    //select[@name="ControlId52"]    ${UserData.CaseCommContacttype}
    click element    //label[@for="ControlId56-radio-1-YE0330"]
    sleep    02 Seconds
    ${prov1}    Get WebElement    //input[@id="checkbox-ControlId57-PR2180"]//following::label[@for="checkbox-ControlId57-PR2180"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${prov1}

    ${prov2}    Get WebElement    //label[@for="checkbox-ControlId57-VO2630"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${prov2}

    ${prov3}    Get WebElement    //label[@for="checkbox-ControlId58-ME1350"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${prov3}

    ${prov4}    Get WebElement     //label[@for="checkbox-ControlId58-ME1490"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${prov4}

    click element    //label[@for="ControlId60-radio-1-YE0330"]
    select from list by label    //select[@name="ControlId61"]    ${UserData.CaseCommCallOut}
    select from list by label    //select[@name="ControlId62"]    ${UserData.CaseCommContactRes}
    select from list by label    //select[@name="ControlId68"]    ${UserData.CaseCommDesc}
    select from list by label    //select[@name="ControlId72"]    ${UserData.CaseCommFollowUp}
    input text    //textarea[@id="ControlId74"]    Case Level Comm Record
    click element    //a[@id="btn-save-CommRec"]
    wait until element is visible    //div[text()="Communication Record details saved successfully."]    20 Seconds
    sleep    05 Seconds
    element text should be    //div[@id="CaseCommunicationRecord-gridContent"]//table//tr[1]//td[4]    ${UserData.CaseCommComType}

CPCM_Edit_Comm_Record
    [Arguments]    ${UserData}
    click element    //div[@id="CaseCommunicationRecord-gridContent"]//table//tr[1]//td[4]
    wait until element is visible    //a[@id="edit-commRec"]    20 Seconds
    click element    //a[@id="edit-commRec"]
    wait until element is visible    //select[@id="ReasonForCorrection"]    20 Seconds
    input text    //input[@id="ContactNumber"]    ${UserData.CaseCommNewContact}
    select from list by label    //select[@name="ReasonForCorrection"]    ${UserData.CaseCommReason}
    click element    //a[@id="btn-save-CommRec"]
    wait until element is visible    //div[text()="Communication Record was successfully updated."]    20 Seconds
    sleep    05 Seconds
    click element    //a[@id="edit-commRec"]
    wait until element is visible    //select[@id="ReasonForCorrection"]    20 Seconds
    element attribute value should be    //input[@id="ContactNumber"]    value    ${UserData.CaseCommNewContact}
    click element    //a[@id="btn-Cancel-Create-CommRec"]
    sleep    02 Seconds
    click element    //a[@id="button-cancel-changes-yes"]
    wait until element is visible    //a[@id="edit-commRec"]    20 Seconds
    sleep    03 Seconds
    click element    //u[text()="Back"]
    wait until element is visible    //*[@id="CaseCommunicationRecord"]//table//tbody//tr[1]/td[10]//a[@class="viewHistoryAnchor "]    20 Seconds
    sleep    03 Seconds

CPCM_Comm_Record_History
    [Arguments]    ${UserData}
    click element    //*[@id="CaseCommunicationRecord"]//table//tbody//tr[1]/td[10]//a[@class="viewHistoryAnchor "]
    wait until element is visible    //*[@id="CommunicationRecordHistoryGrid"]/table/tbody/tr[1]/td[1]    20 Seconds
    page should contain element    //h3[text()="Communication Record History"]
    click element    //*[@id="CommunicationRecordHistoryGrid"]/table/tbody/tr[1]/td[1]
    sleep    02 Seconds
    click element    //*[@id="CommunicationRecordHistoryGrid"]/table/tbody/tr[2]/td[1]
    sleep    02 Seconds
    click element    //a[@id="btnCompareCommRec"]
    wait until element is visible    //u[text()="Contact Information"]    20 Seconds
    page should contain element    //h3[text()="Compare Communication Records"]
    element text should be    //div[text()="Contact Number"]//following::div[@class="small-6 columns casecompare-value-column comparecase-distinct-val data-distinct=true"][1]    ${UserData.CaseCommNewContact}
    element text should be    //div[text()="Contact Number"]//following::div[@class="small-6 columns casecompare-value-column comparecase-distinct-val data-distinct=true"][2]    ${UserData.CaseCommContactNum}
    click element    //u[text()="Back"]
    wait until element is visible    //*[@id="CommunicationRecordHistoryGrid"]/table/tbody/tr[1]/td[1]    20 Seconds
    click element    //u[text()="Back"]
    wait until element is visible    //*[@id="CaseCommunicationRecord"]//table//tbody//tr[1]/td[10]//a[@class="viewHistoryAnchor "]    20 Seconds
    sleep    03 Seconds

CPCM_Comm_Record_View_Call_OutComes
    click element    //b[text()="View Call Outcomes from CGX 1.0"]
    wait until element is visible    //h4[text()="CGX 1.0 Call Outcomes"]    20 Seconds
    click element    //a[@id="Comm-Call-Out-Comes-close-btn"]
    sleep    03 Seconds
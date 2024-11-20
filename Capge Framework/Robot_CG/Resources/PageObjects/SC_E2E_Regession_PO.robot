*** Settings ***
Documentation  This script is used to Create Authorization
Library    OperatingSystem
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Library  ../../CustomLibs/DataCreation.py

Resource  ../Definitions/HumanaGui.robot
Resource  ../PageObjects/MCD_RegressionPO.robot



*** Variables ***
${AuthId_Path} =    //span[@id="AuthId"]
#${AuthID_Value} =    EMPTY
${TasknavigationinCPCMcase} =    //a[@href='/cgx/Task/CpcmCaseTask']
${SelectingTask} =    //td[text()='Inpatient Admission']
${Priority} =    //input[@id='JustificationId']//following::div[@id='Priority']
${TaskType} =    //div[@id='TypeDescription']
${TaskFollowUpDate} =    //div[@id='FollowUpDate']
#${TaskFollowUpTime} =    //div[@id='FollowUpTime']
${TaskQueueName} =    //div[@id='QueueNameAutoComplete']
${TaskChangeDescription} =    //div[@id='TaskDetailComments-gridContent']//table//tbody/tr[1]/td[3]
${TaskSubject} =    //label[text()='Subject']/following::div[1]

*** Keywords ***

Validate fields Case Level
    [Arguments]    ${UserData}
    click element    ${TasknavigationinCPCMcase}
    sleep    4s
    page should contain element    //div[@id='CaseTask-gridContent']
##    click element    ${SelectingTask}
    click element    //td[contains(text(),'${UserData.AuthID_Value}')]    #selecting perticular task
    sleep    3s
    wait until page contains    View Task
    run keyword if    '${UserData.Priority}' != '${EMPTY}'    element should contain    ${Priority}    ${UserData.Priority}
    element should contain    ${TaskType}    ${UserData.TaskType}
    run keyword if    '${UserData.FollowupDate}' != '${EMPTY}'    element should contain    ${TaskFollowUpDate}    ${UserData.FollowupDate}
    page should contain element    //div[@class="bottom-divider editTaskHeaderDetails"]//*[contains(text(),'${UserData.Source}')]
    element should contain    ${TaskQueueName}    ${UserData.Quenename}
    log to console    ${UserData.Subject} ${UserData.AuthID_Value}
    element should contain    ${TaskSubject}    ${UserData.Subject} ${UserData.AuthID_Value}

Get Auth Value after Submission
    [Arguments]    ${UserData}
    wait until element is visible    ${AuthId_Path}    30s
    ${UserData.AuthID_Value} =    get text    ${AuthId_Path}
#    set global variable    ${AuthID_Value}
    ${UserData.AuthID_Value} =    strip string    ${UserData.AuthID_Value}    mode=both
    log to console    ${UserData.AuthID_Value}

Task Level Validation after Submitting Auth
    [Arguments]    ${UserData}
    click element    //span[contains(text(),'${UserData.CaseID}')]
    Validate fields Case Level    ${UserData}

Validate TaskLevel Description for TC_SC_E2E_IPAuth_FU_AprovedStatus_01
    [Arguments]    ${UserData}
    ${CurrentDate} =    Get Current Date    result_format=%m-%d-%Y
    scroll element into view    ${TaskChangeDescription}
    page should contain element    //*[@class="maskable" and contains(text(),'Member was admitted with ${UserData.AdmissionType} on ${CurrentDate} from Authorization ${UserData.AuthID_Value}. Review authorizations and take appropriate action based on process.')]

Validate Description for TC_SC_E2E_IPAuth_FU_AprovedStatus_Chk_Rank_02
    [Arguments]    ${UserData}
    ${CurrentDate} =    Get Current Date    result_format=%m-%d-%Y
    ${DischargeDate_1} =        Add Time To Date  ${CurrentDate}    -1 days   date_format=%m-%d-%Y    result_format=%m-%d-%Y
    log to console    ${CurrentDate}
    scroll element into view    ${TaskChangeDescription}
#    ${UserData.DischargeDis}    replace string    ${UserData.DischargeDis}    ${space}    ${EMPTY}
#    @{Dis_dispos}  create list    split string    ${UserData.DischargeDis}    -
#@{Dis_dispos}[0]-@{Dis_dispos}[1]
#    ${UserData.DischargeDis} =    strip string    ${UserData.DischargeDis}    characters=
    page should contain element    //*[@class="maskable" and contains(text(),'Member had an ${UserData.AdmissionType} and now was discharged on ${DischargeDate_1} with ${UserData.DischargeDis} and RPM ${Actual_Priority}. From Auth ID - ${UserData.AuthID_Value}')]
#    page should contain element    //*[@class="maskable" and contains(text(),'Member had an ${UserData.AdmissionType} and now was discharged on ${DischargeDate_1} with ')]
#    page should contain element    //*[@class="maskable" and contains(text(),'and RPM ${UserData.Priority}. From Auth ID - ${UserData.AuthID_Value}')]

*** Variables ***
${Edit_MedicalCode} =    //a[@id="edit-ip-medical-code-partial" and contains(text(),'Edit')]
${Link_MedicalCode} =    //div[@id="left-navAuth"]//u[text()='Medical Codes']
${Remove_PROC_Code} =    //div[@id="AuthDirectProcedureCodeGrid"]//div/img
${Edit_SubmitAuth} =    //a[@id="edit-submit-authorization" and text()='Submit Auth']
${Link_BusinessRule} =    //div[@id="left-navAuth"]//u[text()='Business Rules']

*** Keywords ***
SC E2E Observation Rule 04
    set selenium implicit wait    20s
    wait until page contains    Authorization - Details    30s
    wait until element is visible    ${Link_MedicalCode}    20s
    click element    ${Link_MedicalCode}
    page should contain element    //div[@id="AuthDirectProcedureCodeGrid"]/table/tbody/tr/td[contains(text(),'G0378')]    30s
    wait until element is visible    ${Edit_MedicalCode}    20s
    click element    ${Edit_MedicalCode}
    wait until element is visible    ${Remove_PROC_Code}    30s
    click element    ${Remove_PROC_Code}
    wait until element is visible    ${Edit_SubmitAuth}    30s
    click element    ${Edit_SubmitAuth}

Validate Busines Rules for SC E2E Observation Rule 04
    wait until element is visible    ${Link_BusinessRule}    30s
    click element    ${Link_BusinessRule}
    page should contain element    //div[@id="BuinessRulesGrid"]//td[contains(text(),'Medicaid Potential Observation Case')]
    sleep    1s
    page should contain element    //div[@id="BuinessRulesGrid"]//td[contains(text(),'SC Medicaid PH Inpatient')]

Handle Popups after submiting Auth
    sleep    4s
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    click element   ${MemChoice3}
    ${DuplicateConfirm} =    Run Keyword And Return Status   page should contain link    Yes, Continue
    run keyword if  ${DuplicateConfirm}  Confirm the Duplicate
    sleep    1 Second
    ${CommunicationRec} =    Run Keyword And Return Status   page should contain link    Not Now
    run keyword if  ${CommunicationRec}  Confirm the Communication

*** Variables ***
${Menu_IPM} =    (//span[@class="hide-for-medium-down" and text()='Menu'])[1]
${FolloupDate_1}
${FolloupDate_2}
${FolloupDate_3}
${Actual_Priority}

*** Keywords ***
Task Level Validate Priority based on Rank After Submiting Auth
    [Arguments]    ${UserData}
    ${priority_chk} =    get text    (//*[@id="Priority"])[2]
    set local variable    ${priority_chk}
    ${priority_chk} =    strip string    ${priority_chk}    mode=both
    log to console    ${priority_chk}
    ${FollpupDate_chk} =    get text    ${TaskFollowUpDate}
    set local variable    ${FollpupDate_chk}
    ${FollpupDate_chk} =    strip string    ${FollpupDate_chk}    mode=both
    log to console    ${FollpupDate_chk}
    click element    //*[@id="view-task-close-btn"]/div/span
    wait until page contains    Case - Tasks
    set selenium implicit wait    20s
    wait until page contains element    //div[@id="imgRxEligibleRight"]//following::a[1]
    sleep    1s
    click element    //div[@id="imgRxEligibleRight"]//following::a[1]
    wait until element is visible    //*[@id="imp-link"]/span[text()='IMP 2.0']    10s
    click element    //*[@id="imp-link"]/span[text()='IMP 2.0']
    switch window    url=https://${INSTANCE}-carehub.humana.com/imp/    30s
    sleep    10s
    wait until page contains element    ${Menu_IPM}
    click element    ${Menu_IPM}
    wait until element is visible    //*[@id="li-HealthRiskScore"]/a
    click element    //*[@id="li-HealthRiskScore"]/a     #health Risk Score
    wait until page contains    Health Risk Score    10s
    #${UserData.AuthID_Value}
    ${Rank_Score} =    get text    (//div[@class="ui-widget-content slick-row even"]//div[@class="slick-cell l2 r2"])[1]/span
    set local variable    ${Rank_Score}
    ${Rank_Score} =    strip string    ${Rank_Score}    mode=both
    log to console    ${Rank_Score}
    ${Actual_Priority} =    set variable if   ${Rank_Score}<154    Low
    ...    ${Rank_Score}<170    Medium    High
    set global variable     ${Actual_Priority}
    log to console    ${Actual_Priority}
    should be equal as strings    ${priority_chk}    ${Actual_Priority}

    ${Day} =    get current date    result_format=%A
    log to console    ${Day}
    run keyword if    '${Day}'=='Friday'    Increese All Folloup Dates BY 2
    ...    ELSE IF    '${Day}'=='Thursday'    Increese Folloup Dates 2and3 BY 2
    ...    ELSE IF    '${Day}'=='Wednesday'    Increese 3rd Folloup Date BY 2
    ...    ELSE    Folliwup Date with Week Days

    ${Actual_FolloupDate} =    set variable if   '${Actual_Priority}'=='Low'    ${FolloupDate_3}
    ...    '${Actual_Priority}'=='Medium'    ${FolloupDate_2}    ${FolloupDate_1}
    log to console    ${Actual_FolloupDate}
    should be equal as strings    ${FollpupDate_chk}    ${Actual_FolloupDate}
    switch window    url=https://qa2-carehub.humana.com/cgx/Task/CpcmCaseTask    30s
    sleep    10s
    click element    //td[contains(text(),'${UserData.AuthID_Value}')]    #selecting perticular task
    sleep    3s

Increese Folloup Dates 2and3 BY 2
    ${FolloupDate_1} =    Get Nth Date From Current Date    +1
    ${FolloupDate_2} =    Get Nth Date From Current Date    +4
    ${FolloupDate_3} =    Get Nth Date From Current Date    +5
    set global variable   ${FolloupDate_1}
    set global variable   ${FolloupDate_2}
    set global variable   ${FolloupDate_3}

Increese All Folloup Dates BY 2
    ${FolloupDate_1} =    Get Nth Date From Current Date    +3
    ${FolloupDate_2} =    Get Nth Date From Current Date    +4
    ${FolloupDate_3} =    Get Nth Date From Current Date    +5
    set global variable   ${FolloupDate_1}
    set global variable   ${FolloupDate_2}
    set global variable   ${FolloupDate_3}

Increese 3rd Folloup Date BY 2
    ${FolloupDate_1} =    Get Nth Date From Current Date    +1
    ${FolloupDate_2} =    Get Nth Date From Current Date    +2
    ${FolloupDate_3} =    Get Nth Date From Current Date    +5
    set global variable   ${FolloupDate_1}
    set global variable   ${FolloupDate_2}
    set global variable   ${FolloupDate_3}

Folliwup Date with Week Days
    ${FolloupDate_1} =    Get Nth Date From Current Date    +1
    ${FolloupDate_2} =    Get Nth Date From Current Date    +2
    ${FolloupDate_3} =    Get Nth Date From Current Date    +3

Get Nth Date From Current Date
    [Arguments]    ${n}
    ${CurrentDate} =    Get Current Date    result_format=%m/%d/%Y
    ${FolloupDate} =        Add Time To Date  ${CurrentDate}    ${n} days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    [Return]    ${FolloupDate}

Selecting CPCM Case
   set selenium implicit wait    10s
   click element  //span[text()='Medicaid Case Management (MCM)']
   wait until page contains element   //span[@id='CaseId']

*** Variables ***
${CPCM_CPCMCommunication} =   //a[@href='/cgx/CommRec/CommRec/CpcmCaseCommunicationRecord']
${CPCM_AddCommunicationbuttonUndercaselevel} =  //span[normalize-space()='Add']
${CPCM_CommunicationType} =   //select[@id='ControlId3550']
${CPCM_ContactMethod} =  //select[@id='ControlId3552']
${CPCM_ContactType} =  //select[@id='ControlId3555']
${CPCM_ContactResult} =  //select[@id='ControlId3565']
${CPCM_ContactAttemptNumber} =  //select[@id='ControlId3569']
${CPCM_CommunicationDescription} =  //select[@id='ControlId3571']
${CPCM_FollowUpWithMember} =  //select[@id='ControlId3575']
${CPCM_SaveCommincationRecord} =   //a[normalize-space()='Submit']

*** Keywords ***
Navigate to Communication record under CPCM case
      set selenium implicit wait    10s
      click element  ${CPCM_CPCMCommunication}
      wait until page contains   Case - Communication Record  30s
      wait until page contains element   ${CPCM_AddCommunicationbuttonUndercaselevel}

Create Outbound Communication record under cpcm Case level
    [Arguments]  ${UserData}
    set selenium implicit wait    10s
    click element  ${CPCM_AddCommunicationbuttonUndercaselevel}
    wait until page contains    Create Communication Record  30s
    select from list by label   ${CPCM_CommunicationType}   ${UserData.CommunicationType}
    wait until page contains element    ${CPCM_ContactMethod}    30s
    select from list by label   ${CPCM_ContactMethod}   ${UserData.ContactMethod}
    select from list by label   ${CPCM_ContactType}   ${UserData.ContactType}
    select from list by label   ${CPCM_ContactResult}   ${UserData.ContactResult}
    select from list by label   ${CPCM_ContactAttemptNumber}   ${UserData.ContactAttemptNumber}
    @{CommunicationDescriptionvalues}    Get List Items   ${CPCM_CommunicationDescription}
    List Should contain value   ${CommunicationDescriptionvalues}   ${UserData.CommunicationDescription}
    @{CommunicationDescriptionvalues}    ConvertList_to_Upper    ${CommunicationDescriptionvalues}
    @{CopyValues}   Copy List   ${CommunicationDescriptionvalues}
    log to console    ${CommunicationDescriptionvalues}
    log to console    ${CopyValues}
#    sort list    ${CopyValues}
    @{CopyValue_1}    sort Assc   ${CopyValues}
    log     ${CopyValue_1}
    #log to console     ${CopyValues}
    lists should be equal     ${CopyValue_1}   ${CommunicationDescriptionvalues}
    select from list by label   ${CPCM_CommunicationDescription}   ${UserData.CommunicationDescription}
    select from list by label   ${CPCM_FollowUpWithMember}    ${UserData.FollowUpWithMember}
    input text    //input[@id="ControlId4111"]    ABC
    click Element   ${CPCM_SaveCommincationRecord}
    wait until page contains   Case - Communication Record

*** Variables ***
${CreateTempMember} =    //a[@id='createTemp']
${TempMemberFirstName} =   //input[@id='FirstName']
${TempMemberLastName} =    //input[@id='LastName']
${TempMemberGender} =     //select[@id='GenderCode']
${TempMemberDOB} =      //input[@id='Dob']
${SaveButtonOnTempMember} =    //a[@id='save-temp-member-btn']
${AssignedQueue} =   //span[@id='AssignedQueue']
${BussinesTable} =    //div[@id='BuinessRulesGrid-gridContent']

*** Keywords ***
Create Temp Member
    [Arguments]  ${UserData}
    set selenium implicit wait    10s
    wait until page contains element    ${CreateTempMember}    30s
    click element     ${CreateTempMember}
    wait until page contains     Create Temp Member   30 seconds
    input text   ${TempMemberFirstName}    ${UserData.FirstName}
    input text   ${TempMemberLastName}    ${UserData.LastName}
    select from list by label   ${TempMemberGender}    ${UserData.Gender}
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${DOB} =      add time to date    ${Today}   -7 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    ${TempMemberDOB}    ${DOB}
    click element   ${SaveButtonOnTempMember}
    wait until page contains      Temporary Member was saved successfully   30 seconds
    wait until page contains element      //div[@id='MaskedMemberId']    30 seconds


Validate Banner Message and Assigned queue for Temp Member
     [Arguments]  ${UserData}
     set selenium implicit wait    10s
     element should contain    ${AssignedQueue}      ${UserData.Assignedqueue}
     scroll element into view     ${BussinesTable}
     Table should contain    ${BussinesTable}      ${UserData.BussinessRule}


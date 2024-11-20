*** Settings ***
Library  SeleniumLibrary
#Library    String
#Library    DateTime
Library  ../../CustomLibs/DataCreation.py


Resource  ../Definitions/Common.robot
Resource  ../PageObjects/Generic_PO.robot
Resource  ../PageObjects/KY_Assessment_HealthRisk.robot
Resource  ../PageObjects/CPCMCases.robot
Resource    ../PageObjects/FL_ExploratoryPO.robot

*** Keywords ***
Navigate to Auth Task
    wait until element is visible    //div[@id="left-navAuth"]//a[@href="/cgx/Task/AuthorizationTask"]    10s
    click element    //div[@id="left-navAuth"]//a[@href="/cgx/Task/AuthorizationTask"]

Navigate to task under CPCM
    wait until element is visible    //div[@id="left-nav"]//a[@href="/cgx/Task/CpcmCaseTask"]    10s
    click element    //div[@id="left-nav"]//a[@href="/cgx/Task/CpcmCaseTask"]

Navigate to task under LTSS
    wait until element is visible    //div[@id="left-nav"]//a[@href="/cgx/Task/LtssCaseTask"]    10s
    click element    //div[@id="left-nav"]//a[@href="/cgx/Task/LtssCaseTask"]

Navigate to Task Under myworkAuth
    [Arguments]    ${UserData}
    click element    //div[@id="MyWorkAuth"]//span[text()='${UserData.AuthID_Value}']
    wait until element is visible    //div[@id="left-navAuth"]//a[@href="/cgx/Task/AuthorizationTask"]    30s
    click element    //div[@id="left-navAuth"]//a[@href="/cgx/Task/AuthorizationTask"]

Various Flows Create case of CPCM
    [Arguments]    ${UserData}
    click element    ${CPCMAddButton}
    wait until element is visible    ${CPCMCreateCaseScreen}    20 Seconds
    page should contain element    ${CPCMCreateCaseScreen}
    select from list by label    ${CPCMClinicalProgram}    ${UserData.ClinicalProgram}
    select from list by label    ${CPCMCaseType}    ${UserData.CaseType}
    select from list by label    ${CPCMCaseSource}    ${UserData.CaseSource}
    select from list by label    ${CPCMCaseReason}    ${UserData.CaseReason}
    select from list by label    ${CPCMAcuity}    ${UserData.Acuity}
    select from list by label    ${CPCMParticipatingStatus}    ${UserData.ParticipatingStatus}
    select from list by label    ${CPCMStratificationLevel}    1
#    set local variable    ${CaseName}
    click element    ${CPCMSubmitBtn}
    wait until element is visible    ${CPCMCaseId}    20 Seconds

Various Flows Create Task for LTSS Case
    click element    //a[@id='add-new-tasks']
    wait until element is visible    //select[@name="PriorityType"]    30s
    select from list by label    //select[@name="PriorityType"]  Medium
    select from list by label    //select[@name="TypeId"]  Address Change
#    select from list by label    //select[@name="TypeId"]  1 month s/p call
    ${task_Today} =      get current date    result_format=%m/%d/%Y
    input text    //input[@id='FollowUpDate']    ${task_Today}
    click element    //a[@id="save-new-task-btn"]
    sleep    2s

*** Variables ***
${QueueIcon} =    //a[@id="btnQueueDropdown"]/span
${QueueApply} =    //a[@id="btnQueueApply"]/img
${LtssCaseTask} =    //div[@id="left-nav"]//a[@href="/cgx/Task/LtssCaseTask"]
${cpcm_value}

*** Keywords ***
Open LTSS case from myQueue List
    click element    ${QueueIcon}
    wait until element is visible    ${QueueApply}    10s
    click element    //dl[@id="QueueList"]//a[text()='Ajit Singh (AHS8367)' and @class="queueName selected"]
    sleep    3s
    click element    //dl[@id="QueueList"]//a[text()='Namrata Namrata (NAN6004)']
    click element    ${QueueApply}
    click element    //div[@id="MyWorkLtssClinicalCaseGrid"]//span[text()='H80089122']
    sleep    1s
    wait until element is visible    ${LtssCaseTask}
    click element    ${LtssCaseTask}

get Case details and navigate to MyWork CPCM case
    wait until element is visible    //span[@id="CaseId"]    30s
    ${cpcm_value} =    get text    //span[@id="CaseId"]
    set global variable    ${cpcm_value}
    log to console    ${cpcm_value}
    Navigate to MyWork CPCM Case
    wait until element is visible    //img[@id="btnMyWorkCaseGridtoggleSearch"]    20s
    click element    //*[contains(text(),'${cpcm_value}')]
#Starts Here - Alternate way to select CMCM Case by Searching CPCM Case
#    click element    //img[@id="btnMyWorkCaseGridtoggleSearch"]
#    wait until element is visible    //div/span[text()='Case ID']    30s
#    click element    //div/span[text()='Case ID']
#    wait until element is visible    //label[@id="searchByCaption" and text()="Case ID"]    20s
#    input text    //input[@id="txtInlineFilter"]    ${cpcm_value}
##    input text    //input[@id="txtInlineFilter"]    C000105083
#
##    scroll element into view    //span[text()='C000105083']
##    click element    //span[text()='C000105083']
#    scroll element into view    //span[text()='${cpcm_value}']
#    click element    //span[text()='${cpcm_value}']
#Ends Here - Alternate way to select CMCM Case by Searching CPCM Case

Close task Under CPCM case
    click element    //a[@id="edit-tasks-grid"]
    sleep    01 Seconds
    click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]/td[1]
    sleep    03 Seconds
    click element    //a[@id="button-task-quick-complete"]
    wait until element is visible    //a[@id="button-quick-complete"]    20 Seconds
    sleep    02 Seconds
    page should contain element    //h4[text()="Quick Complete"]
    click element    //a[@id="button-quick-complete"]
    page should contain element    //span[text()=" 1 tasks completed successfully "]
    click element    //a[@id="edit-tasks-grid-done"]

*** Variables ***
${TableRow} =    //*[@id="MemberCentralCaseGrid"]/div[5]/div/div[1]/div[8]/span
${CaseStatus} =    //select[@id="CaseStatus"]
${CloseReason} =    //select[@id="CloseReason"]


*** Keywords ***
Close Case
#    [Arguments]  ${UserData}
    set selenium implicit wait    5 Seconds
#    page should contain element    ${TableRow}
#    click element    ${TableRow}
#    wait until page contains  Case - Details
    click link    Edit
    wait until page contains   Edit Case
    select from list by label    ${CaseStatus}    Close
    sleep    2 Seconds
    select from list by label    ${CloseReason}    Closed for error
    click element    ${SubmitBtn}

Edit And Save CPCM Case
    sleep    2s
    click link    Edit
    wait until page contains   Edit Case
    wait until element is visible    //input[@id="ControlId601"]     20s
    input text    //input[@id="ControlId601"]    Check_Edit
    click element    ${SubmitBtn}
    sleep    3s
    Close Case

Navigate on My Work Referral to Create Case
    [Arguments]    ${UserData}    ${QueueName}
    set selenium implicit wait    30s
    wait until element is visible    ${Ref_QueueIcon}    30s
    click element    ${Ref_QueueIcon}
    wait until element is visible    ${Ref_QueueApply}    30s
    Unselect all queues from referrals
    wait until element is visible    //div[@class="grid-canvas"]/div[1]//span[text()='${QueueName}']    50s
    click element    //div[@class="grid-canvas"]/div[1]//span[text()='${QueueName}']
    wait until element is visible    //a[@id="button-referral-create-case"]    30s
    click element    //a[@id="button-referral-create-case"]

    wait until element is visible    //span[@id="CaseId"]    20s
    ${CaseID} =    get text    //span[@id="CaseId"]
    log to console    ${CaseID}
    click link    Submit
    Close Case

*** Variables ***
${MyWorkAssess_Search} =    //img[@id="btnMyWorkAssessmenttoggleSearch"]
${MW_Assess_DateHeader} =    //div[@class="slick-header-columns ui-sortable"]//following::span[text()='Created / Updated Date']
${InlineSearch} =    //input[@id="txtInlineFilter"]
${btnTakeNew_Ass} =    //a[@id="btnTakeNewAssessment"]
${latestCreationDate} =    (//div[@id="assessmentBannerBorder"]//div[@class="small-6 columns valueField"])[4]

*** Keywords ***
Open Assessment from MyWork_Assessment
    wait until element is visible    ${MW_Assess_DateHeader}    20s
    click element    ${MyWorkAssess_Search}
    click element    ${MW_Assess_DateHeader}
    wait until element is visible    ${InlineSearch}
    ${TodayDate} =      get current date    result_format=%d/%Y
    input text    ${InlineSearch}    ${TodayDate}
    click element    //div[@class="grid-canvas"]/div[1]

Take As New and Submit assessment from Existing Assess
    [Arguments]    ${UserData}
    wait until element is visible    ${btnTakeNew_Ass}    20s
    click link    ${btnTakeNew_Ass}
    Fillup the answers of Ky HRA Assessment    ${UserData}

Fillup the answers of Ky HRA Assessment
    [Arguments]    ${UserData}
    ${status} =    run keyword and return status    element should be visible    ${KYHealth_Q1}
    run keyword unless    ${status}    reload page
    wait until element is visible    ${KYHealth_Q1}    30s
    input text    ${KYHealth_Q1}    ${UserData.KYHealth_Q1}
    input text    ${KYHealth_Q2}    ${UserData.KYHealth_Q2}
    input text    ${KYHealth_Q3}    ${UserData.KYHealth_Q3}
    input text    ${KYHealth_Q4}    ${UserData.KYHealth_Q4}
    input text    ${KYHealth_Q5}    ${UserData.KYHealth_Q5}
    input text    ${KYHealth_Q6}    ${UserData.KYHealth_Q6}
    input text    ${KYHealth_Q7}    ${UserData.KYHealth_Q7}
    input text    ${KYHealth_Q8}    ${UserData.KYHealth_Q8}
    input text    ${KYHealth_Q9}    ${UserData.KYHealth_Q9}
    input text    ${KYHealth_Q10}    ${UserData.KYHealth_Q10}
    click element    ${KYHealth_Q11}
    select from list by label    ${KYHealth_Q12}    ${UserData.KYHealth_Q12}
    select from list by label    ${KYHealth_Q13}    ${UserData.KYHealth_Q13}
    click element    ${KYHealth_Q14}
    select from list by label    ${KYHealth_Q15}    ${UserData.KYHealth_Q15}
    click element    ${KYHealth_Q16}
    scroll element into view    ${KYHealth_Q17}
    sleep    1s
    click element    ${KYHealth_Q17}
    click element    ${KYHealth_Q18}
    scroll element into view    ${KYHealth_Q19}
    sleep    1s
    click element    ${KYHealth_Q19}
    select from list by label    ${KYHealth_Q20}    ${UserData.KYHealth_Q20}
    select from list by label    ${KYHealth_Q21}    ${UserData.KYHealth_Q21}
    click element    ${KYHealth_Q22}
    select from list by label    ${KYHealth_Q23}    ${UserData.KYHealth_Q23}
    select from list by label    ${KYHealth_Q24}    ${UserData.KYHealth_Q24}
    select from list by label    ${KYHealth_Q25}    ${UserData.KYHealth_Q25}
    click element    ${KYHealth_Q26}
    click element    ${KYHealth_Q27}
    click element    ${KYHealth_Q28}
    click element    ${KYHealth_Q29}
    click element    ${KYHealth_Q30}
    scroll element into view     ${KYHealth_Q31}
    sleep    1s
    click element    ${KYHealth_Q31}
    click element    ${KYHealth_Submit}

Verify details of Ass at MC level
    wait until element is visible    ${latestCreationDate}
    ${latestCreationDate_value} =    get text    ${latestCreationDate}
    log to console    ${latestCreationDate_value}
    click link    Member Central
    click element    ${KY_Assessments}
    wait until element is visible    //div[@id="MemberAssessment-gridContent"]//tbody/tr/td[text()="Medicaid KY Health Risk Assessment"]
    click element    //div[@id="MemberAssessment-gridContent"]//tbody/tr/td[text()="Medicaid KY Health Risk Assessment"]
    wait until element is visible    ${latestCreationDate}    30s
    element should contain    ${latestCreationDate}     ${latestCreationDate_value}

*** Variables ***
${LeftNav_Assess} =    //div[@id="left-nav"]//a[text()='Assessments']
${btnAssessmentVoid} =    //a[@id="btnAssessmentVoid"]
${VoidReason} =    //select[@id="VoidReason"]
${voidButton} =    //a[@id="voidButton"]

*** Keywords ***
Navigate to Assessment under MyWork CPCM case
    [Arguments]    ${UserData}
    wait until element is visible    ${LeftNav_Assess}    30s
    click element    ${LeftNav_Assess}
    click element    ${KY_TakeAssessment}
    wait until element is visible    id:Department    20s
    select from list by label    name:Department    ${UserData.Department}
    Scroll Element Into View    ${KY_HealthRiskAssmentLink}
    set focus to element    ${KY_HealthRiskAssmentLink}
    sleep    2s
    click element    ${KY_HealthRiskAssmentLink}

Void the Assessment
    wait until element is visible    ${btnAssessmentVoid}    20s
    click link    ${btnAssessmentVoid}
    wait until element is visible    //select[@id="VoidReason"]    20s
#    sleep    4s
    select from list by label    //select[@id="VoidReason"]    Assessment completed on wrong individual
    sleep    1s
    click link    ${voidButton}

    wait until element is visible    //div[@id="left-nav"]//a[text()='Details']    30s
    click element    //div[@id="left-nav"]//a[text()='Details']


*** Variables ***
${Auth_Asses_link} =    //div[@id="left-navAuth"]//a[text()='Assessments']
${MWAuth_search} =    //img[@id="btnMyWorkAuthtoggleSearch"]
${MWAuth_Header} =    //div[@id="MyWorkAuth"]/div[@class="slick-header ui-state-default"]//span[text()='Auth ID']

*** Keywords ***
Navigate to Auth level Assessment
    [Arguments]    ${UserData}
    wait until element is visible    ${Auth_Asses_link}    30s
    click link    ${Auth_Asses_link}
    wait until element is visible    ${KY_TakeAssessment}    30s
    click element    ${KY_TakeAssessment}
    wait until element is visible    id:Department    20s
    select from list by label    id:Department    ${UserData.Department}
    Scroll Element Into View    ${KY_HealthRiskAssmentLink}
    set focus to element    ${KY_HealthRiskAssmentLink}
    sleep    2s
    click element    ${KY_HealthRiskAssmentLink}

Open Auth from MyWork Authorization
    [Arguments]    ${UserData}
    wait until element is visible    ${MWAuth_search}    30s
    sleep 4s
    click element    ${MWAuth_search}
    click element    ${MWAuth_Header}
    wait until element is visible    //label[@id="searchByCaption" and text()='Auth ID']    30s
    input text    //input[@id="txtInlineFilter"]    ${UserData.AuthID_Value}
    wait until element is visible    //div[@id="MyWorkAuth"]//span[text()='${UserData.AuthID_Value}']    20s
    click element    //div[@id="MyWorkAuth"]//span[text()='${UserData.AuthID_Value}']

Comm record link from MYWork Auth
#    sleep    3s
    wait until element is visible    //div[@id="left-navAuth"]//a[text()='Communication Record']    30s
    scroll element into view    //div[@id="left-navAuth"]//a[text()='Communication Record']
    sleep    1s
    click element    //div[@id="left-navAuth"]//a[text()='Communication Record']

Open Case from my work Ltss case
    [Arguments]    ${UserData}
    sleep    3s
    wait until element is visible    //img[@id="btnMyWorkLtssClinicalCaseGridtoggleSearch"]    30s
    click element    //img[@id="btnMyWorkLtssClinicalCaseGridtoggleSearch"]
    wait until element is visible    //div[@id="MyWorkLtssClinicalCaseGrid"]/div[@class="slick-header ui-state-default"]//span[text()='Case ID']    30s
    click element    //div[@id="MyWorkLtssClinicalCaseGrid"]/div[@class="slick-header ui-state-default"]//span[text()='Case ID']

    wait until element is visible    //label[@id="searchByCaption" and text()='Case ID']    30s
    input text    //input[@id="txtInlineFilter"]    ${UserData.LTSSCase_Value}
    wait until element is visible    //div[@class="grid-canvas"]//span[text()='${UserData.LTSSCase_Value}']    20s
    click element    //div[@class="grid-canvas"]//span[text()='${UserData.LTSSCase_Value}']

Add Outbound Communication Record in Ltss case_Various Flows
    [Arguments]    ${UserData}
    wait until element is visible    ${Ltss_ContactName}    40s
    input text    ${Ltss_ContactName}    ${UserData.Ltss_ContactName}
    input text    ${Ltss_ContactNumber}    ${UserData.ContactNumber}
    select from list by label    ${Ltss_Comm_Type}    ${UserData.CommunicationType}
    wait until element is visible    ${Ltss_Contact_Method}    30s
    select from list by label    ${Ltss_Contact_Method}    ${UserData.Ltss_Contact_Method}
    select from list by label    ${Ltss_ContactType}    ${UserData.Ltss_ContactType}
    select from list by label    ${Ltss_CallOutcome}    ${UserData.CallOutcome}
    select from list by label    ${Ltss_CallResult}    ${UserData.CallResult}
    select from list by label    ${Ltss_Comm_Description}    ${UserData.CommunicationDescription}
    select from list by label    ${Ltss_Friquency}    ${UserData.FriquencyOfContact}
    select from list by label    ${Ltss_CallAttemptNumber}    ${UserData.ContactAttemptNumber}
    scroll element into view    ${btn_submit_CommRec}
    sleep    1s
    click link    ${btn_submit_CommRec}
*** Variables ***
${cpcm_CommType} =  //select[@id="ControlId48"]
${cpcm_Contact_Method} =  //select[@id="ControlId50"]
${cpcm_ContactType} =  //select[@id="ControlId53"]
${cpcm_CallOutcome} =  //select[@id="ControlId61"]
${cpcm_CallResult} =  //select[@id="ControlId63"]
${cpcm_Comm_Description} =  //select[@id="ControlId69"]
${cpcm_CallAttemptNumber} =  //select[@id="ControlId67"]

*** Keywords ***
Add Communication Record in MW CPCM_Various Flows
    [Arguments]    ${UserData}
    wait until element is visible    ${Ltss_ContactName}    40s
    input text    ${Ltss_ContactName}    ${UserData.Ltss_ContactName}
    input text    ${Ltss_ContactNumber}    ${UserData.ContactNumber}
    select from list by label    ${cpcm_CommType}    ${UserData.CommunicationType}
    wait until element is visible    ${cpcm_Contact_Method}    30s
    select from list by label    ${cpcm_Contact_Method}    ${UserData.Ltss_Contact_Method}
    select from list by label    ${cpcm_ContactType}    ${UserData.Ltss_ContactType}
    click element    //label[@for="ControlId145-radio-1-NO0110"]
    select from list by label    ${cpcm_CallOutcome}    ${UserData.CallOutcome}
    select from list by label    ${cpcm_CallResult}    ${UserData.CallResult}
    select from list by label    ${cpcm_Comm_Description}    ${UserData.CommunicationDescription}
    select from list by label    //select[@id="ControlId73"]    Member will Call Nurse
#    select from list by label    ${Ltss_Friquency}    ${UserData.FriquencyOfContact}
    select from list by label    ${cpcm_CallAttemptNumber}    ${UserData.ContactAttemptNumber}
    scroll element into view    ${btn_submit_CommRec}
    sleep    1s
    click link    ${btn_submit_CommRec}

Close the exisisting cpcm case
    Navigate to CPCM Cases
    wait until element is visible    //div[@id="MemberCentralCaseGrid"]//span[text()='${cpcm_value}']
    click element    //div[@id="MemberCentralCaseGrid"]//span[text()='${cpcm_value}']
    Close Case

Search The CaseID
    page should contain element  ${Search_Element}
    click link  ${Search_Element}
    page should contain element  ${Back_Button}
    click element   ${RecordTab}
    input text    //input[@id='CaseId']    ${cpcm_value}
    click element  ${Search_Button}
    wait until element is visible    //h3[contains(text(),'Case - Details')]    30s

Get Case details and search the Case ID
    wait until element is visible    //span[@id="CaseId"]    30s
    ${cpcm_value} =    get text    //span[@id="CaseId"]
    set global variable    ${cpcm_value}
    log to console    ${cpcm_value}
    Search The CaseID

Search the AuthID
    [Arguments]  ${UserData}
    page should contain element  ${Search_Element}
    click link  ${Search_Element}
    page should contain element  ${Back_Button}
    click element   ${RecordTab}
    input text    ${AuthId}    ${UserData.AuthID_Value}
    click element  ${Search_Button}

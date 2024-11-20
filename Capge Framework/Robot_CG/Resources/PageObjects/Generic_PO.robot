*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    DateTime
Library    Collections

Library    ../../CustomLibs/DataCreation.py

Resource    ../Definitions/HumanaGui.robot
Resource    ../PageObjects/Authorization.robot

*** Variables ***
${Generic_memberName} =    //a[@id='member-name-link']/u
${Generic_DOB} =    //div[@id="member-information"]/div[1]/div[3]
${Generic_memberName_Value} =    EMPTY
${Generic_DOB_Value} =    EMPTY
${MemberInfoGrid} =    //*[@id="MemberInfoGrid"]/table/tbody/tr[1]/td[28]/div
${MemberNameDisplay} =     //span[@id="MemberNameDisplay"]//following-sibling::span[1]
${MemberIdDisplay} =     //span[@id="MemberId"]//following-sibling::span[1]
${DOBDisplay} =     //span[@id="DateOfBirthDisplay"]//following-sibling::span[1]

*** Keywords ***
Verify Member Details in Member Info Section
    [Arguments]    ${UserData}
    wait until element is visible    ${Generic_memberName}
    ${Generic_memberName_Value} =    get text    ${Generic_memberName}
    set global variable    ${Generic_memberName_Value}
    ${Generic_memberName_Value} =    strip string    ${Generic_memberName_Value}    mode=both
    log to console    ${Generic_memberName_Value}

    ${Generic_DOB_Value} =    get text    ${Generic_DOB}
    set global variable    ${Generic_DOB_Value}
    ${Generic_DOB_Value} =    strip string    ${Generic_DOB_Value}    mode=both
    ${Generic_DOB_Value} =    split string    ${Generic_DOB_Value}  ,
    log    ${Generic_DOB_Value}[0]
    scroll element into view    ${MemberInfoGrid}
    sleep    1s
    click element    ${MemberInfoGrid}
    wait until element is visible    ${MemberNameDisplay}    10s
    element text should be    ${MemberNameDisplay}    ${Generic_memberName_Value}
    element text should be    ${MemberIdDisplay}    ${UserData.SubscriberId}
    element text should be    ${DOBDisplay}    ${Generic_DOB_Value}[0]

*** Variables ***
${btn_SearchProvider} =    //a[@id="provider-search-button"]
${Generic_Provider_Name} =    //input[@id="ProviderName"]
${Advanced_Search} =    //div[@id="provider-search-additional-search"]/a/u[text()='Advanced Search Criteria']
${Advanced_State} =    //select[@id="State"]
${SearchForprovider} =    //a[@id="button-provider-search"]
${btn_SelectLocation} =    //a[@id="button-location-select"]
${Gen_RequestingProvider} =    (//label[@for="RequestingProvider"])[1]
${Gen_TreatingProvider} =    (//label[@for="TreatingProvider"])[1]
${Gen_FacilityProvider} =    (//label[@for="FacilityProvider"])[1]
${btn_ProviderSave} =    //a[@id="button-provider-save"]
${Gen_LastCoveredDate} =    //input[@id="LastCoveredDate"]

*** Keywords ***
Navigate to Create Auth Page
    set selenium implicit wait    5 Seconds
    click element  ${CreateAuth}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    page should contain element    ${ContactMethod}

Search Provider Information and add
    [Arguments]    ${UserData}
    sleep    4s
    scroll element into view    ${btn_SearchProvider}
    click element    ${btn_SearchProvider}
    wait until page contains    Provider Search Instructions    20s
    wait until element is visible    ${Generic_Provider_Name}    40s
    input text    ${Generic_Provider_Name}    ${UserData.ProvName}
    sleep    1s
    click element    ${Advanced_Search}
    wait until element is visible    ${Advanced_State}
    select from list by label    ${Advanced_State}    ${UserData.State}
    click element    ${SearchForprovider}
    wait until page contains    Results    30s
    sleep    5s
    click element    //div[@id="ProviderSearchGrid"]/table/tbody/tr[1]/td[1]
    wait until element is visible    ${Gen_RequestingProvider}    20s
    scroll element into view    ${Gen_RequestingProvider}
    sleep    1s
    click element    ${Gen_RequestingProvider}
    sleep    1s
    click element    ${Gen_TreatingProvider}
    sleep    1s
    click element    ${Gen_FacilityProvider}
    sleep    1s
    click element    ${btn_SelectLocation}
    wait until element is visible    //a[@id="button-clear"]    30s
    scroll element into view    ${btn_ProviderSave}
    sleep    1s
    click element    ${btn_ProviderSave}
    wait until element is visible    //div[@id="requesting-provider"]/div[2]//a/img    30s

Create IPAuth for Generic test scenerio
    [Arguments]    ${UserData}
    set selenium implicit wait    5 Seconds
    scroll element into view    ${ContactMethod}
    sleep  1s
    click element  ${ContactMethod}
    Select From List By Label  ${ContactMethod}  ${UserData.ContactMethod}
    input text  ${ContactName}  ${UserData.ContactName}
    Select From List By Label  ${ContactType}  ${UserData.ContactType}
    run keyword if    '${UserData.ServiceDate}' != '${EMPTY}'    input text  ${DateOfService}  ${UserData.ServiceDate}

    ######Caller Authenticatoin
    wait until page does not contain  //*[@id="loading-ajax"]
    scroll element into view    ${NotificationDate}
    run keyword if    '${UserData.ContactType}' != 'Member' or '${UserData.ContactType}' !='Member Rep'   User Enters Provider Choice
    ...         ELSE    User Enters Member Choice

     ########Auth Information
    wait until page does not contain  //*[@id="loading-ajax"]
    scroll element into view    ${ProgramManagement}
    Select From List By Label  ${ProgramManagement}  ${UserData.ProgramManagement}
    run keyword if    '${UserData.ProgramManagement}' == 'Bariatrics'    User Enters Bariatric    ${UserData}
    run keyword if    '${UserData.NotificationDate}' != '${EMPTY}'    User Enters Notification Date    ${UserData}
    scroll element into view    ${AuthType}
    sleep    2 Seconds
    select from list by label    ${AuthType}    ${UserData.AuthType}

    run keyword if  '${UserData.AuthType}' == 'Inpatient'  Provide User Inpatient Info    ${UserData}


Provide User Inpatient Info
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    ${EPSDT} =     run keyword and return status    page should contain element   ${Under21}
    run keyword if    ${EPSDT}    click element    ${EPSDTCheck}
    scroll element into view    ${RequestType}
    select from list by label    ${RequestType}    ${UserData.RequestType}
    run keyword if    '${UserData.RequestSubType}' != '${EMPTY}'    User Enter RequestSubType  ${UserData}
    select from list by label    ${AdmissionType}   ${UserData.AdmissionType}
    ${BedList} =  create list  LTAC  Inpt Rehab  SNF Admit Post Hsp  Inpt Transplant
    ${EnterBedType} =  run keyword and return status  list should not contain value  ${BedList}  ${UserData.AdmissionType}
    run keyword if  ${EnterBedType}  User Enter Bed Type  ${UserData}
    run keyword if    '${UserData.DischargeDate}' != '${EMPTY}'    User Enter Discharge Date  ${UserData}
    run keyword if    '${UserData.DischargeDis}' != '${EMPTY}'    User Enter Discharge Disposition  ${UserData}
    scroll element into view    //div[@id='ProviderInfo']
    Search Provider Information and add     ${UserData}
    scroll element into view    ${search-diag-code-btn}
    sleep    2 Seconds
    Clear added Diagnosis and Procedure codes and search again    ${UserData}
    Enter Curent Date    ${Gen_LastCoveredDate}
    #scroll element into view   //label[contains(text(),'Redirection')]
    scroll element into view    //a[@class='collapsible-title']//u[text()='Redirection']
    sleep    1 Seconds
    select from list by label    ${Redirection}    ${UserData.Redirection}
    wait until element is visible    ${CalcualteLosBtn}    40s
    sleep    1s
    click element    ${CalcualteLosBtn}
    sleep    2 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]    3 seconds
    wait until element is visible    ${Calculated}    40s
    click element    ${Submit}
    wait until page does not contain  //*[@id="loading-ajax"]    5 Seconds
    sleep    2 Second
    ${ConfirmNotification} =  run keyword and return status    page should contain element    //div[@id="Notification-confirmation"]
    run keyword if    ${ConfirmNotification}    click element    //a[@id="OpObservationcancelButton"]/u[text()='No']
    sleep    2 Second
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    click element   ${MemChoice3}
    ${DuplicateConfirm} =    Run Keyword And Return Status   page should contain link    Yes, Continue
    run keyword if  ${DuplicateConfirm}  Confirm the Duplicate
    sleep    1 Second
    ${GenerateLetter} =    Run Keyword And Return Status   page should contain element    //a[@id="not-now-button"]
    run keyword if  ${GenerateLetter}  Confirm the Generate Letter
    sleep    2 Second
    ${CommunicationRec} =    Run Keyword And Return Status   page should contain element    //a[@id="not-now-button-Comm-rec"]
    run keyword if  ${CommunicationRec}  Confirm the Communication
    wait until page contains element    //h3[@class='humana-green' and text()='Authorization - Details']    10 Seconds

*** Variables ***
${search-diag-code-btn} =    //a[@id="search-diag-code-btn"]
${search-Proc-code-btn} =    //a[@id="search-procedure-code-btn"]
${Genneric_DiagCode} =    //input[@id="Code"]
${diagnosis_code_search_btn} =    //a[@id="diagnosis-code-search-btn"]
${procedure_code_search_btn} =    //a[@id="procedure-code-search-btn"]
${Diagnosis_Label} =    //*[@id="MedicalCodeSearchGrid"]/div[2]/div[1]//tbody/tr[1]/td[1]/div/label
${Procedure_Label} =    //*[@id="ProcedureCodeSearchGrid"]/div[2]/div[1]//tbody/tr[1]/td[1]/div/label
${ADD_Diag_btn} =    //a[@id="add-diagnosis-code-button"]
${ClearDiagnosis} =    //div[@id="AuthDirectPrimaryDiagnosisCodeGrid"]//div[5]/div/div/div[1]/img
${ADD_Proc_btn} =    //a[@id="add-procedure-code-button"]
${ClearProcedure} =    //*[@id="AuthDirectProcedureCodeGrid"]/div[5]/div/div/div[3]/img

*** Keywords ***
Clear added Diagnosis and Procedure codes and search again
    [Arguments]    ${UserData}
    Search the Diagnosis code and add    ${UserData}
    wait until element is visible    ${ClearDiagnosis}
    sleep    3s
    click element    ${ClearDiagnosis}
    sleep    3s
    element should not be visible    ${ClearDiagnosis}
    element should not be visible    //div[@id="AuthDirectPrimaryDiagnosisCodeGrid"]//div[5]/div/div/div[3]/span[contains(text(),'${UserData.PrimaryDiagnosis}')]
    Search the Diagnosis code and add    ${UserData}
    Search the Procedure code and add    ${UserData}
    wait until element is visible    ${ClearProcedure}
    scroll element into view    ${ClearProcedure}
    sleep    1s
    click element    ${ClearProcedure}
    sleep    3s
    Search the Procedure code and add    ${UserData}


Search the Diagnosis code and add
    [Arguments]    ${UserData}
    sleep    2s
    click element    ${search-diag-code-btn}
    wait until page contains    Diagnosis Code Search    30s
    input text    ${Genneric_DiagCode}    ${UserData.PrimaryDiagnosis}
    click element    ${diagnosis_code_search_btn}
    wait until element is visible    ${Diagnosis_Label}
    click element    ${Diagnosis_Label}
    wait until element is visible    //a[@id="set-primary-diag-code-btn"]
    click element    //a[@id="set-primary-diag-code-btn"]
    sleep    1s
    click link    ${ADD_Diag_btn}

Search the Procedure code and add
    [Arguments]    ${UserData}
    sleep    2s
    scroll element into view    ${search-Proc-code-btn}
    sleep    1s
    click element    ${search-Proc-code-btn}
    wait until page contains    Procedure Code Search    30s
    input text    ${Genneric_DiagCode}    ${UserData.ProcedureCode}
    click element    ${procedure_code_search_btn}
    wait until element is visible    ${Procedure_Label}    20s
    click element    ${Procedure_Label}
    wait until element is visible    //a[@id="set-procedure-code-btn"]
    click element    //a[@id="set-procedure-code-btn"]
    wait until element is visible    //div[@id="procedurecodeselectiongrid-gridContent"]//tbody/tr[1]/td[1][contains(text(),'${UserData.ProcedureCode}')]    20s
    sleep    1s
    click element    ${ADD_Proc_btn}

*** Variables ***
${TakeOwnership} =    //a[@id="view-take-ownership"]
${LoginUser_Path} =    (//div[@id="login"]/div/div/span)[1]
${LoginUser_Value} =    EMPTY
${AssingnQueue} =    //span[@id="AssignedQueue"]
${RemoveOwnership} =    //a[@id="view-remove-ownership"]
${AuthHistory} =    //a[@id="history-authorization"]
${HistoryRecord1} =    //*[@id="AuthHistoryGrid"]//tbody/tr[1]/td[1]/div/label
${HistoryRecord2} =    //*[@id="AuthHistoryGrid"]//tbody/tr[2]/td[1]/div/label
${btn_CompareHistry} =    //a[@id="button-auth-compare" and contains(text(),'Compare')]
${CheckDiff} =    //div[@for="CheckDifference"]/div[1]/label
${OwnershipHistory} =     //a[@id="OwnershipHistory" and contains(text(),'Ownership History')]

*** Keywords ***
Validate Add and Remove Auth Ownership
    [Arguments]    ${UserData}
    wait until element is visible    ${TakeOwnership}    30s
    ${LoginUser_Value} =    get text    ${LoginUser_Path}
    set global variable    ${LoginUser_Value}
    ${LoginUser_Value} =    strip string    ${LoginUser_Value}    mode=both
    log to console    ${LoginUser_Value}
    click element    ${TakeOwnership}
    set selenium implicit wait    30s
    scroll element into view    ${AssingnQueue}
    sleep    25s
    element text should be    ${AssingnQueue}    ${LoginUser_Value}
    sleep    2s
    ## Remove ownership
    wait until element is visible    ${RemoveOwnership}    20s
    click element    ${RemoveOwnership}
    sleep    20s
    element text should not be    ${AssingnQueue}    ${LoginUser_Value}
    reload page
    sleep    4s

    ${GenerateLetter} =    Run Keyword And Return Status   page should contain element    //a[@id="not-now-button"]
    run keyword if  ${GenerateLetter}  Confirm the Generate Letter
    sleep    2 Second
    ${CommunicationRec} =    Run Keyword And Return Status   page should contain element    //a[@id="not-now-button-Comm-rec"]
    run keyword if  ${CommunicationRec}  Confirm the Communication
## Edit Auth
    click element    //a[@id="edit-ip-auth-info-partial"]
    sleep    3s
    scroll element into view    ${ProgramManagement}
    Select From List By Label  ${ProgramManagement}    Medicare
    sleep    10s
    ${Checked} =    Checkbox Should Not Be Selected    //label[@for="checkbox-4-1"]
    run keyword if    ${Checked}    click element    //label[@for="checkbox-4-1"]
    sleep    1s
    ${Checked} =    Checkbox Should Not Be Selected    //label[@for="checkbox-5-2"]
    run keyword if    ${Checked}    click element    //label[@for="checkbox-5-2"]
    sleep    1s
    ${Checked} =    Checkbox Should Not Be Selected    //label[@for="checkbox-5-4"]
    run keyword if    ${Checked}    click element    //label[@for="checkbox-5-4"]
    sleep   5s
    scroll element into view    //a[@id="edit-submit-authorization"]
    click element    //label[@for="checkbox-5-4"]
    sleep     1s
    click element    //label[@for="checkbox-5-4"]
    sleep   2s
#    scroll element into view    //a[@id="edit-submit-authorization"]
    click element    //a[@id="edit-submit-authorization"]
    wait until element is visible    //a[@id="not-now-button-Comm-rec"]    40s
    click element    //a[@id="not-now-button-Comm-rec"]

    # Auth History
    sleep     2s
    click element    ${AuthHistory}
    wait until page contains    Authorization History    30s
    click element    ${HistoryRecord1}
    sleep    1s
    click element    ${HistoryRecord2}
    wait until element is visible    ${btn_CompareHistry}    20s
    click element    ${btn_CompareHistry}
    wait until page contains    Authorization - Compare Versions    30s
    page should contain element    //span[@id="AuthId" and contains(text(),'${UserData.AuthID_Value}')]

    #Minimise and expand to verivy the auth details
    wait until element is visible    //*[@id="auth-information"]/a/u[text()='Authorization Information']    20s
    element should be visible    //*[@id="auth-information"]/div/div[40]/div[contains(text(),'${UserData.AuthType}')]
    page should contain element    //span[@id="AuthId" and contains(text(),'${UserData.AuthID_Value}')]
    sleep    1s
    click element    //*[@id="auth-information"]/a/u[text()='Authorization Information']
    sleep    2s
    element should not be visible    //*[@id="auth-information"]/div/div[40]/div[contains(text(),'${UserData.AuthType}')]

    # show only difference
    click element    ${CheckDiff}
    sleep    2s
    element should not be visible    //*[@id="auth-information"]/div/div[40]/div[contains(text(),'${UserData.AuthType}')]

    click element    //*[@id="compare-case-backbutton"]/u
    ${CommunicationRec} =    Run Keyword And Return Status   page should contain element    //a[@id="not-now-button-Comm-rec"]
    run keyword if  ${CommunicationRec}  Confirm the Communication
    wait until element is visible    ${OwnershipHistory}    20s
    click element    ${OwnershipHistory}
    wait until page contains    Ownership History    30s
    page should contain element    //span[@id="AuthId" and contains(text(),'${UserData.AuthID_Value}')]
#=======    page should contain element    //*[@id="authownershiphistorygrid"]//tbody/tr/td[2][contains(text(),'${LoginUser_Value}')]
    click element    //a[@id="auth-owner-ship-history-view-modal-close-btn"]/div/span
    wait until element is visible    ${OwnershipHistory}    30s
    scroll element into view    //a[@id="viewAuth-Back-btn"]/u[text()='Back']
    sleep    1s
    click element    //a[@id="viewAuth-Back-btn"]/u[text()='Back']      # back to Auth Grid main page
    wait until element is visible    ${CreateAuth}    30s

*** Variables ***
${Auth_Filter} =    //ul[@class="button-group right"]/li[6]/a/span[text()='Filter']
${Auth_FilterForm} =    //form[@id="MemberCentralAuthFilterForm"]
@{AuthType_List} =    EMPTY
${Auth_ApplyFilter} =    //form[@id="MemberCentralAuthFilterForm"]/div[1]/div/a[3]/img

*** Keywords ***
Authorization Grid Filter
    [Arguments]    ${UserData}
    click link  Member Central
    wait until element is visible    ${AuthMenu}
    click element  ${AuthMenu}
    @{AuthType_List}    create list    Inpatient    Outpatient     LTSS Inpatient    LTSS Outpatient    BHInpatient    BHOutpatient
    set global variable    @{AuthType_List}

    FOR    ${i}    IN RANGE    0    5
        log to console    ${AuthType_List}[${i}]
        Select Filter asper AuthType    ${UserData}    ${AuthType_List}[${i}]
        Verify Filter for Auth Type    ${UserData}    ${AuthType_List}[${i}]
        Clear Filters at Auth level
        ${i} =    evaluate    ${i}+1
    END


Select Filter asper AuthType
    [Arguments]    ${UserData}    ${AuthType_Filter}
    set focus to element     ${Auth_Filter}
    sleep    2s
    click element    ${Auth_Filter}
    wait until element is visible    ${Auth_FilterForm}    20s
    click element    //div[@id="AuthType"]/div[2]//ol/li/a[text()='${AuthType_Filter}']
    wait until element is visible    //div[@id="AuthType"]/div[2]//ol/li[@class="selected"]/a[text()='${AuthType_Filter}']    20s
    click element    ${Auth_ApplyFilter}

Verify Filter for Auth Type
    [Arguments]    ${UserData}    ${AuthType_Filter}
    sleep    2s
    ${Expected_rowcount} =    get element count    //div[@id="MemberCentralAuth"]/div[2]/div[1]//tbody/tr/td[4][contains(text(),'${AuthType_Filter}')]
    ${Actual_rowcount} =    get element count    //div[@id="MemberCentralAuth"]/div[2]/div[1]//tbody/tr
    log    ${Expected_rowcount} Expected
    log    ${Actual_rowcount} Actual
    should be equal as strings    ${Actual_rowcount}    ${Expected_rowcount}

Clear Filters at Auth level
    wait until element is visible    ${Auth_Filter}    20s
    click element    ${Auth_Filter}
    wait until element is visible    ${Auth_FilterForm}    20s
    sleep    1s
    click element    //form[@id="MemberCentralAuthFilterForm"]/div[1]/div/a[2]/img     #${MC_ClearFilter}
    sleep    1s
    click element    ${Auth_ApplyFilter}

*** Variables ***
${MyworkRecentWork} =    //a[@href="/cgx/MyWork/MyWorkRecentWork/Index"]
${RecentWorkOptions} =    //select[@id="MyRecentWorks"]     #/option
@{Recentwork_List} =    EMPTY
${img_AuthSearch} =    //img[@id="btnRecentWorkAuthtoggleSearch"]
${Auth_Record} =    //*[@id="RecentWorkAuth"]/div[5]/div/div[1]/div[11]/span
${Auth_RecordValue} =    EMPTY
${txtInlineFilter} =    //input[@id="txtInlineFilter"]

*** Keywords ***
Mywork Recent Work
    [Arguments]    ${UserData}
    set selenium implicit wait    20s
    click link    My Work
    wait until element is visible    ${MyworkRecentWork}    20s
    click link    ${MyworkRecentWork}
    wait until element is visible    //h3[text()='Recent Work']    30s
    @{Recentwork_List} =    get list items    ${RecentWorkOptions}
    set global variable    @{Recentwork_List}
    log    ${Recentwork_List}
    FOR    ${i}    IN RANGE    0    4
        ${i} =    evaluate    ${i}+1
        log to console    ${Recentwork_List}[${i}]
        select from list by label    ${RecentWorkOptions}    ${Recentwork_List}[${i}]
        check Mywork Recent Work Grid Filter    ${Recentwork_List}[${i}]
    END

check Mywork Recent Work Grid Filter
    [Arguments]    ${Recentwork_Item}
    set selenium implicit wait    20s
    run keyword if    '${Recentwork_Item}' == 'Auths / CDRs'    Search Auths CDRs in Grid    ${Recentwork_Item}
    run keyword if    '${Recentwork_Item}' == 'CP CM Cases'    Search CP CM Cases in Grid    ${Recentwork_Item}
    run keyword if    '${Recentwork_Item}' == 'Clinical Consultations'    Search Clinical Consultations in Grid    ${Recentwork_Item}
    run keyword if    '${Recentwork_Item}' == 'MD Routes'    Search MD Routes in Grid    ${Recentwork_Item}


Search Auths CDRs in Grid
    [Arguments]    ${Recentwork_Item}
    sleep    2s
    ${check_Record} =   run keyword and return status    element should not be visible    ${Auth_Record}
    run keyword if    ${check_Record}    log to console    No records Found for ${Recentwork_Item}
    element should be visible    ${Auth_Record}    20s
    ${Auth_RecordValue} =    get text    ${Auth_Record}
    set global variable    ${Auth_RecordValue}
    log to console    ${Auth_RecordValue}

    click element    ${img_AuthSearch}
    wait until element is visible    ${img_AuthSearch}    20s
    click element    //div[@id="RecentWorkAuth"]/div[2]/div/div[1]/span[1]
    sleep    1s
    input text    ${txtInlineFilter}    ${Auth_RecordValue}
    sleep    2s
    element text should be    //*[@id="RecentWorkAuth"]/div[5]/div/div[1]/div[1]/span   ${Auth_RecordValue}

*** Variables ***
${Cpcm_Record} =    //*[@id="MyWorkRecentCaseGrid"]/div[5]/div/div[1]/div[1]/span[1]
${Cpcm_RecordValue} =    EMPTY
${img_CPCMSearch} =    //img[@id="btnMyWorkRecentCaseGridtoggleSearch"]

*** Keywords ***
Search CP CM Cases in Grid
    [Arguments]    ${Recentwork_Item}
    sleep    2s
    ${check_Record} =   run keyword and return status    element should not be visible    ${Cpcm_Record}
    run keyword if    ${check_Record}    log to console    No records Found for ${Recentwork_Item}
    element should be visible    ${Cpcm_Record}    20s
    ${Cpcm_RecordValue} =    get text    ${Cpcm_Record}
    set global variable    ${Cpcm_RecordValue}
    log    ${Cpcm_RecordValue}

    click element    ${img_CPCMSearch}
    wait until element is visible    ${txtInlineFilter}    20s
    click element    //*[@id="MyWorkRecentCaseGrid"]/div[2]/div/div[9]/span[1]
    sleep    1s
    input text    ${txtInlineFilter}    ${Cpcm_RecordValue}
    sleep    2s
    element text should be    //*[@id="MyWorkRecentCaseGrid"]/div[5]/div/div[1]/div[9]/span[1]   ${Cpcm_RecordValue}

*** Variables ***
${Consult_Record} =    //*[@id="RecentClinicalConsultations"]/div[5]/div/div[1]/div[3]/span[1]
${Consult_RecordValue} =    EMPTY
${img_CunsultSearch} =    //img[@id="btnRecentClinicalConsultationstoggleSearch"]

*** Keywords ***
Search Clinical Consultations in Grid
    [Arguments]    ${Recentwork_Item}
    sleep    2s
    ${check_Record} =   run keyword and return status    element should not be visible    ${Consult_Record}
    run keyword if    ${check_Record}    log to console    No records Found for ${Recentwork_Item}
    element should be visible    ${Consult_Record}    20s
    ${Consult_RecordValue} =    get text    ${Consult_Record}
    set global variable    ${Consult_RecordValue}
    log to console    ${Consult_RecordValue}

    click element    ${img_CunsultSearch}
    wait until element is visible    ${txtInlineFilter}    20s
    click element    //div[@id="RecentClinicalConsultations"]/div[2]/div/div[8]
    sleep    1s
    input text    ${txtInlineFilter}    ${Consult_RecordValue}
    sleep    2s
    element text should be    ${Consult_Record}   ${Consult_RecordValue}

*** Variables ***
${MD_Data} =    //div[@id="MDReviewGrid"]//div[@class="grid-canvas"]/div/div[12]
*** Keywords ***
Search MD Routes in Grid
    [Arguments]    ${Recentwork_Item}
    sleep    2s
    ${check_Record} =   run keyword and return status    element should not be visible    ${MD_Data}
    run keyword if    ${check_Record}    log to console    No records Found for ${Recentwork_Item}
    ...    ELSE    Validate MyWork MD Review

Validate MyWork MD Review
    wait until element is visible    ${MD_Data}    20s
    click element    ${MD_Data}
    wait until element is visible    //div[@id="heading" and contains(text(),' View MD Review')]    30s

## TC12_Verify Owner,Co-Owner details AND Manage Queue verify referral records
*** Variables ***
${Ref_QueueIcon} =    //a[@id="btnQueueDropdown"]/span
${Ref_QueueApply} =    //a[@id="btnQueueApply"]/img
${Show_AutoPages} =    //a[@id="slick-auto-pager-icon" and text()='Auto']
${statusMessage} =    //div[@id="MyWorkReferralsGridPager"]//following::span[@class="slick-pager-status"]
${SelectedReferrals} =    //a[@class="queueName deleted selected"]
#@{TotalReferrals} =    EMPTY

*** Keywords ***
View My Work Referral Records
    [Arguments]    ${UserData}    ${QueueName}
    set selenium implicit wait    30s
    wait until element is visible    ${Ref_QueueIcon}    30s
    click element    ${Ref_QueueIcon}
    wait until element is visible    ${Ref_QueueApply}    30s
    Unselect all queues from referrals
    wait until element is visible    //dl[@id="QueueList"]/dd/div/a[text()='${QueueName}']    50s
    click element    //dl[@id="QueueList"]/dd/div/a[text()='${QueueName}']
    sleep    6s
    wait until element is visible    //dl[@id="QueueList"]/dd/div/a[@class="queueName deleted selected" and text()='${QueueName}']    30s
    click element    ${Ref_QueueApply}
    wait until element is visible    ${Ref_QueueIcon}    40s
    sleep    4s
    ${Ref_status} =  run keyword and return status    element should be visible    //div[@id='MyWorkReferrals']//table/tbody//following::div[@class='grid-canvas']/div//span[text()='${QueueName}']    30s
    run keyword unless    ${Ref_status}    page should contain element    //div[@id="MyWorkReferrals-Zero-Count-div"]/h6[text()='No Records Found']    30s
    run keyword if    ${Ref_status}    Verify Count of referrals    ${QueueName}

Verify Count of referrals
    [Arguments]    ${QueueName}
    sleep    5s
    scroll element into view    ${Show_AutoPages}
    click element    ${Show_AutoPages}
    sleep    2s
    ${StatusValue} =    get text    ${statusMessage}
#    set local variable    ${StatusValue}
    ${StatusValue} =    strip string    ${StatusValue}    mode=both
    log to console    ${StatusValue}
    ${NumberOfPages} =    split string    ${StatusValue}
    log    ${NumberOfPages}[2]
    log    ${NumberOfPages}[4]

#    click element    ${Ref_QueueIcon}
#    wait until element is visible    ${Ref_QueueApply}    30s
#    scroll element into view    ${SelectedReferrals}
#        @{TotalReferrals} =    get text    ${SelectedReferrals}
#        log to console    ${TotalReferrals}
#        log    @{TotalReferrals}
#    click element    ${Ref_QueueApply}

    ${TotalCount}  set variable    0
    FOR    ${i}    IN RANGE    ${NumberOfPages}[2]-1    ${NumberOfPages}[4]
        sleep    5s
        ${Count} =    get element count    //div[@id='MyWorkReferrals']//table/tbody//following::div[@class='grid-canvas']/div//span[text()='${QueueName}']
#        log to console    ${Count}
        ${Status}    run keyword and return status    element should be visible    //input[@type="submit" and @class="slick-ui-icon-seek-next"]    10s
        run keyword if    ${Status}    click element    //input[@type="submit" and @class="slick-ui-icon-seek-next"]
        ${TotalCount} =    evaluate    ${TotalCount}+${Count}
        ${i}    evaluate    ${i}+1
        ${Count}  set variable    0
    END
    log to console    Total Count:${TotalCount}
    page should contain element    //div[@id="MyWorkReferrals-Count-div"]/h6/span[@id="MyWorkReferrals-Total-span" and text()='${TotalCount}']


Unselect all queues from referrals
    click element    //dl[@id="QueueList"]/dd/a[starts-with(text(),'Select All Queues')]
    sleep    4s
    wait until element is visible    //dl[@id="QueueList"]/dd/a[starts-with(text(),'Select All Queues') and @class="queueName selectAll selected"]    20s
    sleep    1s
    click element    //dl[@id="QueueList"]/dd/a[starts-with(text(),'Select All Queues')]
    wait until element is not visible    //dl[@id="QueueList"]/dd/a[starts-with(text(),'Select All Queues') and @class="queueName selectAll selected"]    20s
    sleep    4s

###TC13
Validate apply button and confirmation popp
    ## click apply and then No
    click element  ${ApplyBtn}
    sleep    3 Seconds
    wait until element is visible    //div[@id="message-alert"]/div[2]//following::div[contains(text(),'Do you want to apply selected role configuration?')]    40s
    click element    ${NotConfirm_Btn}
    ## click apply and then Yes
    click element  ${ApplyBtn}
    sleep    3 Seconds
    click element  ${ConfirmBtn}
    sleep    3s
    page should contain element    //input[@id="SubscriberId"]    30s



*** Variables ***
${Business_Fun_DD} =    //div[@id="filteredBusinessFunctions"]//following::ul[@class="select2-selection__rendered"]
${Filters} =    //span[@id="select2-BusinessFunctionsFilter-container" and @title="All Business Functions"]
${NotConfirm_Btn} =    //a[@id="message-alert-no-button"]

*** Keywords ***
Validate fields after clicking Reset
    click element    ${RestBtn}
    sleep    2s
    element should be visible    ${RoleBtn}
    element should be visible    ${FilterGroup}/span[@title="No Access"]
    element should be visible    ${Business_Fun_DD}
    element should not be visible    ${ApplyBtn}
    element should be visible    ${RestBtn}
    element should be visible    ${RoleSummaryBtn}

Select the role and click on View Role Summary
    [Arguments]    ${UserData}
    Select the Roles  ${UserData}
    wait until element is visible    ${RoleSummaryBtn}
    click element  ${RoleSummaryBtn}

Validation before clicking on View role Summary
    element should be visible    ${RoleBtn}
    element should be visible    ${FilterGroup}/span[@title="No Access"]
    element should be visible    ${RestBtn}
    element should not be visible    ${ApplyBtn}

Validation After clicking on View role Summary
    [Arguments]    ${UserData}
    wait until element is visible    ${ApplyBtn}    30s
    element should be visible    ${RoleBtn}/span[@title="${UserData.Role}"]
    element should be visible    ${FilterGroup}/span[@title="No Access"]
    element should be enabled    ${ApplyBtn}
    element should be visible    ${RestBtn}
    element should be visible    ${Business_Fun_DD}
    element should be visible    //ul[@id="BusinessFunction"]

Validation After Reset and clicking on View role Summary
    [Arguments]    ${UserData}
    element should be visible    ${RoleBtn}/span[@title="${UserData.Role}"]
    element should be visible    ${FilterGroup}/span[@title="No Access"]
    ##page should contain element    //div[@id="EmulatedUser" and text()='Amol Sahebrao/AOS6140']
    page should contain element    //div[@id="EmulatedUser" and text()='Ajit Singh/AHS8367']
#    page should contain element    //div[@id="EmulatedUser" and text()='${Generic_memberName_Value}/AOS6140']
    page should contain element    ${Filters}
    page should contain element    //ul[@id="BusinessFunction"]


Verify Role
    sleep   5s
    click link  Export to Excel
    sleep   10s
    convert_xls_to_xlsx
    ${Total_Rows} =    read_xlsfile
    log    ${Total_Rows}
    should not be equal as strings    ${Total_Rows}    False

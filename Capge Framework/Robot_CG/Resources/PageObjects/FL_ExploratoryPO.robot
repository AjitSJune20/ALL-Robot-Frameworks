*** Settings ***
Library  SeleniumLibrary
Library    String
Library    DateTime
Library  ../../CustomLibs/DataCreation.py
Library    Collections
Library    AutoItLibrary

Resource  ../Definitions/Common.robot
Resource    ../PageObjects/FLAssessmentPR.robot
Resource  ../PageObjects/SC_E2E_Regession_PO.robot
Resource  ../PageObjects/FLENDToENDPOM.robot
Resource  ../PageObjects/CpCmCase.robot

*** Variables ***
${LTSS_CommRec} =    //div[@id="left-nav"]/ul/li/a[text()='Communication Record']
${Add_CommRec} =    //a[@id="add-new-communication-record"]
${Cancel_CommRec} =    //a[@id="btn-Cancel-Create-CommRec"]
${btn_submit_CommRec} =    //a[@id="btn-save-CommRec"]
${Late_Entry} =    //label[@for="IsLateEntry" and text()='Late Entry']
${LateEntryDate} =    //input[@id="LateEntryDate"]
${LateEntryTime} =    //input[@id="LateEntryTime"]
${TimeZoneCode} =    //select[@id="TimeZoneCode"]
${Ltss_Comm_Type} =    //select[@id="ControlId686"]
${Ltss_Contact_Method} =    //select[@id="ControlId688"]
${Ltss_ContactType} =    //select[@id="ControlId691"]
${Ltss_CallOutcome} =    //select[@id="ControlId699"]
${Ltss_CallResult} =    //select[@id="ControlId701"]
${Ltss_Comm_Description} =    //select[@id="ControlId705"]
${Ltss_Friquency} =    //select[@id="ControlId781"]
${Ltss_CallAttemptNumber} =    //select[@id="ControlId703"]
${Ltss_ContactName} =    //input[@id="ContactName"]
${Ltss_ContactNumber} =    //input[@id="ContactNumber"]
${Comm_Filter} =    //*[@id="communication-record-grid-container"]//li/a/span[text()='Filter']
${ltssComm_FilterForm} =    //form[@id="ClincalCaseCommunicationRecordFilterForm"]
${Filter_Outbound} =    //div[@id="CommunicationTypes"]/div[2]//ol//a[text()='Outbound']
${selected_Outbound} =    //div[@id="CommunicationTypes"]/div[2]//ol//li[@class='selected']//a[text()='Outbound']
${ApplyFilter} =    //form[@id='ClincalCaseCommunicationRecordFilterForm']/div[1]/div/a[3]/img
${ClearFilter} =    //form[@id='ClincalCaseCommunicationRecordFilterForm']/div[1]/div/a[2]/img
${CreatedBy}
${CreatedDate}

# Changes by Amol Pawar,  changes for: Create comm rec at Ltss case level
*** Keywords ***
Navigate to LTSS Comm Rec
    wait until element is visible    ${LTSS_CommRec}    20s
    sleep    1s
    click element    ${LTSS_CommRec}
    wait until page contains    Case - Communication Record    20s

Verify Late Entry Fields Date_Time_TimeZone
    set selenium implicit wait    20s
    click element    ${Late_Entry}
    sleep    2s
    wait until element is visible    ${LateEntryDate}    20s
    element should be visible    ${LateEntryDate}
    element should be visible    ${LateEntryTime}
    element should be visible    ${TimeZoneCode}
    sleep    2s
    click element    ${Late_Entry}
    sleep    1s
#    click element    ${Cancel_CommRec}
#    wait until page contains    Case - Communication Record    20s

Navigate to Create Comm Record
    wait until element is visible    ${Add_CommRec}    30s
    click element    ${Add_CommRec}
    wait until element is visible    ${Late_Entry}    40s

Add Outbound Communication Record in Ltss case
    [Arguments]    ${UserData}
    wait until element is visible    ${Ltss_ContactName}    40s
    input text    ${Ltss_ContactName}    ${UserData.ContactName}
    input text    ${Ltss_ContactNumber}    ${UserData.ContactNumber}
    select from list by label    ${Ltss_Comm_Type}    ${UserData.CommunicationType}
    wait until element is visible    ${Ltss_Contact_Method}    30s
    select from list by label    ${Ltss_Contact_Method}    ${UserData.ContactMethod}
    select from list by label    ${Ltss_ContactType}    ${UserData.ContactType}
    select from list by label    ${Ltss_CallOutcome}    ${UserData.CallOutcome}
    select from list by label    ${Ltss_CallResult}    ${UserData.CallResult}
    select from list by label    ${Ltss_Comm_Description}    ${UserData.CommunicationDescription}
    select from list by label    ${Ltss_Friquency}    ${UserData.FriquencyOfContact}
    select from list by label    ${Ltss_CallAttemptNumber}    ${UserData.ContactAttemptNumber}
    scroll element into view    ${btn_submit_CommRec}
    sleep    1s
    click link    ${btn_submit_CommRec}

Get Member Details from Comm Rec
    sleep    2s
    wait until element is visible    //div[@id="ClincalCaseCommunicationRecord"]//div/span[text()='Outbound']    30s
    click element    //div[@id="ClincalCaseCommunicationRecord"]//div/span[text()='Outbound']
    wait until element is visible    //div[@id="CreatedByName"]    10s
    ${CreatedBy} =    get text    //div[@id="CreatedByName"]
    ${Createdate} =    get text    //div[@id="DisplayCreatedDate"]
    ${CreatedBy} =    strip string    ${CreatedBy}    mode=both
    ${Createdate} =    strip string    ${Createdate}    mode=both
    set global variable    ${CreatedBy}
    set global variable    ${Createdate}
    log    ${CreatedBy}
    log    ${Createdate}
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="ClincalCaseCommunicationRecord"]//div/span[text()='Outbound']    20s

Clear all filter
    wait until element is visible    ${Comm_Filter}    20s
    click element    ${Comm_Filter}
    wait until element is visible    ${ltssComm_FilterForm}    20s
    sleep    1s
    click element    ${ClearFilter}
    sleep    1s
    click element    ${ApplyFilter}

Select Filter as per communicationType
    [Arguments]    ${UserData}    ${CommunicationType}
    set focus to element     ${Comm_Filter}
    sleep    2s
    click element    ${Comm_Filter}
    wait until element is visible    ${ltssComm_FilterForm}    20s
    click element    //div[@id="CommunicationTypes"]/div[2]//ol//a[text()='${CommunicationType}']
    wait until element is visible    //div[@id="CommunicationTypes"]/div[2]//ol//li[@class='selected']//a[text()='${CommunicationType}']    20s
    click element    ${ApplyFilter}

Verify Filter for Ltss Comm Rec
    [Arguments]    ${UserData}    ${CommunicationType}
    sleep    4s
    ${Expected_rowcount} =    get element count    //div[@id="ClincalCaseCommunicationRecord"]/div[2]//tbody/tr/td[3][text()='${CommunicationType}']
    ${Actual_rowcount} =    get element count    //div[@id="ClincalCaseCommunicationRecord"]/div[2]//tbody/tr
    log    ${Expected_rowcount} Expected
    log    ${Actual_rowcount} Actual
    should be equal as strings    ${Actual_rowcount}    ${Expected_rowcount}

verify the Comm record details from LTSS Level
    [Arguments]    ${UserData}
    set selenium implicit wait    20s
    element should be visible    //div[@id="MemberCentralCommunicationRecord"]/div[2]//td[text()='${CreatedBy}']
    element should be visible    //div[@id="MemberCentralCommunicationRecord"]/div[2]//td[text()='${Createdate}']
    element should be visible    //div[@id="MemberCentralCommunicationRecord"]/div[2]//td[text()='${UserData.CommunicationType}']

Navigate to Add Comm Record to verify Side Banner
    click link  Member Central
    sleep    1s
    Click on the LTSS Case
    Select the Case
    Navigate to LTSS Comm Rec
    Navigate to Create Comm Record     #click on Add Button

*** Variables ***
${HistoryPrintDropdown} =    //div[@id="CommunicationRecordHistoryGridPrintDropdown"]
${EditPrintDropdown} =    //div[@id="ClincalCaseCommunicationRecordPrintDropdown"]
${PrintCommRec} =    //div[@id="CommunicationRecord"]
${PrintCommRec_AuthEdit} =    //a[@id="btnAuthCommunicationRecordPrint"]
${CommRec_HistoryLabel} =    //div[@id="CommunicationRecordHistoryGrid"]//tbody/tr[1]/td//label
${btn_EditCommRec} =    //a[@id="edit-communication-record"]

*** Keywords ***
Click left Side Banner and Verify Details
    [Arguments]    ${UserData}
    set selenium implicit wait    30s
    Split the left side banner
    element should be visible    //div[@id="sbsCreatedByName" and text()='${CreatedBy}']
    element should be visible    //div[@id="sbsDisplayCreatedDate" and text()='${Createdate}']
    element should be visible    //div[@id="sbsControlId686" and contains(text(),'${UserData.CommunicationType}')]
    sleep    1s
    select from list by label    ${Ltss_Comm_Type}    ${UserData.CommunicationType}
    wait until element is visible    ${Ltss_Contact_Method}    20s
    Verify Details for Outbound Comumunication Type
    Split the left side banner
    Verify Details for Outbound Comumunication Type
    Split the left side banner
    Split the left side banner
    Verify Details for Outbound Comumunication Type

Verify Print and Pdf downloading on History and Edit screen
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
#    wait until element is visible    //div[@id="ClincalCaseCommunicationRecord"]/div[2]//table/tbody/tr[1]/td[text()='${CreatedBy}'][1]   20s
    wait until element is visible    (//div[@id="ClincalCaseCommunicationRecord"]//following::div/span[text()='${CreatedBy}'])[1]    20s
    sleep    1s
    click element    (//div[@id="ClincalCaseCommunicationRecord"]//div/img[@src="https://${INSTANCE}-carehub.humana.com/cgx/Content/humana/images/Web/history.png"])[1]
#    click element    //div[@id="ClincalCaseCommunicationRecord"]/div[2]//table/tbody/tr[1]/td[@title="History"]//a[@class="viewHistoryAnchor "]/img
    wait until page contains    Communication Record History    20s
    click element    ${CommRec_HistoryLabel}    # click on history record
    wait until element is visible    ${HistoryPrintDropdown}
    click element    ${HistoryPrintDropdown}
    wait until element is visible    ${PrintCommRec}
    click element    ${PrintCommRec}
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecLTSS_HistoryScreen${Today}
    wait until page contains    Communication Record History    10s
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecLTSS_HistoryScreen${Today}.pdf
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    (//div[@id="ClincalCaseCommunicationRecord"]//following::div/span[text()='${CreatedBy}'])[1]    20s    # back of Hostory page
    click element    ${btn_EditCommRec}     # click on Edit
    wait until element is visible    //div[@id="ClincalCaseCommunicationRecord"]//div[@class="grid-canvas"]/div/div/label    30s
    click element    //div[@id="ClincalCaseCommunicationRecord"]//div[@class="grid-canvas"]/div/div/label       # Select record on edit screen
    click element    ${EditPrintDropdown}    # Print dropdown on edit screen
    wait until element is visible    ${PrintCommRec}
    click element    ${PrintCommRec}
    Check if pdf is able to download or not    CommRecLTSS_EditScreen${Today}
    wait until element is visible    (//div[@id="ClincalCaseCommunicationRecord"]//following::div/span[text()='${CreatedBy}'])[1]    30s
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecLTSS_EditScreen${Today}.pdf


Split the left side banner
    sleep    2s
    ${Element1}    Get WebElement    //a[@id='side-by-side-flyout-button']
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${Element1}
    sleep    2s

Verify Details for Outbound Comumunication Type
    set selenium implicit wait    20s
    element should be visible    ${Ltss_Contact_Method}
    element should be visible    ${Ltss_ContactType}
    element should be visible    ${Ltss_CallOutcome}
    element should be visible    ${Ltss_CallResult}
    element should be visible    ${Ltss_Comm_Description}
    element should be visible    ${Ltss_CallAttemptNumber}
#######################################################################
# Changes by Amol Pawar,  changes for: TC05_FL_Create comm rec at Member Central Level
Create communication record at MC Level
    [Arguments]    ${UserData}
    sleep    4s
    ${Chk_CommRec} =    run keyword and return status    element should be visible    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]
    run keyword if    ${Chk_CommRec}    Comm Record Without Checking Late Entery at MC Level   ${UserData}
    ...    ELSE    Comm Record With Checking Late Entery at MC Level   ${UserData}

Comm Record Without Checking Late Entery at MC Level
    [Arguments]    ${UserData}
    Navigate to Create Comm Record
    Add Outbound Communication Record in MC Level   ${UserData}

Comm Record With Checking Late Entery at MC Level
    [Arguments]    ${UserData}
     Navigate to Create Comm Record
     Verify Late Entry Fields Date_Time_TimeZone
     Add Outbound Communication Record in MC Level   ${UserData}

Get MemberDetails from Comm Rec at MC level
    sleep    2s
    wait until element is visible    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]    30s
    click element    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]
    ${UpdatedBy} =    get text    //div[@id="UpdatedByName"]
    ${Updatedate} =    get text    //div[@id="DisplayUpdatedDate"]
    ${UpdatedBy} =    strip string    ${UpdatedBy}    mode=both
    ${Updatedate} =    strip string    ${Updatedate}    mode=both
    set global variable    ${UpdatedBy}
    set global variable    ${Updatedate}
    log    ${UpdatedBy}
    log    ${Updatedate}
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]    20s

*** Variables ***
${MC_FilterForm} =    //form[@id="MemberCentralCommunicationRecordFilterForm"]
${MC_ApplyFilter} =    //form[@id='MemberCentralCommunicationRecordFilterForm']/div[1]/div/a[3]/img
${MC_ClearFilter} =    //form[@id='MemberCentralCommunicationRecordFilterForm']/div[1]/div/a[2]/img
${btn_PrintOnViewScren} =    //a[@id="print-button"]/div
${PrintCommRec_VwScreen} =    //*[@id="print-CommunicationRecord"]
*** Keywords ***
Select Filter asper communicationType at MC Level
    [Arguments]    ${UserData}    ${CommunicationType}
    set focus to element     ${Comm_Filter}
    sleep    2s
    click element    ${Comm_Filter}
    wait until element is visible    ${MC_FilterForm}    20s
    click element    //div[@id="CommunicationTypes"]/div[2]//ol//a[text()='${CommunicationType}']
    wait until element is visible    //div[@id="CommunicationTypes"]/div[2]//ol//li[@class='selected']//a[text()='${CommunicationType}']    20s
    click element    ${MC_ApplyFilter}

Verify Filter for Comm Rec at MC level
    [Arguments]    ${UserData}    ${CommunicationType}
    sleep    2s
    ${Expected_rowcount} =    get element count    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr/td[4][text()='${CommunicationType}']
    ${Actual_rowcount} =    get element count    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr
    log    ${Expected_rowcount} Expected
    log    ${Actual_rowcount} Actual
    should be equal as strings    ${Actual_rowcount}    ${Expected_rowcount}

Clear all filter at MC level
    wait until element is visible    ${Comm_Filter}    20s
    click element    ${Comm_Filter}
    wait until element is visible    ${MC_FilterForm}    20s
    sleep    1s
    click element    ${MC_ClearFilter}
    sleep    1s
    click element    ${MC_ApplyFilter}

*** Variables ***
${UpdatedBy}
${Updatedate}
${MC_Comm_Type} =    //select[@id="ControlId75"]
${MC_Contact_Method} =    //select[@id="ControlId77"]
${MC_ContactType} =    //select[@id="ControlId80"]
${MC_CallOutcome} =    //select[@id="ControlId88"]
${MC_CallResult} =    //select[@id="ControlId90"]
${MC_Comm_Description} =    //select[@id="ControlId94"]
${MC_CallAttemptNumber} =    //select[@id="ControlId92"]
${MC_Friquency} =    //select[@id="ControlId513"]
${MC_OnsiteType} =    //select[@id="ControlId3510"]
${MC_CallAuthenticated} =    //label[@for="ControlId147-radio-1-NO0110"]
${MC_CallerInfo} =    //label[@for="ControlId87-radio-1-NO0110"]
${DateOfSignificantChange} =    //input[@id='ControlId2884']
${ReasonForSignificantChange} =    //select[@id='ControlId3524']
${SignificantChangeNotes} =    //textarea[@id="ControlId3526"]
${TypeOfMember} =    //label[@for="ControlId571-radio-37-LT0220"]
${EligibilityVerified} =    //label[@for="ControlId520-radio-1-YE0330"]
${ReviewGoal} =    //label[@for="ControlId527-radio-1-NO0110"]
${ReviewGoalNotes} =    //textarea[@id="ControlId528"]
${Repatriation} =    //label[@for="ControlId569-radio-1-NO0110"]
${RepatriationNotes} =    //textarea[@id="ControlId570"]
${Representative} =    //label[@for="ControlId530-radio-1-NO0110"]
${RepresentativeNotes} =    //textarea[@id="ControlId531"]
${Satisfaction} =    //label[@for="ControlId533-radio-1-NO0110"]
${SatisfactionNotes} =    //textarea[@id="ControlId534"]
${ServiceUse} =    //label[@for="ControlId536-radio-1-NO0110"]
${ServiceUseNotes} =    //textarea[@id="ControlId537"]
${EducationMaterial} =    //label[@for="ControlId539-radio-1-NO0110"]
${EducationMaterialNotes} =    //textarea[@id="ControlId540"]
${ExploitationWithMember} =    //label[@for="ControlId542-radio-1-NO0110"]
${ExploitationWithMemberNotes} =    //textarea[@id="ControlId543"]
${ReportConcerns} =    //label[@for="ControlId545-radio-1-NO0110"]
${ReportConcernsNotes} =    //textarea[@id="ControlId546"]
${hearingProcess} =    //label[@for="ControlId548-radio-1-NO0110"]
${hearingProcessNotes} =    //textarea[@id="ControlId549"]
${AppropriateForm} =    //label[@for="ControlId551-radio-1-NO0110"]
${AppropriateFormNotes} =    //textarea[@id="ControlId552"]
${FolloupRequired} =    //label[@for="ControlId554-radio-1-YE0330"]
${FolloupRequiredNotes} =    //textarea[@id="ControlId555"]
${Hospitalizations} =    //li[@id="ControlId558-1"]/a
${HospitalizationsNotes} =    //textarea[@id="ControlId559"]
${PDOStatus} =    //select[@id="ControlId556"]
${PDONotes} =    //textarea[@id="ControlId557"]
${StatementByMember} =    //textarea[@id="ControlId560"]
${MemberSpecificNeed} =    //textarea[@id="ControlId561"]
${DMIntervention} =    //textarea[@id="ControlId562"]
${Signature_Credentials} =    //textarea[@id="ControlId563"]
${PhysicalEnv} =    //textarea[@id="ControlId564"]
${PhysicalCondition} =    //textarea[@id="ControlId565"]
${EmotionalWellBeing} =    //textarea[@id="ControlId566"]
${UpcommingApoinment} =    //textarea[@id="ControlId567"]
${AdditionalComments} =    //textarea[@id="ControlId568"]
${FollowupWithMember} =    //select[@id='ControlId100']
${HistoryIconInMC} =    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]/td[@title="History"]//a[@class="viewHistoryAnchor "]/img
${EditPrintDropdownAtMCLevel} =    //div[@id="MemberCentralCommunicationRecordPrintDropdown"]
${MC_MemberState} =    //select[@id="ControlId512"]

*** Keywords ***
Add Outbound Communication Record in MC Level
    [Arguments]    ${UserData}
    input text    ${Ltss_ContactName}    ${UserData.ContactName}
    input text    ${Ltss_ContactNumber}    ${UserData.ContactNumber}
    select from list by label    ${MC_Comm_Type}    ${UserData.CommunicationType}
    wait until element is visible    ${MC_Contact_Method}    20s
    select from list by label    ${MC_Contact_Method}    ${UserData.ContactMethod}
    select from list by label    ${MC_ContactType}    ${UserData.ContactType}
    select from list by label    ${MC_OnsiteType}    ${UserData.OnsiteType}
    select from list by label    ${MC_CallOutcome}    ${UserData.CallOutcome}
    sleep    1s
    click element    ${MC_CallAuthenticated}
    sleep    1s
    click element    ${MC_CallerInfo}
    sleep    1s
    select from list by label    ${MC_CallResult}    ${UserData.CallResult}
    select from list by label    ${MC_Comm_Description}    ${UserData.CommunicationDescription}
### New changes for MC velel com rec
    sleep    1s
    select from list by label    ${MC_MemberState}     ${UserData.MemberState}
### NEw change ends here
    select from list by label    ${MC_Friquency}    ${UserData.FriquencyOfContact}
    Enter Curent Date    ${DateOfSignificantChange}
    select from list by label    ${ReasonForSignificantChange}    ${UserData.ReasonForSignificantChange}
    input text    ${SignificantChangeNotes}    ${UserData.SignificantChangeNotes}
    select from list by label    ${MC_CallAttemptNumber}    ${UserData.ContactAttemptNumber}
    scroll element into view    ${TypeOfMember}
    sleep    1s
    click element    ${TypeOfMember}
    sleep    1s
    click element    ${EligibilityVerified}
    click element    ${ReviewGoal}
    input text    ${ReviewGoalNotes}    ${UserData.ReviewGoalNotes}
    click element    ${Repatriation}
    input text    ${RepatriationNotes}    ${UserData.RepatriationNotes}
    click element    ${Representative}
    input text    ${RepresentativeNotes}    ${UserData.RepresentativeNotes}
    click element    ${Satisfaction}
    input text    ${SatisfactionNotes}    ${UserData.SatisfactionNotes}
    click element    ${ServiceUse}
    input text    ${ServiceUseNotes}    ${UserData.ServiceUseNotes}
    click element    ${EducationMaterial}
    input text    ${EducationMaterialNotes}    ${UserData.EducationMaterialNotes}
    click element    ${ExploitationWithMember}
    input text    ${ExploitationWithMemberNotes}    ${UserData.ExploitationWithMemberNotes}
    click element    ${ReportConcerns}
    input text    ${ReportConcernsNotes}    ${UserData.ReportConcernsNotes}
    click element    ${hearingProcess}
    input text    ${hearingProcessNotes}    ${UserData.hearingProcessNotes}
    click element    ${AppropriateForm}
    input text    ${AppropriateFormNotes}    ${UserData.AppropriateFormNotes}
    click element    ${FolloupRequired}
    input text    ${FolloupRequiredNotes}    ${UserData.FolloupRequiredNotes}
    click element    ${Hospitalizations}
    input text    ${HospitalizationsNotes}    ${UserData.HospitalizationsNotes}
    select from list by label    ${PDOStatus}    ${UserData.PDOStatus}
    input text    ${PDONotes}    ${UserData.PDONotes}
    input text    ${StatementByMember}    ${UserData.StatementByMember}
    input text    ${MemberSpecificNeed}    ${UserData.MemberSpecificNeed}
    input text    ${DMIntervention}    ${UserData.DMIntervention}
    input text    ${Signature_Credentials}    ${UserData.Signature_Credentials}
    input text    ${PhysicalEnv}    ${UserData.PhysicalEnv}
    input text    ${PhysicalCondition}    ${UserData.PhysicalCondition}
    input text    ${EmotionalWellBeing}    ${UserData.EmotionalWellBeing}
    input text    ${UpcommingApoinment}    ${UserData.UpcommingApoinment}
    input text    ${AdditionalComments}    ${UserData.AdditionalComments}
    select from list by label    ${FollowupWithMember}    ${UserData.FollowUpWithMember}
    click link    ${btn_submit_CommRec}

Check PDF Download in ViewScreen at MC level
    [Arguments]    ${UserData}
    wait until element is visible    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]/td[contains(text(),'${UserData.CommunicationType}')]    30s
    click element    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]/td[contains(text(),'${UserData.CommunicationType}')]
    wait until element is visible    ${btn_PrintOnViewScren}    20s
    click element    ${btn_PrintOnViewScren}
    wait until element is visible    ${PrintCommRec_VwScreen}    30s
    click element    ${PrintCommRec_VwScreen}
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecMC_ViewScreen${Today}
    wait until element is visible    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecMC_ViewScreen${Today}.pdf
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]    30s

Check PDF Download in History at MC level
    sleep    2s
    click element    ${HistoryIconInMC}
    wait until page contains    Communication Record History    30s
    click element    ${CommRec_HistoryLabel}     #Clicking the history record
    wait until element is visible    ${HistoryPrintDropdown}    20s
    click element    ${HistoryPrintDropdown}
    wait until element is visible    ${PrintCommRec}
    click element    ${PrintCommRec}
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecMC_HistoryScreen${Today}
    wait until element is visible    ${CommRec_HistoryLabel}    30s
    sleep    2s
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecMC_HistoryScreen${Today}.pdf
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]    30s

Check PDF Download in EditScreen at MC level
    sleep    2s
    click element    ${btn_EditCommRec}     # click on Edit
    wait until element is visible    //*[@id="MemberCentralCommunicationRecord"]//tbody/tr[1]/td[1]/div/label    30s
    click element    //*[@id="MemberCentralCommunicationRecord"]//tbody/tr[1]/td[1]/div/label       # Select record on edit screen
    click element    ${EditPrintDropdownAtMCLevel}    # Print dropdown on edit screen
    wait until element is visible    ${PrintCommRec}
    click element    ${PrintCommRec}
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecMC_EditScreen${Today}
    wait until element is visible    //*[@id="MemberCentralCommunicationRecord"]//tbody/tr[1]/td[1]/div/label
    sleep    2s
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecMC_EditScreen${Today}.pdf
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="MemberCentralCommunicationRecord-gridContent"]/div/div[2]//tbody/tr[1]    30s

####### Changes by Amol Pawar for Create comuncation record at Auth Level
Navigate to Authlevel Comm Rec
    [Arguments]    ${UserData}
    sleep    1s
    click link  Member Central
    sleep    1s
    Navigate Authorization Page
#    click element    //div[@id='MemberCentralAuth-gridContent']//td[contains(text(),'088323938')]
    click element    //div[@id='MemberCentralAuth-gridContent']//td[contains(text(),'${UserData.AuthID_Value}')]
    scroll element into view    ${Auth_Comm_rec}
    click element    ${Auth_Comm_rec}

*** Variables ***
${Auth_Comm_rec} =    //*[@id="left-navAuth"]/ul//a[contains(text(),'Communication Record')]
${Auth_Comm_Type} =    //select[@id="ControlId102"]
${Auth_Contact_Method} =    //select[@id="ControlId104"]
${Auth_ContactType} =    //select[@id="ControlId107"]
${OtherAuthChoices} =    //label[@for="checkbox-ControlId114-OU1820"]
${AuthCommrecPrint_VwScreen} =    //a[@id="btn-print-authCommRec"]

*** Keywords ***
Add Outbound Communication Record at Auth Level
    [Arguments]    ${UserData}
    input text    ${Ltss_ContactName}    ${UserData.ContactName}
    sleep    1s
    input text    ${Ltss_ContactNumber}    ${UserData.ContactNumber}
    sleep    1s
    select from list by label    ${Auth_Comm_Type}    ${UserData.CommunicationType}
    wait until element is visible    ${Auth_Contact_Method}    20s
    select from list by label    ${Auth_Contact_Method}    ${UserData.ContactMethod}
    select from list by label    ${Auth_ContactType}    ${UserData.ContactType}
    click element    ${OtherAuthChoices}
    sleep    1s
    click link    ${btn_submit_CommRec}

Get Member Details from Auth level Comm Rec
    sleep    2s
    wait until element is visible    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]    30s
    click element    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]
    ${UpdatedBy} =    get text    //div[@id="UpdatedByName"]
    ${Updatedate} =    get text    //div[@id="DisplayUpdatedDate"]
    ${UpdatedBy} =    strip string    ${UpdatedBy}    mode=both
    ${Updatedate} =    strip string    ${Updatedate}    mode=both
    set global variable    ${UpdatedBy}
    set global variable    ${Updatedate}
    log    ${UpdatedBy}
    log    ${Updatedate}
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]    20s


verify the Comm record details from Auth Level
    [Arguments]    ${UserData}
    set selenium implicit wait    20s
    element should be visible    //div[@id="MemberCentralCommunicationRecord"]/div[2]//td[text()='${UpdatedBy}']
    element should be visible    //div[@id="MemberCentralCommunicationRecord"]/div[2]//td[text()='${Updatedate}']
    element should be visible    //div[@id="MemberCentralCommunicationRecord"]/div[2]//td[text()='${UserData.CommunicationType}']

Check PDF Download in ViewScreen at Auth level
    [Arguments]    ${UserData}
    wait until element is visible    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]/td[contains(text(),'${UserData.CommunicationType}')]    30s
    click element    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]/td[contains(text(),'${UserData.CommunicationType}')]
    wait until element is visible    ${AuthCommrecPrint_VwScreen}    30s
    click element    ${AuthCommrecPrint_VwScreen}
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecAuth_ViewScreen${Today}
    wait until element is visible    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecAuth_ViewScreen${Today}.pdf
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]

Check PDF Download in HistoryScreen at Auth level
    [Arguments]    ${UserData}
    set selenium implicit wait    30s
    click element    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]/td[9]/div//img     #Clicking the history record
    wait until element is visible    //div[@id="CommunicationRecordHistoryGrid-gridContent"]//tbody/tr/td//label    20s
    click element    //div[@id="CommunicationRecordHistoryGrid-gridContent"]//tbody/tr/td//label      #select 1st record
    wait until element is visible    //a[@id="btnCommunicationRecordHistoryGridPrint"]/span     #Print btn
    click element    //a[@id="btnCommunicationRecordHistoryGridPrint"]/span
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecAuth_HistoryScreen${Today}
    wait until element is visible    //div[@id="CommunicationRecordHistoryGrid-gridContent"]//tbody/tr/td//label    30s
    sleep    2s
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecAuth_HistoryScreen${Today}.pdf
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]    30s

Check PDF Download in EditScreen at Auth level
    [Arguments]    ${UserData}
    set selenium implicit wait    30s
    click element    ${btn_EditCommRec}     #Clicking the edit
    wait until element is visible    //div[@id="AuthCommunicationRecord-gridContent"]//tbody/tr[1]/td//label     #selecting redord in edit screen
    click element    //div[@id="AuthCommunicationRecord-gridContent"]//tbody/tr[1]/td//label
    wait until element is visible    ${PrintCommRec_AuthEdit}
    click element    ${PrintCommRec_AuthEdit}
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecAuth_EditScreen${Today}
    wait until element is visible    //div[@id="AuthCommunicationRecord-gridContent"]//tbody/tr[1]/td//label
    sleep    2s
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecAuth_EditScreen${Today}.pdf
    click element    //div[@id="layout-main-body-content"]/div//u[text()='Back']
    wait until element is visible    //div[@id="AuthCommunicationRecord"]/div[2]//table/tbody/tr[1]    30s

#####    Creates by Navya Paidipati for FL #######
*** Variables ***
${LTSS_Commrecord} =   //a[@href='/cgx/CommRec/CommRec/ClinicalCaseCommunicationRecord']
#${LTSS_CommRec} =    //div[@id="left-nav"]/ul/li/a[text()='Communication Record']
#${Add_CommRec} =    //a[@id="add-new-communication-record"]
#${Cancel_CommRec} =    //a[@id="btn-Cancel-Create-CommRec"]
#${btn_submit_CommRec} =    //a[@id="btn-save-CommRec"]
#${Late_Entry} =    //label[@for="IsLateEntry" and text()='Late Entry']
#${LateEntryDate} =    //input[@id="LateEntryDate"]
#${LateEntryTime} =    //input[@id="LateEntryTime"]
#${TimeZoneCode} =    //select[@id="TimeZoneCode"]
#${Ltss_Comm_Type} =    //select[@id="ControlId686"]
#${Ltss_Contact_Method} =    //select[@id="ControlId688"]
#${Ltss_ContactType} =    //select[@id="ControlId691"]
#${Ltss_CallOutcome} =    //select[@id="ControlId699"]
#${Ltss_CallResult} =    //select[@id="ControlId701"]
#${Ltss_Comm_Description} =    //select[@id="ControlId705"]
#${Ltss_Friquency} =    //select[@id="ControlId781"]
#${Ltss_CallAttemptNumber} =    //select[@id="ControlId703"]
#${Ltss_ContactName} =    //input[@id="ContactName"]
#${Ltss_ContactNumber} =    //input[@id="ContactNumber"]
#${Comm_Filter} =    //*[@id="communication-record-grid-container"]//li/a/span[text()='Filter']
#${ltssComm_FilterForm} =    //form[@id="ClincalCaseCommunicationRecordFilterForm"]
#${Filter_Outbound} =    //div[@id="CommunicationTypes"]/div[2]//ol//a[text()='Outbound']
#${selected_Outbound} =    //div[@id="CommunicationTypes"]/div[2]//ol//li[@class='selected']//a[text()='Outbound']
#${ApplyFilter} =    //form[@id='ClincalCaseCommunicationRecordFilterForm']/div[1]/div/a[3]/img
#${ClearFilter} =    //form[@id='ClincalCaseCommunicationRecordFilterForm']/div[1]/div/a[2]/img
#${CreatedBy}
#${CreatedDate}
${CommnityLivingSupportPlan} =    //select[@id='ControlId3786']
${CLSPOptions} =   //select[@id='ControlId3787']
${CLSPCOmpletionDate} =    //input[@id='ControlId4095']
${CallAttemptNumber} =   //select[@id='ControlId703']






*** Keywords ***
Navigate to Communication record page under LTSS Case
      set selenium implicit wait    10s
      click element  ${LTSS_Commrecord}
      wait until page contains   Case - Communication Record   30s
      wait until page contains element   ${CPCM_AddCommunicationbuttonUndercaselevel}

Navigate to Create Comm Record under LTSS Case
    wait until element is visible    ${Add_CommRec}    20s
    click element    ${Add_CommRec}
    wait until element is visible    ${Late_Entry}    20s


Verify Community Living Support Plan Comm Rec
    [Arguments]    ${UserData}
    input text    ${Ltss_ContactName}    ${UserData.ContactName}
    input text    ${Ltss_ContactNumber}    ${UserData.ContactNumber}
    select from list by label    ${Ltss_Comm_Type}    ${UserData.CommunicationType}
    wait until element is visible    ${Ltss_Contact_Method}    20s
    select from list by label    ${Ltss_Contact_Method}    ${UserData.ContactMethod}
    select from list by label    ${Ltss_ContactType}    ${UserData.ContactType}
    select from list by label    ${Ltss_CallOutcome}    ${UserData.CallOutcome}
    select from list by label    ${Ltss_CallResult}    ${UserData.CallResult}
    select from list by label    ${CallAttemptNumber}   ${UserData.CallAttemptNumber}
    select from list by label    ${Ltss_Comm_Description}    ${UserData.CommunicationDescription}
    wait until element is visible    ${CommnityLivingSupportPlan}   30s
    ${CommityLivingSupplanValues} =   get text   ${CommnityLivingSupportPlan}
    ${CommityLivingSupplanvalues_test}=  replace string using regexp     ${CommityLivingSupplanValues}  \n  ${SPACE}
    should be equal as strings  ${CommityLivingSupplanvalues_test}   ${UserData.CommnityLivingSupportPlandropdownvalues}
    select from list by label    ${CommnityLivingSupportPlan}     ${UserData.CommnityLivingSupportPlan}
    wait until element is visible   ${CLSPOptions}    30s
    ${CLSPOptionsDropDownValues} =   get text   ${CLSPOptions}
    ${CLSPOptionsDropDownValues_test} =  replace string using regexp     ${CLSPOptionsDropDownValues}    \n  ${SPACE}
    should be equal as strings  ${CLSPOptionsDropDownValues_test}   ${UserData.CLSPDropdownValues}
    page should contain element   ${CLSPCOmpletionDate}
    select from list by label   ${CLSPOptions}   ${UserData.CLSPOptions}
    ${Today} =      get current date    result_format=%m/%d/%Y
    input text    ${CLSPCOmpletionDate}   ${Today}
    click link    ${btn_submit_CommRec}


Navigate to view Comm record under LTSS case
   set selenium implicit wait   10s
   page should contain element   ${Add_CommRec}
   sleep   2s
   click element    //div[@id='ClincalCaseCommunicationRecord-gridContent']//table/tbody/tr[1]/td[1]


######################### View Page ######################
*** Variables ***
${ContactName_View} =   //label[text()='Contact Name']/following::div[1]
${ContactNumber_View} =   //label[text()='Contact Number']/following::div[1]
${CommType_View} =  //div[@id='ControlId686']
${ContactMethod_View} =  //div[@id='ControlId688']
${ContactType_View} =   //div[@id='ControlId691']
${CallOutCome_View} =   //div[@id='ControlId699']
${CallResult_View} =   //label[text()='Call Result']/following::li[1]
${CallAttempt_View} =   //div[@id='ControlId703']
${CommDesc_View} =    //label[text()='Communication Description']/following::li[1]
${CommunityLiving_View} =   //div[@id='ControlId3786']
${CLSPOptions_View}  =    //label[text()='CLSP Options']/following::div[1]
${CLSPCompltionDate_View} =   //div[@id='ControlId4095']
*** Keywords ***
Validate View Comm record under LTSS case
   [Arguments]    ${UserData}
   set selenium implicit wait   10s
   wait until page contains element   ${ContactName_View}    30s
   scroll element into view   ${ContactName_View}
   element should contain    ${ContactName_View}    ${UserData.ContactName}
   element should contain    ${ContactNumber_View}    ${UserData.ContactNumber}
   element should contain    ${CommType_View}    ${UserData.CommunicationType}
   scroll element into view    ${ContactMethod_View}
   element should contain   ${ContactMethod_View}     ${UserData.ContactMethod}
   element should contain   ${ContactType_View}    ${UserData.ContactType}
   scroll element into view    ${CallOutCome_View}
   element should contain    ${CallOutCome_View}    ${UserData.CallOutcome}
   element should contain    ${CallResult_View}    ${UserData.CallResult}
   scroll element into view    ${CallAttempt_View}
   element should contain   ${CallAttempt_View}   ${UserData.CallAttemptNumber}
   scroll element into view   ${CommDesc_View}
   element should contain    ${CommDesc_View}    ${UserData.CommunicationDescription}
   element should contain    ${CommunityLiving_View}     ${UserData.CommnityLivingSupportPlan}
   sleep   2s
   scroll element into view    //div[@id='ControlId3787']
   element should contain     //div[@id='ControlId3787']     ${UserData.CLSPOptions}
   ${Today} =  get current date  result_format=%m/%d/%Y
   element should contain   ${CLSPCompltionDate_View}     ${Today}



################################# LTSS AUTH #################################################
*** Variables ***
${TotalUnitsOnAddServicePopUP} =   //div[@id='TotalUnits']



*** Keywords ***

Create LTSS Auth and Validate Units & frequency on Add Service Details Pop-Up
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    ${Today} =      get current date    result_format=%m/%d/%Y
    #${Tomorrow} =      add time to date    ${Today}   7 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    wait until page does not contain  //*[@id="loading-ajax"]    2 seconds
    click element       ${CreateLTSSAuthBtn}
    wait until page contains    Create Authorization    30 seconds
    input text      ${StartDateLTSSAuth}    ${UserData.StartDate}
    input text      ${EndDateLTSSAuth}    ${UserData.EndDate}
    select from list by label    ${ServiceTypeLTSSAuth}    ${UserData.ServiceType}
    sleep    2s
    wait until page does not contain  //*[@id="loading-ajax"]    30s

    ${Status_ReasonOfDelay} =    run keyword and return status    element should be visible    //select[@id='DelayReason']
    run keyword if    ${Status_ReasonOfDelay}    select from list by label    id:DelayReason    Member Out of Service Area
    sleep    2s
    select from list by label    ${ServiceDecriptionLTSSAuth}    ${UserData.ServiceDecription}
    input text    ${ReasonForRequest}    ${UserData.ReasonForRequest}
    select from list by label    ${ScopeLTSSAuth}    ${UserData.Scope}
    wait until page contains element    ${BarrierLTSSAuth}    30 seconds
    scroll element into view    ${BarrierLTSSAuth}
    select from list by label    ${BarrierLTSSAuth}    ${UserData.Barrier}
    sleep    2s
    scroll element into view    ${AddServiceDetailsLTSSAuth}
    click element       ${AddServiceDetailsLTSSAuth}
    sleep    2s
    wait until page contains    Add Service Details    30 seconds
    ${GranularStatus} =  run keyword and return status    Element should be visible   //select[@id='GranularServiceCode']
    run keyword if   ${GranularStatus}   select from list by index    //select[@id='GranularServiceCode']    1
    wait until page contains element   ${FrequencyLTSSAuth}   30 seconds
    run keyword if   '${UserData.Model}' == 'Add Service Pop up'      Validate Units & frequency on Add Service Details Pop-Up   ${UserData}
    select from list by label    ${FrequencyLTSSAuth}    ${UserData.Frequency}
    wait until page contains element    //label[text()='Calculate Frequency By']    30s
    click element    //input[@name='CalculateFrequencyBy']//following::label[text()='${UserData.CalculateFrequencyBy}']
    input text      ${TotalLTSSAuth}    ${UserData.Total}
    click element       ${SaveServiceLTSSAuthBtn}
    wait until page does not contain  //*[@id="loading-ajax"]    5 seconds
    wait until page contains element    //div[@id='LtssAuthServieInformationGrid-gridContent']//table/tbody/tr
    #select from list by label    ${ProviderCountryCodeLTSSAuth}    ${UserData.ProviderCountryCode}
    #click element       ${FindProviderLTSSAuthBtn}
    sleep    10s
    wait until page does not contain  //*[@id="loading-ajax"]    30s
    ${ProviderCheckStatus} =  run keyword and return status    Element should be visible   ${ProviderCheckkboxLTSSAuthFL}
    run keyword if   ${ProviderCheckStatus}     Select provider checkbox for LTSS Auth
    ...    ELSE     Search Provider Pop Up for LTSS Auth     ${UserData}
    sleep    5s
    wait until page does not contain  //*[@id="loading-ajax"]     30s
    wait until page contains element    //div[@id='primary-provider-summary']     30s
    select from list by label    ${AuthTypeLTSSAuth}    ${UserData.AuthType}
    page should contain element     //input[@id='FinalApproval']/following::label[1]
    scroll element into view    //input[@id='FinalApproval']/following::label[1]
    click element     //input[@id='FinalApproval']/following::label[1]
    page should contain element      //select[@id='OverAllStatusCode' and @disabled]
    select from list by label    ${RequestTypeLTSSAuth}    ${UserData.RequestType}
    input text      ${DateRequestedLTSSAuth}    ${Today}
    scroll element into view   ${AuthSubmissionLTSSAuth}
    sleep  1s
    click element       ${AuthSubmissionLTSSAuth}
    sleep    5s
    ${DuplicateServiceStatus} =    run keyword and return status     element should be visible    ${DuplicatePopup}
    run keyword if    ${DuplicateServiceStatus}     click element    ${DuplicatePopup}
    wait until page contains    View Authorization    30s
    wait until page contains element    ${LTSSAuthID}


Select provider checkbox for LTSS Auth
     set selenium implicit wait     10s
     scroll element into view    ${ProviderCheckkboxLTSSAuthFL}
     click element       ${ProviderCheckkboxLTSSAuthFL}
     click element       ${SetProviderLTSSAuthBtn}



Validate Units & frequency on Add Service Details Pop-Up
    [Arguments]    ${UserData}
    set selenium implicit wait   10s
    ${TotalUnitsEnter} =    set variable    10
    wait until page contains element     ${FrequencyLTSSAuth}
    select from list by label    ${FrequencyLTSSAuth}     Weekly
    wait until page contains element    //label[text()='Calculate Frequency By']    30s
    click element    //input[@name='CalculateFrequencyBy']//following::label[text()='Units']
    wait until element is visible    ${TotalLTSSAuth}    30s
    input text      ${TotalLTSSAuth}    ${TotalUnitsEnter}
    scroll element into view     ${TotalUnitsOnAddServicePopUP}
    ${totalUntits} =   evaluate    ${TotalUnitsEnter}*${UserData.N0OfWeeks}
    element should contain     ${TotalUnitsOnAddServicePopUP}    ${totalUntits}
    scroll element into view    ${FrequencyLTSSAuth}
    select from list by label    ${FrequencyLTSSAuth}     Weekly - Days of Week
    wait until page contains element    //label[text()='Calculate Frequency By']    30s
    click element    //input[@name='CalculateFrequencyBy']//following::label[text()='Units']
    wait until page contains element     //div[@id='DailyTotal']/table/tbody/tr/td
    ${totalWeekyDaysofweekCount} =   set variable    0
    ${ColumnCount} =   get element count     //div[@id='DailyTotal']/table/tbody/tr/td
    ${ColumnCount} =   evaluate    ${ColumnCount}+1
    FOR   ${i}   IN RANGE    2    ${ColumnCount}
         scroll element into view     //div[@id='DailyTotal']/table/tbody/tr/td[${i}]
         input text    //div[@id='DailyTotal']/table/tbody/tr/td[${i}]//input    ${TotalUnitsEnter}
         ${totalWeekyDaysofweekCount} =   evaluate    ${totalWeekyDaysofweekCount}+${TotalUnitsEnter}
    END
    scroll element into view     ${TotalUnitsOnAddServicePopUP}
    ${totalUntits} =   evaluate    ${totalWeekyDaysofweekCount}*${UserData.N0OfWeeks}
    element should contain     ${TotalUnitsOnAddServicePopUP}    ${totalUntits}
    scroll element into view    ${FrequencyLTSSAuth}
    select from list by label    ${FrequencyLTSSAuth}     Bi-Weekly
    wait until page contains element    //label[text()='Calculate Frequency By']    30s
    click element    //input[@name='CalculateFrequencyBy']//following::label[text()='Units']
    wait until element is visible    ${TotalLTSSAuth}    30s
    input text      ${TotalLTSSAuth}    ${TotalUnitsEnter}
    scroll element into view     ${TotalUnitsOnAddServicePopUP}
    ${BiweekCount} =   evaluate    ${UserData.N0OfWeeks}/2
    ${Reminder} =    evaluate    ${UserData.N0OfWeeks}%2
    log    ${Reminder}
    convert to integer    ${Reminder}
    run keyword if   '${Reminder}' == '1'    BI week Odd Totalaunits Validation    ${BiweekCount}   ${TotalUnitsEnter}
    ...   ELSE    BI week Even Totalaunits Validation   ${BiweekCount}    ${TotalUnitsEnter}
    scroll element into view    ${FrequencyLTSSAuth}
    select from list by label    ${FrequencyLTSSAuth}     Bi-Weekly - Days of Week
    wait until page contains element    //label[text()='Calculate Frequency By']    30s
    click element    //input[@name='CalculateFrequencyBy']//following::label[text()='Units']
    wait until page contains element     //div[@id='DailyTotal']/table/tbody/tr/td
    ${totalWeekyDaysofweekCount} =   set variable    0
    ${ColumnCount} =   get element count     //div[@id='DailyTotal']/table/tbody/tr/td
    ${ColumnCount} =   evaluate    ${ColumnCount}+1
    FOR   ${i}   IN RANGE    2    ${ColumnCount}
         scroll element into view     //div[@id='DailyTotal']/table/tbody/tr/td[${i}]
         input text    //div[@id='DailyTotal']/table/tbody/tr/td[${i}]//input    ${TotalUnitsEnter}
         ${totalWeekyDaysofweekCount} =   evaluate    ${totalWeekyDaysofweekCount}+${TotalUnitsEnter}
    END
    scroll element into view     ${TotalUnitsOnAddServicePopUP}
    run keyword if   '${Reminder}' == '1'    BI week Odd Totalaunits Validation    ${BiweekCount}   ${totalWeekyDaysofweekCount}
    ...   ELSE    BI week Even Totalaunits Validation   ${BiweekCount}    ${totalWeekyDaysofweekCount}
    scroll element into view    ${FrequencyLTSSAuth}
    select from list by label    ${FrequencyLTSSAuth}     Monthly
    wait until page contains element    //label[text()='Calculate Frequency By']    30s
    click element    //input[@name='CalculateFrequencyBy']//following::label[text()='Units']
    wait until element is visible    ${TotalLTSSAuth}    30s
    input text      ${TotalLTSSAuth}    ${TotalUnitsEnter}
    scroll element into view     ${TotalUnitsOnAddServicePopUP}
    ${totalUntits} =   evaluate    ${TotalUnitsEnter}*1
    element should contain     ${TotalUnitsOnAddServicePopUP}    ${totalUntits}
    scroll element into view    ${FrequencyLTSSAuth}
    select from list by label    ${FrequencyLTSSAuth}     Monthly - Every Other
    wait until page contains element    //div[@id='MonthlyEveryOtherTotal']    30s
    @{Month} =     split string    ${UserData.StartDate}      /
    log    ${Month}
    input text      //div[@id='MonthlyEveryOtherTotal']/table/tbody/tr/td//input[@area-code='${Month}[0]']    ${TotalUnitsEnter}
    scroll element into view     ${TotalUnitsOnAddServicePopUP}
    ${totalUntits} =   evaluate    ${TotalUnitsEnter}*1
    element should contain     ${TotalUnitsOnAddServicePopUP}    ${totalUntits}






BI week Odd Totalaunits Validation
     [Arguments]    ${BiweekCount}    ${TotalUnitsEnter}
     set selenium implicit wait   10s
     ${totalUntits} =  set variable  0
     ${BiweekCount} =  evaluate   ${BiweekCount}+0.5
     ${totalUntits} =   evaluate    ${TotalUnitsEnter}*${BiweekCount}
    element should contain     ${TotalUnitsOnAddServicePopUP}    ${totalUntits}


BI week Even Totalaunits Validation
     [Arguments]    ${BiweekCount}    ${TotalUnitsEnter}
     set selenium implicit wait   10s
     ${totalUntits} =  set variable  0
     ${totalUntits} =   evaluate    ${TotalUnitsEnter}*${BiweekCount}
    element should contain     ${TotalUnitsOnAddServicePopUP}    ${totalUntits}






###################### TC-04 -ET- PLOC - Services ############################
*** Variables ***
${EditPLOCButton} =    //a[@id='edit-plan-of-care-button']
${ServiceLink} =     (//u[text()='Services'])[1]
${AddServiceButton} =      //a[@id='add-services-goals']
${EndDateInServicePopUp} =    //input[@id='EndDate']

*** Keywords ***
Navigate to Edit PLOC under LTSS case
   set selenium implicit wait  15 Seconds
   click element    //div[@id='left-nav']//a[text()='Plan of Care']
   wait until page contains    Plan of Care    30 seconds
   wait until page contains element     ${EditPLOCButton}     30s
   sleep    2s
   click element    ${EditPLOCButton}
   wait until page contains      Case - Edit Plan of Care     30s

Navigate to Service section in Edit PLOC Page
     set selenium implicit wait    15s
     scroll element into view    (//u[text()='Services'])[1]
     click element    (//u[text()='Services'])[1]
     sleep    1s
     wait until element is visible    ${AddServiceButton}     30s

Removing Existing Nature support and Routine Medical Care Services
     set selenium implicit wait    15s
     ${RowCount} =    get element count    //div[@id='PlanOfCareService-gridContent']//table/tbody/tr/td/div[not(contains(@class,'hide'))]/a/img
     ${RowCount} =    evaluate    ${RowCount}+1
     FOR   ${i}    IN RANGE   1    ${RowCount}
         scroll element into view    //div[@id='PlanOfCareService-gridContent']//table/tbody/tr/td/div[not(contains(@class,'hide'))]/a/img
         click element    //div[@id='PlanOfCareService-gridContent']//table/tbody/tr/td/div[not(contains(@class,'hide'))]/a/img
         sleep    15s
     END

Adding Services In Service pop up
     [Arguments]    ${UserData}
     set selenium implicit wait     30s
     click element    ${AddServiceButton}
     wait until page contains     Add Service     30s
     sleep    2s
     select from list by label    ${SourceInAddServicePopUp}     ${UserData.Source}
     wait until page contains element    ${StartDateInAddServicePopUp}
     ${Today} =      get current date    result_format=%m/%d/%Y
     input text    ${StartDateInAddServicePopUp}     ${Today}
     sleep    1s
     input text    ${EndDateInServicePopUp}     ${Today}
     select from list by label    ${NaturalServiceTypeInAddServicePopUp}    Other
     wait until page contains element     //textarea[@id='NaturalServiceTypeOthers']     30s
     select from list by label    ${NaturalServiceTypeInAddServicePopUp}    ${UserData.ServiceType}
     wait until element is not visible    //textarea[@id='NaturalServiceTypeOthers']     30s
     scroll element into view    ${BarrierInAddServicePopUp}
     input text     ${BarrierInAddServicePopUp}    ${UserData.Barrier}
     scroll element into view    ${ScopeInAddServicePopUp}
     input Text     ${ScopeInAddServicePopUp}      ${UserData.Scope}
     sleep   1s
     click element     ${SaveAndAddInAddServicePopUp}
     #wait until page contains      Service has been added successfully.    30s
     sleep   5s
     select from list by label    ${SourceInAddServicePopUp}     ${UserData.Source1}
     wait until page contains element    //select[@id='Payer']     30s
     select from list by label     //select[@id='Payer']     ${UserData.Payer}
     ${Today} =      get current date    result_format=%m/%d/%Y
     scroll element into view    ${StartDateInAddServicePopUp}
     input text    ${StartDateInAddServicePopUp}     ${Today}
     sleep    1s
     input text    ${EndDateInServicePopUp}     ${Today}
     select from list by label    //select[@id='PayerServiceType']    ${UserData.ServiceType1}
     scroll element into view    ${BarrierInAddServicePopUp}
     input text     ${BarrierInAddServicePopUp}    ${UserData.Barrier1}
     scroll element into view    ${ScopeInAddServicePopUp}
     input Text     ${ScopeInAddServicePopUp}      ${UserData.Scope1}
     sleep   2s
     click element    ${EnterDefaultProviderInAddServicePopUp}
     wait until page contains     Enter Default Provider
     input text    ${NameInEnterDefaultProvier}   Test Provider
     input text    ${PhoneNumberInEnterDefaultProvider}    123-456-7890
     sleep  1s
     click element    ${EnterDefaultProviderInEnterDefaultProviderPopUp}
     wait until page contains element    ${PrimaryDefaultProviderInAddService}   30 seconds
     click element   ${SaveButtonInAddServicePopUp}
     wait until page contains    Service has been Added Successfully   30 seconds
*** Variables ***
${SourceOnViewService} =     //div[@id='PlanOfCareServiceSourceCodeDesc']
${StartDateOnViewService} =     //div[@id='StartDate']
${EndDateOnViewService} =    //div[@id='EndDate']
${ServiceTypeOnViewService} =     //div[@id='NaturalServiceTypeDesc']
${BarrierOnViewService} =     //label[@for='Barrier']//following::pre[1]
${ScopreOnViewServices} =     //label[@for='Scope']//following::pre[1]
${EditButtonViewService} =      //a[@id='non-auth-service-view-edit-btn']
${CancelButtonEditService} =     //a[@id='edit-service-cancel-btn']/u
${PayerInViewService} =     //div[@id='Payer']
*** Keywords ***
Validate Natural Support System Service for View and Edit screen in PLOC
     [Arguments]    ${UserData}
     set selenium implicit wait    10s
     scroll element into view    //div[@id='PlanOfCareService-gridContent']//td[text()='${UserData.Source}']
     click element    //div[@id='PlanOfCareService-gridContent']//td[text()='${UserData.Source}']
#     wait until page contains    View Service    30s
     wait until element is visible    ${SourceOnViewService}    30s
     element should contain    ${SourceOnViewService}     ${UserData.Source}     # Source
     ${Today} =      get current date    result_format=%m/%d/%Y
     element should contain    ${StartDateOnViewService}    ${Today}
     element should contain    ${EndDateOnViewService}      ${Today}
     element should contain    ${ServiceTypeOnViewService}     ${UserData.ServiceType}
     element should contain    ${BarrierOnViewService}    ${UserData.Barrier}
     element should contain    ${ScopreOnViewServices}     ${UserData.Scope}
     sleep    1s
     click element    ${EditButtonViewService}
     wait until page contains    Edit Service     30s
     page should contain element    ${StartDateInAddServicePopUp}
     page should contain element    ${EndDateInServicePopUp}
     page should contain element    ${NaturalServiceTypeInAddServicePopUp}
     page should contain element    ${BarrierInAddServicePopUp}
     page should contain element    ${ScopeInAddServicePopUp}
     sleep    1s
     set focus to element    ${CancelButtonEditService}
     click element    ${CancelButtonEditService}
     wait until element is visible    //div[@id='PlanOfCareService-gridContent']//td[text()='${UserData.Source}']     30s




Validate Routine Medical Care Service for View and Edit screen in PLOC
      [Arguments]    ${UserData}
     set selenium implicit wait    10s
     scroll element into view    //div[@id='PlanOfCareService-gridContent']//td[text()='${UserData.Source1}']
     click element    //div[@id='PlanOfCareService-gridContent']//td[text()='${UserData.Source1}']
     wait until page contains    View Service    30s
     element should contain    ${SourceOnViewService}     ${UserData.Source1}     # Source
     element should contain    ${PayerInViewService}     ${UserData.Payer}
     ${Today} =      get current date    result_format=%m/%d/%Y
     element should contain    ${StartDateOnViewService}    ${Today}
     element should contain    ${EndDateOnViewService}      ${Today}
     element should contain    //div[@id='PayerServiceTypeDesc']     ${UserData.ServiceType1}
     element should contain    ${BarrierOnViewService}    ${UserData.Barrier1}
     element should contain    ${ScopreOnViewServices}     ${UserData.Scope1}
     sleep    1s
     click element    ${EditButtonViewService}
     wait until page contains    Edit Service     30s
     page should contain element    //select[@id='Payer']
     page should contain element    ${StartDateInAddServicePopUp}
     page should contain element    ${EndDateInServicePopUp}
     page should contain element    //select[@id='PayerServiceType']
     page should contain element    ${BarrierInAddServicePopUp}
     page should contain element    ${ScopeInAddServicePopUp}
     sleep    1s
     set focus to element    ${CancelButtonEditService}
     click element    ${CancelButtonEditService}
     wait until element is visible    //div[@id='PlanOfCareService-gridContent']//td[text()='${UserData.Source}']     30s

Submit PLOC for FL
    set selenium implicit wait    10s
    scroll element into view    //label[@for='IsCareManagerVerified-radio-694-1']
    click element    //label[@for='IsCareManagerVerified-radio-694-1']
    sleep    1s
    set focus to element    //a[@id='save-plan-of-care-button']
    click element    //a[@id='save-plan-of-care-button']
    sleep    2s
    wait until page contains    Plan of Care has been saved successfully.     30s

######################### CP CM Case ################################
*** Variables ***
#${ClinicalProgram1} =     //select[@id='ControlId610']
${ClinicalProgram1} =     //select[@id='ControlId4078']
#${CaseName1} =     //input[@id='ControlId611']
${CaseName1} =     //input[@id='ControlId4079']
#${CaseType1} =    //select[@id='ControlId612']
${CaseType1} =    //select[@id='ControlId4080']
#${CaseSource1} =    //select[@id='ControlId613']
${CaseSource1} =    //select[@id='ControlId4081']
#${ParticipatingStatus1} =    //select[@id='ControlId614']
${ParticipatingStatus1} =    //select[@id='ControlId4082']
#${CaseReason1} =     //select[@id='ControlId616']
${CaseReason1} =     //select[@id='ControlId4087']
#${Acuity1} =     //select[@id='ControlId617']
${Acuity1} =     //select[@id='ControlId4088']
${Submitbutton1} =     //a[@id='button-submit-cpcmcase']
${CaseID1} =     //span[@id='CaseId']
*** Keywords ***
Create CP CM case and Note down Case ID by answering only Mandatory fileds
    [Arguments]    ${UserData}
    set selenium implicit wait  15 Seconds
    wait until element is visible    ${CreateBtn}
    click element  ${CreateBtn}
    wait until element is visible    ${ClinicalProgram1}
    select from list by label    ${ClinicalProgram1}    ${UserData.ClinicalProgram}
    input text  ${CaseName1}  ${UserData.CaseName}
    select from list by label    ${CaseType1}    ${UserData.CaseType}
    select from list by label    ${CaseSource1}    ${UserData.CaseSource}
    sleep    2s
    wait until element is visible   ${ParticipatingStatus1}
    select from list by label    ${ParticipatingStatus1}   ${UserData.ParticipatingStatus}
    select from list by label    ${CaseReason1}    ${UserData.CaseReason}
    select from list by label    ${Acuity1}   ${UserData.Acuity}
    click element  ${Submitbutton1}
    wait until element is visible    ${CaseID1}     30s
    ${UserData.CaseID} =     get text    ${CaseID1}
    log     ${CaseID1}


##################### Add Comm record #############
*** Variables ***
${LateEntryCheckBox} =     (//label[@for='IsLateEntry'])[1]
${LateEntryDate} =     //input[@id='LateEntryDate']
${LateEntryTime} =    //input[@id='LateEntryTime']
${TimeZoneCode} =    //select[@id='TimeZoneCode']
${CPCM_Comm_type} =     //select[@id='ControlId48']
${CPCM_Comm_Methodd} =     //select[@id='ControlId50']
${CPCM_Comm_COntactTpe} =     //select[@id='ControlId53']
${CPCM_Comm_CallAuthYes} =     //label[@for='ControlId145-radio-1-YE0330']
${CPCM_Comm_CallAuthNo} =     //label[@for='ControlId145-radio-1-NO0110']
${CPCM_Comm_CallOutcome} =     //select[@id='ControlId61']
${CPCM_Comm_CallResult} =     //select[@id='ControlId63']
${CPCM_Comm_ContactAttemptNumber} =     //select[@id='ControlId67']
${CPCM_COmm_CommunicationDescription} =    //select[@id='ControlId69']
${CPCM_COmm_FollowupWithMember} =     //select[@id='ControlId73']
${CPCM_Comm_SubmitButton} =    //a[@id='btn-save-CommRec']
*** Keywords ***
Create Comm Record under CPCM case level for FL
    [Arguments]  ${UserData}
    set selenium implicit wait    10s
    click element  ${CPCM_AddCommunicationbuttonUndercaselevel}
    wait until page contains    Create Communication Record  30s
    click element     ${LateEntryCheckBox}
    wait until element is visible    ${LateEntryDate}    30s
    wait until element is visible    ${LateEntryTime}     30s
    wait until element is visible    ${TimeZoneCode}    30s
    click element     ${LateEntryCheckBox}
    wait until element is not visible    ${LateEntryDate}    30s
    wait until element is not visible    ${LateEntryTime}     30s
    wait until element is not visible    ${TimeZoneCode}    30s
    select from list by label   ${CPCM_Comm_type}   ${UserData.CommunicationType}
    wait until page contains element    ${CPCM_Comm_Methodd}    30s
    select from list by label   ${CPCM_Comm_Methodd}   ${UserData.ContactMethod}
    scroll element into view    ${CPCM_Comm_COntactTpe}
    select from list by label   ${CPCM_Comm_COntactTpe}   ${UserData.ContactType}
    run keyword if    '${UserData.CallAuth}' == 'Yes'     click element    ${CPCM_Comm_CallAuthYes}
    ...     ELSE    click element    ${CPCM_Comm_CallAuthNo}
    scroll element into view    ${CPCM_Comm_CallOutcome}
    select from list by label   ${CPCM_Comm_CallOutcome}   ${UserData.CallOutcome}
    select from list by label   ${CPCM_Comm_CallResult}   ${UserData.CallResult}
    select from list by label   ${CPCM_Comm_ContactAttemptNumber}   ${UserData.ContactAttemptNumber}
    scroll element into view    ${CPCM_COmm_CommunicationDescription}
    select from list by label   ${CPCM_COmm_CommunicationDescription}    ${UserData.CommDesc}
    scroll element into view    ${CPCM_COmm_FollowupWithMember}
    select from list by label    ${CPCM_COmm_FollowupWithMember}     ${UserData.FollowUpWithMember}
    click Element   ${CPCM_Comm_SubmitButton}
    wait until page contains   Communication Record details saved successfully.     30s
    page should contain element    //div[@id='CaseCommunicationRecord']
    sleep    2s
    ${UserData.CreatedandUpdatedDate} =     get text    //div[@id='CaseCommunicationRecord']//table/tbody/tr/td[1]
    ${UserData.CreatedandUpdatedBy} =   get text    //div[@id='CaseCommunicationRecord']//table/tbody/tr/td[2]


Verify Comm record created under CP CM Case is displaying on MC Comm record screen
     [Arguments]    ${UserData}
     set selenium implicit wait    10s
     wait until element is visible    //div[@id='MemberCentralCommunicationRecord']    30s
     ${Status} =    set variable    False
     ${RowCountCommrecords} =    get element count    //div[@id='MemberCentralCommunicationRecord']//table/tbody/tr
     ${RowCountCommrecords} =    evaluate    ${RowCountCommrecords}+1
     FOR    ${i}    IN RANGE   1    ${RowCountCommrecords}
           ${CreatedandUpdatedDate} =    get text    //div[@id='MemberCentralCommunicationRecord']//table/tbody/tr[${i}]/td[1]
           ${CreatedandUpdatedBy} =    get text    //div[@id='MemberCentralCommunicationRecord']//table/tbody/tr[${i}]/td[2]
           ${CommType} =    get text    //div[@id='MemberCentralCommunicationRecord']//table/tbody/tr[${i}]/td[4]
           sleep    1s
           ${CreadandUpdatedDateStatus} =    run keyword and return status    should be equal as strings    ${CreatedandUpdatedDate}    ${UserData.CreatedandUpdatedDate}
           ${CreadandUpdatedByStatus} =    run keyword and return status    should be equal as strings    ${CreatedandUpdatedBy}    ${UserData.CreatedandUpdatedBy}
           ${CommTypeStatus} =    run keyword and return status    should be equal as strings    ${CommType}    ${UserData.CommunicationType}
           ${Status} =    set variable if  ${CreadandUpdatedDateStatus} and ${CreadandUpdatedByStatus} and ${CommTypeStatus}    True
           exit for loop if    ${CreadandUpdatedDateStatus} and ${CreadandUpdatedByStatus} and ${CommTypeStatus}
     END
     should be equal as strings   ${Status}    True


Selecting CP CM case for PDF validation
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    page should contain element    //span[text()='${UserData.CaseID}']
    sleep    2s
    click element    //span[text()='${UserData.CaseID}']
    wait until element is visible   ${CaseID1}     30s

Validate Print functionality for view Comm record under CPCM case
    set selenium implicit wait    10s
    sleep    1s
    click element    //div[@id='CaseCommunicationRecord']//table/tbody/tr/td[1]
    wait until element is visible    ${PrintCommRec_VwScreen}
    click element    ${PrintCommRec_VwScreen}
    Check if pdf is able to download or not in CPCM Case


Check if pdf is able to download or not in CPCM Case
    sleep    4s
    switch window    New
    sleep    5s
    WaitForActiveWindow    PrintCommRec - Google Chrome    Chrome Legacy Window
    sleep    5s
    Control Click    PrintCommRec - Google Chrome    Chrome Legacy Window   [CLASS:Chrome_RenderWidgetHostHWND; INSTANCE:1]    LEFT    1     585    28
    WaitForActiveWindow     Save As    &Save
    sleep     2s
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Control Send    Save As   &Save     [CLASS:Edit; INSTANCE:1]     CommrcordCPCMView${today}    0
    Control Click    Save As    &Save   [CLASS:Button; INSTANCE:2]    LEFT    1     88    26
    sleep    3s
    Control Click    Save As    &Save   [CLASS:Button; INSTANCE:2]    LEFT    1     29    13
    sleep    2s
    close window
    sleep    1s
    switch window    Main
    sleep     5s
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommrcordCPCMView${today}.pdf

Check if pdf is able to download or not
    [Arguments]    ${CommRec_Name}
    sleep    4s
    switch window    New
    WaitForActiveWindow    PrintCommRec - Google Chrome    Chrome Legacy Window
    sleep    4s
    Control Click    PrintCommRec - Google Chrome    Chrome Legacy Window   [CLASS:Chrome_RenderWidgetHostHWND; INSTANCE:1]    LEFT    1     588    30
    WaitForActiveWindow    Save As    &Save
    Control Send    Save As   &Save     [CLASS:Edit; INSTANCE:1]     ${CommRec_Name}    0
    Control Click    Save As    &Save   [CLASS:Button; INSTANCE:2]    LEFT    1     88    26
    sleep    3s
    Control Click    Save As    &Save   [CLASS:Button; INSTANCE:2]    LEFT    1     40    12
    sleep    2s
    close window
    sleep    1s
    switch window    Main

Validate Print functionality for History Comm record under CPCM case
    set selenium implicit wait    10s
    sleep    1s
    click element    //u[text()='Back']
    wait until element is visible    //div[@id='CaseCommunicationRecord']//table/tbody/tr[1]/td[@title="History"]/div/a/img
    click element    //div[@id='CaseCommunicationRecord']//table/tbody/tr[1]/td[@title="History"]/div/a/img
    wait until element is visible        ${CommRec_HistoryLabel}     # click on history record
    click element    ${CommRec_HistoryLabel}
    wait until element is visible    ${PrintCommRec_VwScreen}
    click element    ${PrintCommRec_VwScreen}
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecCPCMCase_HistoryScreen${Today}
    wait until page contains    Communication Record History    10s
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecCPCMCase_HistoryScreen${Today}.pdf
    click element    //u[text()='Back']

Validate Print functionality for Edit Comm record under CPCM case
    wait until element is visible    ${btn_EditCommRec}    10s
    sleep    1s
    click element    ${btn_EditCommRec}     #Clicking the edit
    wait until element is visible    (//div[@id="CaseCommunicationRecord-gridContent"]//table)[2]/tbody/tr[1]/td/div/label    10s
    click element    (//div[@id="CaseCommunicationRecord-gridContent"]//table)[2]/tbody/tr[1]/td/div/label
    wait until element is visible    ${PrintCommRec_VwScreen}
    click element    ${PrintCommRec_VwScreen}
    ${Today} =    get current date    result_format=%m_%d_%Y_%H_%M_%S
    Check if pdf is able to download or not    CommRecCPCMCase_EditScreen${Today}
    OperatingSystem.file should exist    ${PDFFILE_PATH}\\CommRecCPCMCase_EditScreen${Today}.pdf
    click element    //u[text()='Back']

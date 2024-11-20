*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library  ../../CustomLibs/DataCreation.py
Library    DateTime
Library    String
Resource    ../PageObjects/Authorization.robot
Resource    ../PageObjects/SearchPage.robot
Resource  ../../Resources/Definitions/Common.robot
*** Variables ***

#View Authorization New Auth button elements #
${ViewAuthNewBtn} =    //div[@id="divViewAuthButtonControls"]//a[@id="new-authorization"]
${ViewAuthNewAuthBtnPopUpTitle} =    //h4[@id="modal-header-title" and text()='Create New Authorization']
${ViewAuthNewAuthKeepMemberBtn} =   //div[@id="createNewAuthorization"]//a[@id="keep-member-button"]
${ViewAuthNewAuthChangeMemberBtn} =   //div[@id="createNewAuthorization"]//a[@id="change-member-button"]
${ViewAuthNewAuthAllNewMemberBtn} =   //div[@id="createNewAuthorization"]//a[@id="allnew-button"]
${ViewAuthNewAuthCancelLink} =    //div[@id="createNewAuthorization"]//a[@id="createNewAuthorization-cancel-btn"]
${ViewAuthNewAuthPopUpMsg} =    //div[@id='create-new-authorization']
${UserNameValidationMsgExpected}
${CreateAuthTitle} =    //h3[@class="humana-green" and text()='Create Authorization']
${MemberInfoGridTableOnCreateAuth} =     //div[@id="MemberInfoGrid-gridContent"]//table[@role="grid"]
${CreateAuthCancelLink} =    //a[@id="btn-Cancel-Create-Auth"]
${SubmitAuthButton} =    //a[@id="submit-authorization"]
${NoProviderAddedMesg} =    //div[@id="ProviderInfo"]//div[text()='Please select member before selecting providers.']
${CreateAuthRequestingProv} =    //div[@id="requesting-provider"]
${CreateAuthTreatingProv} =    //div[@id="treating-provider"]
${CreateAuthFacilityProv} =    //div[@id="facility-provider"]


#View Authorization Build Auth button elements #
${ViewAuthBuildFaxBtn} =     //div[@id="divViewAuthButtonControls"]//a[@id="build-auth-fax"]
${ViewAuthBuildFaxBtnPopUpTitle} =    //h4[@id="modal-header-title" and text()='Build Fax - Select a Provider']
${ViewAuthBuildFaxPopUpReqProvRadio} =    //label[@for="FaxProviderType-radio-674-1"]
${ViewAuthBuildFaxPopUpTreatProvRadio} =    //label[@for="FaxProviderType-radio-674-2"]
${ViewAuthBuildFaxPopUpFacilityProvRadio} =    //label[@for="FaxProviderType-radio-674-3"]
${ViewAuthBuildFaxProceedBtn} =    //div[@id="fax-provider-selection"]//a[@id="faxProceed"]
${ViewAuthBuildFaxCancelLink} =    //div[@id="fax-provider-selection"]//a[@class="cancel-button tertiary"]
${MemberInfoGridTableOnBuildFax} =    //div[@id="FaxAuthorizationDetailsGrid-gridContent"]//table[@role="grid"]
${BuildFaxTitle} =    //h3[@class="humana-green" and text()='Build Fax']
${BuildFaxSendBtn} =    //a[@id="btnSendFax"]
${BuildFaxCancelLink} =    //a[@id="btn-Cancel-Fax-Auth"]

#View Authorization Ownership button elements #
${ViewAuthTakeOwnershipBtn} =    //div[@id="divViewAuthButtonControls"]//a[@id="view-take-ownership"]
${ViewAuthRemoveOwnershipBtn} =    //div[@id="divViewAuthButtonControls"]//a[@id="view-remove-ownership"]
${AuthOwnershipAlertmsg} =    //div[@id="message-alert"]//div[contains(text(),'Authorization got updated by another user, loading the latest version..')]
${AuthOwnershipAlertOkBtn} =    //a[@id="message-alert-ok-button"]

#View Authorization Ownership History button elements #
${ViewAuthOwnershipHistoryBtn} =    //div[@id="divViewAuthButtonControls"]//a[@id="OwnershipHistory"]
${ViewAuthOwnershipHistoryPopUp} =    //div[@id='auth-owner-ship-history-view-modal']//h4[@id='modal-header-title' and text()='Ownership History']
${OwnershipHistoryGridTable} =    //div[@id="authownershiphistorygrid-gridContent"]//table[@role="grid"]
${OwnershipHistoryPopupCloselink} =    //div[@id='auth-owner-ship-history-view-modal']//u[text()='Close']

#View Authorization Auth History button elements #
${ViewAuthAuthHistoryBtn} =    //div[@id="divViewAuthButtonControls"]//a[@id="history-authorization"]
${ViewAuthAuthHistoryPopUp} =    //div[@id='auth-history-view-modal']//h4[@id='modal-header-title' and text()='Authorization History']
${FirstRecordCheckBox} =    //*[@id="AuthHistoryGrid"]/table/tbody/tr[1]/td[1]
${SecondRecordCheckBox} =    //*[@id="AuthHistoryGrid"]/table/tbody/tr[2]/td[1]
${AuthHistoryCompareBtn} =    //a[@id="button-auth-compare"]
${AuthCompareVersionsTitle} =    //h3[@class="humana-green hide-for-medium-down" and text()="Authorization - Compare Versions"]
${ShowOnlyDiffChkbox} =    //label[text()='Show only the differences']


*** Keywords ***
Authorization_Details_NewAuth_Button_Verify
    Get Member Details
    wait until element is visible    ${ViewAuthNewBtn}
    Check If Auth Approved
    Auth Details New Auth Keep Member
    Auth Details New Auth Change Member
    Auth Details New Auth All New Member
    Auth Details New Auth cancel

Authorization_Details_BuildFax_Button_Verify
    Auth Details Build Fax
    Auth Details Build Fax Cancel

Authorization_Details_Take_RemoveOwnership_Button_Verify
    Auth Details Take Ownership
    Auth Details Remove Ownership

Authorization_Details_AuthHistory_OwnershipHistory_Button_Verify
    Auth Details Ownership History
    Auth Details Auth Hist

Auth Details New Auth Keep Member
    wait until element is visible    ${ViewAuthNewBtn}
    click element    ${ViewAuthNewBtn}
    sleep    2 Seconds
    wait until page contains element    ${ViewAuthNewAuthBtnPopUpTitle}    10 Seconds
    page should contain element    ${ViewAuthNewAuthBtnPopUpTitle}
    page should contain element    ${ViewAuthNewAuthKeepMemberBtn}
    page should contain element    ${ViewAuthNewAuthChangeMemberBtn}
    page should contain element    ${ViewAuthNewAuthAllNewMemberBtn}
    page should contain element    ${viewauthnewauthcancellink}
    set local variable    ${UserNameValidationMsgExpected}    You are creating a new Auth for (${UniversalMemberName}). How do you want to proceed?
    ${UserNameValidationMsgActual} =    get text    ${viewauthnewauthpopupmsg}
    log to console    ${UserNameValidationMsgActual}
#    should be equal as strings    ${UserNameValidationMsgActual}    ${UserNameValidationMsgExpected}
    click element    ${viewauthnewauthkeepmemberbtn}
    wait until page contains element    ${CreateAuthTitle}
  # table should contain     //div[@id="MemberInfoGrid-gridContent"]//table[@role="grid"]    ${UniversalMemberID}
  # table should contain     //div[@id="MemberInfoGrid-gridContent"]//table[@role="grid"]    ${UniversalMemberName}
    page should contain element    ${SubmitAuthButton}
    page should contain element    ${CreateAuthRequestingProv}
    page should contain element    ${createauthtreatingprov}
    page should contain element    ${createauthfacilityprov}
    ${id} =    get table cell    ${MemberInfoGridTableOnCreateAuth}    2    1
    set local variable    ${id}
    log to console    ${id}
    ${name} =    get table cell    ${MemberInfoGridTableOnCreateAuth}    2    2
    set local variable    ${name}
    log to console    ${name}
    should be equal as strings    ${id}    ${UniversalMemberID}
    should be equal as strings    ${name}  ${UniversalMemberName}
    Click on Cancel on Create Auth

Click on Cancel on Create Auth
    set selenium implicit wait    10 Seconds
    click element    //a[@id="btn-Cancel-Create-Auth"]
    click element    //a[@id="button-cancel-edit-changes-yes"]
    wait until page contains element    ${ViewAuthNewBtn}
    wait until page contains element    //h3[@class='humana-green' and text()='Authorization - Details']

Auth Details New Auth Change Member
    wait until element is visible    ${ViewAuthNewBtn}
    click element    ${ViewAuthNewBtn}
    sleep    2 Seconds
    wait until page contains element    ${ViewAuthNewAuthBtnPopUpTitle}    10 Seconds
    page should contain element    ${ViewAuthNewAuthBtnPopUpTitle}
    click element    ${viewauthnewauthchangememberbtn}
    wait until page contains element    ${CreateAuthTitle}
    page should contain element    ${SubmitAuthButton}
    page should contain element    ${CreateAuthRequestingProv}
    page should contain element    ${createauthtreatingprov}
    page should contain element    ${createauthfacilityprov}
    page should not contain element    ${memberinfogridtableoncreateauth}
    click on cancel on create auth

Auth Details New Auth All New Member
    set selenium implicit wait    10 Seconds
    wait until element is visible    ${ViewAuthNewBtn}
    click element    ${ViewAuthNewBtn}
    sleep    2 Seconds
    wait until page contains element    ${ViewAuthNewAuthBtnPopUpTitle}    5 Seconds
    page should contain element    ${ViewAuthNewAuthBtnPopUpTitle}
    click element    ${ViewAuthNewAuthAllNewMemberBtn}
    sleep    2 Seconds
    wait until page contains element    ${CreateAuthTitle}
    wait until page contains element    ${CreateAuthTitle}    10 Seconds
    page should contain element    ${NoProviderAddedMesg}
    page should contain element    ${SubmitAuthButton}
    page should not contain element    ${memberinfogridtableoncreateauth}
    click on cancel on create auth

Auth Details New Auth cancel
    wait until element is visible    ${ViewAuthNewBtn}
    click element    ${ViewAuthNewBtn}
    sleep    2 Seconds
    page should contain element    ${ViewAuthNewAuthBtnPopUpTitle}
    click element    ${viewauthnewauthcancellink}
    page should contain element    ${viewauthnewbtn}
    page should contain element    //h3[@class='humana-green' and text()='Authorization - Details']    05 Seconds

Auth Details Build Fax
    wait until element is visible    ${ViewAuthNewBtn}
    ${AuthorizationID} =  get text    ${ViewAuthId}
    set local variable    ${AuthorizationID}
    click element    ${ViewAuthBuildFaxBtn}
    sleep    2 Seconds
    page should contain element    ${ViewAuthBuildFaxBtnPopUpTitle}
    page should contain element    ${ViewAuthBuildFaxPopUpReqProvRadio}
    page should contain element    ${ViewAuthBuildFaxPopUpTreatProvRadio}
    page should contain element    ${ViewAuthBuildFaxPopUpFacilityProvRadio}
    page should contain element    ${viewauthbuildfaxproceedbtn}
    page should contain element    ${ViewAuthBuildFaxCancelLink}
    select from list by label    //select[@id="SelectedAuthFaxTemplate"]    Medicare Peer-To-Peer
    click element    ${viewauthbuildfaxpopuptreatprovradio}
    click element    ${viewauthbuildfaxproceedbtn}
    wait until page contains element    ${BuildFaxTitle}
    page should contain element    ${buildfaxtitle}
    ${AuthIdGridonBuildFax} =    get table cell    ${memberinfogridtableonbuildfax}    2    1
    set local variable    ${AuthIdGridonBuildFax}
    log to console    ${AuthIdGridonBuildFax}
    ${MemberNameGridonBuildFax} =    get table cell    ${memberinfogridtableonbuildfax}    2    2
    set local variable    ${MemberNameGridonBuildFax}
    log to console    ${MemberNameGridonBuildFax}
    ${MemberDOBGridonBuildFax} =    get table cell    ${memberinfogridtableonbuildfax}    2    3
    set local variable    ${MemberDOBGridonBuildFax}
    log to console    ${MemberDOBGridonBuildFax}
    ${MemberIDGridonBuildFax} =    get table cell    ${memberinfogridtableonbuildfax}    2    4
    set local variable    ${MemberIDGridonBuildFax}
    log to console    ${MemberIDGridonBuildFax}
    should be equal as strings    ${AuthIdGridonBuildFax}     ${AuthorizationID}
    should be equal as strings    ${MemberNameGridonBuildFax}    ${UniversalMemberName}
    should be equal as strings    ${MemberDOBGridonBuildFax}     ${UniversalMemberDOB}
    should be equal as strings    ${MemberIDGridonBuildFax}    ${UniversalMemberID}
    page should contain element    //div[@id="FaxAuthorizationDetailsGrid-gridContent"]//table[@role="grid"]//span[@id="select2-InformationRequested-container"]
    Auth Search Modified    ${AuthorizationID}
    wait until element is visible    ${ViewAuthNewBtn}

Auth Details Build Fax Cancel
    wait until element is visible    ${ViewAuthNewBtn}
    click element    ${ViewAuthBuildFaxBtn}
    sleep    2 Seconds
    page should contain element    ${ViewAuthBuildFaxBtnPopUpTitle}
    click element    ${viewauthbuildfaxcancellink}
    page should contain element    ${viewauthnewbtn}
    page should contain element    //h3[@class='humana-green' and text()='Authorization - Details']    05 Seconds

Auth Details Take Ownership
    wait until element is visible    ${ViewAuthNewBtn}
    sleep    03 Seconds
  #  click element     //a[@id='paste-contact-info']//following::a[1]
    set selenium implicit wait    10 Seconds
    click link    ${viewauthtakeownershipbtn}
    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
    wait until page contains element    //span[@id="AssignedQueue" and contains(text(),'${UniversalLoggedInUserName}')]    15 Seconds
   # Sleep    15 Seconds
    ${AssignedQueue} =    get text    //span[@id="AssignedQueue"]
    log to console    ${AssignedQueue}
    set local variable    ${AssignedQueue}
    should be equal as strings    ${AssignedQueue}    ${UniversalLoggedInUserName}
    ${PopUpStatus} =   Run Keyword And Return Status  page should contain element    ${authownershipalertokbtn}
    run keyword if  ${PopUpStatus}  click element   ${authownershipalertokbtn}
    sleep    03 Seconds
   # run keyword if    is visible    ${authownershipalertokbtn}    click element   ${authownershipalertokbtn}
   # run keyword if   page should contain ${authownershipalertokbtn}  click element   ${authownershipalertokbtn}
    click element    //div[@id="left-navAuth"]//a[@href='/cgx/Authorization/Authorization/ViewAuth?isFromDetail=true']
    wait until element is visible    ${ViewAuthNewBtn}
    should be equal as strings    ${AssignedQueue}    ${UniversalLoggedInUserName}

Auth Details Remove Ownership
    set selenium implicit wait    10 Seconds
    wait until element is visible    ${ViewAuthNewBtn}
    click element    ${ViewAuthRemoveOwnershipBtn}
    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
    wait until page does not contain element    //span[@id="AssignedQueue" and contains(text(),'${UniversalLoggedInUserName}')]    10 Seconds
   # Sleep    10 Seconds
    ${AssignedQueue} =    get text    //span[@id="AssignedQueue"]
    log to console    ${AssignedQueue}
    set local variable    ${AssignedQueue}
    should be empty     ${AssignedQueue}
    click element    //a[@id='paste-contact-info']//following::a[1]
    wait until page contains element    ${authownershipalertokbtn}
   # wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    page should contain element    ${AuthOwnershipAlertmsg}
    click element    ${authownershipalertokbtn}
    wait until page contains element    //h3[@class='humana-green' and text()='Authorization - Details']    05 Seconds
    should be empty    ${AssignedQueue}

Auth Details Ownership History
    set selenium implicit wait    10 Seconds
    wait until element is visible    ${ViewAuthNewBtn}
    sleep    03 Seconds
    click element    ${viewauthownershiphistorybtn}
    wait until page contains element    ${viewauthownershiphistorypopup}
    sleep    03 Seconds
    page should contain element    ${viewauthownershiphistorypopup}
    ${OwnershipHistoryQueueName} =    get table cell    ${ownershiphistorygridtable}    2    1
    log to console    ${OwnershipHistoryQueueName}
    set local variable    ${OwnershipHistoryQueueName}
    ${OwnershipHistoryQueueOwner} =    get table cell    ${ownershiphistorygridtable}    2    2
    log to console    ${OwnershipHistoryQueueOwner}
    set local variable    ${OwnershipHistoryQueueOwner}
    should be equal as strings    ${OwnershipHistoryQueueName}    ${UniversalLoggedInUserName}
    should be equal as strings    ${OwnershipHistoryQueueOwner}    ${UniversalLoggedInUserName}
    click element    ${OwnershipHistoryPopupCloselink}

  #  ${Time} =    get current date
   # log to console    ${Time}

Auth Details Auth Hist
    Get Member Details
    set selenium implicit wait    10 Seconds
    wait until element is visible    ${ViewAuthNewBtn}
    sleep    03 Seconds
    Edit the Authorization for Contact Name
    click link    //div[@id="left-navAuth"]//a[text()='Details']
    click element    ${viewauthauthhistorybtn}
    wait until page contains element    ${ViewAuthAuthHistoryPopUp}
    page should contain element    ${ViewAuthAuthHistoryPopUp}
    click element    ${secondrecordcheckbox}
    sleep    02 Seconds
    click element    ${firstrecordcheckbox}
    click element    ${authhistorycomparebtn}
    wait until page contains element    ${AuthCompareVersionsTitle}
    page should contain element    ${AuthCompareVersionsTitle}
    click element    ${showonlydiffchkbox}
    ${ContactNamePrevValue} =    get text    //*[@id="auth-contact-details"]/div/div[10]/div[2]
    ${ContactNameUpdatedValue2} =    set variable    ${ContactNamePrevValue}Updated
    ${ContactNameUpdatedValue} =    get text    //*[@id="auth-contact-details"]/div/div[10]/div[1]
    should be equal as strings    ${ContactNameUpdatedValue2}    ${ContactNameUpdatedValue}
    click element    //a[@id="compare-case-backbutton"]
    wait until page contains element    ${ViewAuthNewBtn}

Edit the Authorization for Contact Name
    set selenium implicit wait    10 Seconds
    click element    //a[@id='paste-contact-info']//following::a[1]
    wait until page contains element     ${ContactName}
    input text    ${ContactName}    Automation TesterUpdated
    click link    Submit Auth
    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
    sleep    1 Second
    ${ErrorMessage} =    run keyword and return status   page should contain element    ${VoidError}
    run keyword if    ${ErrorMessage}   run keywords    User Enters Provider Choice
    ...    AND    click link    Submit Auth
    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
    ${DuplicateConfirm} =    Run Keyword And Return Status   page should contain link    Yes, Continue
    run keyword if  ${DuplicateConfirm}  Confirm the Duplicate
    sleep    1 Second
    ${ClinicalReivew} =    Run Keyword And Return Status   page should contain link    No
    run keyword if  ${ClinicalReivew}  Confirm the Questionnaire
    sleep    1 Second
    ${CommunicationRec} =    Run Keyword And Return Status   page should contain link    Not Now
    run keyword if  ${CommunicationRec}  Confirm the Communication

Make Auth Approved
    set selenium implicit wait    10 Seconds
    click element    //div[@id="AuthMedicalCodes"]//a[contains(text(),'Edit')]
    sleep    02 Seconds
    click element    //div[@id='AuthDirectPrimaryDiagnosisCodeGrid']//div[starts-with(@class,'slick-cell l2 r2')]
    select from list by label    //select[@tabindex='0']     Approved
    sleep    02 Seconds
#    click element    //div[@id="AuthDirectPrimaryDiagnosisCodeGrid"]//span[@class="cell-title-normal" and text()="P07.00"]
#    sleep  02 Seconds
#    press keys    None    TAB
#    press keys    None    TAB
#    sleep  02 Seconds
   ### click element    //label[text()='Procedure Codes']
#    scroll element into view    //label[text()='Procedure Codes']
#    click element    (//*[@id="AuthDirectProcedureCodeGrid"]//span[@class='cell-title-normal'])[1]
#    select from list by label    //select[@tabindex='0']     Approved
#    sleep    02 Seconds
    scroll element into view    //div[@id="BuisnessRulesInformation"]//a[contains(text(),'Edit')]
    click element    //div[@id="BuisnessRulesInformation"]//a[contains(text(),'Edit')]
    Approve the business rule
    sleep    02 Seconds
    ${PendingStatus} =   run keyword and return status    page should contain element    //div[@id="EditBuinessRulesGrid-gridContent"]//tbody//td[text()='Pended']
    run keyword if    ${PendingStatus}    Approve the business rule
    ...    ELSE IF ${PendingStatus}    Approve the business rule
    click element    //div[@id="RangeOfDaysGrid"]//tbody//tr[1]     # Auth Information
##    click element    //div[@id="RangeOfDaysGrid"]//tbody//td[text()="Pended"]     # Auth Information
    select from list by label    //select[@name="StatusCode"]    Approved
    click link    //a[@id="button-update-rod"]      #save btn
    wait until element does not contain    //h4[@id="modal-header-title" and text()="Edit Range Of Days"]    10 Seconds
    sleep    10s
    click element    //a[@id="edit-submit-authorization"]   #submit auth
    run keyword if    ${PendingStatus}    Approve the business rule
    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
    sleep    02 Seconds
    ${ErrorMessage} =    run keyword and return status   page should contain element    ${VoidError}
    run keyword if    ${ErrorMessage}   run keywords    User Enters Provider Choice
    ...    AND    click link    Submit Auth
    log to console    updated the auth
    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
    ${DuplicateConfirm} =    Run Keyword And Return Status   page should contain link    Yes, Continue
    run keyword if  ${DuplicateConfirm}  Confirm the Duplicate
    sleep    1 Second
    ${ClinicalReivew} =    Run Keyword And Return Status   page should contain link    No
    run keyword if  ${ClinicalReivew}  Confirm the Questionnaire
    sleep    1 Second
    ${CommunicationRec} =    Run Keyword And Return Status   page should contain link    Not Now
    run keyword if  ${CommunicationRec}  Confirm the Communication
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    wait until page contains element    //h3[@class='humana-green' and text()='Authorization - Details']

Approve the business rule
    click element    (//label[@for="EditBuinessRulesGridselectAll"])[1]
    #click element    //label[text()='Set Status To']
    sleep    02 Seconds
    #click element    //div[@id="EditBuinessRulesGrid-gridContent"]//td[@class=" checkboxColumn checkboxCell "][1]
    #sleep    01 Seconds
    select from list by label    //select[@id="BuinessStatusType"]    Approved

Check If Auth Approved
    set selenium implicit wait    10 Seconds
    ${AuthStatus} =  get text  ${Status}
    log to console    ${AuthStatus}
    run keyword if    '${AuthStatus}' != 'Approved'    Make Auth Approved
*** Settings ***
Library  SeleniumLibrary
Library  ../../CustomLibs/DataCreation.py
Library    DateTime
Library    String
Resource    ../PageObjects/Authorization.robot
Resource    ../PageObjects/SearchPage.robot
Resource  ../../Resources/Definitions/Common.robot

*** Variables ***
${CRClinicalInfo}
${CRCriteria}
${CRAdditionalPertinentInfo}
${AuthorizationID}
# Create Clinical Review - Objects

${ViewAuthNewBtn} =    //div[@id="divViewAuthButtonControls"]//a[@id="new-authorization"]
${AuthNavCRLink} =    //div[@id="left-navAuth"]//a[text()='Clinical Review']
${AuthCRTitle} =    //h3[@class="humana-green" and text()="Authorization - Clinical Review"]
${AuthCRAddBtn} =    //a[@id="create-clinicalreview"]
${AuthCRAuthIdReflected} =    //form[@id="clinicalreview-save-form"]//div[@id="AuthId"]
${AuthCRAuthTypeReflected} =    //form[@id="clinicalreview-save-form"]//div[@id="AuthType"]
${AuthCRReviewerNameReflected} =    //form[@id="clinicalreview-save-form"]//div[@id="ReviewerName"]
${AuthCRSourceOfReviewDrpDwn} =    //select[@id="SourceOfReviewCode"]
${AuthCRClinicalProgrammeDrpDwn} =    //select[@id="HumanaClinicalProgramCode"]
${AuthCRTypeOfReviewDrpDwn} =    //select[@id="TypeOfReviewCode"]
${AuthCRWasItReadmissionRadio} =    //label[@for="WasItReadmission-radio-39-3"]
${AuthCRMemberClinicalInfoEdit} =    //textarea[@id="MbrClinicalInfo"]
${AuthCRCriteriaConsideredDrpDwn} =    //select[@id="CriteriaConsideredCode"]
${AuthCRAppCriteriaEdit} =    //textarea[@id="AppCriteria"]
${AuthCRPertinentInfoEdit} =    //textarea[@id="AdditionalPertinentInfo"]
${AuthCRMeetsClinicalCritRadio} =    //label[@for="MeetsClinicalCriteria-radio-46-2"]
${AuthCRRangeOfDaysFromDate} =    //input[@id="RangeOfDaysFrom"]
${AuthCRRangeOfDaysToDate} =    //input[@id="RangeOfDaysTo"]
${AuthCRCompleteDischargePlanRadio} =    //label[@for="CompleteDischargePlanning-radio-46-1"]
${AuthCRPotentialDischargeRadio} =    //label[@for="PotentialDischargeWithHSS-radio-46-2"]
${AuthCRIsSuffiecientInfoRecvdRadio} =    //label[@for="IsSufficientInformationReceivedCode-radio-39-2"]
${AuthCRClinicalDate} =    //input[@id="ClinicalDate"]
${AuthCRClinicalTime} =    //input[@id="ClinicalTime"]
${AuthCRSaveBtn} =    //a[@id="Clinicalreview-save-btn"]


# View Clinical Review Objects
${ViewCRCreatedCRGrid} =    //div[@id="AuthorizationClinicalReview-gridContent"]//td[@role="gridcell" and text()="Initial OP Services"]
${ViewCRCreatedCRGridCnt} =    //div[@id="AuthorizationClinicalReview-Count-div"]
${ViewCRTitle} =    //h3[@class="humana-green" and text()="Authorization - View Clinical Review"]
${ViewCRSourceOfReviewCode} =     //div[@id="SourceOfReviewCode"]
${ViewCRClinicalProgramme} =    //div[@id="HumanaClinicalProgramCode"]
${ViewCRTypeOfReviewDesc} =    //div[@id="TypeOfReviewDescription"]
${ViewCRClinicalInfo} =    //input[@name="DisplayMbrClinicalInfo.hdnCharLength"]//parent::div[@class="small-12 columns"]//child::div[@class="styledparagraphwatermark paragraphText"]
${ViewCRCriteriaConsidered} =    //div[@id="CriteriaConsideredCode"]
${ViewCRTestCriteria} =    //input[@name="AppCriteriadata.hdnCharLength"]//parent::div[@class="small-12 columns"]//child::div[@class="small-9 columns valueField paragraph"]
${ViewCRAdditionalPertinentInfo} =    //input[@name="AdditionalPertinentInfoData.hdnCharLength"]//parent::div[@class="small-12 columns"]//child::div[@class="small-9 columns valueField paragraph"]
${ViewCREditCRBtn} =    //a[@id="Clinicalreview-edit-btn"]

#Create MD Review Objects
${ViewCRMDReviewAddBtn} =    //span[@class="i-buttons-web i-add-web"]
${MDReviewTitle} =    //div[@id="heading" and text()=" Create MD Review "]
${MDPriorityDrpDwn} =    //span[@class='dropdown-btn singleSelection noOptions ng-star-inserted']
${MDPriorityDrpDownVal} =    //div[normalize-space()='Routine']
${MDRouteReasonDrpDwn} =    //span[contains(text(),'Select')]
${MDRouteReasonDrpDwnVal} =    //div[normalize-space()='Peer to Peer']
${MDPeerToPeerReqNoteEdit} =    //div[@class="mb-15 ng-star-inserted"][1]//textarea[@class="k-textarea ng-untouched ng-pristine ng-invalid"]
${MDDignosisTable} =    //td[normalize-space()='T86.21']
# ${MDClinicalAssesMentEdit} =    //textarea[@class="k-textarea ng-pristine ng-valid ng-touched"]/../..
${MDClinicalAssesMentEdit} =    //label[contains(text(),' Clinical Assessment')]//following::Div[1]

*** Keywords ***
Create Clinical Review
    [Arguments]    ${UserData}
    #Search For Member    ${USerData}
    #select the member
    ${CurrentTme} =    get current date    result_format=%H:%M:%S %p
    log to console   ${CurrentTme}
    Auth Search Modified    ${UserData.AuthId}
    set selenium implicit wait    10 Seconds
    set local variable    ${ViewAuthNewBtn}
    wait until element is visible    ${ViewAuthNewBtn}
    # Get Member Details
    ${AuthorizationID} =  get text    ${ViewAuthId}
    set global variable    ${AuthorizationID}
    #set local variable    ${AuthorizationID}
    click link    ${AuthNavCRLink}
    wait until page contains element    ${AuthCRTitle}
    page should contain element    ${AuthCRTitle}
    click element    ${AuthCRAddBtn}
    ${ActualAuthIdReflected} =    get text    ${authcrauthidreflected}
    set local variable     ${ActualAuthIdReflected}
    log to console    ${ActualAuthIdReflected}
    should be equal as strings    ${ActualAuthIdReflected}     ${AuthorizationID}
    ${ActualAuthTypeReflected} =    get text    ${AuthCRAuthTypeReflected}
    set local variable    ${ActualAuthTypeReflected}
    log to console    ${ActualAuthTypeReflected}
    should be equal as strings    ${ActualAuthTypeReflected}    Inpatient
    ${ActualReviewNameReflected} =    get text    ${AuthCRReviewerNameReflected}
    set local variable    ${ActualReviewNameReflected}
    log to console    ${ActualReviewNameReflected}
    should be equal as strings    ${ActualReviewNameReflected}    Harshal Ravindra Pawar
    select from list by label    ${AuthCRSourceOfReviewDrpDwn}    Onsite
    select from list by label    ${AuthCRClinicalProgrammeDrpDwn}    Bariatric
    select from list by label    ${AuthCRTypeOfReviewDrpDwn}    Initial OP Services
    click element    ${AuthCRWasItReadmissionRadio}
    ${RndNumber} =    GenerateRandomNumberFiveDigit
    ${CRClinicalInfo}    set variable    Test Clinical Info_${RndNumber}
    set global variable    ${CRClinicalInfo}
    ${RndNumber} =    GenerateRandomNumberFiveDigit
    ${CRCriteria}     set variable    PPV TEST APP CRITERIA_${RndNumber}
    set global variable    ${CRCriteria}
    ${RndNumber} =   GenerateRandomNumberFiveDigit
    ${CRAdditionalPertinentInfo}     set variable    PPV TEST ADDITIONAL INFO_${RndNumber}
    set global variable    ${CRAdditionalPertinentInfo}
    input text    ${AuthCRMemberClinicalInfoEdit}    ${CRClinicalInfo}
    select from list by label    ${AuthCRCriteriaConsideredDrpDwn}     Member’s Certificate of Coverage
    input text    ${AuthCRAppCriteriaEdit}    ${CRCriteria}
    input text    ${AuthCRPertinentInfoEdit}    ${CRAdditionalPertinentInfo}
    click element    ${AuthCRMeetsClinicalCritRadio}
    ${DateToday} =      get current date    result_format=%m/%d/%Y
    log to console    ${DateToday}
    ${DateTomorrow} =        Add Time To Date  ${DateToday}    1 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    log to console    ${DateToday}
    log to console    ${DateTomorrow}
    input text    ${AuthCRRangeOfDaysFromDate}    ${DateToday}
    input text    ${AuthCRRangeOfDaysToDate}    ${DateTomorrow}
    click element    ${AuthCRCompleteDischargePlanRadio}
    click element    ${AuthCRPotentialDischargeRadio}
    click element    ${AuthCRIsSuffiecientInfoRecvdRadio}
    input text    ${AuthCRClinicalDate}     ${DateToday}
    input text   ${AuthCRClinicalTime}     10:00:00 AM
    click element    ${AuthCRSaveBtn}
    ValidateClinicalReviewCreated

ValidateClinicalReviewCreated
    wait until page contains element    ${AuthCRTitle}
    page should contain element    ${AuthCRTitle}
    page should contain element    ${ViewCRCreatedCRGridCnt}
    page should contain element    ${ViewCRCreatedCRGrid}
    click element    ${ViewCRCreatedCRGrid}
    page should contain element    ${ViewCREditCRBtn}
    sleep    03 Seconds
    log to console    ${AuthorizationID}

    ${AuthIdReflectedStatus} =  run keyword and return status    ActualAndExpectedValueComparision    //div[@id="AuthId"]    ${AuthorizationID}
    convert to string    ${AuthIdReflectedStatus}
    should be equal as strings    ${AuthIdReflectedStatus}    True

    ${AuthTypeReflectedStatus} =  run keyword and return status    ActualAndExpectedValueComparision    //div[@id="AuthType"]    Inpatient
    convert to string    ${AuthTypeReflectedStatus}
    should be equal as strings    ${AuthTypeReflectedStatus}    True

    ${ReviewNameReflectedStatus} =  run keyword and return status    ActualAndExpectedValueComparision    //div[@id="ReviewerName"]    Harshal Ravindra Pawar
    convert to string    ${ReviewNameReflectedStatus}
    should be equal as strings    ${ReviewNameReflectedStatus}    True

    ${SourceOfReviewCodeReflectedStatus} =  run keyword and return status    ActualAndExpectedValueComparision    ${ViewCRSourceOfReviewCode}    Onsite
    convert to string    ${SourceOfReviewCodeReflectedStatus}
    should be equal as strings    ${SourceOfReviewCodeReflectedStatus}    True

    ${ClinicalProgmCodeReflectedStatus} =  run keyword and return status    ActualAndExpectedValueComparision    ${ViewCRClinicalProgramme}    Bariatric
    convert to string    ${ClinicalProgmCodeReflectedStatus}
    should be equal as strings    ${ClinicalProgmCodeReflectedStatus}    True


    ${TypeOfReviewCodeReflectedStatus} =  run keyword and return status    ActualAndExpectedValueComparision    ${ViewCRTypeOfReviewDesc}    Initial OP Services
    convert to string    ${TypeOfReviewCodeReflectedStatus}
    should be equal as strings    ${TypeOfReviewCodeReflectedStatus}    True

    log to console  ${CRClinicalInfo}
    ${ClinicalInfoReflectedStatus} =    run keyword and return status    ActualAndExpectedValueComparision    ${ViewCRClinicalInfo}    ${CRClinicalInfo}
    convert to string    ${ClinicalInfoReflectedStatus}
    should be equal as strings    ${ClinicalInfoReflectedStatus}    True


    ${CriteriaConsideredReflectedStatus} =    run keyword and return status    ActualAndExpectedValueComparision    ${ViewCRCriteriaConsidered}    Member’s Certificate of Coverage
    convert to string    ${CriteriaConsideredReflectedStatus}
    should be equal as strings    ${CriteriaConsideredReflectedStatus}    True

    log to console  ${CRCriteria}
    ${CriteriaReflectedStatus} =    run keyword and return status    ActualAndExpectedValueComparision    ${ViewCRTestCriteria}    ${CRCriteria}
    convert to string    ${CriteriaReflectedStatus}
    should be equal as strings    ${CriteriaReflectedStatus}    True

    log to console    ${CRAdditionalPertinentInfo}
    ${AdditionalPertInfoRefltStatus} =    run keyword and return status    ActualAndExpectedValueComparision    ${ViewCRAdditionalPertinentInfo}    ${CRAdditionalPertinentInfo}
    convert to string    ${AdditionalPertInfoRefltStatus}
    should be equal as strings    ${AdditionalPertInfoRefltStatus}    True


GenerateRandomNumberFiveDigit
     ${RndNumber} =    generate random string    5    0123456789
     [return]    ${RndNumber}

ActualAndExpectedValueComparision
    [Arguments]    ${ActualFieldxpath}    ${ExpectedFieldValue}
    log to console    ${ExpectedFieldValue}
    ${ActualValue} =    get text    ${ActualFieldxpath}
    should be equal as strings    ${ActualValue}    ${ExpectedFieldValue}


CreateMDReview
     [Arguments]    ${UserData}
    #Search For Member    ${USerData}
    #select the member
    auth search modified    ${UserData.AuthId}
    set selenium implicit wait    10 Seconds
    set local variable    ${ViewAuthNewBtn}
    wait until element is visible    ${ViewAuthNewBtn}
    # Get Member Details
    click link    ${AuthNavCRLink}
    wait until page contains element    ${AuthCRTitle}
    page should contain element    ${AuthCRTitle}
    click element    ${ViewCRCreatedCRGrid}
    page should contain element    ${ViewCREditCRBtn}
    sleep    03 Seconds
    click element    ${ViewCRMDReviewAddBtn}
    wait until page contains element    ${MDReviewTitle}
    sleep    10 Seconds
    click element    ${MDPriorityDrpDwn}
    click element    ${MDPriorityDrpDownVal}
    click element    ${MDRouteReasonDrpDwn}
    click element    ${MDRouteReasonDrpDwnVal}
    click element    //label[@class="required" and text()=" Peer to Peer Request Notes"]
    input text    ${MDPeerToPeerReqNoteEdit}    MD Review Request
    page should contain element    ${MDDignosisTable}
    click element    //label[@for="undefined" and text()=" Clinical Assessment"]
    press keys  None   TAB
    sleep    02 Seconds
    ${clinicalAssessment} =    get text    ${MDClinicalAssesMentEdit}
    log to console    ${clinicalAssessment}

CreateAuthAttachmentDemo
    [Arguments]    ${UserData}
    #Search For Member    ${USerData}
    #select the member
    auth search modified    ${UserData.AuthId}
    set selenium implicit wait    10 Seconds
    set local variable    ${ViewAuthNewBtn}
    wait until element is visible    ${ViewAuthNewBtn}
    Create Auth Attachment    ${UserData}

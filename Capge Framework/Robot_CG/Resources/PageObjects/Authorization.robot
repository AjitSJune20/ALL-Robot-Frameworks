*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library  ../../CustomLibs/DataCreation.py
Library    String
Library    DateTime
Library    RPA.PDF
Resource  ../PageObjects/ClinicalConsultation.robot
Resource  ../../Data/Config.robot

*** Variables ***
${MemberCentral} =  //*[@id="navigation-bar"]/nav/section/ul[1]/li[2]/a
${AuthMenu} =  //a[@href="/cgx/MemberCentral/MemberAuth/Index?IsfromAuthMenu=true"]
${CreateAuth} =  //a[@id="create-authorization"]
${CreateLttsAuth} =  //a[@id="create-authorization-LTSS"]
##Contact Information
${ContactMethod} =  //select[@id="ContactMethodCode"]
${ContactName} =  //input[@id="ContactName"]
${ContactType} =  //Select[@id="ContactTypeCode"]
##Member Information
${DateOfService} =  //input[@id="DateOfService"]
#${SubscriberId} =  //input[@id="SubscriberId"]
##Provider Information
${ProviderType} =  //select[@id="AddProviderIdType"]
${ProviderId} =  //input[@id="ProviderId"]
${RequestingProvider} =  //label[@for="addRequestingProvider"]
${TreatingProvider} =  //label[@for="addTreatingProvider"]
${FacilityProvider} =  //label[@for="addFacilityProvider"]
${AddProvider} =  //a[@id="provider-add-button"]
#${ProviderLocation} =  //div[@id="providerlocationselect"]/div[2]/table/tbody/tr[1]/td[1]
${ProviderSearch} =  //*[@id="button-provider-search"]
${ProviderSelect} =  //*[@id="ProviderSearchGrid"]/table/tbody/tr[1]
${SearchProvider} =  //*[@id="provider-search-button"]
${TIN} =  //input[@id="TaxIdentificationNumber"]
${ProvName} =  //label[@for="ProviderName"]//following::input[1]
${ProvType} =    //select[@id="ProviderIdType"]
${ProviderAddressSelect} =  //*[@id="providerlocationselect"]/div[2]/table/tbody/tr[1]/td[1]
${RequestingProvider1} =  //label[@for="RequestingProvider"]
${TreatingProvider1} =  //label[@for="TreatingProvider"]
${FacilityProvider1} =  //label[@for="FacilityProvider"]
#Choice
${ProvChoice} =    //label[@for="checkbox-4-1"]
${MemChioce1} =    //label[@for="checkbox-5-2"]
${MemChoice2} =    //label[@for="checkbox-5-4"]
${MemChoice3} =    //label[@for="checkbox-5-6"]

#Authorization Information

${NotificationDate} =  //input[@id="NotificationDate"]
${ProgramManagement} =  //select[@id="ProgramManagementCode"]
${BCoe} =    //label[@for="BariatricCenterofExcellence"]
${Revision} =    /label[@for="Isthisarevision"]
${AuthType} =  //select[@id="AuthTypeCode"]
${Under21} =    //h3[contains(text(),'Member is Under 21:')]
${EPSDTCheck} =    //div[@for='IsEpsdtServiceRequested']//label[@class="valueField"]
${RequestType} =  //select[@id="RequestTypeCode"]
${RequestSubType} =  //select[@id="RequestSubTypeCode"]
${AdmissionType} =  //select[@id="AdmissionTypeCode"]
${BedType} =  //select[@id="BedTypeCode"]
${DischargeDate} =  //input[@id='DischargeDate']
${DischargeDisposition} =  //select[@id="DischargeDispositionCode"]

##Medical Codes
${DiagnosisCode} =  //input[@id="DiagnosisCodeSearch"]
${AddPrimaryDiagnosis} =  //a[@id="add-primary-diagnosis-button"]
${CalcualteLosBtn} =  //a[@id="los-drg-btn"]
${Calculated} =    //span[contains(text(),'Targeted LOS:')]
${AddSecondaryDiagnosis} =  //a[@id="add-secondary-diagnosis-button"]
${ProcedureCode} =  //input[@id="ProcedureCodeSearch"]
${AddProcedureBtn} =  //a[@id="ProcedureCodeSearchbtn"]
${Submit} =    //a[@id="submit-authorization"]
${Duplicate} =    //a[@id="auth-duplicate-button"]
##Redirection
${RedirectionTypeCode} =  //select[@id="RedirectionTypeCode"]
##Side Menu
${MenuCollapseBtn} =  //a[@id="menu-collapse-button"]
${ContactInfoLink} =  //a[@href="#ContactInformation"]
${MemberInfoLink} =  //a[@href="#AuthMemberInfo"]
${ProviderInfolink} =  //a[@href="#ProviderInfo"]
${CallerAuthLink} =  //a[@href="#CallerAuthentication"]
${AuthInfoLink} =  //a[@href="#AuthInformation"]
${MedicalcodeLink} =  //a[@href="#AuthMedicalCodes"]
${RedirectionLink} =  //a[@href="#RedirectionInformation"]
## Caller Authentication Check Boxes
${ProvdierNameCheck} =  //input[@id="checkbox-4-1"]
${VoiceRegCheck} =  //input[@id="checkbox-4-3"]
${MemIDCheck} =  //input[@id="checkbox-5-2"]
${MemZipCheck} =  //input[@id="checkbox-5-3"]
${MemDobCheck} =  //input[@id="checkbox-5-4"]
${MemGrpCheck} =  //input[@id="checkbox-5-6"]
${UnableAuthCheck} =  //input[@id="checkbox-126-1"]
${OutboundCallCheck} =  //input[@id="checkbox-126-2"]
###Auth View Page
${ViewMemberDetails} =  //a[@data-dropdown="MemberInfoGriddetPanel"]
${MemberName} =  //*[@id="MemberNameDisplay"]//following::span[1]
#${MedicaidId}  =  //*[@id="MedicaidId"]//following::span[1]
${MedicaidId}  =    //*[@id="MemberInfoGriddetPanel"]/div/p[6]/span[2]
${StreeAddress} =  //*[@id="BuissnessRulesAddress"]//following::span[1]
${AuthId} =    //span[@id="AuthId"]


*** Keywords ***
Navigate Authorization Page
    click element  ${AuthMenu}


Validate Fields
    [Arguments]    ${UserData}
    wait until page contains element    ${AuthId}
    click element    ${ViewMemberDetails}
    ${MemName} =    set variable    ${UserData.LName}, ${UserData.FName}
    element text should be    ${MemberName}     ${MemName}
    element text should be    ${StreeAddress}   ${UserData.Address}
    ${ValueMedecaid} =    Run Keyword And Return Status    Element Should Be Visible    ${MedicaidId}
    run keyword if  ${ValueMedecaid}  Valid Medicaid Value    ${UserData}
    

Valid Medicaid Value
    [Arguments]    ${UserData}
    element text should be    ${MedicaidId}     ${UserData.MedecaidId}


User Inputs for Authorization
    [Arguments]    ${UserData}
    set selenium implicit wait    5 Seconds
    click element  ${CreateAuth}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    page should contain element    ${ContactMethod}
    click element  ${ContactMethod}
    Select From List By Label  ${ContactMethod}  ${UserData.ContactMethod}
    input text  ${ContactName}  ${UserData.ContactName}
    Select From List By Label  ${ContactType}  ${UserData.ContactType}
    run keyword if    '${UserData.ServiceDate}' != '${EMPTY}'    input text  ${DateOfService}  ${UserData.ServiceDate}
    scroll element into view    ${ProviderType}
    run keyword if    '${UserData.ProvType}' == 'NPI'    Provider Search with NPI   ${UserData}
    ...         ELSE IF    '${UserData.ProvType}' == 'TIN'    Provider Search with TIN  ${UserData}
    ...         ELSE IF    '${UserData.ProvID}' == '${EMPTY}'    Enter Default Provider for Auth    ${UserData}
    ...         ELSE    Provider Search with NPI   ${UserData}

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

    run keyword if  '${UserData.AuthType}' == 'Inpatient'  User Enter Inpatient Info    ${UserData}
    ...    ELSE IF  '${UserData.AuthType}' == 'Outpatient'    User Enter Outpatient Info    ${UserData}
    ...    ELSE IF  '${UserData.AuthType}' == 'BHInpatient'    User Enter BHInpatient info    ${UserData}
    ...    ELSE IF  '${UserData.AuthType}' == 'BHOutpatient'    User Enter BHOutpatient info    ${UserData}



User Enters Provider Choice
    set selenium implicit wait    5 Seconds
    scroll element into view    ${ProvChoice}
    click element    ${ProvChoice}
    click element    ${MemChioce1}
    sleep    01 Seconds
    click element    ${MemChoice2}

User Enters Member Choice
    click element    ${MemChioce1}
    click element    ${MemChoice2}
    click element    ${MemChoice3}


Provider Search with NPI
     [Arguments]    ${UserData}
     set selenium implicit wait    5 Seconds
     click element  ${ProviderId}
     Select From List By Label    ${ProviderType}    ${UserData.ProvType}
     input text  ${ProviderId}  ${UserData.ProvID}
     wait until page does not contain  //*[@id="loading-ajax"]
     click element  ${RequestingProvider}
     click element  ${TreatingProvider}
     click element  ${FacilityProvider}
     click element  ${AddProvider}


Provider Search with TIN
    [Arguments]    ${UserData}
    sleep    2s
    set focus to element    ${SearchProvider}
    click element  ${SearchProvider}
    set selenium implicit wait  15 seconds
    wait until page contains element    ${TIN}
    sleep    1 seconds
    input text  ${ProvName}  ${UserData.ProvName}
    input text  ${TIN}  ${UserData.ProvID}
    click link    Search
    wait until page contains element    ${ProviderSelect}
    click element  ${ProviderSelect}
    wait until page contains element    ${ProviderAddressSelect}
    sleep   1 Seconds
    ${TotalRows} =    get text    //span[@id="providerlocationselect-Total-span"]
    run keyword if    '${TotalRows}' != '1'    click element  ${ProviderAddressSelect}
    #click element  ${ProviderAddressSelect}
    scroll element into view    ${RequestingProvider1}
    click element  ${RequestingProvider1}
    click element  ${FacilityProvider1}
    click element  ${TreatingProvider1}
    click link    Select Location
    sleep    2 seconds
    wait until page contains element    //a[@id="button-provider-save"]    2 seconds
    click link    Save

User Enters Bariatric
     [Arguments]    ${UserData}
    scroll element into view    ${BCoe}
    ${BCoeYes} =  Run Keyword And Return Status    should be equal as strings  ${UserData.BCoe}  Yes
    run keyword if    ${BCoeYes}   Enter BCoe
    ${RevisionYes} =  Run Keyword And Return Status    should be equal as strings  ${UserData.BRevision}  Yes
    run keyword if    ${RevisionYes}   Enter Revision

Enter Revision
    click element    ${Revision}
Enter BCoe
    click element    ${BCoe}

User Enters Notification Date
    [Arguments]    ${UserData}
    input text  ${NotificationDate}  ${UserData.NotificationDate}

User Enter Inpatient Info
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
    scroll element into view    ${DiagnosisCode}
    input text    ${DiagnosisCode}    ${UserData.PrimaryDiagnosis}
    click link    Add as Primary
    set selenium implicit wait  20 Seconds
    wait until page contains element    //span[contains(text(),'${UserData.PrimaryDiagnosis}')]
    scroll element into view    ${AddProcedureBtn}
    input text    ${ProcedureCode}    ${UserData.ProcedureCode}
    click link    ${AddProcedureBtn}
    wait until page contains element    //span[contains(text(),'${UserData.ProcedureCode}')]
    scroll element into view   //label[contains(text(),'Redirection')]
    sleep    1 Seconds
    select from list by label    ${Redirection}    ${UserData.Redirection}
    click element    ${CalcualteLosBtn}
    sleep    2 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]    3 seconds
    wait until page contains element    ${Calculated}
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

#ADD Another ProcedureCode
#    [Arguments]    ${UserData}
#    input text    ${ProcedureCode}    ${UserData.ProcedureCode1}
#    click link    ${AddProcedureBtn}

User Enter Bed Type
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    select from list by label    ${BedType}     ${UserData.BedType}

User Enter Discharge Date
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    run keyword if    '${UserData.DischargeDate}' == 'Today'    Enter Curent Date   ${DischargeDate}
    ...    ELSE    input text    ${DischargeDate}   ${UserData.DischargeDate}

Enter Curent Date
    [Arguments]    ${Datexpath}
    ${date} =    Get Current Date    result_format=%m/%d/%Y
    input text    ${Datexpath}   ${date}
#    log to console    ${date}
#    ${time} =    get current date    result_format=%H:%M:%S %p
#    log to console   ${time}

User Enter RequestSubType
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    2 seconds
    select from list by label    ${RequestSubType}   ${UserData.RequestSubType}

User Enter Discharge Disposition
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    select from list by label    ${DischargeDisposition}   ${UserData.DischargeDis}

Confirm the Duplicate
      click link    Yes, Continue

Confirm the Communication
     click element    //a[@id="not-now-button-Comm-rec"]

Confirm the Generate Letter
    click element    //a[@id="not-now-button"]


#########################################Out Patient Authorization######################################################
*** Variables ***
${NotificatonTime} =    //input[@id='TimeNotificationDate']
${ServiceTypeHome} =  //label[@for="IsHomeHealthServiceTypeSelected"]
${ServiceTypeOther} =  //label[@for='IsOtherServiceTypesSelected' and contains(text(),'Other')]
${SelectServiceType} =  //ul[@id='ServiceTypes']
${TypesofUnits} =   //select[@id="TypeOfUnitCodeCopyToAll"]
${CopyBtn} =    //a[contains(text(),'Copy to All')]
${CHeader} =    //h4[contains(text(),'Create Communication Record')]
*** Keywords ***
User Enter Outpatient Info
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    ${EPSDT} =     run keyword and return status    page should contain element   ${Under21}
    run keyword if    ${EPSDT}    click element    ${EPSDTCheck}
    scroll element into view    ${RequestType}
    select from list by label    ${RequestType}    ${UserData.RequestType}
    sleep    1 Second
    ${TimeField}=  run keyword and return status    page should contain element    ${NotificatonTime}
    run keyword if    ${TimeField}      input text    ${NotificatonTime}     ${UserData.Time}
     run keyword if  '${UserData.ServiceType}' == 'Home Health'  click element    ${ServiceTypeHome}
    ...         ELSE    Select the Service Type Other    ${UserData}
    scroll element into view    ${DiagnosisCode}
    input text    ${DiagnosisCode}    ${UserData.PrimaryDiagnosis}
    click link    Add as Primary
    wait until page contains element    //span[contains(text(),'${UserData.PrimaryDiagnosis}')]
    Add Procedure    ${UserData}
    #wait until page contains element    //span[contains(text(),'${UserData.ProcedureCode}')]
    scroll element into view    ${TypesofUnits}
    wait until element is visible    ${TypesofUnits}
    sleep    2 Seconds
    select from list by label   ${TypesofUnits}  ${UserData.TypeOfUnits}
    wait until element is enabled    ${CopyBtn}
    click element    ${CopyBtn}
    wait until page contains element    //span[contains(text(),'${UserData.TypeOfUnits}')]
    select from list by label    ${Redirection}    ${UserData.Redirection}
    sleep    1 Seconds
    select from list by label    ${Redirection}    ${UserData.Redirection}
    click link    Submit Authorization
    sleep    2 Second
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    click element   ${MemChoice3}
    ${DuplicateConfirm} =    Run Keyword And Return Status   page should contain link    Yes, Continue
    run keyword if  ${DuplicateConfirm}  Confirm the Duplicate
    sleep    1 Second
    ${ClinicalReivew} =    Run Keyword And Return Status   page should contain link    No
    run keyword if  ${ClinicalReivew}  Confirm the Questionnaire
    sleep    1 Second
    ${GenerateLetter} =    Run Keyword And Return Status   page should contain element    //a[@id="not-now-button"]
    run keyword if  ${GenerateLetter}  Confirm the Generate Letter
    sleep    2 Second
    ${CommunicationRec} =    Run Keyword And Return Status   page should contain element    //a[@id="not-now-button-Comm-rec"]
    run keyword if  ${CommunicationRec}  Confirm the Communication
    wait until page contains element    //h3[@class='humana-green' and text()='Authorization - Details']    10 Seconds

Select the Service Type Other
    [Arguments]    ${UserData}
    set selenium implicit wait    2 Seconds
    click element    ${ServiceTypeOther}
    sleep    02 Seconds
    click element    ${SelectServiceType}//a[contains(text(),'${UserData.ServiceType}')]

#########################################BHInPatient Authorization#####################################################
*** Variables ***
${AdmissionDate} =    //input[@id="AdmissionDate"]
${PrimaryTreatment} =   //div[@id="PrimaryTreatmentReasonCode"]
${AdmissionType} =    //select[@id='AdmissionTypeCode']
${POS} =    //select[@id='PlaceOfServiceCode']
${StartTime} =    //input[@id='StartTime']
${AdmissionReason} =   //select[@id='PrimaryAdmissionReasonCode']
${POS} =    //select[@id='PlaceOfServiceCode']
${CodeType} =    //div[@id='BHCodeTypes']
${ServiceSet} =    //select[@id='ServiceSetCode']
${RequestingUnit} =    //input[@id='ServiceSetRequestingUnits']
${AuthorizedUnit} =    //input[@id='ServiceSetAuthorizedUnits']
${STypeOfUnits} =    //select[@id='ServiceSetTypeOfUnitCode']
${RevenueCode} =    //input[@id='RevenueCodeSearch']

*** Keywords ***
User Enter BHInpatient Info
    [Arguments]    ${UserData}
    set selenium implicit wait    5 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    run keyword if    '${UserData.EPSDT}' == 'Checked'    click element    ${EPSDTCheck}
    clear element text    ${AdmissionDate}
    input text     ${AdmissionDate}    ${UserData.ServiceDate}
    select from list by label    ${RequestType}    ${UserData.RequestType}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    click element  ${PrimaryTreatment}//label[contains(text(),'${UserData.TreatmentReason}')]
    run keyword if    '${UserData.TreatmentReason}' == 'Mental Health'    User Enter Reason for Admission   ${UserData}
    select from list by label    ${AdmissionType}    ${UserData.AdmissionType}
    sleep    2 Seconds
    select from list by label    ${POS}    ${UserData.PlaceofService}
    set focus to element    ${StartTime}
    input text    ${StartTime}    ${UserData.StartTime}
    run keyword if    '${UserData.DischargeDate}' != '${EMPTY}'    User Enter Discharge Date  ${UserData}
    select from list by label    ${DischargeDisposition}    ${UserData.DischargeDis}
    input text    ${DiagnosisCode}    ${UserData.PrimaryDiagnosis}
    page should contain link   Add as Primary
    click link    Add as Primary
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${CodeType}//label[contains(text(),'${UserData.CodeType}')]
    run keyword if    '${UserData.CodeType}' == 'Service Set'  User Enter Service Set   ${UserData}
    ...         ELSE IF  '${UserData.CodeType}' == 'Procedure Code'  User Enter Procedure Code  ${UserData}
    ...         ELSE IF  '${UserData.CodeType}' == 'Revenue Code'  User Enter Revenue Code  ${UserData}
    select from list by label    ${Redirection}    ${UserData.Redirection}
    sleep    2 Seconds
    click link    Submit Authorization
    sleep    1 Second
    wait until page does not contain  //*[@id="loading-ajax"]
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    click element   ${MemChoice3}
    ${DuplicateConfirm} =    Run Keyword And Return Status   page should contain link    Yes, Continue
    sleep     1 Second
    run keyword if  ${DuplicateConfirm}  Confirm the Duplicate
    sleep    1 Second
    ${ClinicalReivew} =    Run Keyword And Return Status   page should contain link    Yes
    run keyword if  ${ClinicalReivew}  Confirm the Questionnaire

User Enter Reason for Admission
    [Arguments]    ${UserData}
    select from list by label    ${AdmissionReason}    ${UserData.AdmissionReason}

User Enters POS
    [Arguments]    ${UserData}
    set selenium implicit wait    2 Seconds
    select from list by label    ${POS}    ${UserData.PlaceofService}

User Enter Service Set
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    run keyword if    '${UserData.AuthType}' != 'BHOutpatient'    select from list by label    ${ServiceSet}  ${UserData.ServiceSet}
    sleep    1 Second
    ${ContinueMessage} =    Run Keyword And Return Status   page should contain link    Continue
    run keyword if  ${ContinueMessage}  click link    Continue

    input text    ${RequestingUnit}    ${UserData.RequestingUnits}
    input text    ${AuthorizedUnit}    ${UserData.AuthorizedUnits}
    select from list by label    ${STypeOfUnits}  ${UserData.TypeOfUnits}


User Enter Procedure Code
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    input text    ${ProcedureCode}    ${UserData.ProcedureCode}
    click link    ${AddProcedureBtn}
    sleep    1 Seconds
    wait until page contains element    //span[contains(text(),'${UserData.RevenueCode}')]
    scroll element into view    ${TypesofUnits}
    select from list by label   ${TypesofUnits}  ${UserData.TypeOfUnits}
    click element    ${CopyBtn}
    wait until page contains element    //span[contains(text(),'${UserData.TypeOfUnits}')]


User Enter Revenue Code
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    1 seconds
    scroll element into view   ${RevenueCode}
    input text    ${RevenueCode}    ${UserData.RevenueCode}
    click link    Add
    sleep    1 Seconds
    wait until page contains element    //span[contains(text(),'${UserData.RevenueCode}')]
    scroll element into view    ${TypesofUnits}
    select from list by label   ${TypesofUnits}  ${UserData.TypeOfUnits}
    click element    ${CopyBtn}
    wait until page contains element    //span[contains(text(),'${UserData.TypeOfUnits}')]


Confirm the Questionnaire
    click link    No


#########################################BHOutPatient Authorization#####################################################
*** Variables ***
${StartDate} =   //input[@id="StartDate"]
${LastDate} =    //input[@id="LastDay"]
${Redirection} =    //select[@id="RedirectionTypeCode"]

*** Keywords ***
User Enter BHOutpatient info
    [Arguments]    ${UserData}
    wait until page does not contain  //*[@id="loading-ajax"]    2 seconds
    set selenium implicit wait    5 Seconds
    select from list by label    ${RequestType}    ${UserData.RequestType}
    click element    ${SelectServiceType}//a[contains(text(),'${UserData.ServiceType}')]
    wait until page does not contain  //*[@id="loading-ajax"]
    click element  ${PrimaryTreatment}//label[contains(text(),'${UserData.TreatmentReason}')]
    run keyword if   '${UserData.StartDate}' != '${EMPTY}'   input text  ${StartDate}  ${UserData.StartDate}
    run keyword if   '${UserData.LastDate}' != '${EMPTY}'   input text  ${LastDate}  ${UserData.LastDate}
    wait until page does not contain  //*[@id="loading-ajax"]    2 seconds
    select from list by label    ${POS}    ${UserData.PlaceofService}
    input text    ${DiagnosisCode}    ${UserData.PrimaryDiagnosis}
    click link    Add as Primary
    wait until page does not contain  //*[@id="loading-ajax"]    2 seconds
    run keyword if    '${UserData.CodeType}' != 'Service Set'   click element    ${CodeType}//label[contains(text(),'${UserData.CodeType}')]
    run keyword if    '${UserData.CodeType}' == 'Service Set'  User Enter Service Set   ${UserData}
    ...         ELSE IF  '${UserData.CodeType}' == 'Procedure Code'  User Enter Procedure Code  ${UserData}
    ...         ELSE IF  '${UserData.CodeType}' == 'Revenue Code'  User Enter Revenue Code  ${UserData}
    select from list by label    ${Redirection}    ${UserData.Redirection}
    sleep    1 Second
    click link    Submit Authorization
    sleep    1 Second
    wait until page does not contain  //*[@id="loading-ajax"]    2 seconds
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    click element   ${MemChoice3}
    ${DuplicateConfirm} =    Run Keyword And Return Status   page should contain link    Yes, Continue
    run keyword if  ${DuplicateConfirm}  Confirm the Duplicate
    sleep    1 Second
    ${ClinicalReivew} =    Run Keyword And Return Status   page should contain link    Yes
    run keyword if  ${ClinicalReivew}  Confirm the Questionnaire


##############################################    Write Output    ######################################################
*** Variables ***
${ViewAuthId} =    //span[@id="AuthId"]
${Status} =    //span[@id="OverallAuthStatusForBanner"]
${Queue} =    //span[@id="AssignedQueue"]
${BRule} =    //*[@id="BuinessRulesGrid"]/table/tbody
${Sheet_name} =    AuthorizationResults
${Index_Name} =    SubscriberId

*** Keywords ***
Log the Status
    [Arguments]     ${UserData}
   set selenium implicit wait  10 seconds
   wait until page does not contain  //*[@id="loading-ajax"]
   ${AuthorizationID} =  get text    ${ViewAuthId}
   ${AuthStatus} =  get text  ${Status}
   ${AssignedQueue} =  get text  ${Queue}
   ${BROutput} =  get text  ${BRule}
   ${BROutput} =  Replace String Using Regexp  ${BROutput}  \n  ${SPACE}
   ${BROutput} =   remove string    ${BROutput}
   ${MemberName} =    get text    //div[@id="member-information"]//child::div[@class="small-2 columns"][1]
   ${MemberName} =    split string    ${MemberName}    ,
   ${FirstName} =   set variable    ${MemberName}[1]
   ${LastName} =    set variable    ${MemberName}[0]
   ${FirstName} =   strip string    ${MemberName}[1]    mode=both
   ${LastName} =    strip string    ${MemberName}[0]    mode=both
   ${MemberDOB} =    get text    //div[@id="member-information"]//child::div[@class="small-2 columns"][3]
   ${MemberDOB} =    split string    ${MemberDOB}    ,
   ${MemberDOB} =   set variable    ${MemberDOB}[0]
   ${MemberDOB} =    strip string    ${MemberDOB}    mode=both
    set to dictionary  ${UserData}  Authorization ID   ${AuthorizationID}  Status  ${AuthStatus}  Assigned Queue  ${AssignedQueue}  Business Rule  ${BROutput}    First Name    ${FirstName}    Last Name   ${LastName}    Member DOB    ${MemberDOB}
    ${HEADER} =    get dictionary keys    ${UserData}    sort_keys=False
    ${VALUE} =    get dictionary values    ${UserData}    sort_keys=False
    write_to_file   ${HEADER}   ${VALUE}
    format_output_data
#    write_to_excel    ${Sheet_name}    SubscriberId
    format_excel    ${Sheet_name}
###########################################    Void Auths    ##############################
*** Variables ***
${Edit} =    //a[@id='paste-contact-info']//following::a[1]
${CreateDate} =    //div[@id='CreatedDate']
${VoidReason} =    //select[@id='VoidReasonCode']
${VoidStatus} =    //span[@id='OverallAuthStatusForBanner']
${VoidAuthBtn} =    //a[@id='button-edit-void-authorization-popup']
${VoidError} =    //span[@id="unableToAuthenticatePanelError"]
*** Keywords ***

Void Auth
    [Arguments]    ${UserData}
    set selenium implicit wait    5 Seconds
    click element    ${AuthMenu}
    click element    //table/tbody/tr/td[3]
    wait until page contains element    ${CreateDate}
    click element    ${Edit}
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    User Enters Caller Authentication    ${UserData}
    page should contain link    Void Auth
    click link    Void Auth
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    click element   ${MemChoice3}
    click link    Void Auth
    wait until page contains element    ${VoidReason}
    select from list by label    ${VoidReason}    Test Authorization
    sleep    1 Seconds
    click link    ${VoidAuthBtn}
    Sleep    2 Seconds
    ${VStatus} =    get text    ${VoidStatus}
    should be equal as strings    ${VStatus}     Void

Smoke Void Auth
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
     wait until page contains element    ${CreateDate}
    click element    ${Edit}
    Sleep    1 Second
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if  ${ErrorMessage}    User Enters Caller Authentication    ${UserData}
    page should contain link    Void Auth
    click link    Void Auth
    ${ErrorMessage} =    run keyword and return status    is element enabled    ${VoidError}
    run keyword if    ${ErrorMessage}    click element   ${MemChoice3}
    click link    Void Auth
    sleep    2 seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    wait until page contains element    ${VoidReason}
    select from list by label    ${VoidReason}    Test Authorization
    sleep    1 Seconds
    click link    ${VoidAuthBtn}
    Sleep    2 Seconds
    ${VStatus} =    get text    ${VoidStatus}
    should be equal as strings    ${VStatus}     Void


User Enters Caller Authentication
     [Arguments]    ${UserData}
      set selenium implicit wait    10 Seconds
      run keyword if    page should contain element    '${UserData.ContactType}' != 'Member' or '${UserData.ContactType}' !='Member Rep'   User Enters Provider Choice
    ...         ELSE    User Enters Member Choice

Add Procedure
    [Arguments]    ${UserData}

    @{Code} =      split string    ${UserData.ProcedureCode}    ,
    FOR    ${item}  IN   @{Code}
          sleep    1 Seconds
          scroll element into view    ${ProcedureCode}
          input text    ${ProcedureCode}    ${item}
          click link    ${AddProcedureBtn}
    END

#############################################    Auth Letters    ######################################################
*** Variables ***
${Template} =    //a[@id='select-template']
${ExistingAuth} =    //*[@id="MemberCentralAuth"]/div[2]/div[1]/table/tbody/tr[1]/td[3]
${Letters} =    //ul[@class='side-nav']//a[contains(text(),'Letters')]
${AddBtn} =    //a[@id='add-letter']
${SelectTemplate} =    //a[@id='select-template']
#${MemPrimarySendTo} =   //label[@for='send-to-checkbox-Primary']
${MemPrimarySendTo} =   //div[@for='MemberPrimarySendTo']//label[1]
${Location} =    //select[@id='SelectedLocationId']
${GenerateBtn} =    //a[contains(text(),'Generate Letter')]
${LetterTable} =    //div[@id="GeneratedLettersGrid"]/table/tbody/tr/td[1]

*** Keywords ***
Create Letter
     [Arguments]    ${UserData}
     set selenium implicit wait    5 Seconds
     #click element    ${ExistingAuth}
     wait until page does not contain  //*[@id="loading-ajax"]
     set focus to element    //div[@id='left-navAuth']
     click element    ${Letters}
     wait until page contains     Authorization - Letters
     click element    ${AddBtn}
     page should contain    Create Auth Letter
     click element    ${SelectTemplate}
     set focus to element    //ul[@id='TemplateId']
     click link    Medicare - DENC-SP
     click link    Select
     ${Proceeding} =    Run Keyword And Return Status   page should contain link     Proceed
     run keyword if  ${Proceeding}    click link    Proceed
     Sleep  1 Seconds
     page should contain    Create Auth Letter
     scroll element into view    ${MemPrimarySendTo}
     click element    ${MemPrimarySendTo}
     scroll element into view    ${Location}
     select from list by label  ${Location}  CIT - Louisville
     click element    ${GenerateBtn}
     wait until element is visible    ${LetterTable}
     page should contain link    Save
     click link    Save




###################################     Auth Connunication Record ###################################################
*** Variables ***
${CommRec} =    //ul[@class='side-nav']//a[contains(text(),'Communication Record')]
${CAddBtn} =    //a[@id='add-new-communication-record']
${CName} =    //input[@id='ContactName']
${CNumber} =    //input[@id='ContactNumber']
${CommType} =    //select[@id='ControlId102']
${CMethod} =    //select[@id='ControlId103']
${CType} =    //select[@id='ControlId106']
${CResult} =    //select[@id='ControlId116']
${MChioce1} =    //label[@for='checkbox-ControlId113-ME1490']
${MChioce2} =    //label[@for='checkbox-ControlId113-ME1590']
${MChioce3} =    //label[@for='checkbox-ControlId113-ME1350']
${Recorded} =    //label[@for='ControlId2855-radio-1-NO0220']
${Disclaimer} =    //a[contains(text(),'Grijalva Disclaimer')]
${CommNotes} =    //textarea[@id='ControlId131']
${Dept} =    //*[@id="AuthCommunicationRecord"]/div[2]/div[1]/table/tbody/tr[1]/td[3]
*** Keywords ***

Create Communication Record
    [Arguments]    ${UserData}
    set selenium implicit wait    5 Seconds
    #click element    ${ExistingAuth}
    wait until page does not contain  //*[@id="loading-ajax"]
    set focus to element    ${CommRec}
    click element    ${CommRec}
    wait until page contains    Authorization - Communication Record
    click element    ${CAddBtn}
    wait until page contains    Create Communication Record
    input text    ${CName}    THIS IS A PPV QA TEST AUTHORIZATION
    input text    ${CNumber}    602-555-1212
    select from list by label    ${CommType}    Inbound
    select from list by label    ${CMethod}    Fax
    select from list by label    ${CType}    Caregiver
    scroll element into view    ${MChioce1}
    click element    ${MChioce1}
    click element    ${MChioce2}
    click element    ${MChioce3}
    click element    ${Recorded}
    select from list by label    ${CResult}    Acute Care Admit Completed
    click link    Grijalva Disclaimer
    click link   Lack of Information Script
    click link   Peer to Peer Discussion Offered
    input text    ${CommNotes}    This is a test note
    click link    Submit
    wait until page contains    Authorization - Communication Record
    ${DeptVal} =    get text    ${Dept}
    should be equal as strings    ${DeptVal}    ICGS








###################################### Auth Task    ########################################################
*** Variables ***
${Task} =  //ul[@class='side-nav']//a[contains(text(),'Tasks')]
${TAdd} =   //a[@id='add-new-tasks']
${TPriority} =  //select[@id='PriorityType']
${TskType} =  //select[@id='TypeId']
${TFollowupD} =    //input[@id='FollowUpDate']
${TFollowupT} =    //input[@id='FollowUpTime']
${TComments} =    //textarea[@id='Comments']
${SaveBtn} =    //a[@id='save-new-task-btn']
${TEdit} =    //a[@id='edit-tasks-grid']

*** Keywords ***

Create Task
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    click element    ${Task}
    wait until page contains    Authorization - Tasks
    click element    ${TAdd}
    wait until page contains element    ${TPriority}
    select from list by label    ${TPriority}    Urgent
    select from list by label    ${TskType}     Clinical 2nd Request
    input text   ${TFollowupD}    ${UserData.Date}
    input text   ${TFollowupT}    ${UserData.Time}
    input text    ${TComments}    Test Automation
    click link    Save

Validate Edit Task
    set selenium implicit wait    10 Seconds
    click element    ${Task}
    page should contain element    ${TEdit}
    click element    //*[@id="AuthorizationTask"]/div[2]/div[1]/table/tbody/tr
    page should contain link    Take Ownership
    page should contain link    Change Ownership
    page should contain link    Complete
    page should contain link    Void Task
    page should contain link    Edit
    click link    Edit
    wait until page contains    Edit Task
    wait until page contains element    ${TPriority}
    select from list by label    ${TPriority}    Medium
    input text    ${TComments}    Edit Test Automation
    click link    Save




################################################ Auth Attachments    #############################################
*** Variables ***
${SideAttachment} =     //ul[@class='side-nav']//a[contains(text(),'Attachments')]
${AAddBtn} =    //a[@id="btn-auth-attacments"]
${SelectFile} =    //input[@id="attachmentFile"]
${AttachAddFile} =    C:\\Users\\SNG9716\\RobotLocal\\Data\\Jan_2019_kNHOw_Calendar.pdf
${AttachExistingAuth} =    //*[@id="MemberCentralAuth"]/div[2]/div[1]/table/tbody/tr[1]/td[3]
${AttachContactMethod} =    //select[@id="ContactMethodCode"]
${AttachContactName} =  //input[@id="ContactName"]
${AProvChoice} =    //label[@for="checkbox-4-3"]
${AMemChoice1} =    //label[@for="checkbox-5-2"]
${AMemChoice2} =    //label[@for="checkbox-5-4"]
${AttachContactType} =     //select[@id="ContactTypeCode"]
${AttachType} =    //div[@id="AttachmentType"]//label[contains(text(),"Non Clinical Record")]
${AttachDescr} =    //textarea[@id="AttachmentDescription"]
${Success} =    //div[@class="alert-box success"]
${AttachVoidRsn} =    //textarea[@id="VoidComments"]

*** Keywords ***
Create Auth Attachment
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    click element    ${AttachExistingAuth}
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${SideAttachment}
    wait until page contains    Authorization - Attachments
    click element    ${AAddBtn}
    wait until page does not contain  //*[@id="loading-ajax"]
    choose file    ${SelectFile}   ${AttachAddFile}
    select from list by label    ${AttachContactMethod}    Fax
    input text    ${AttachContactName}     Automation Tester
    select from list by label    ${AttachContactType}    Facility
    scroll element into view    ${AProvChoice}
    click element    ${AProvChoice}
    click element    ${AMemChoice1}
    Sleep    1 Second
    click element    ${AMemChoice2}
    click element    ${AttachType}
    input text   ${AttachDescr}    This is Automation Testing
    click link    Save
    wait until page does not contain  //*[@id="loading-ajax"]
    page should contain element    ${Success}
Edit Attachment
    set selenium implicit wait    10 Seconds
    click element    ${AttachExistingAuth}
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${SideAttachment}
    page should contain element    //td[contains(text(),"This is Automation Testing")]
    click element     //td[contains(text(),"This is Automation Testing")]
    Sleep    2 Second
    page should contain    View Attachment
    page should contain link    Edit
    click element    //a[@id="button-edit-auth-attactment-details"]
    page should contain    Edit Attachment
    input text    ${ATTACHCONTACTNAME}    Automation Testing
    scroll element into view    ${AProvChoice}
    click element    ${AProvChoice}
    click element    ${AMemChoice1}
    Sleep    1 Second
    click element    ${AMemChoice2}
    click link    Save
    page should contain element    ${Success}

Void Attachment
    click element     //td[contains(text(),"This is Automation Testing")]
    Sleep    1 Second
    click link    Void Attachment
    input text    ${AttachVoidRsn}    Void This is Automation Testing
    click link    //a[@id="button-void-auth-attactment"]
    page should contain element    ${Success}

############ Nisharani Chavan 24/09/2021

Void Member Attachment
        click element      //td[contains(text(),"This is Automation Testing")]
        Sleep    1 Second
        click link    Void Attachment
        input text    ${AttachVoidRsn}    Void This is Automation Testing
        click link    //a[@id="btnVoidMemberAttachmentDetails"]
        page should contain element    ${Success}

#####################

######################################### LTSS Authorization######################################################
*** Variables ***
${CreateLTSSAuthBtn} =    //span[contains(text(),'Create LTSS Authorization')]
${StartDateLTSSAuth} =     //input[@id='StartDate']
${EndDateLTSSAuth} =    //input[@id='EndDate']
${ServiceTypeLTSSAuth} =     //select[@id='ServiceType']
${ServiceDecriptionLTSSAuth} =     //select[@id='ServiceDescription']
${ScopeLTSSAuth} =      //select[@id='LtssAuthScope']
${BarrierLTSSAuth} =      //select[@id='LtssAuthBarrier']
${AddServiceDetailsLTSSAuth} =      //a[@id='add-granular-service-button']
${GranuleServiceCodeLTSSAuth} =      //select[@id='GranularServiceCode']
${FrequencyLTSSAuth} =      //select[@id='Frequency']
${FrequencyCalculationLTSSAuth} =      //input[starts-with (@id,'CalculateFrequencyBy-radio')]/following-sibling::label[contains(text(),'Units')]
${TotalLTSSAuth} =      //input[@id='Total']
${SpecialServiceConsiderationLTSSAuth} =        //textarea[@id='ServiceSpecialConsideration']
${BackUpPlanDetailLTSSAuth} =        //textarea[@id='BackUpPlanDetail']
${SaveServiceLTSSAuthBtn} =     //a[@id='granularservice-save-btn']
${ProviderCountryCodeLTSSAuth} =        //select[@id='ProviderCountyCode']
${FindProviderLTSSAuthBtn} =     //a[@id='providerCountySearch']
${ProviderChkboxLTSSAuth} =        //input[@id='1-Provider-checkbox']/parent::div/label
${SetProviderLTSSAuthBtn} =         //a[@id='provider-primary']
${AuthTypeLTSSAuth} =       //select[@id='AuthorizationTypeCode']
${OveralStatusLTSSAuth} =      //select[@id='OverAllStatusCode']
${RequestTypeLTSSAuth} =        //select[@id='RequestTypeCodeForCreate']
${DateRequestedLTSSAuth} =      //input[@id='DateRequested']
${AuthSubmissionLTSSAuth} =     //a[@id='btn-submit-authorization']
${DelayReasonLTSSAuth} =        //select[@id='DelayReason']


${EditLTSSAuthBtn} =        //a[@id='btn-edit-authorization']
${VoidLTSSAuthBtn} =        //a[@id='edit-void-authorization']
${VoidReasonLTSSAuth} =     //span[@class='select2-selection select2-selection--single']
#//span[@id='select2-VoidReasonCode-container']
${VoidAuthorizationLTSSAuthBtn} =       //a[@id='button-edit-void-authorization-popup']
*** Keywords ***
Create LTSS Auth
    [Arguments]    ${UserData}
    set selenium speed    0.5s
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${Tomorrow} =      add time to date    ${Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    Navigate to Authorizations
    wait until page does not contain  //*[@id="loading-ajax"]    2 seconds
    click element       ${CreateLTSSAuthBtn}
    input text      ${StartDateLTSSAuth}    ${Today}
    input text      ${EndDateLTSSAuth}    ${Tomorrow}
    select from list by label    ${ServiceTypeLTSSAuth}    ${UserData.ServiceType}
    select from list by label    ${ServiceDecriptionLTSSAuth}    ${UserData.ServiceDecription}
    select from list by label    ${ScopeLTSSAuth}    ${UserData.Scope}
    select from list by label    ${BarrierLTSSAuth}    ${UserData.Barrier}
    click element       ${AddServiceDetailsLTSSAuth}
    select from list by label    ${GranuleServiceCodeLTSSAuth}    ${UserData.GranuleServiceCode}
    select from list by label    ${FrequencyLTSSAuth}    ${UserData.Frequency}
    click element       ${FrequencyCalculationLTSSAuth}
    input text      ${TotalLTSSAuth}    ${UserData.Total}
    input text      ${SpecialServiceConsiderationLTSSAuth}  ${UserData.SpecialServiceConsideration}
    input text      ${BackUpPlanDetailLTSSAuth}  ${UserData.BackUpPlanDetail}
    click element       ${SaveServiceLTSSAuthBtn}
    wait until page does not contain  //*[@id="loading-ajax"]    5 seconds
    select from list by label    ${ProviderCountryCodeLTSSAuth}    ${UserData.ProviderCountryCode}
    click element       ${FindProviderLTSSAuthBtn}
    sleep    5s
    click element       ${ProviderChkboxLTSSAuth}
    click element       ${SetProviderLTSSAuthBtn}
    sleep    5s
    select from list by label    ${AuthTypeLTSSAuth}    ${UserData.AuthType}
    select from list by label    ${OveralStatusLTSSAuth}    ${UserData.OveralStatus}
    select from list by label    ${RequestTypeLTSSAuth}    ${UserData.RequestType}
    input text      ${DateRequestedLTSSAuth}    ${Today}
    click element       ${AuthSubmissionLTSSAuth}


Void LTSS Auth
    [Arguments]    ${UserData}
    set selenium speed    0.5s
#    click element    //img[@alt='Search']
#    click link    Record
#    input text    //input[@id='authIdField']    088303216
#    click element    //a[@id='btnSearch']
    sleep    3s
    click element       ${EditLTSSAuthBtn}
    wait until page does not contain  //*[@id="loading-ajax"]    2 seconds
    click element       ${VoidLTSSAuthBtn}
    click element       ${VoidReasonLTSSAuth}
    input text      //input[@class='select2-search__field']     Test Authorization
    click element    //li[@class='select2-results__option select2-results__option--highlighted']
    click element       ${VoidAuthorizationLTSSAuthBtn}
    sleep    3s
#    element text should be      //div[contains(text(),'Authorization 088295487 was successfully Voided an')]

Protegrity View Authorization
    [Arguments]  ${UserData}
    set selenium speed    1s
#    click element    //div[@class='k-grid-content']//tr/td[contains(text(),'${UserData.AuthId}')]
#    sleep    3s
    ${Email_Auth_Actual}      get text    ${Email}
    ${ContactPhone_Auth_Actual}      get text    ${ContactPhone}
    click element    //img[contains(@src,'grid_more_icon_web.png')]
    ${FullName_MemInfo}      get text    ${MemberName}
    ${Name}      split string   ${FullName_MemInfo}     ,
    ${FirstName_Auth_Actual}    strip string     ${Name}[1]
    ${LastName_Auth_Actual}    strip string     ${Name}[0]

    ${Address}      get text    ${StreeAddress}
    ${Add}      split string   ${Address}     ,
    ${StreetAddress_Auth_Actual}    strip string     ${Add}[0]
    ${ZipCodeAuth_Actual}    strip string     ${Add}[5]

    should be equal as strings  ${Email_Auth_Actual}  ${UserData.Email}
    should be equal as strings  ${FirstName_Auth_Actual}  ${UserData.FirstName}
    should be equal as strings  ${LastName_Auth_Actual}  ${UserData.LastName}
    should be equal as strings  ${ZipCodeAuth_Actual}  ${UserData.ZipCode}
    should be equal as strings  ${StreetAddress_Auth_Actual}  ${UserData.StreetAddress}
    should be equal as strings  ${ContactPhone_Auth_Actual}  ${UserData.ContactPhone}
 #   should be equal as strings  ${Medicare ID_Auth_Actual}  ${UserData.Medicare ID}
    reload page

*** Variables ***
${FullAddress} =    //div[@class='member-banner']//div[4]
${MemberName_CDR} =    //div[@id='MemberNameDisplay']




*** Keyword ***
Protegrity View AuthLetter
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    3s
    click element    //a[@href='/cgx/Authorization/AuthorizationLetter']
    page should contain element    //h3[contains(text(),'Authorization - Letters')]
    click element    //div[@id='AuthorizationLetters-gridContent']//div[@class='k-grid-content']//tr/td[4]
    ${Address}      get text    ${FullAddress}
    ${Add}      split string   ${Address}   ,
    ${StreetAddress_AuthLetter}    strip string     ${Add}[0]
    ${ZipCodeAuth_AuthLetter}     strip string     ${Add}[4]

    should be equal as strings  ${ZipCodeAuth_AuthLetter}    ${UserData.ZipCode}
    should be equal as strings  ${StreetAddress_AuthLetter}    ${UserData.StreetAddress}
    reload page

Protegrity View Quality Review
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Quality Review
    click element    //div[@id='QualityReviewGrid-gridContent']//tr/td[2]
    page should contain element    //h3[contains(text(),'View Quality Review')]
    ${Phone}      get text    //label[@for='TeamMemberPhoneNumber']/following::div[1]
    should be equal as strings    ${Phone}    ${UserData.ContactPhone}
    reload page

View_CDR_Protegrity
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Letters
    click element    //div[@id='AuthorizationLetters-gridContent']//div[@class='k-grid-content']//tr/td[4]
    ${Address}      get text    ${FullAddress}
    ${Add}      split string   ${Address}     ,
#    ${StreetAddress_AuthLetter_Actual}     ${Add}[0]
#    ${ZipCodeAuth_AuthLetter_Actual}     ${Add}[4]
    should be equal as strings  ${Add}[4]    ${UserData.ZipCode}
    should be equal as strings  ${Add}[0]    ${UserData.StreetAddress}

Protegrity Edit Quality Review
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Quality Review
    click element    //div[@id='QualityReviewGrid-gridContent']//tr/td[2]
    page should contain element    //h3[contains(text(),'View Quality Review')]
    click element    //a[@id='qualityReview-edit-btn']
    ${Phone}      get value    //input[@id='TeamMemberPhoneNumber']
    should be equal as strings    ${Phone}    ${UserData.ContactPhone}
    reload page

Protegrity Edit Discharge Plan
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Discharge Plan
    click element    //a[@id='dischargePlan-edit-btn']
    scroll element into view    //input[@id='PlannerPhoneNumber']
    ${Phone}      get value    //input[@id='PlannerPhoneNumber']
    ${Extension}      get value    //input[@id='PlannerExtension']
    should be equal as strings    ${Phone}    ${UserData.ContactPhone}
    should be equal as strings    ${Extension}    ${UserData.ContactExtension}
    reload page

Protegrity Create Discharge Plan
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Discharge Plan
    scroll element into view    //input[@id='PlannerPhoneNumber']
    ${Phone}      get value    //input[@id='PlannerPhoneNumber']
    ${Extension}      get value    //input[@id='PlannerExtension']
    should be equal as strings    ${Phone}    ${UserData.ContactPhone}
    should be equal as strings    ${Extension}    ${UserData.ContactExtension}
    reload page

#### Changes for submit Auth with Default Provider
*** Variables ***
${DefaultProvider} =    //a[@id="add-newprovider-button" and text()='Enter Default Provider']
${ProviderName} =    //input[@id="DisplayProviderName"]
${ProviderPhone} =    //input[@id="NewProivderPhone"]
${Save_DefaultProvider} =    //a[@id="button-add-new-provider"]

*** Keywords ***
Enter Default Provider for Auth
    [Arguments]  ${UserData}
    sleep    2s
    wait until element is visible    ${DefaultProvider}    30s
    scroll element into view    ${DefaultProvider}
    sleep    1s
    click element    ${DefaultProvider}
    wait until page contains    Enter Default Provider    30s
    input text    ${ProviderName}    ${UserData.ProviderName}
    input text    ${ProviderPhone}    ${UserData.ProviderPhone}
    click element    //label[@for="AddNewRequestingProvider" and text()='Requesting Provider']
    click element    //label[@for="AddNewTreatingProvider" and text()='Treating Provider']
    click element    //label[@for="AddNewFacilityProvider" and text()='Facility Provider']
    sleep    1s
    click element    ${Save_DefaultProvider}
    wait until element is visible    //div[@id="requesting-provider"]/div[2]//a/img    30s

###### Amol Pawar Change for TR-157265 Semi-Automate Medicare Approval template UMMED85(CGX backlog letter)
Semi-Automate Medicare Letter Validation
    [Arguments]    ${UserData}
    switch window    Main    10s
    wait until page contains    Authorization - Letters    30s
    Make Grid Order Descending    ${Desc_path}    ${Col_path}
    sleep    1s
    set focus to element    (//div[@id="AuthorizationLetters-gridContent"]//tbody//tr/td[text()='${UserData.LetterName}'])[1]
    sleep    1s
    click element    (//div[@id="AuthorizationLetters-gridContent"]//tbody//tr/td[text()='${UserData.LetterName}'])[1]
    wait until element is visible    ${LetterName}    30s
    ${FileName} =    get text    ${LetterName}
    set local variable    ${FileName}
    ${FileName} =    strip string    ${FileName}    mode=both
    log to console    ${FileName}
    click element    ${LetterName}
    sleep    10s
    ${DataFromPDF} =    Get Text From PDF    ${PDFFILE_PATH}//${FileName}
    set global variable    ${DataFromPDF}
#    ${DataFromPDF} =    strip string    ${DataFromPDF}  mode=both
    log    ${DataFromPDF}
#    should be true    "e reviewed  the request  received  from  you  or your  provider  for  the services  shown  below" in "${DataFromPDF}"
    should be true    "${UserData.SubscriberId1}" in "${DataFromPDF}"
    ${AuthID_Value} =    get text    ${AuthId_Path}
    set global variable    ${AuthID_Value}
    ${AuthID_Value} =    strip string    ${AuthID_Value}    mode=both
    log to console    ${AuthID_Value}
    should be true    "${AuthID_Value}" in "${DataFromPDF}"
    should be true    "${UserData.ApprovedServices}" in "${DataFromPDF}"
    should be true    "${UserData.SNFFacility}" in "${DataFromPDF}"
#    should be true    "${MemberName_Value}" in "${DataFromPDF}"

*** Variables ***
${LetterName} =    //a[@id="viewLnkAttachment"]
${AuthID_Value} =    EMPTY
${DataFromPDF} =    EMPTY
${AuthId_Path} =    //span[@id="AuthId"]
${AuthLetters} =    //div[@id="left-navAuth"]//a[text()='Letters']
${Add_Letter} =    //a[@id="add-letter"]
${Select_Template} =    //a[@id="select-template"]/span[text()='Select Template']
${btn_selectTemplate} =    //a[@id="btn-select-template"]
${btn_Proceed} =    //div[@id="message-alert"]//a[@id="button-proceed"]
${LocationforLetter} =    //input[@placeholder="Location"]
${SendTo} =    //label[@for="send-to-checkbox-Primary"]
${CopyTo} =    //label[@for="copy-to-checkbox-Requesting"]
${Generate_Letter} =     //div[contains(text(),'Generate Letter')]
${Desc_path} =    //div[@id="AuthorizationLetters-gridContent"]//thead/tr/th[2][@aria-sort="descending"]
${Col_path} =    //div[@id="AuthorizationLetters-gridContent"]//thead/tr/th[2]
${expected_MemberName} =    //span[text()='Name : ']//parent::div/span[2]
${MemberName_Value} =    EMPTY
${DynamicFields} =    //u[text()=' Dynamic Fields ']
${IDNLetterDate} =    //label[text()='IDN Letter Date: ']//parent::div//following::div[1]/textarea
${Requestedservice} =    //div[@id="ngxEditor"]/div/div
${CopytoPCP_Facility} =    //label[contains(text(),'Copy to PCP/Facility:')]//following::div[1]/textarea
*** Keywords ***
Create X_AUTO_Medicare Approval Letter
    [Arguments]    ${UserData}
    set selenium implicit wait    20s
    wait until element is visible    ${AuthLetters}    10s
    click element    ${AuthLetters}
    wait until page contains    Authorization - Letters    20s
    set focus to element    ${Add_Letter}
    sleep    1s
    click link    ${Add_Letter}
    wait until page contains    Create Auth Letter    20s
    set focus to element    ${Select_Template}
    sleep    1s
    click element    ${Select_Template}
    wait until element is visible    //div[@id="select-letter-Template"]//h4[@id="modal-header-title"]    20s
    scroll element into view    ${UserData.TemplateID}    #  id:TemplateId-9278
    sleep    1s
    click element    ${UserData.TemplateID}
    sleep    1s
    click link    ${btn_selectTemplate}
    wait until page contains    Proceed to Create Letter    20s
    set focus to element    ${btn_Proceed}
    sleep    1s
    click element    ${btn_Proceed}
    sleep    4s
    switch window    url=https://${INSTANCE}-cgxbts.humana.com/Letters/Create    30s
    sleep    1s
    ${MemberName_Value} =    get text    ${expected_MemberName}
    set global variable    ${MemberName_Value}
    ${MemberName_Value} =    strip string    ${MemberName_Value}    mode=both
    log to console    ${MemberName_Value}
    wait until element is visible    ${LocationforLetter}    30s
    input text    ${LocationforLetter}    ${UserData.LocationforLetter}    #CIT - Louisville
    click element    ${SendTo}
    click element    ${CopyTo}
    ${var_DynamicField} =    run keyword and return status    element should be visible    ${DynamicFields}
    run keyword if    ${var_DynamicField}    Enter Dynamic Field values    ${UserData}
    scroll element into view    //h4[contains(text(),'Generated Letters')]
    sleep    1s
    set focus to element    ${Generate_Letter}
    sleep    2s
    click element    ${Generate_Letter}
    wait until element is visible    //div[@class="grid-container"]    30s
    sleep    1s
    click element    //button[text()='Save']
    wait until element is visible    //span[contains(text(),'Letter was generated successfully')]    30s
    set focus to element    //button[contains(text(),'Ok')]
    sleep    1s
    click element    //button[contains(text(),'Ok')]
    sleep    2s

#######    Amol Pawar: Changes for TC Verify Dynamic fields for xMedicare-Pre-Claim Provider Dispute_Approval_E
Enter Dynamic Field values
    [Arguments]    ${UserData}
    wait until element is visible    ${IDNLetterDate}    30s
    input text    ${IDNLetterDate}    ${UserData.IDNLetterDate}
    input text    ${Requestedservice}    ${UserData.Requestedservice}
    input text    ${CopytoPCP_Facility}    ${UserData.CopytoPCP_Facility}

Dynamic Field values Validate
    [Arguments]    ${UserData}
    sleep    2s
    should be true    "${UserData.IDNLetterDate}" in "${DataFromPDF}"
    should be true    "${UserData.Requestedservice}" in "${DataFromPDF}"
    should be true    "${UserData.CopytoPCP_Facility}" in "${DataFromPDF}"
########################################################
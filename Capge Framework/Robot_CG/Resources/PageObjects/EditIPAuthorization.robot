*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${AuthInfoEdit} =    //div[@id='AuthInformation']//a[contains(text(),'Edit')]
${EditDischargeDate} =    //input[@id='DischargeDate']
${EditDischargeDisp} =    //select[@name='DischargeDispositionCode']
${EditBedType} =    //select[@name='BedTypeCode']
${MedicalCodeEdit} =    //div[@id='AuthMedicalCodes']//a[contains(text(),'Edit')]
${EditDiagnosisCode} =    //input[@name='DiagnosisCodeSearch']


*** Keywords ***
Edit IP Auth for Dischage Date Discharge Disp Bed Type and Diagnosis code
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    sleep    1s
    click element    ${AuthInfoEdit}
    wait until page does not contain     //*[@id="loading-ajax"]
    wait until element is enabled    //select[@name='ProgramManagementCode']
    scroll element into view    ${EditDischargeDate}
    sleep    2s
    set focus to element    ${EditDischargeDate}
    input text    ${EditDischargeDate}     ${UserData.DischageDateAfterAuthSub}
    sleep    2s
    PRESS KEY    ${EditDischargeDate}    \\09
    select from list by label    ${EditDischargeDisp}    ${UserData.DischageDisAfterAuthSub}
    sleep    2s
    scroll element into view    //div[@id='RangeOfDaysGrid']//table//tbody//tr//td[3]
    click element    //div[@id='RangeOfDaysGrid']//table//tbody//tr//td[3]
    sleep    1s
    wait until page contains    Edit Range Of Days
    select from list by label    ${EditBedType}     ${UserData.BedTypeAfterAuthSub}
    click element    //a[contains(text(),'Save')]
    sleep    2s
    wait until page contains element    //a[@id='add-rangeofdays']    30s
    scroll element into view    ${MedicalCodeEdit}
    click element    ${MedicalCodeEdit}
    wait until page contains element    ${EditDiagnosisCode}
    input text    ${EditDiagnosisCode}    ${UserData.DiagnosisCodeAfterAuthSub}
    click element    //a[contains(text(),'Add as Primary')]
    set selenium implicit wait    20s
    wait until page contains element    //span[contains(text(),'${UserData.DiagnosisCodeAfterAuthSub}')]
    click link    Submit Auth
    wait until page does not contain     //*[@id="loading-ajax"]
    sleep    1s
    ${CommunicationRec} =    Run Keyword And Return Status   page should contain link    Not Now
    run keyword if    ${CommunicationRec}    click link    Not Now


Verify Auth Status
    [Arguments]    ${UserData}
    element should contain    //span[@id='OverallAuthStatusForBanner']    ${UserData.AuthStatus}




















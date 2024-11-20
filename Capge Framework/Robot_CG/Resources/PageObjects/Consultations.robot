*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library  ../../CustomLibs/DataCreation.py
Library    String


*** Variables ***
${ClinicalReview} =    //ul[@class='side-nav']//a[contains(text(),'Consultations')]
${ConsultAddBrn} =    //a[@id="add-auth-consultation"]
${TypeCode} =    //select[@id='TypeCode']
${ConsultRsn} =    //select[@id='Reasons']
${ConsultOutcome} =    //select[@id='Outcomes']
${WhoConsultselect} =    //a[@id='button-consultaion-whoconsulted']
${ConQueueName} =    //input[@id='QueueName']
${SelectName} =    //td[contains(text(),'James Koeppel')]//preceding::label[1]
${QueueNameBtn} =    //a[@id="QueueNamebtn"]
${Consluted} =    //a[@id='button-Consultation-consulted']
${ConsultSaveBtn} =    //a[@id='Consultation-save-btn']
${SuccessAlert} =    //div[@class="alert-box success"]
${TableRec} =    //table/tbody/tr[1]/td[1]
${ConsultTime} =    //input[@id="ConsultationTime"]
${AuthDetails} =    //ul[@class='side-nav']//a[contains(text(),'Details')]
*** Keywords ***

Create BHOP Consultations
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    page should contain element    ${ClinicalReview}
    click element    ${ClinicalReview}
    page should contain   Authorization - Consultations
    click element    ${ConsultAddBrn}
    page should contain    Authorization - Add Consultation
    select from list by label    ${TypeCode}    Consultation
    select from list by label    ${ConsultRsn}    Acute Level of Care Appropriateness Discussion
    select from list by label    ${ConsultOutcome}    CM Leader Discussion
    click element    ${WhoConsultselect}
    input text    ${ConQueueName}    James Koeppel
    click element   ${QueueNameBtn}
    wait until page contains element    ${SelectName}
    click element    ${SelectName}
    click element    ${Consluted}
    click link    Save
    page should contain element    ${SuccessAlert}

Edit BHOP Consultations
    click element    ${TableRec}
    click link    Edit
    input text    ${ConsultTime}     11:30:30 AM
    click link    Save
    page should contain element    ${SuccessAlert}
    click element    ${AuthDetails}





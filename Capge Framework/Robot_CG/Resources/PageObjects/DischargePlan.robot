*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library  ../../CustomLibs/DataCreation.py
Library    String


*** Variables ***
${BHOPExistingAuth} =   //*[@id="MemberCentralAuth"]/div[2]/div[1]/table/tbody/tr[4]/td[4]
${DPSideBar} =    //ul[@class='side-nav']//a[contains(text(),'Discharge Plan')]
${AnticipatedDis} =    //select[@id='AnticipatedDischargeDisposition']
${LivingArrangements} =    //select[@id='LivingArrangements']
${Availability} =    //select[@id='AvailabilityOfSupport']
${AddDCMedication} =    //a[@id='medication-add-button']
${DCMedinput} =    //input[@id='MedicineSearch']
${DCMedSearch} =     //a[@id='MedicineSearchbtn']
${DCMedPicklist} =    //a[text()='Xanax']
${DcBrand} =    //label[@for='Xanax-brand']
${DCRoute} =    //select[@id='RouteCode']
${DCFrequency} =    //select[@id='Frequency']
${DCDosage} =     //input[@id='Dosage']
${DCSavebtn} =     //a[@id='button-save-medication']
${SelfCareAbility} =    //select[@id='SelfCareAbility']
${ActivityTolerance} =    //select[@id='ActivityTolerance']
${HealthRisks} =    //select[@id='HealthRisks']
${NutritionalStatus} =    //select[@id='NutritionalStatus']
${HealthCareBehaviors} =    //select[@id='HealthCareBehaviors']
${AnticipatClinical} =    //select[@id='AnticipatClinicalProgReferral']
${DCNotes} =    //textarea[@id='DischarePlanNotes']
${DCSuccessAlert} =    //div[@class="alert-box success"]
*** Keywords ***


Create BHOP Discharge Plan
    set selenium implicit wait    10 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    page should contain element    ${DPSideBar}
    click element    ${DPSideBar}
    page should contain    Add Discharge Plan
    select from list by label    ${AnticipatedDis}    Pending Clinical
    select from list by label    ${LivingArrangements}    Home
    select from list by label    ${Availability}     Assistance not required
    click element    ${AddDCMedication}
    wait until page contains    Add Medication
    input text    ${DCMedinput}    XAN
    sleep    1 Seconds
    click element    ${DCMedSearch}
    wait until page does not contain  //*[@id="loading-ajax"]
    click link    ${DCMedPicklist}
    wait until page does not contain  //*[@id="loading-ajax"]
    scroll element into view    ${DcBrand}
    click element    ${DcBrand}
    click link    Submit
    sleep    1 Second
    wait until page contains element    ${DCRoute}
    select from list by label    ${DCRoute}     Oral
    select from list by label    ${DCFrequency}   Daily
    input text    ${DCDosage}   3
    click element    ${DCSavebtn}
    page should contain element    ${SelfCareAbility}
    select from list by label    ${SelfCareAbility}    Information Not Available
    select from list by label    ${ActivityTolerance}   Independent in ambulation
    select from list by label    ${HealthRisks}   Smokes
    select from list by label    ${NutritionalStatus}   Adequate nutritional intake
    select from list by label    ${HealthCareBehaviors}   No issues
    select from list by label    ${AnticipatClinical}   Complex Care Management
    input text    ${DCNotes}    This is Automation Test
    click link    Save
    page should contain element    ${DCSuccessAlert}

Edit BHOP Discharge Plan
    page should contain    View Discharge Plan
    click link    Edit
    select from list by label    ${LivingArrangements}     Shelter
    click link    Save
    page should contain element    ${DCSuccessAlert}

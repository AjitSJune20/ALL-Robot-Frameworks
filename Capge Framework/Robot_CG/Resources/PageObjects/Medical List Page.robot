*** Settings ***
Library  SeleniumLibrary
Library  String
Library  DateTime
Resource  ../../Data/TestData.robot


*** Variables ***

${MedicationsLnk} =     //a[@id='Medications-tab']
${VaccinationsLnk} =     //a[@id='Vaccinations-tab']
${AllergiesLnk} =     //a[@id='Allergies-tab']
${InvalidText} =    Lorem ipsum 1234567890 ~!@$%^&*()-_=+[]\{}|;':,./< >?
${Char250} =    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${Char2500} =    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${AllergiesAdd_Btn} =   //a[@id='btnAddAllergy']
${AllergyName} =    //input[@id='AllergyName']
${AllergyFirstSymptomDate} =    //input[@id='FirstSymptomDate']
${AllergyPresentingSymptoms} =    //select[@id='PresentingSymptom']
${AllergyTreatmentInformation} =    //input[@id='TreatmentInformation']
${AllergyNotes} =    //textarea[@id='Notes']
${AllergySaveBtn} =    //a[@id='button-save-allergy']
${RcdSavedMsg} =
#${AllergyRcdSelect} =   //td[contains(text(),${UserData.AllergyName})]
${AllergyRcdEditBtn} =      //a[@id='edit-allergy']
${AllergyRcdInactivateBtn} =       //a[@id='inactivate']
${AllergyInactivateReason} =        //textarea[@id='InactivateReason']
${AllergySubmitBtn} =       //a[@id='submitButton']
${AllergyRcdInacivateMsg} =        //div[contains(text(),'Allergy details have been inactivated successfully')]


${VaccinationAdd_Btn} =   //a[@id='btnAddVaccination']
${VaccinationName} =    //select[@id='VaccinationName']
${VaccinationDosage} =    //input[@id='Dosage']
${VaccinationDate} =    //input[@id='VaccinationDate']
${VaccinationExpirationDate} =    //input[@id='ExpirationDate']
${VaccinationNotes} =    //textarea[@id='Notes']
${VaccinationSaveBtn} =    //a[@id='button-save-vaccination']
${VaccinationRcdSavedMsg} =        //div[contains(text(),'Vaccination details saved successfully.')]
#${VaccinationRcdSavedMsg} =        //div[contains(text(),'Vaccination details have been saved successfully.')]
#${VaccinationRcdSelect} =       //td[contains(text(),${UserData.VaccinationName})]
${VaccinationRcdEditBtn} =      //a[@id='button-edit-vaccination']
${VaccinationRcdInactivateBtn} =       //a[@id='button-inactive-vaccination']
${VaccinationInactivateReason} =        //textarea[@id='InactivateReason']
${VaccinationSubmitBtn} =       //a[@id='submitButton']
${VaccinationRcdInacivateMsg} =        //div[contains(text(),'Vaccination details have been inactivated successfully')]



${MedicationAdd_Btn} =   //a[@id='btnAddMedication']
${MedicineSearch} =    //input[@id='MedicineSearch']
${MedicineName} =    //input[@id='MedicineName']
${MedicationStartDate} =    //input[@id='StartDate']
${MedicationDosage} =    //input[@id='Dosage']
${MedicationFrequency} =    //input[@id='Frequency']
${MedicationPrescribed} =    //label[contains(text(),'Taken as prescribed?')]/following::label[contains(text(),'Yes')]
${MedicationPrescribedDoctor} =    //input[@id='PrescribingDoctor']
${MedicationOversightStrategy} =    //select[@id='MedicationAdministeredBy']
${MedicationPrescribedDoctor} =    //input[@id='PrescribingDoctor']
${MedicationRoute} =    //select[@id='RouteCode']
${MedicationNotes} =    //textarea[@id='Notes']
${MedicationSaveBtn} =    //a[@id='button-save-medication']
${MedicationRcdSavedMsg} =        //div[contains(text(),'Medication details saved successfully.')]
#${MedicationRcdSavedMsg} =        //div[contains(text(),'Medication details have been saved successfully.')]
#${MedicationRcdSelect} =       //td[contains(text(),${UserData.MedicineName})]
${MedicationRcdEditBtn} =      //a[@id='button-edit-medication']
${MedicationRcdInactivateBtn} =       //a[@id='button-inactive-medication']
${MedicationInactivateReason} =        //textarea[@id='InactivateReason']
${MedicationSubmitBtn} =       //a[@id='submitButton']
${MedicationRcdInacivateMsg} =        //div[contains(text(),'Medication details have been inactivated successfully')]


*** Keywords ***
Allergies Add Valid Save
    [Arguments]  ${UserData}
    click link      Allergies
    double click element       ${AllergiesAdd_Btn}
    set selenium implicit wait  5 Seconds
    input text      ${AllergyName}      ${UserData.AllergyName}
    ${Today} =      get current date    result_format=%m/%d/%Y
    input text      ${AllergyFirstSymptomDate}      ${Today}
    click element   //ul[@class='select2-selection__rendered']
    click element   //li[contains(text(),'${UserData.AllergyReactionList}')]
    input text      ${AllergyTreatmentInformation}      ${UserData.AllergyTreatmentInformation}
    input text      ${AllergyNotes}     THIS IS TEST
    click element       ${AllergySaveBtn}
    #page should contain element     ${RcdSavedMsg}

Medical List Allergies Edit
    [Arguments]  ${UserData}
    click element       //td[contains(text(),'${UserData.AllergyName}')]
    click element       ${AllergyRcdEditBtn}
    input text      ${AllergyTreatmentInformation}      ${UserData.AllergyTreatmentInformation}
    click element       ${AllergySaveBtn}


Medical List Allergies Edit Inactive Valid
    [Arguments]  ${UserData}
    click element       //td[contains(text(),'${UserData.AllergyName}')]
    click element       ${AllergyRcdInactivateBtn}
    input text      ${AllergyInactivateReason}      ${UserData.AllergyInactivateReason}
    click element       ${AllergySubmitBtn}
    page should contain element     ${AllergyRcdInacivateMsg}


Vaccinations Add Valid Save
    [Arguments]  ${UserData}
    click link      Vaccinations
    double click element       ${VaccinationAdd_Btn}
    click element       //span[@class='select2-selection select2-selection--single']
    click element   //li[contains(text(),'${UserData.VaccinationName}')]
    input text      ${VaccinationDosage}      ${UserData.VaccinationDosage}
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${Tomorrow} =      add time to date    ${Today}   1 days    result_format=%m/%d/%Y
    input text      ${VaccinationDate}      ${Today}
    input text      ${VaccinationExpirationDate}      ${Tomorrow}
    input text      ${VaccinationNotes}      ${UserData.VaccinationNotes}
    click element       ${VaccinationSaveBtn}
#    page should contain element     ${VaccinationRcdSavedMsg}

Medical List Vaccinations Edit
    [Arguments]  ${UserData}
    click element       //td[contains(text(),'${UserData.VaccinationName}')]
    click element       ${VaccinationRcdEditBtn}
    input text      ${VaccinationDosage}      ${UserData.VaccinationDosage}
    click element       ${VaccinationSaveBtn}


Medical List Vaccinations Edit Inactive Valid
    [Arguments]  ${UserData}
    click element       //td[contains(text(),'${UserData.VaccinationName}')]
    click element       ${VaccinationRcdInactivateBtn}
    input text      ${VaccinationInactivateReason}      ${UserData.VaccinationInactivateReason}
    click element       ${VaccinationSubmitBtn}
    page should contain element     ${VaccinationRcdInacivateMsg}



Medications Add Valid Save
    [Arguments]  ${UserData}
    click link      Medications
    double click element       ${MedicationAdd_Btn}
    input text      ${MedicineSearch}      ${UserData.MedicineSearch}
    input text      ${MedicineName}      ${UserData.MedicineName}
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${Tomorrow} =      add time to date    ${Today}   1 days    result_format=%m/%d/%Y
    input text      ${MedicationStartDate}      ${Today}
    input text      ${MedicationDosage}      ${UserData.MedicationDosage}
    input text      ${MedicationFrequency}      ${UserData.MedicationFrequency}
    click element       ${MedicationPrescribed}
    input text      ${MedicationPrescribedDoctor}     ${UserData.MedicationPrescribedDoctor}
    click element       //label[contains(text(),'Medication Oversight Strategy')]/following::span[@class='select2-selection select2-selection--single']
    click element       //li[contains(text(),'${UserData.MedicationOversightStrategy}')]
    click element       //label[contains(text(),'Route')]/following::span[@class='select2-selection select2-selection--single']
    click element       //li[contains(text(),'${UserData.MedicationRoute}')]
    input text      ${MedicationNotes}     ${UserData.MedicationNotes}
    click element       ${MedicationSaveBtn}
    page should contain element     ${MedicationRcdSavedMsg}

Medical List Medications Edit
    [Arguments]  ${UserData}
    click element       //td[contains(text(),'${UserData.MedicineName}')]
    click element       ${MedicationRcdEditBtn}
    input text      ${MedicationDosage}      ${UserData.MedicationDosage}
    click element       ${MedicationSaveBtn}


Medical List Medications Edit Inactive Valid
    [Arguments]  ${UserData}
    click element       //td[contains(text(),'${UserData.MedicineName}')]
    click element       ${MedicationRcdInactivateBtn}
    input text      ${MedicationInactivateReason}      ${UserData.MedicationInactivateReason}
    click element       ${MedicationSubmitBtn}
    page should contain element     ${MedicationRcdInacivateMsg}


Medical List Medications Edit Inactive Valid Required Field
    [Arguments]  ${UserData}
    click element       //td[contains(text(),'${UserData.MedicineName}')]
    click element       ${MedicationRcdInactivateBtn}
    click element       ${MedicationSubmitBtn}
    page should contain element     //span[@id='InactivateReason-error']
    click element       //u[contains(text(),'Cancel')]
    click element       //u[contains(text(),'Back')]

#***********************************************************************************************************************
#***********************************************************************************************************************

CoreUAT_Medical_LIst_Allergies_Add_Valid_Save_and_Add
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link      Allergies
    double click element       ${AllergiesAdd_Btn}
    set selenium implicit wait  5 Seconds
    input text      ${AllergyName}      ${UserData.AllergyName}
    ${Today} =      get current date    result_format=%m/%d/%Y
    input text      ${AllergyFirstSymptomDate}      ${Today}
    click element   //ul[@class='select2-selection__rendered']
    click element   //li[contains(text(),'${UserData.AllergyReactionList}')]
    input text      ${AllergyTreatmentInformation}      ${UserData.AllergyTreatmentInformation}
    input text      ${AllergyNotes}     THIS IS TEST
    click element       //a[@id='button-save-add-allergy']
    #page should contain element     ${RcdSavedMsg}
    sleep    5s


CoreUAT_Medical_LIst_Allergies_Add_Valid_Cancel
    [Arguments]  ${UserData}
    set selenium speed    1s
#    double click element       ${AllergiesAdd_Btn}
#    set selenium implicit wait  5 Seconds
    input text      ${AllergyName}      ${UserData.AllergyName}
    ${Today} =      get current date    result_format=%m/%d/%Y
    input text      ${AllergyFirstSymptomDate}      ${Today}
    click element   //ul[@class='select2-selection__rendered']
    click element   //li[contains(text(),'${UserData.AllergyReactionList}')]
    input text      ${AllergyTreatmentInformation}      ${UserData.AllergyTreatmentInformation}
    input text      ${AllergyNotes}     THIS IS TEST
    click element       //a[@id='button-save-add-allergy']
    click element       //u[contains(text(),'Cancel')]
    page should contain element    //h4[contains(text(),'Confirmation')]
    page should contain element    //div[contains(text(),'All unsaved changes will be lost. Are you sure you')]
    click element    //a[@id='button-cancel-changes-yes']
    page should contain element    //select[@id='AllergyCode']

CoreUAT_Medical_LIst_Allergies_Add_Valid_Max Length
    [Arguments]  ${UserData}
    double click element       ${AllergiesAdd_Btn}
    set selenium implicit wait  5 Seconds
    input text      ${AllergyName}      ${Char250}
    input text      ${AllergyTreatmentInformation}      ${Char250}
    input text      ${AllergyNotes}     ${Char2500}
    page should contain element    //span[contains(text(),'Allergy Name should not exceed 250 characters')]
    page should contain element    //span[contains(text(),'Treatment Information should not exceed 250 characters')]
    page should contain element    //span[contains(text(),'Notes should not exceed 2500 characters')]
    click element       //u[contains(text(),'Cancel')]
    click element    //a[@id='button-cancel-changes-yes']
    page should contain element    //select[@id='AllergyCode']

CoreUAT_Medical_LIst_Allergies_Add_Valid_NKA
    [Arguments]  ${UserData}
    set selenium speed    1s
    double click element       ${AllergiesAdd_Btn}
    set selenium implicit wait  5 Seconds
    click element    //label[@for='NoKnownAllergy' and @class='valueField']
    page should contain element    //input[@class='form-item input-validation-valid input-readonly']
    click element    //u[contains(text(),'Cancel')]
    click element    //a[@id='button-cancel-changes-yes']

CoreUAT_Medical_LIst_Allergies_Add_Valid_NKA1
    [Arguments]  ${UserData}
    set selenium speed    1s
    double click element       ${AllergiesAdd_Btn}
    set selenium implicit wait  5 Seconds
    click element    //label[@for='NoKnownAllergy' and @class='valueField']
    page should contain element    //input[@class='form-item input-validation-valid input-readonly']
    click element    //u[contains(text(),'Cancel')]
    click element    //a[@id='button-cancel-changes-yes']

CoreUAT_Medical_LIst_Allergies_Add_Invalid_Invalid Data
    [Arguments]  ${UserData}
    #set selenium speed    1s
    double click element       ${AllergiesAdd_Btn}
    set selenium implicit wait  5 Seconds
    input text      ${AllergyName}      ${InvalidText}
    ${Today} =      get current date    result_format=%m/%d/%Y
    input text      ${AllergyFirstSymptomDate}      ${Today}
    click element   //ul[@class='select2-selection__rendered']
    click element   //li[contains(text(),'Rash')]
    input text      ${AllergyTreatmentInformation}      ${InvalidText}
    input text      ${AllergyNotes}     ${InvalidText}
    click element       ${AllergySaveBtn}
    #page should contain element     ${RcdSavedMsg}

CoreUAT_Medical_LIst_Allergies_Edit_Inactive_Invalid
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //tbody/tr[1]/td[2]
    click element       ${AllergyRcdInactivateBtn}
    input text      ${AllergyInactivateReason}      ${InvalidText}
    click element       ${AllergySubmitBtn}
    page should contain element    //div[contains(text(),'Allergy details have been inactivated successfully')]


CoreUAT_Medical_LIst_Allergies_Edit_Inactive_Max Fields
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //tbody/tr[1]/td[2]
    click element       ${AllergyRcdInactivateBtn}
    input text      ${AllergyInactivateReason}      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    click element       //u[contains(text(),'Cancel')]

CoreUAT_Medical_LIst_Allergies_Edit_Inactive_Cancel
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       ${AllergyRcdInactivateBtn}
    input text      ${AllergyInactivateReason}      ${UserData.AllergyInactivateReason}
    click element       //u[contains(text(),'Cancel')]
    sleep    1s
    page should not contain element    ${AllergyInactivateReason}
    page should contain element    //h3[contains(text(),'View Allergy')]
    page should contain element    ${AllergyRcdInactivateBtn}

CoreUAT_Medical_LIst_Allergies_Edit_Inactive_Required Field
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //td[contains(text(),'${UserData.AllergyName}')]
    click element       ${AllergyRcdInactivateBtn}
    click element       ${AllergySubmitBtn}
    page should contain element    //span[contains(text(),'Inactive Reason is required')]
    click element       //u[contains(text(),'Cancel')]
    click element    //u[contains(text(),'Back')]
    page should contain element    //select[@id='AllergyCode']

CoreUAT_Medical_LIst_Allergies_Reorder      #Need to update
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Allergies
    Sleep   2s
    ${Before}    get text    //th[@class='k-header']/a/div
    drag and drop    //th[@class='k-header']/a/div[contains(text(),'Description')]    //th[@class='k-header']/a/div[contains(text(),'Created / Updated Date')]
    Sleep   2s
    ${After}    get text    //th[@class='k-header']/a/div
    should be equal as strings  ${Before}  Created / Updated Date
    should be equal as strings  ${After}  Description
    click element    //img[@alt='Reorder']
    ${ColName}    get text    //dl[@id='AllergyvisibleCol']/dd[1]/a
    should be equal as strings  ${ColName}  Description
    reload page


CoreUAT_Medical_List_Allergies_View_Active
    [Arguments]  ${UserData}
    set selenium speed    1s
    select from list by label    //select[@id='AllergyCode']    Active Allergies
    page should contain element    ${AllergiesAdd_Btn}

CoreUAT_Medical_LIst_Allergies_View_Inactive
    [Arguments]  ${UserData}
    set selenium speed    1s
    select from list by label    //select[@id='AllergyCode']    Inactive Allergies
    page should contain element    //th[@class='k-header'and @data-field='InactiveReason']

CoreUAT_Medical_LIst_Allergies_Add_Invalid_Required Fields
    [Arguments]  ${UserData}
    set selenium speed    1s
    double click element       ${AllergiesAdd_Btn}
    set selenium implicit wait  5 Second
    click element       ${AllergySaveBtn}
    page should contain element    //span[contains(text(),'Some errors occurred. Please see below for details')]
    page should contain element    //span[contains(text(),'Allergy Name is required')]
    page should contain element    //span[contains(text(),'Date of First Symptom is required')]
    page should contain element    //span[contains(text(),'Presenting Symptoms is required')]
    page should contain element    //span[contains(text(),'Allergy Name is required')]
    page should contain element    //span[contains(text(),'Allergy Name is required')]



CoreUAT_Medical_LIst_Medications_Add_Valid_Save Add
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link      Medications
    double click element       ${MedicationAdd_Btn}
    input text      ${MedicineSearch}      ${UserData.MedicineSearch}
    input text      ${MedicineName}      ${UserData.MedicineName}
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${Tomorrow} =        Add Time To Date  ${Today}    1 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    #${Tomorrow} =      add time to date    ${Today}   1 days    result_format=%m/%d/%Y
    input text      ${MedicationStartDate}      ${Today}
    input text      ${MedicationDosage}      ${UserData.MedicationDosage}
    input text      ${MedicationFrequency}      ${UserData.MedicationFrequency}
    click element       ${MedicationPrescribed}
    input text      ${MedicationPrescribedDoctor}     ${UserData.MedicationPrescribedDoctor}
    click element       //label[contains(text(),'Medication Oversight Strategy')]/following::span[@class='select2-selection select2-selection--single']
    click element       //li[contains(text(),'${UserData.MedicationOversightStrategy}')]
    click element       //label[contains(text(),'Route')]/following::span[@class='select2-selection select2-selection--single']
    click element       //li[contains(text(),'${UserData.MedicationRoute}')]
    input text      ${MedicationNotes}     ${UserData.MedicationNotes}
    click element       //a[@id='button-save-add-medication']
    page should contain element     ${MedicationRcdSavedMsg}
    click element    //u[contains(text(),'Cancel')]
    click element    //a[@id='button-cancel-changes-yes']

CoreUAT_Medical_LIst_Medications_Add_Valid_Cancel
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link      Medications
    double click element       ${MedicationAdd_Btn}
    input text      ${MedicineSearch}      ${UserData.MedicineSearch}
    input text      ${MedicineName}      ${UserData.MedicineName}
    ${Today} =      get current date    result_format=%m/%d/%Y
#    ${Tomorrow} =      add time to date    ${Today}   date_format=%m/%d/%Y    1 days    result_format=%m/%d/%Y
    ${Tomorrow} =        Add Time To Date  ${Today}    1 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text      ${MedicationStartDate}      ${Today}
    input text      ${MedicationDosage}      ${UserData.MedicationDosage}
    input text      ${MedicationFrequency}      ${UserData.MedicationFrequency}
    click element       ${MedicationPrescribed}
    input text      ${MedicationPrescribedDoctor}     ${UserData.MedicationPrescribedDoctor}
    click element       //label[contains(text(),'Medication Oversight Strategy')]/following::span[@class='select2-selection select2-selection--single']
    click element       //li[contains(text(),'${UserData.MedicationOversightStrategy}')]
    click element       //label[contains(text(),'Route')]/following::span[@class='select2-selection select2-selection--single']
    click element       //li[contains(text(),'${UserData.MedicationRoute}')]
    input text      ${MedicationNotes}     ${UserData.MedicationNotes}
    click element    //u[contains(text(),'Cancel')]
    page should contain element    //h4[contains(text(),'Confirmation')]
    page should contain element    //div[contains(text(),'All unsaved changes will be lost. Are you sure you')]
    click element    //a[@id='button-cancel-changes-yes']
    page should contain element    //select[@id='MedicationFilter']

CoreUAT_Medical_LIst_Medications_Add_Valid_Max Length
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link      Medications
    double click element       ${MedicationAdd_Btn}
    input text      ${MedicineSearch}      @@
    click element    ${MedicineName}
    page should contain element    //span[contains(text(),'Medicine Search must be between 3 and 20 characters')]
    clear element text    ${MedicineSearch}
    click element    ${MedicineName}
    input text      ${MedicineSearch}      @@@@@@@@@@@@@@@@@@@@@
    input text      ${MedicineName}      ${Char250}
    input text      ${MedicationDosage}      ${Char250}
    input text      ${MedicationFrequency}      ${Char250}
    input text      ${MedicationPrescribedDoctor}     ${Char250}
    input text      ${MedicationNotes}     ${Char2500}
    page should contain element    //span[contains(text(),'Medicine Search must be between 3 and 20 characters')]
    page should contain element    //span[contains(text(),'Medicine Name should not exceed 250 characters')]
    page should contain element    //span[contains(text(),'Dosage should not exceed 250 characters')]
    page should contain element    //span[contains(text(),'Frequency should not exceed 250 characters')]
    page should contain element    //span[contains(text(),'Prescribing Doctor should not exceed 250 characters')]
    page should contain element    //span[contains(text(),'Notes should not exceed 2500 characters')]
    reload page

CoreUAT_Medical_LIst_Medications_Add_Invalid_Invalid Data
    [Arguments]  ${UserData}
    set selenium speed    1s
    input text      ${MedicineSearch}      0~!$%^&*()-_=+./<>?
    input text      ${MedicationStartDate}      11/11/1111
    input text      //input[@id='EndDate']      11/11/1111
    input text      ${MedicationDosage}      ${InvalidText}
    input text      ${MedicineName}    ${InvalidText}
    input text      ${MedicationDosage}      ${InvalidText}
    input text      ${MedicationFrequency}      ${InvalidText}
    input text      ${MedicationPrescribedDoctor}     ${InvalidText}
    input text      ${MedicationNotes}     ${InvalidText}
    page should contain element    //span[@id='StartDate-error' and contains(text(),'Please enter a valid date')]
    page should contain element    //span[@id='EndDate-error' and contains(text(),'Please enter a valid date')]
    reload page

CoreUAT_Medical_LIst_Medications_Add_Invalid_Required Fields  #CHK AGAIN
    [Arguments]  ${UserData}
    set selenium speed    1s
    input text      ${MedicineName}    ${InvalidText}
    click element       ${MedicationSaveBtn}
    page should contain element     ${MedicationRcdSavedMsg}

CoreUAT_Medical_LIst_Medications_Edit_Inactivate_Valid_Max Length
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //td[contains(text(),'${UserData.MedicineName}')]
    click element       ${MedicationRcdInactivateBtn}
    input text      ${MedicationInactivateReason}      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    page should contain element    //span[contains(text(),'Inactive Reason should not exceed 100 characters')]
    reload page

CoreUAT_Medical_LIst_Medications_Edit_Inactivate_Valid_Cancel
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //td[contains(text(),'${UserData.MedicineName}')]
    click element       ${MedicationRcdInactivateBtn}
    input text      ${MedicationInactivateReason}    ${UserData.MedicationInactivateReason}
    click element    //u[contains(text(),'Cancel')]
    page should contain element    //h3[contains(text(),'View Medication')]
    page should contain element    //a[@id='button-edit-medication']
    click element    //u[contains(text(),'Back')]
CoreUAT_Medical_LIst_Medications_Edit_Inactivate_Invalid_Invalid Data
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //td[contains(text(),'${UserData.MedicineName}')]
    click element       ${MedicationRcdInactivateBtn}
    input text      ${MedicationInactivateReason}    ${InvalidText}
    click element    ${MedicationSubmitBtn}
    page should contain element    //div[contains(text(),'Medication details have been inactivated successfully')]

CoreUAT_Medical_LIst_Medications_Reorder
    [Arguments]  ${UserData}
    Sleep   3s
    set selenium speed    1s
    ${Before}    get text    //th[@class='k-header']/a/div
    drag and drop    //th[@class='k-header'and @data-field='Description']    //th[@class='k-header'and @data-field='CreatedOrUpdatedDate']
    Sleep   3s
    ${After}    get text    //th[@class='k-header']/a/div
    should be equal as strings  ${Before}  Created / Updated Date
    should be equal as strings  ${After}  Description
    click element    //img[@alt='Reorder']
    ${ColName}    get text    //dl[@id='MemberMedicationvisibleCol']/dd[1]/a
    should be equal as strings  ${ColName}  Description
    ${ColName}    get text    //dl[@id='MemberMedicationvisibleCol']/dd[2]/a
    should be equal as strings  ${ColName}  Created / Updated Date
    reload page
    click link      Medications

CoreUAT_Medical_LIst_Medications_View_Active
    [Arguments]  ${UserData}
    set selenium speed    1s
    select from list by label    //select[@id='MedicationFilter']    Active Medications
    page should contain element    ${MedicationAdd_Btn}

CoreUAT_Medical_LIst_Medications_View_Inactive
    [Arguments]  ${UserData}
    set selenium speed    1s
    select from list by label    //select[@id='MedicationFilter']    Inactive Medications
    page should contain element    //th[@class='k-header'and @data-field='InactiveReason']
    reload page
    click link      Medications

CoreUAT_Medical_LIst_Medications_Add_Valid_No Current Medications
    [Arguments]  ${UserData}
    set selenium speed    1s
    double click element    ${MedicationAdd_Btn}
    click element       //label[@class='valueField' and @for='NoCurrentMedications']
    click element       ${MedicationSaveBtn}
    page should contain element     ${MedicationRcdSavedMsg}


#*******************************************************************

CoreUAT_Medical_LIst_Vaccinations_Edit_Inactive_Valid_Save
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //td[contains(text(),'${UserData.VaccinationName}')]
    click element       ${VaccinationRcdInactivateBtn}
    input text      ${VaccinationInactivateReason}      ${UserData.VaccinationInactivateReason}
    click element       ${VaccinationSubmitBtn}
    page should contain element     ${VaccinationRcdInacivateMsg}

CoreUAT_Medical_LIst_Vaccinations_Add_Valid_Save
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link      Vaccinations
    double click element       ${VaccinationAdd_Btn}
    click element       //span[@class='select2-selection select2-selection--single']
    click element   //li[contains(text(),'${UserData.VaccinationName}')]
    input text      ${VaccinationDosage}      ${UserData.VaccinationDosage}
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${Tomorrow} =      add time to date    ${Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text      ${VaccinationDate}      ${Today}
    input text      ${VaccinationExpirationDate}      ${Tomorrow}
    input text      ${VaccinationNotes}      ${UserData.VaccinationNotes}
    click element       ${VaccinationSaveBtn}
#    page should contain element     ${VaccinationRcdSavedMsg}

CoreUAT_Medical_LIst_Vaccinations_Add_Valid_Save Add
    [Arguments]  ${UserData}
    set selenium speed    1s
    double click element       ${VaccinationAdd_Btn}
    click element       //span[@class='select2-selection select2-selection--single']
    click element   //li[contains(text(),'${UserData.VaccinationName}')]
    input text      ${VaccinationDosage}      ${UserData.VaccinationDosage}
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${Tomorrow} =      add time to date    ${Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text      ${VaccinationDate}      ${Today}
    input text      ${VaccinationExpirationDate}      ${Tomorrow}
    input text      ${VaccinationNotes}      ${UserData.VaccinationNotes}
    click element       //a[@id='button-save-add-vaccination']
    page should contain element     //div[contains(text(),'Vaccination details saved successfully.')]

CoreUAT_Medical_LIst_Vaccinations_Add_Valid_Cancel
    [Arguments]  ${UserData}
    set selenium speed    1s
    double click element       ${VaccinationAdd_Btn}
    click element       //span[@class='select2-selection select2-selection--single']
    click element   //li[contains(text(),'${UserData.VaccinationName}')]
    input text      ${VaccinationDosage}      ${UserData.VaccinationDosage}
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${Tomorrow} =      add time to date    ${Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text      ${VaccinationDate}      ${Today}
    input text      ${VaccinationExpirationDate}      ${Tomorrow}
    input text      ${VaccinationNotes}      ${UserData.VaccinationNotes}
    click element    //u[contains(text(),'Cancel')]
    page should contain element    //h4[contains(text(),'Confirmation')]
    page should contain element    //div[contains(text(),'All unsaved changes will be lost. Are you sure you')]
    click element    //a[@id='button-cancel-changes-yes']

CoreUAT_Medical_LIst_Vaccinations_Add_Valid_Max Length
    [Arguments]  ${UserData}
    set selenium speed    1s
    double click element       ${VaccinationAdd_Btn}
    click element       //span[@class='select2-selection select2-selection--single']
    input text      ${VaccinationDosage}      ${Char250}
    input text      ${VaccinationNotes}      ${Char2500}
    page should contain element    //span[contains(text(),'Dosage should not exceed 250 characters')]
    page should contain element    //span[contains(text(),'Notes should not exceed 2500 characters')]
    reload page

CoreUAT_Medical_LIst_Vaccinations_Add_Valid_Vaccination Date Unknown
    [Arguments]  ${UserData}
    set selenium speed    1s
   # double click element       ${VaccinationAdd_Btn}
    click element    //label[@for='VaccinationDateChecked']
    click element    //label[@for='ExpirationDateChecked']
    page should contain element    //span[@class='k-picker-wrap k-state-disabled']/input[@id='VaccinationDate']
    page should contain element    //span[@class='k-picker-wrap k-state-disabled']/input[@id='ExpirationDate']
    reload page

CoreUAT_Medical_LIst_Vaccinations_Add_Invalid_Invalid Data
    [Arguments]  ${UserData}
    set selenium speed    1s
#    click link      Vaccinations
#    double click element       ${VaccinationAdd_Btn}
    input text      ${VaccinationDosage}     ${InvalidText}
    input text      ${VaccinationDate}      11/11/1111
    input text      ${VaccinationExpirationDate}      11/11/1111
    input text      ${VaccinationNotes}      ${InvalidText}
    page should contain element    //span[@id='VaccinationDate-error' and contains(text(),'Please enter a valid date')]
    page should contain element    //span[@id='ExpirationDate-error' and contains(text(),'Please enter a valid date')]
    reload page

CoreUAT_Medical_LIst_Vaccinations_Add_Invalid_Required Field
    [Arguments]  ${UserData}
    set selenium speed    1s
#    click link      Vaccinations
#    double click element       ${VaccinationAdd_Btn}
    click element       //span[@class='select2-selection select2-selection--single']
    click element   //li[contains(text(),'${UserData.VaccinationName}')]
    input text      ${VaccinationDosage}      ${UserData.VaccinationDosage}
    ${Today} =      get current date    result_format=%m/%d/%Y
    ${Tomorrow} =      add time to date    ${Today}   1 days    date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text      ${VaccinationDate}      ${Today}
    input text      ${VaccinationExpirationDate}      ${Tomorrow}
    input text      ${VaccinationNotes}      ${UserData.VaccinationNotes}
    click element    //u[contains(text(),'Back')]

CoreUAT_Medical_LIst_Vaccinations_Edit_Inactive_Valid_Cancel
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //td[contains(text(),'${UserData.VaccinationName}')]
    click element       ${VaccinationRcdInactivateBtn}
    input text      ${VaccinationInactivateReason}      ${UserData.VaccinationInactivateReason}
    click element    //u[contains(text(),'Cancel')]
    page should contain element    //h3[contains(text(),'View Vaccination')]
    page should contain element    ${VaccinationRcdInactivateBtn}

CoreUAT_Medical_LIst_Vaccinations_Edit_Inactive_Valid_Max Length
    [Arguments]  ${UserData}
    set selenium speed    1s
    #click element       //td[contains(text(),'${UserData.VaccinationName}')]
    click element       ${VaccinationRcdInactivateBtn}
    input text      ${VaccinationInactivateReason}      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    page should contain element    //span[contains(text(),'Inactive Reason should not exceed 100 characters')]
    reload page


CoreUAT_Medical_LIst_Vaccinations_Edit_Inactive_Invalid_Invalid Data
    [Arguments]  ${UserData}

    click link      Vaccinations

    set selenium speed    1s
    click element       //td[contains(text(),'Diptheria')]
    click element       ${VaccinationRcdInactivateBtn}
    input text      ${VaccinationInactivateReason}    ${InvalidText}
    click element    //a[@id='submitButton']
    page should contain element    //div[contains(text(),'Vaccination details have been inactivated successf')]


CoreUAT_Medical_LIst_Vaccinations_Edit_Inactive_Invalid_Required Field
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element       //td[contains(text(),'Tetanus')]
    click element       ${VaccinationRcdInactivateBtn}
    click element    ${VaccinationSubmitBtn}
    page should contain element    //span[contains(text(),'Inactive Reason is required')]
    click element    //u[contains(text(),'Cancel')]
    click element    //u[contains(text(),'Back')]

CoreUAT_Medical_LIst_Vaccinations_Reorder
    [Arguments]  ${UserData}
    set selenium speed    1s
    Sleep   2s
    ${Before}    get text    //div[@id='Vaccination-gridContent']//th[@class='k-header']/a/div
    drag and drop    //div[@id='Vaccination-gridContent']//th[@class='k-header'and @data-field='Description']    //div[@id='Vaccination-gridContent']//th[@class='k-header'and @data-field='CreatedOrUpdatedDate']
    Sleep   2s
    ${After}    get text    //div[@id='Vaccination-gridContent']//th[@class='k-header']/a/div
    should be equal as strings  ${Before}  Created / Updated Date
    should be equal as strings  ${After}  Description
    click element    //img[@alt='Reorder']
    ${ColName}    get text    //dl[@id='VaccinationvisibleCol']/dd[1]/a
    should be equal as strings  ${ColName}  Description
    ${ColName2}    get text    //dl[@id='VaccinationvisibleCol']/dd[2]/a
    should be equal as strings  ${ColName2}  Created / Updated Date
    reload page
    click link      Vaccinations

CoreUAT_Medical_LIst_Vaccinations_View_Active
    [Arguments]  ${UserData}
    set selenium speed    1s
    select from list by label    //select[@id='VaccinationFilter']    Active Vaccinations
    page should contain element    ${AllergiesAdd_Btn}

CoreUAT_Medical_LIst_Vaccinations_View_Inactive
    [Arguments]  ${UserData}
    set selenium speed    1s
    select from list by label    //select[@id='VaccinationFilter']    Inactive Vaccinations
    page should contain element    //th[@class='k-header'and @data-field='InactiveReason']
    reload page
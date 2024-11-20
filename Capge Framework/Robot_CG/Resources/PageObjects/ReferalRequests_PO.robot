*** Settings ***
Documentation  This script is used to Ref
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime

Resource  ../Definitions/HumanaGui.robot

*** Variables ***
${Create_RR} =    //a[@class="button" and contains(text(),'Create')]
${HAH_Prgm} =    //div[@class="infoText membermovementMenu"]//*[text()='Humana at Home Program']
${Referal_Src} =    //select[@name="ControlId1401"]
${Population_referedTo} =    //select[@name="ControlId1390"]
${Memberqualify} =    //select[@name="ControlId1391"]
${Conditions_RR} =    //*[@id="ControlId1392-1"]//*[text()='CHF']
${CriteriaC} =    //label[@for="ControlId1405-radio-138-N"]
${btn_Cancel_RR} =    //a[@id="button-submit-hah-cancel"]
${btn_Yes_RR} =    //a[@id="button-cancel-changes-yes"]
${btn_Submit_RR} =    //a[@id="button-submit-hah-create"]
${Char101} =    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${RR_Caregiver} =    //input[@id="ControlId1438"]
${RR_Cognitive} =    //input[@id="ControlId1439"]
${RR_Depression} =    //input[@id="ControlId1440"]

${RR_EOLDetails} =    //input[@id="ControlId1441"]
${RR_FallRiskDetails} =    //input[@id="ControlId1442"]
${RR_FinancialDetails} =    //input[@id="ControlId1443"]
${RR_FunctionalDetails} =    //input[@id="ControlId1444"]
${RR_HealthLiteracy} =    //input[@id="ControlId1445"]
${RR_Home_Safety} =    //input[@id="ControlId1446"]
${RR_Medication} =    //input[@id="ControlId1447"]
${RR_MentalHealth} =    //input[@id="ControlId1448"]
${RR_Nutrition} =    //input[@id="ControlId1449"]
${RR_SafetyCare} =    //input[@id="ControlId1450"]
${RR_OtherDetails} =    //input[@id="ControlId1451"]
${RR_Comments} =    //textarea[@id="ControlId1421"]
${changeQueue_btn} =    //a[@id="PrimaryOwner-change-ownership"]
${search_QueueName} =    //input[@id="QueueName"]

*** Keywords ***

Jump to Home of Referal Request HAH
    sleep    2s
    click element    ${btn_Cancel_RR}
    wait until element is visible    //*[text()='Confirmation']    10s
    click element    ${btn_Yes_RR}

Submit values upto Conditions
    [Arguments]    ${UserData}
    click link    ${Create_RR}
    wait until element is visible    //*[text()='Humana at Home Program']
    click link    ${HAH_Prgm}
    wait until element is visible    //*[text()='Referral Source']    10s
    sleep    1s
    select from list by label    name:ControlId1401    ${UserData.Referal_Src}
#    select from list by label    ${Referal_Src}    ${UserData.Referal_Src}
    select from list by label    ${Population_referedTo}    ${UserData.Population_referedTo}
    select from list by label    ${Memberqualify}    ${UserData.Memberqualify}
    wait until page contains element    //*[text()='Criteria']
    click element    ${Conditions_RR}


ReferalRequest_Valid_Cancel
    [Arguments]    ${UserData}
#    Navigate To Role
#    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    sleep    3s
    Navigate to Referral Request
    Submit values upto Conditions   ${UserData}
    click element    ${CriteriaC}
    Jump to Home of Referal Request HAH
    set selenium implicit wait  5 Seconds
    ${chk_Status_RR} =    run keyword and return status    page should contain element  //h3[text()='Referral Request']
    run keyword if    ${chk_Status_RR}    log to console    "Test Case for Valid Cancel is Passed"

ReferalRequest_Invalid_RequiredFields
    [Arguments]    ${UserData}
#    Navigate To Role
#    Applying the Role   ${UserData}
#    Search For Member   ${UserData}
#    Select The Member
#    Navigate to Referral Request
    click link    ${Create_RR}
    wait until element is visible    //*[text()='Humana at Home Program']
    click link    ${HAH_Prgm}
    wait until element is visible    //*[text()='Referral Source']    10s
    click element    ${btn_Submit_RR}
    element should be visible    //*[@id="ControlId1401-error" and text()='Referral Source is required']
    element should be visible    //*[@id="ControlId1390-error" and text()='Population Referred To is required']
    Jump to Home of Referal Request HAH

RR_MemberQuality_Invalid_RequiredFields
    [Arguments]    ${UserData}
    Submit values upto Conditions   ${UserData}
    sleep    1s
    click element    ${Conditions_RR}
    sleep    2s
    click element    ${btn_Submit_RR}
    element should be visible    //span[@for='ControlId1392' and text()='Conditions is required']
    element should be visible    //span[@class='field-validation-error' and contains(text(),'Has the member been newly diagnosed with')]
    sleep    2s
    select from list by label    ${Memberqualify}    ${UserData.Memberqualify_1}
    sleep    1s
    click element    ${btn_Submit_RR}
    element should be visible    //span[@class="field-validation-error" and contains(text(),'Inpatient Admissions within the last 3 months, or two or more')]
    element should be visible    //span[@class="field-validation-error" and contains(text(),'Two or more Emergency Department visits')]
    element should be visible    //span[@class='field-validation-error' and contains(text(),'Has the member been newly diagnosed with')]
    Jump to Home of Referal Request HAH

RR_MemberQuality_Valid_MaxLength
    [Arguments]    ${UserData}
    Submit values upto Conditions   ${UserData}
    sleep    1s
    input text      ${RR_Caregiver}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Caregiver Details should not exceed 100 characters')]

    input text    ${RR_Cognitive}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Cognitive Details should not exceed 100 characters')]

    input text    ${RR_Depression}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Depression Details should not exceed 100 characters')]

    input text    ${RR_EOLDetails}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'EOL Details should not exceed 100 characters')]

    input text    ${RR_FallRiskDetails}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Fall Risk Details')]

    input text    ${RR_FinancialDetails}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Financial Details should not exceed 100 characters')]

    input text    ${RR_FunctionalDetails}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Function Details should not exceed 100 characters')]

    input text    ${RR_HealthLiteracy}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Health Literacy Health Education Details should not exceed 100 characters')]

    input text    ${RR_Home_Safety}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Home Safety Details should not exceed 100 characters')]

    input text    ${RR_Medication}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Medication Details should not exceed 100 characters')]

    input text    ${RR_MentalHealth}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Mental Health Details should not exceed 100 characters')]

    input text    ${RR_Nutrition}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Nutrition Details')]

    input text    ${RR_SafetyCare}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Self Care Management Details should not exceed 100 characters')]

    input text    ${RR_OtherDetails}    ${Char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Other Details should not exceed 100 characters')]

    input text   ${RR_Comments}      ${Char101}${Char101}${Char101}${Char101}${Char101}${Char101}${Char101}${Char101}${Char101}${Char101}
    page should contain element    //span[contains(text(),'Additional Comments should not exceed 1000 characters')]
    Jump to Home of Referal Request HAH

RR_MemberQuality_Valid_QueueChange
    [Arguments]    ${UserData}
    Submit values upto Conditions   ${UserData}
    sleep    1s
    scroll element into view    //label[text()='Queue']
    ${PrimaryQueueOwner} =    get text    //div[@id="PrimaryOwner_QueueName"]
    ${PrimaryQueueOwner} =    strip string    ${PrimaryQueueOwner}    mode=both
    log to console    ${PrimaryQueueOwner}
    click element    ${changeQueue_btn}
    wait until element is visible    //label[text()='Search by Name']
    input text    ${search_QueueName}    Koeppel
    click link    Find
    sleep    3s
    #select checkbox    id:0-QueueSearchGrid-checkbox
    click element    //td[@class=" checkboxColumn checkboxCell "]     #//input[@id="0-QueueSearchGrid-checkbox"]
    click link    Select
    scroll element into view    //label[text()='Queue']
    ${ChangedQueueOwner} =    get text    //div[@id="PrimaryOwner_QueueName"]
    ${ChangedQueueOwner} =    strip string    ${ChangedQueueOwner}    mode=both
    log to console    ${ChangedQueueOwner}
    should not be equal as strings    ${PrimaryQueueOwner}    ${ChangedQueueOwner}
    Jump to Home of Referal Request HAH

RR_MemberQuality_Valid_Create
    [Arguments]    ${UserData}
    Submit values upto Conditions   ${UserData}
    click element    ${CriteriaC}
    sleep    2s
    click element    ${btn_Submit_RR}
    page should contain element    //*[contains(text(),'Referral request details have been created successfully')]

*** Variables ***
${Transitions_Link} =    //div[@class="infoText membermovementMenu"]//*[text()='Transitions']
${Trans_Room} =    //input[@id="Room"]
${Trans_HospName} =    //input[@id="HospitalName"]
${Trans_OtherDiagnosis} =    //textarea[@id="OtherDiagnosis"]
${Trans_PCPName} =    //input[@id="PCPName"]
${Trans_FName1} =    //input[@id="ControlId1361"]
${Trans_LName1} =    //input[@id="ControlId1362"]
${Trans_Relationship1} =    //input[@id="ControlId1363"]
${Trans_FName2} =    //input[@id="ControlId1366"]
${Trans_LName2} =    //input[@id="ControlId1367"]
${Trans_Relationship2} =    //input[@id="ControlId1368"]
${Trans_SpecialInstruction} =    //textarea[@id="ControlId1375"]

*** Keywords ***
Jump to Home of Referal Request Transactions
    sleep    2s
    click element    //a[@id="button-cancel-referral-transitions"]
    wait until element is visible    //*[text()='Confirmation']    10s
    click link    Yes

Transitions_Invalid_RequiredFields
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to Referral Request
    click link    ${Create_RR}
    wait until element is visible    //*[text()='Transitions']
    click link    ${Transitions_Link}
    wait until element is visible    //*[text()='Referral Source']    10s
    click link    Submit
    element should be visible    //*[@id="ReferralSourceCode-error" and text()='Referral Source is required']
    element should be visible    //*[text()='Authorization Id is required']
    element should be visible    //span[@id="HospitalName-error" and text()='Hospital Name is required']
    element should be visible    //span[@id="RequestingUserPhoneNumber-error" and text()='Phone number is required']
    element should be visible    //span[@id="RequestingUserExtension-error" and text()='Extension is required']
    Jump to Home of Referal Request Transactions

Transitions_Valid_MaxLength
    [Arguments]    ${UserData}
    click link    ${Create_RR}
    wait until element is visible    //*[text()='Transitions']
    click link    ${Transitions_Link}
    wait until element is visible    //*[text()='Referral Source']    10s

    input text    ${Trans_Room}    @@@@@@@@@
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Room should not exceed 8 characters')]

    input text    ${Trans_HospName}    ${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Hospital Name should not exceed 50 characters')]

    input text    ${Trans_OtherDiagnosis}    ${char101}${char101}${char101}${char101}${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'should not exceed 500 characters')]

    input text   ${Trans_PCPName}    ${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Name should not exceed 100 characters')]

    input text   ${Trans_FName1}    ${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'First Name should not exceed 20 characters')]

    input text   ${Trans_LName1}    ${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Last Name should not exceed 25 characters')]

    input text   ${Trans_Relationship1}    ${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Relationship should not exceed 30 characters')]

    input text   ${Trans_FName2}    ${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'First Name should not exceed 20 characters')]

    input text   ${Trans_LName2}    ${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Last Name should not exceed 25 characters')]

    input text   ${Trans_Relationship2}    ${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Relationship should not exceed 30 characters')]

    input text   ${Trans_SpecialInstruction}    ${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}${char101}
    press keys    None    TAB
    page should contain element    //span[contains(text(),'Special Instructions should not exceed 2500 characters')]
    Jump to Home of Referal Request Transactions
*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library  ../../CustomLibs/DataCreation.py
Library    String



###################################### Auth Clinical Review    ########################################################
*** Variables ***
${Review} =    //ul[@class='side-nav']//a[contains(text(),'Clinical Review')]
${AuthDetails} =    //ul[@class='side-nav']//a[contains(text(),'Details')]
${ReviewName} =    //input[@id='Name']
${ReviewNumber} =    //input[@id='PhoneNumber']
${RAddBtn} =    //a[@id='create-clinicalreview']
${ReadRep} =    //label[@for='IsFacilityRepresentative']
${CriteriaCon} =    //select[@id='CriteriaConsideredCode']
${AppCriteria} =    //textarea[@id='AppCriteria']
${PProblem} =    //textarea[@id='PresentingProblem']
${RedFlag} =    //select[@id='RedFlagList']
${AddMed} =    //a[@id='medication-add-button']
${MedSearch} =    //input[@id='MedicineSearch']
${MedSearchBtn} =    //a[@id='MedicineSearchbtn']
${Brand} =    //label[@for='Xanax-brand']
${PickList} =    //a[contains(text(),'Xanax')]
${MedName} =    //input[@id='MedicineName']
${AddPrev} =    //a[@id="previous-treatment-add-button"]
${CRSaveBtn} =    //a[@id="button-save-medication"]
${PreviousTreat} =    //select[@id='PreviousTreatmentCode']
${PTSaveBtn} =    //a[@id='savePreviousTreatment']
${InfoReceived} =    //div[@id='IsSufficientInformationReceivedCode']
${ClinicalDate} =    //input[@id='ClinicalDate']
${ClinicalTime} =    //input[@id='ClinicalTime']
${PhysName} =    //input[@id='AttendingPhysicianName']
${Symptoms} =    //select[@id='Symptoms']
${TreatDays} =    //select[@id='TreatmentDays']
${Network} =    //label[@for='MemberSupportNetworkEffectiveness-radio-172-4']
${PrimaryStress} =    //select[@id='PrimaryStressors']
${EatDisorder} =    //div[@id='MemberEatingDisorder']
${ClinicalSave} =    //a[@id='bhClinicalreview-save-btn']
${BHOPExistingAuth} =   //*[@id="MemberCentralAuth"]/div[2]/div[1]/table/tbody/tr[4]/td[4]

*** Keywords ***
Create Clinical Review
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${Review}
    wait until page contains    Authorization - Clinical Review
    click element    ${RAddBtn}
    wait until page contains    Authorization - Add Clinical Review
    click element    ${ReadRep}
    input text    ${ReviewName}     Tester
    input text    ${ReviewNumber}    555-121-1234
    select from list by label    ${CriteriaCon}    MCG
    input text    ${AppCriteria}    This is Test
    input text    ${PProblem}    This is Auto Test
    select from list by label    ${RedFlag}    No
    click element    ${AddMed}
    wait until page contains    Add Medication
    input text    ${MedSearch}    XAN
    wait until element is enabled    ${MedSearchBtn}
    sleep    1 Seconds
    click element    ${MedSearchBtn}
    wait until page does not contain  //*[@id="loading-ajax"]
    click link    ${PickList}
    scroll element into view    ${Brand}
    click element    ${Brand}
    click link    Submit
    wait until page contains    Add Medication
    click element    ${CRSaveBtn}
    wait until page contains element    ${AddPrev}
    scroll element into view    ${AddPrev}
    click element    ${AddPrev}
    sleep    2 Seconds
    wait until page contains element    ${PreviousTreat}
    select from list by label    ${PreviousTreat}    Inpatient Psychiatric
    click element    ${PTSaveBtn}
    wait until page does not contain  //*[@id="loading-ajax"]
    scroll element into view    ${InfoReceived}//label[contains(text(),'Yes')]
    click element    ${InfoReceived}//label[contains(text(),'Yes')]
    input text    ${ClinicalDate}    ${UserData.Date}
    input text    ${ClinicalTime}    ${UserData.Time}
    input text    ${PhysName}   Dr. Doolittle
    select from list by label    ${Symptoms}    Angry
    select from list by label    ${TreatDays}    Tuesday
    click element    ${Network}
    select from list by label    ${PrimaryStress}    Economic Problems
    click element    ${EatDisorder}//label[contains(text(),'No')]
    click element    ${ClinicalSave}


*** Variables ***
${MemberCondition} =    //div[@id='MemberCondition']//label[contains(text(),'Short Term')]
${Frequency} =    //select[@id='VisitFrequency']
${MemComplaint} =    //div[@id='MemberCompliantWithTreatment']//label[contains(text(),'Yes')]
${HomeWork} =    //div[@id='MemberCompletedHomework']//label[contains(text(),'Yes')]
${MemTreat} =    //select[@id='WhyMemberRequireTreatment']
${SupportSys} =     //select[@id='MemberSupportSystem']
${SysInvolve} =    //select[@id='SupportSystemInvolvement']
${FollowupSession} =    //input[@id='FollowUpSessionGoals']
${DecreaseSession} =    //input[@id='PlanToDecreaseSessions']
${AdvTherapy} =    //select[@id='ObstaclesToAdvancementOfTherapy']
${SeriousIll} =    //select[@id='MembersWithSeriousIllness']
${RoutTreat} =    //select[@id='AdditionToRoutineTreatment']
${MemRate} =    //select[@id='MemberProgressRate']
${BHEatingDisorder} =    //div[@id='MemberEatingDisorder']//label[contains(text(),'No')]




*** Keywords ***

Create BHOP Clinical Review
    [Arguments]    ${UserData}
    set selenium implicit wait    10 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${Review}
    wait until page contains    Authorization - Clinical Review
    click element    ${RAddBtn}
    wait until page contains    Authorization - Add Clinical Review
    click element    ${ReadRep}
    input text    ${ReviewName}     Tester
    input text    ${ReviewNumber}    555-121-1234
    select from list by label    ${CriteriaCon}    MCG
    input text    ${AppCriteria}    This is Test
    input text    ${PProblem}    This is Auto Test
    select from list by label    ${RedFlag}    No
    click element    ${AddMed}
    wait until page contains    Add Medication
    input text    ${MedSearch}    XAN
    wait until element is enabled    ${MedSearchBtn}
    sleep    1 Seconds
    click element    ${MedSearchBtn}
    click element    ${MedSearchBtn}
    wait until page does not contain  //*[@id="loading-ajax"]    3 Seconds
    wait until element is enabled    ${PickList}
    click link    ${PickList}
    scroll element into view    ${Brand}
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${Brand}
    click link    Submit
    wait until page contains    Add Medication
    click element    ${CRSaveBtn}
    wait until page contains element    ${AddPrev}
    scroll element into view    ${AddPrev}
    click element    ${AddPrev}
    sleep    2 Seconds
    wait until page contains element    ${PreviousTreat}
    select from list by label    ${PreviousTreat}    Inpatient Psychiatric
    click element    ${PTSaveBtn}
    wait until page does not contain  //*[@id="loading-ajax"]
    scroll element into view    ${InfoReceived}//label[contains(text(),'Yes')]
    click element    ${InfoReceived}//label[contains(text(),'Yes')]
    input text    ${ClinicalDate}    ${UserData.ReferralDate}
    input text    ${ClinicalTime}    ${UserData.ReferralTime}
    click element    ${MemberCondition}
    select from list by label    ${Frequency}    One time per month
    click element    ${MemComplaint}
    click element    ${homework}
    select from list by label    ${MemTreat}     Member’s symptoms are not resolved
    select from list by label    ${SupportSys}    Spouse
    select from list by label    ${SysInvolve}    Participating in family therapy
    input text    ${FollowupSession}    Testing
    input text    ${DecreaseSession}    Test Regular Session
    select from list by label  ${AdvTherapy}    Poor Family Support
    select from list by label  ${SeriousIll}    Psychiatric evaluation
    select from list by label  ${RoutTreat}    Support Group
    select from list by label  ${MemRate}    Improving
    click element    ${BHEatingDisorder}
    click element    ${ClinicalSave}
    click element    ${AuthDetails}










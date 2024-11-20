*** Settings ***
Library  SeleniumLibrary
Library  String
#Resource  ../../Data/TestData.robot
#Resource    ../
Resource  ../Definitions/HumanaGui.robot
Resource  ../PageObjects/IL_Assessment_HCBS.robot


*** Variables ***
#Demographic
${Q1_input} =  //input[@id="DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q3a"]
${PhoneNumberExtension}=  //input[@id="DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q3b"]
${Q2}=  xpath://input[@id="DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q4"]   #already filled
${Q3}=  name:DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q6
${Q4}=  name:DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q7
${Q5}=  DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q7b   #name of radio
${NameOfFacility}=  xpath://input[@id="DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q7c"]
${Q6}=  name:DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q7b1
${Q7}=  DEMOMCD_BH_DEMOMCDS1_DEMOMCDS1Q8   #name of radio
${Q8}=  name:DEMOMCD_BH_DEMOMCDQ1    #dropdown
${Q9}=  DEMOMCD_BH_DEMOMCDQ2     #name of radio
${Q10}=  name:DEMOMCD_BH_DEMOMCDQ4a
${Q11}=  id:option_0_DEMOMCD_BH_DEMOMCDQ5        #checkbox
${Comment_Detail1}=    xpath://input[@id="DEMOMCD_BH_DEMOMCDQ7a"]
${Q12} =  DEMOMCD_BH_DEMOMCDQ6        # name of radio
${Q13} =  name:DEMOMCD_BH_DEMOMCDQ7
${Q14} =  DEMOMCD_BH_DEMOMCDQ9        #name of radio

#Social Determinants of Health (SDOH)
${Q15} =  SDOHMCD_BH_SDOHMCDQ1
${Q16} =  SDOHMCD_BH_SDOHMCDQ2
${Q17} =  SDOHMCD_BH_SDOHMCDQ3
${Comment_Detail2}=     xpath://input[@id="SDOHMCD_BH_SDOHMCDQ8a"]
${Q18} =  id:option_0_SDOHMCD_BH_SDOHMCDQ4
${BH_Q19} =    id:option_0_SDOHMCD_BH_SDOHMCDQ5       #//input[@id='option_2_SDOHMCD_BH_SDOHMCDQ5']      #id:option_0_SDOHMCD_BH_SDOHMCDQ5
#${BH_Q20} =    //input[@id='option_0_SDOHMCD_BH_SDOHMCDQ6']
${BH_Q20} =  id:option_0_SDOHMCD_BH_SDOHMCDQ6
${BH_Q21} =  id:option_0_SDOHMCD_BH_SDOHMCDQ7
#${BH_Q21} =  //input[@id='option_0_SDOHMCD_BH_SDOHMCDQ7']
${BH_Q22} =  id:option_0_SDOHMCD_BH_SDOHMCDQ8
${NotesSummary1} =  xpath://textarea[@id="SDOHMCD_BH_SDOHMCDQ9"]

#Memory
${Q23} =    //input[@id="option_0_MEMOMCD_BH_MEMOMCDQ1"]    #MEMOMCD_BH_MEMOMCDQ1
${Q24} =    //input[@id='option_0_MEMOMCD_BH_MEMOMCDCRQ2']  #MEMOMCD_BH_MEMOMCDCRQ2
${BH_Q25} =    MEMOMCD_BH_MEMOMCDQ7
${BH_Q26} =    MEMOMCD_BH_MEMOMCDQ8
${BH_Q27} =    MEMOMCD_BH_MEMOMCDQ9
${NotesSummary2} =     xpath://textarea[@id="MEMOMCD_BH_MEMOMCDQ11"]

#General Health, Sensory & Communication
${BH_Q28} =    name:GENEMCD_BH_GENEMCDQ1
${BH_Q29} =    name:GENEMCD_BH_GENEMCDQ2
${BH_Q30} =    name:GENEMCD_BH_GENEMCDQ3
${BH_Q31} =    name:GENEMCD_BH_GENEMCDQ4
${BH_Q32} =    GENEMCD_BH_GENEMCDQ5
${BH_Q33} =    GENEMCD_BH_GENEMCDQ8
${BH_Q34} =    name:GENEMCD_BH_GENEMCDQ11
${BH_Q35} =    name:GENEMCD_BH_GENEMCDQ12
${BH_Q36} =    GENEMCD_BH_GENEMCDQ13
${BH_Q37} =    GENEMCD_BH_GENEMCDQ16
${BH_Q38} =    //input[@id="option_0_GENEMCD_BH_GENEMCDQ19"]
${BH_Q39} =    GENEMCD_BH_GENEMCDQ21
${NotesSummary3} =     xpath://textarea[@id="GENEMCD_BH_GENEMCDQ23"]

#Activities of Daily Living
${Q40a} =   ADLMCDGRID1Q1
${Q40b} =   ADLMCDGRID1Q2
${Q40c} =   ADLMCDGRID1Q3
${Q40d} =   ADLMCDGRID1Q4
${Q40e} =   ADLMCDGRID1Q5
${Q40f} =   ADLMCDGRID1Q6
${UsesAssistiveDeviceFor} =     id:option_0_ADLMCD_BH_ADLMCDQ1
${BH_Q41} =    ADLMCD_BH_ADLMCDQ2
${Q42a} =   ADLMCDGRID2Q1
${Q42b} =   ADLMCDGRID2Q2
${Q42c} =   ADLMCDGRID2Q3
${Q42d} =   ADLMCDGRID2Q4
${Q42e} =   ADLMCDGRID2Q5
${Q42f} =   ADLMCDGRID2Q6
${NotesSummary4} =    xpath://textarea[@id="ADLMCD_BH_ADLMCDQ4"]

#Instrumental Activities of Daily Living
${Q43a} =   IADLMCDQ1a
${Q43b} =   IADLMCDQ1b
${Q43c} =   IADLMCDQ1c
${Q43d} =   IADLMCDQ1d
${Q43e} =   IADLMCDQ1e
${Q43f} =   IADLMCDQ1f
${Q43g} =   IADLMCDQ1g
${Q43h} =   IADLMCDQ1h
${UsesAssistiveDeviceFor_2} =   id:option_1_IADLMCD_BH_IADLMCDQ1
${UsesAssistiveDeviceFor_4} =   id:option_3_IADLMCD_BH_IADLMCDQ1
${BH_Q44} =    IADLMCD_BH_IADLMCDQ2a
${Q45a} =   IADLMCDQ3a
${Q45b} =   IADLMCDQ3b
${Q45c} =   IADLMCDQ3c
${Q45d} =   IADLMCDQ3d
${Q45e} =   IADLMCDQ3e
${Q45f} =   IADLMCDQ3f
${Q45g} =   IADLMCDQ3g
${Q45h} =   IADLMCDQ3h
${NotesSummary5} =    xpath://textarea[@id="IADLMCD_BH_IADLMCDQ4"]

#Health Systems and Status
${BH_Q46} =    xpath://input[@id="HSSMCD_BH_HSSMCDQ1aa"]
${BH_Q47} =    xpath://input[@id="HSSMCD_BH_HSSMCDQ1b"]
${BH_Q48} =    HSSMCD_BH_HSSMCDQ3
${BH_Q49} =    name:HSSMCD_BH_HSSMCDQ7    #No neeed to select this dropdown
${Cardiovascular_Heart} =   HSSMCD_BH_HSSMCDQ8
${Respiratory} =    HSSMCD_BH_HSSMCDQ10
${Endocrine_Glands} =   HSSMCD_BH_HSSMCDQ12
${Musculoskeletal} =    HSSMCD_BH_HSSMCDQ14
${Gastrointestinal} =   HSSMCD_BH_HSSMCDQ16
${Neurological} =   HSSMCD_BH_HSSMCDQ18
${Renal} =    HSSMCD_BH_HSSMCDQ20
${RenalDetails_Dialysis} =  HSSMCDGRIDQ80
${AdditionalRenalDetails}=    xpath://input[@id="HSSMCD_BH_HSSMCDQ21"]
${Blood_Hematological} =    HSSMCD_BH_HSSMCDQ22
${InfectiousDisease} =  HSSMCD_BH_HSSMCDQ24
${Skin_Integumentary} =  HSSMCD_BH_HSSMCDQ26
${Reproductive} =   HSSMCD_BH_HSSMCDQ28
${EyesEarsNoseThroat} =   HSSMCD_BH_HSSMCDQ30
${Cancer} =   HSSMCD_BH_HSSMCDQ32
${RareorOther} =    HSSMCD_BH_HSSMCDQ34
${BehavioralHealth} =   HSSMCD_BH_HSSMCDQ36
${BH_Q50} =    name:HSSMCD_BH_HSSMCDQ38
${Description} =    xpath://textarea[@id="HSSMCD_BH_HSSMCDQ38a"]
${ActivityRestrictions} =   id:option_0_HSSMCD_BH_HSSMCDQ39
${No_MemberDeclines} =    id:option_0_HSSMCD_BH_HSSMCDQ40
${DetailsOfResources} =     xpath://input[@id="HSSMCD_BH_HSSMCDQ40a"]
${healthstatusdetails} =    xpath://input[@id="HSSMCD_BH_HSSMCDQ41"]
${BH_Q51} =    HSSMCD_BH_HSSMCDQ42
${BH_Q52} =    HSSMCD_BH_HSSMCDQ45
${Q52a} =   HSSMCDGRIDQ22
${Q52b} =   HSSMCDGRIDQ23
${Q52c} =   HSSMCDGRIDQ24
${Q52d} =   HSSMCDGRIDQ25
${Q52e} =   HSSMCDGRIDQ26
${Q52f} =   HSSMCDGRIDQ27
${Q52g} =   HSSMCDGRIDQ28
${Q52h} =   HSSMCDGRIDQ29
${Q52i} =   HSSMCDGRIDQ30
${Q52j} =   HSSMCDGRIDQ31
${BH_SelfNeglect1} =    HSSMCD_BH_HSSMCDQ46a
${BH_Q53} =    HSSMCD_BH_HSSMCDQ48
${BH_Q54} =    HSSMCD_BH_HSSMCDQ49
${NotesSummary6} =    xpath://textarea[@id="HSSMCD_BH_HSSMCDQ50"]

#Behavioral Health
${BH_Q55} =    xpath://input[@id="option_0_BHMCD_BH_BHMCDQ1"]
${BH_Q56} =    name:BHMCD_BH_BHMCDQ2
${BH_Q57} =    name:BHMCD_BH_BHMCDQ3
${BH_Q58} =    name:BHMCD_BH_BHMCDQ24
${BH_Q59} =    name:BHMCD_BH_BHMCDQ27
${Q60a} =   BHMCD_BH_BHMCDS1_BHMCDQ6
${Q60b} =   BHMCD_BH_BHMCDS1_BHMCDQ7
${BH_Q61} =    name:BHMCD_BH_BHMCDQ20
${BH_Q62} =    BHMCD_BH_BHMCDQ21
${BH_Q62Details} =    xpath://input[@id="BHMCD_BH_BHMCDQ21a"]
${BH_Q62a} =    BHMCD_BH_BHMCDQ22
${BH_Q62aDetails} =    xpath://input[@id="BHMCD_BH_BHMCDQ22a"]
${BH_Q62b} =    BHMCD_BH_BHMCDQ23
${BH_Q63} =    BHMCD_BH_BHMCDS2_BHMCDQ30
${Q64a} =   xpath://input[@name="BHMCD_BH_BHMCDS3_BHMCDQ38"]
${Q64b} =   xpath://input[@name="BHMCD_BH_BHMCDS3_BHMCDQ39"]
${Q64c} =   xpath://input[@name="BHMCD_BH_BHMCDS3_BHMCDQ40"]
${Q64d} =   xpath://input[@name="BHMCD_BH_BHMCDS3_BHMCDQ41"]
${Q64e} =   xpath://input[@name="BHMCD_BH_BHMCDS3_BHMCDQ42"]
${Q64f} =   xpath://input[@name="BHMCD_BH_BHMCDS3_BHMCDQ43d"]
${NotesSummary7} =    xpath://textarea[@name="BHMCD_BH_BHMCDQ44"]

# Residential Living Environment
${BH_Q65} =    name:RESIMCD_BH_RESIMCDQ1
${BH_Q66a} =   id:option_0_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q1
${BH_Q66b} =   id:option_1_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q2
${BH_Q66c} =   id:option_2_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q3
${BH_Q66d} =   id:option_1_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q4
${BH_Q66e} =   id:option_3_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q5
${BH_Q66f} =   id:option_1_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q6
${BH_Q66g} =   id:option_1_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q7
${Q66g_Xpath} =    xpath://input[@id="option_1_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q7"]
${BH_Q66h} =   id:option_2_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q8
${BH_Q66i} =   xpath://textarea[@id="RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q9"]
${BH_Q67} =    RESIMCD_BH_RESIMCDQ4
${NotesSummary8} =     xpath://textarea[@id="RESIMCD_BH_RESIMCDQ5"]

#Nutrition
${BH_Q68} =    NUTRMCD_BH_NUTRMCDQ1
${BH_Q69} =    NUTRMCD_BH_NUTRMCDQ5
${BH_Q70} =    NUTRMCD_BH_NUTRMCDQ6
${Q70_ft} =     xpath://input[@id="NUTRMCD_BH_NUTRMCD_GQ1_NUTRMCDQ6ai"]
${Q70_inch} =   xpath://input[@id="NUTRMCD_BH_NUTRMCD_GQ1_NUTRMCDQ6aii"]
${NotesSummary9} =     xpath://textarea[@id="NUTRMCD_BH_NUTRMCDQ10"]

#Medication
${BH_Q72a} =   xpath://input[@id="MEDIMCD_BH_MEDIMCDG3_0_MEDIMCDQ11"]
${BH_Q72b} =   name:MEDIMCD_BH_MEDIMCDG3_0_MEDIMCDQ12
${BH_Q73a} =   xpath://input[@id="MEDIMCD_BH_MEDIMCDG4_0_MEDIMCDQ14"]
${BH_Q73b} =   xpath://input[@id="MEDIMCD_BH_MEDIMCDG4_0_MEDIMCDQ15"]
${BH_Q73c} =   xpath://input[@id="MEDIMCD_BH_MEDIMCDG4_0_MEDIMCDQ22"]
${BH_Q73d} =   name:MEDIMCD_BH_MEDIMCDG4_0_MEDIMCDQ16
${BH_Q73e} =   xpath://input[@id="MEDIMCD_BH_MEDIMCDG4_0_MEDIMCDQ17"]
${BH_Q73f} =   xpath://input[@id="MEDIMCD_BH_MEDIMCDG4_0_MEDIMCDQ18"]
${BH_Q74} =    xpath://textarea[@id="MEDIMCD_BH_MEDIMCDQ23"]
${NotesSummary10} =    xpath://textarea[@id="MEDIMCD_BH_MEDIMCDQ19"]

#Caregiver
${BH_Q75} =    CAREMCD_BH_CAREMCDQ1
${BH_Q76a} =   xpath://input[@id="CAREMCD_BH_CAREMCDS1_CAREMCDQ1b"]
${BH_Q76b} =   xpath://input[@id="CAREMCD_BH_CAREMCDS1_CAREMCDQ1c"]
${BH_Q76c} =   xpath://input[@id="CAREMCD_BH_CAREMCDS1_CAREMCDQ1d"]
${Caregiver_Ph_No} =    xpath://input[@id="CAREMCD_BH_CAREMCDS1_CAREMCDQ1e"]
${BH_Q77} =    CAREMCD_BH_CAREMCDS2_CAREMCDQ2
${BH_Q78} =    CAREMCD_BH_CAREMCDS3_CAREMCDQ3
${BH_Q79} =    name:CAREMCD_BH_CAREMCDS3_CAREMCDQ4
${BH_Q80} =    id:option_0_CAREMCD_BH_CAREMCDS3_CAREMCDQ5
${BH_Q81} =    CAREMCD_BH_CAREMCDS3_CAREMCDQ6
${BH_Q82} =    CAREMCD_BH_CAREMCDQ7
${BH_Q83} =    name:CAREMCD_BH_CAREMCDQ9
${BH_Q84} =    xpath://input[@id="CAREMCD_BH_CAREMCDQ10"]
${BH_Q85} =    CAREMCD_BH_CAREMCDQ11
${BH_Q86} =    CAREMCD_BH_CAREMCDQ13
${BH_Q87} =    CAREMCD_BH_CAREMCDQ15
${BH_Q88} =    CAREMCD_BH_CAREMCDQ16
${BH_Q89a} =   CAREMCDQ17a
${BH_Q89b} =   CAREMCDQ17b
${BH_Q89c} =   CAREMCDQ17c
${BH_Q89d} =   CAREMCDQ17d
${BH_Q89e} =   CAREMCDQ17e
${BH_Q89f} =   CAREMCDQ17f
${BH_Q89g} =   CAREMCDQ17g
${BH_Q89h} =   CAREMCDQ17h
${NotesSummary11} =    xpath://textarea[@id="CAREMCD_BH_CAREMCDQ17"]

#Social Resources
${BH_Q90a} =   SOCIMCD_BH_SOCIMCDQ2
${BH_Q90b} =   SOCIMCD_BH_SOCIMCDQ3
${BH_Q90c} =   SOCIMCD_BH_SOCIMCDQ4
${BH_Q92} =    SOCIMCDGRIDQ1
${BH_Q93} =    SOCIMCDGRIDQ2
${BH_Q94} =    SOCIMCDGRIDQ3
${NotesSummary12} =    xpath://textarea[@id="SOCIMCD_BH_SOCIMCDQ10"]

#Advance Directives
${BH_Q95} =    ADMCD_BH_ADMCDQ1
${BH_Q96a} =   id:option_0_ADMCD_BH_ADMCDS1_ADMCDQ3
${BH_Q96b} =   id:option_0_ADMCD_BH_ADMCDS1_ADMCDQ4
${NotesSummary13} =    xpath://textarea[@id="ADMCD_BH_ADMCDQ5"]

#Summary and Conclusions
${BH_Q97} =    name:SnCMCD_BH_SnCMCDQ1
${BH_Q98} =    name:SnCMCD_BH_SnCMCDQ2
${BH_Q99} =    xpath://input[@id="SnCMCD_BH_SnCMCDQ3"]
${BH_Q100} =   name:SnCMCD_BH_SnCMCDQ4
${BH_Q101} =   xpath://input[@id="SnCMCD_BH_SnCMCDQ5"]
${BH_Q102} =   SnCMCD_BH_SnCMCDQ6
${NotesSummary14}=   xpath://textarea[@id="SnCMCD_BH_SnCMCDQ7"]
${CPCM} =    xpath://ul[@class="MemberCentral-dropdown-menu-left"]//a[text()="CP CM Cases"]
${CaseID} =    xpath://span[text()="C000065118"]
${CompAssessment} =     xpath://a[text()="Comprehensive Assessment"]
${btn_Resume} =     xpath://a[text()="Resume"]
${Demographic} =    xpath://a[text()="Demographic"]
${CopmpleteAndNext} =   xpath://a[text()="Complete & Next"]
${BH_ReviewAndSubmit} =    //a[@id="previewAssessmentBtn" and text()="Preview & Submit"]
${BH_Submit} =     //a[@id="submitAssessmentBtn" and text()="Submit"]
${BH_AcknowledgeAndSubmit} =    //a[@id="btnAcknowledgeSubmit"]
${btn_Reassess} =    //*[@id="assessmentReassessBtn" and text()="Reassess"]
${AllNew} =    //a[@id="btntakeAllNew"]
${GetStarted} =    //a[contains(text(),'Get Started')]
${Add_Services_btn} =    //a[@id="add-granular-service-button"]
${Save_SarviceDetails} =    //a[@id="granularservice-save-btn"]
${Service_Provider} =    //*[@id="Provider"]/div[2]/table/tbody/tr[1]/td[1]//label
${Service_Provider1} =    //*[@id="Provider"]/div[2]/table/tbody/tr[2]/td[1]//label
${Services_SaveAndAdd_btn} =    //a[@id="services-save-and-add-btn"]
${Services_Save_btn} =    //a[@id="services-save-btn"]
${Canvas1} =    //canvas[@id="MemberCaregiverSignature"]
${Canvas2} =    //canvas[@id="MemberRepresentativeSignature"]
${Canvas3} =    //canvas[@id="CareCoordinatorSignature"]
${btn_SavePlanOfCare} =    //a[@id="save-plan-of-care-button"]
${DetailsOfReview} =    //textarea[@id="DetailsAdministrativeEditReview"]
${RiskAgrimentDetails} =    //textarea[@id="ControlId3952"]
${ContactTypeInfo} =    //*[@id="PlanOfCareMemberContact"]//table[@data-role="selectable"]//tr[1]/td[3]
${btn_ContactTypeInfo} =    //a[@id="membercontactinfo-view-edit-btn" and contains(text(),'Edit')]
${save_ContactType} =    //a[@id="membercontactinfo-update-btn"]
${RiskDetails_Error} =    //*[@id="ControlId3954-error"]

*** Keywords ***
Reset to ALL New
    [Arguments]  ${UserData}
    set selenium implicit wait    5S
    wait until page contains    Case - View Assessment : Comprehensive
    sleep    2s
    #wait until element is visible    ${btn_Reassess}
#    click link    Reassess
    click element    ${btn_Reassess}
    log to console      CLicked on button Reassess
    sleep    20s
    page should contain element   ${AllNew}
    click element    ${AllNew}
    log to console      CLicked on button All New
    sleep    20s

BH Primary_start with get Started
    [Arguments]    ${UserData}
    sleep    4s
    wait until page contains element    //a[contains(text(),'Get Started')]
    select from list by label    id:DETE_MCD_DETEMCDQ2    Illinois MMAI
    sleep    3s
    click element    //input[@name='DETE_MCD_DETEMCDQ3' and @value='${UserData.BH_CaseType}']
    sleep    3s
    click element    ${GetStarted}

User Take IL Assessment
    [Arguments]  ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    sleep    4s
    Search For Member   ${UserData}
    Select The Member
    SearchPage.Click on the Member Central
    click element    ${CPCM}
    click element    //span[contains(text(),'${UserData.CaseId}')]
    click element    ${CompAssessment}
    sleep    4s
#    ${ReassessNew} =   run keyword and return status  element should be visible    ${btn_Reassess}
#    run keyword IF    ${ReassessNew}   Reset to ALL New   ${UserData}
#    Fill BH Primary Assessment    ${UserData}
#    log to console    BH Primary Assessment is submitted
#    sleep    10s
#    ${ReassessExist} =   run keyword and return status  element should be visible    ${btn_Reassess}
#    run keyword IF    ${ReassessExist}   Keep ALL Exixting Details BH Primary   ${UserData}
#    wait until element is visible    ${btn_Reassess}    20s
#    sleep    2s
#    ${Reassess} =   run keyword and return status  element should be visible    ${btn_Reassess}
#    run keyword IF    ${Reassess}   Reset to ALL New   ${UserData}
#    Fill BH Primary Assessment    ${UserData}
#    log to console    BH Primary Assessment is submitted again
#    wait until element is visible    (//a[@id="button-CompAssesment-History"])[1]    20s
#    Check The History    ${UserData}
###    wait until element is visible    //*[text()='${UserData.Q1_updated}']    30s     #NOt in Use
###   page should contain element    //*[text()='${UserData.Q1_updated}']             #NOt in Use
#    log to console    updated change is verified through history
#    Print with and without PHI BH Primary    ${UserData}
    Navigate to Medicaid Plan of Care
    sleep    2s
    ${EditStatus} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus}    click element    //a[@id="edit-plan-of-care-button"]
###    Folloup Plan validation in PLOC BH Primary    ${UserData}      # Old changes      #NOt in Use
    Case Create Plan Of Care    ${UserData}
##    Validate Member Natural/Community Support Info BHPrimary    ${UserData}            #NOt in Use
    Fill values Member Natural/Community Support Info    ${UserData}
    Fill form in Strengths, Preferences, and Self Care Capabilities    ${UserData}
    Follow up Plan Details    ${UserData}     # newly added section

    ${WaiverCodeStatus} =    run keyword and return status    element should be visible    //label[@for="ControlId4008" and contains(text(),'Member Self-Directed Option Discussed')]
    run keyword if    ${WaiverCodeStatus}    Fill up Member Self Directed Option discussed info    ${UserData}
    Contact information Update    ${UserData}
    Adding Services    ${UserData}
    Adding Services Again    ${UserData}
    scroll element into view    //label[@for="ControlId3973-radio-0-2"]         #Attestation
    sleep    1s
    double click element    //label[@for="ControlId3973-radio-0-2"]
    sleep    2s
    Select Attestation Radio Buttons
    sleep    2m
    Draw Dignature and save PlanOfCare
    Verify Auth Details of Services from Autharization    ${UserData}
    click link    Member Central
    sleep    4s
    Navigate Authorization Page
    sleep    10s
    run keyword if    '${UserData.Service_Auth2_status}' == 'Approved'    Validate Attachmemt in Auth    ${UserData.Service_Auth2}
    run keyword if    '${UserData.Service_Auth1_status}' == 'Approved'    Validate Attachmemt in Auth    ${UserData.Service_Auth1}
    Navigate to Medicaid Plan of Care
    Print PLOC Review type and Check Hostory    ${UserData}

Provide contact type Info and submit PLOC
    sleep    1s
#    wait until page contains    Please fill all required fields for the highlighted grid line(s) below    30s
#    scroll element into view    ${ContactTypeInfo}
#    sleep    1s
#    click element    ${ContactTypeInfo}
    # //div[@id='PlanOfCareMemberContact']//tr[@class='k-alt highlighted-row-mandatory']
    scroll element into view    //div[@id='PlanOfCareMemberContact']//tr[@class='k-alt k-master-row highlighted-row-mandatory']
    sleep    1s
    click element    //div[@id='PlanOfCareMemberContact']//tr[@class='k-alt k-master-row highlighted-row-mandatory']
    wait until page contains    View Member Support Contact Information    20s
    scroll element into view    ${btn_ContactTypeInfo}
    click link    ${btn_ContactTypeInfo}
    wait until page contains    Edit Member Support Contact Information    20s
    select from list by label    id:ILContactType    Durable Power of Attorney Pending    #${UserData.HCBS_ContactType1}
    sleep    1s
    click element    ${save_ContactType}
    Risk details and Save PLOC

Provide another contact type Info and submit PLOC
    sleep    1s
#    wait until page contains    Please fill all required fields for the highlighted grid line(s) below    30s
    scroll element into view    //*[@id="PlanOfCareMemberContact"]//table[@data-role="selectable"]//tr[3]/td[3]
    sleep    1s
    click element    //*[@id="PlanOfCareMemberContact"]//table[@data-role="selectable"]//tr[3]/td[3]
    wait until page contains    View Member Support Contact Information    20s
    scroll element into view    ${btn_ContactTypeInfo}
    click link    ${btn_ContactTypeInfo}
    wait until page contains    Edit Member Support Contact Information    20s
    select from list by label    id:ILContactType    Durable Power of Attorney Pending    #${UserData.HCBS_ContactType1}
    sleep    1s
    click element    ${save_ContactType}
    Risk details and Save PLOC

Risk details and Save PLOC
    set selenium implicit wait    30s
    sleep    2s
#    wait until page contains    Create Plan of Care    10s
    ${Chk_RiskDetails_Error} =    run keyword and return status    element should be visible    ${RiskDetails_Error}
    run keyword if    ${Chk_RiskDetails_Error}    input text    //textarea[@id="ControlId3954"]    abcd
    ${var_btn_SavePlanOfCare} =    run keyword and return status    element should be visible    ${btn_SavePlanOfCare}
    run keyword if    ${var_btn_SavePlanOfCare}    click element    ${btn_SavePlanOfCare}

Print PLOC Review type and Check Hostory
    [Arguments]    ${UserData}
    wait until element is visible    //a[@id="print-button"]//div[@class="plan-of-care-print-drop"]    30s
    click element    //a[@id="print-button"]//div[@class="plan-of-care-print-drop"]
    sleep    1s
#old    click element    ${Print_LTSSServicePlan}     #print
#old    click element    ${PrintPlanOfCare}     #print
    Review Type Verification in PLOC    ${UserData}
#old    wait until page contains element    ${PrintPlanOfCare}    30s
#old    click element    ${PrintPlanOfCare}     #print to check Review date
    sleep    2s
    Navigate to Medicaid Plan of Care
    ${EditStatus1} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus1}    click element    //a[@id="edit-plan-of-care-button"]
    wait until element is visible    //a[@id="print-button"]//div[@class="plan-of-care-print-drop"]    30s
    click element    //a[@id="print-button"]//div[@class="plan-of-care-print-drop"]
    sleep    1s
#    click element    ${PrintAll}
    Navigate to Medicaid Plan of Care
    sleep    1s
    Check Hostory of Plan Of Care    ${UserData}

Adding Services
    [Arguments]    ${UserData}
    scroll element into view    //*[@id="Services"]/a
##    click element    //*[@id="left-nav"]//*[text()='Services']
    sleep    2s
    click element    //label[@for="IsCareManagerVerified-radio-694-1"]
    sleep    2s
    click element    //a[@id="add-services-goals"]     #Add servies
    wait until page contains    Add Service    20s
    wait until page contains    Source
    select from list by index    id:PlanOfCareServiceSourceCode    0
    sleep    1s
    select from list by label    id:PlanOfCareServiceSourceCode    ${UserData.Source}
    sleep    15s
    wait until page contains    Service Information    20s
    set selenium implicit wait    20s
    run keyword if    '${UserData.ServiceStartDate}' == '${EMPTY}'    Enter Curent Date    //*[@id="StartDate"]
    ...    ELSE    input text    //*[@id="StartDate"]    ${UserData.ServiceStartDate}
    sleep    1s
    ${DateToday} =      get current date    result_format=%m/%d/%Y
    ${DateAfter2} =        Add Time To Date  ${DateToday}    +2 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    run keyword if    '${UserData.ServiceEndDate}' == '${EMPTY}'    input text    //*[@id="EndDate"]    ${DateAfter2}
    ...    ELSE    input text    //*[@id="EndDate"]    ${UserData.ServiceEndDate}
    sleep    1s
    select from list by label    id:ServiceType    ${UserData.SourceType}
    sleep    5s
    wait until element is visible    //select[@id="ServiceDescription"]    20s
    set selenium implicit wait    20s
    select from list by label    id:ServiceDescription   ${UserData.Service}
    select from list by label    //select[@id="LtssAuthScope"]   Other - Please Specify
    wait until element is visible    //textarea[@id="ScopeOthers"]    10s
    input text    //textarea[@id="ScopeOthers"]    ${UserData.ScopeOthers}
    input text    //textarea[@id="BarrierOthers"]    ${UserData.BarrierOthers}
    scroll element into view    ${Add_Services_btn}
    click element    ${Add_Services_btn}
    wait until page contains element    //*[text()='Frequency']    50s
    select from list by index    id:Frequency    0
    sleep    1s
    select from list by label    id:Frequency    ${UserData.Friquency}
    sleep    1s
    click element    //label[@for="CalculateFrequencyBy-radio-523-2"]
    ${chk_TotalUnits} =  run keyword and return status    element should be visible    //input[@id="Total"]
    run keyword if    ${chk_TotalUnits}    input text    //input[@id="Total"]    ${UserData.TotalUnits}
    ${chk_Units} =  run keyword and return status    element should be visible    //input[@id="Sunday"]
    run keyword if    ${chk_Units}    Fill the weekly Units    ${UserData}
    sleep    1s
    run keyword if    '${UserData.SourceType}' == 'ADULT DAY CARE'    Check Backup Provider Fields Mendatory
    input text    //input[@id="Name"]    ${UserData.BK_ProviderName}
    input text    //input[@id="PhoneNumber"]    ${UserData.BK_ProviderPhone}
    input text    //textarea[@id="BackUpPlanDetail"]    ${UserData.BackUpPlanDetail}
    sleep    2s
    click link    ${Save_SarviceDetails}
    wait until page contains    Provider Information
#    wait until element is visible    //*[@id="Provider"]/div[2]/table/tbody/tr[1]     50s
    ${Chk_Provider} =    run keyword and return status    page should contain element    //*[@id="Provider"]/div[2]/table/tbody/tr[1]
    run keyword if    ${Chk_Provider}    Select the Provider
    ...    ELSE    Select the Default Provider
    sleep    6s
    wait until element is visible    //*[@id="clear-primary-provider-summary"]//img    30s
    click element    //*[@for="PlocAuthorizationTypeCode-radio-1-7"]     #Auth Type
    select from list by label    id:PlocRequestTypeCode    ${UserData.RequestType}
    wait until page contains element    //a[@id="services-save-and-add-btn"]
    click link    ${Services_SaveAndAdd_btn}
    sleep    2s
    ${DuplicateService} =    run keyword and return status    element should be visible    //*[@id="modal-header-title" and text()='Duplicate Service']
    run keyword if    ${DuplicateService}    click element  //*[@id="btnYes"]
#    wait until page contains    Service has been Added Successfully
    sleep    2s

Check Backup Provider Fields Mendatory
    sleep    2s
    click link    ${Save_SarviceDetails}
    element should be visible    //span[@id="Name-error" and text()='Back-Up Provider Name is required']    10s
    element should be visible    //span[@id="PhoneNumber-error" and text()='Back-Up Provider Phone is required']    10s
    element should be visible    //span[@id="BackUpPlanDetail-error" and text()='Back Up Plan - Detail is required']    10s
    sleep    1s
    input text    //input[@id="Name"]    tester1
    input text    //input[@id="PhoneNumber"]    111-222-3334
    input text    //textarea[@id="BackUpPlanDetail"]    text

Adding Services Again
    [Arguments]    ${UserData}
    sleep    2s
    Enter Curent Date    //*[@id="StartDate"]
    ${DateToday} =      get current date    result_format=%m/%d/%Y
    ${DateAfter2} =        Add Time To Date  ${DateToday}    +2 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    input text    //*[@id="EndDate"]    ${DateAfter2}
    select from list by label    id:ServiceType    ${UserData.SourceType1}
    sleep    2s
    ${serviceType1_changeYes} =    run keyword and return status    page should contain element    //a[@id="btn-servicetype-change-yes"]
    run keyword if    ${serviceType1_changeYes}    click element    //a[@id="btn-servicetype-change-yes"]
    sleep    2s
    select from list by label    id:ServiceDescription   ${UserData.Service1}
    sleep    2s
    select from list by label    id:LtssAuthScope   ${UserData.Scope}
    input text    //textarea[@id="ScopeOthers"]    ${UserData.ScopeOthers}
    input text    //textarea[@id="BarrierOthers"]    ${UserData.BarrierOthers}
    scroll element into view    ${Add_Services_btn}
    click element    ${Add_Services_btn}
    wait until page contains element    //*[text()='Frequency']    30s
    select from list by index    id:Frequency    0
    sleep    1s
    select from list by label    id:Frequency    ${UserData.Friquency1}
    sleep    1s
    click element    //label[@for="CalculateFrequencyBy-radio-523-2"]
    input text    //input[@id="Sunday"]    ${UserData.TotalUnits}
    input text    //input[@id="Monday"]    ${UserData.TotalUnits}
    input text    //input[@id="Tuesday"]    ${UserData.TotalUnits}
    input text    //input[@id="Wednesday"]    ${UserData.TotalUnits}
    input text    //input[@id="Thursday"]    ${UserData.TotalUnits}
    input text    //input[@id="Friday"]    ${UserData.TotalUnits}
    input text    //input[@id="Saturday"]    ${UserData.TotalUnits}
    sleep    1s
    run keyword if    '${UserData.SourceType1}' == 'HOMEMAKER'    Check Backup Provider Fields Mendatory
    input text    //input[@id="Name"]    ${UserData.BK_ProviderName}
    input text    //input[@id="PhoneNumber"]    ${UserData.BK_ProviderPhone}
    input text    //textarea[@id="BackUpPlanDetail"]    ${UserData.BackUpPlanDetail}
    sleep    2s
    click link    ${Save_SarviceDetails}
    wait until page contains    Provider Information
    ${Chk_Provider} =    run keyword and return status    page should contain element    //*[@id="Provider"]/div[2]/table/tbody/tr[2]
    run keyword if    ${Chk_Provider}    Select the Provider Again
    ...    ELSE    Select the Default Provider
    sleep    4s
    wait until page contains element    //*[@id="clear-primary-provider-summary"]//img    20s
    click element    //*[@for="PlocAuthorizationTypeCode-radio-1-7"]     #Auth Type
    select from list by label    id:PlocRequestTypeCode    ${UserData.RequestType}
    wait until page contains element    //a[@id="services-save-and-add-btn"]
    click link    ${Services_Save_btn}
    sleep    2s
    ${DuplicateService} =    run keyword and return status    element should be visible    //*[@id="modal-header-title" and text()='Duplicate Service']
    run keyword if    ${DuplicateService}    click element  //*[@id="btnYes"]
#    wait until page contains    Service has been Added Successfully
    sleep    2s

Fill the weekly Units
    [Arguments]    ${UserData}
    input text    //input[@id="Sunday"]    ${UserData.TotalUnits}
    input text    //input[@id="Monday"]    ${UserData.TotalUnits}
    input text    //input[@id="Tuesday"]    ${UserData.TotalUnits}
    input text    //input[@id="Wednesday"]    ${UserData.TotalUnits}
    input text    //input[@id="Thursday"]    ${UserData.TotalUnits}
    input text    //input[@id="Friday"]    ${UserData.TotalUnits}
    input text    //input[@id="Saturday"]    ${UserData.TotalUnits}

Select the Provider Again
    wait until page contains element    //*[@id="Provider"]/div[2]/table/tbody/tr[2]    30s
    sleep    1s
    scroll element into view    //*[@id="Provider"]/div[2]/table/tbody/tr[2]    #//td[contains(text(),'Active Day of Marion')]
    sleep    5s
    click element    ${Service_Provider1}
    sleep    1s
    wait until page contains    Set as Provider
    click link    Set as Provider

Select the Provider
    wait until page contains element    //*[@id="Provider"]/div[2]/table/tbody/tr[1]    30s
    sleep    2s
    scroll element into view    //*[@id="Provider"]/div[2]/table/tbody/tr[1]    #//td[contains(text(),'Active Day of Marion')]
    sleep    5s
    click element    ${Service_Provider}
    sleep    1s
    wait until page contains    Set as Provider
    click link    Set as Provider

*** Variables ***
${DefaultProvider} =    //a[@id="add-newprovider-button" and text()='Enter Default Provider']
${DefaultProviderName} =    //input[@id="DefaultProviderName"]
${DefaultProviderPhone} =    //input[@id="NewProivderPhone"]
${Save_DefaultProvider} =    //a[@id="button-add-new-provider"]

*** Keywords ***
Select the Default Provider
    set selenium implicit wait    50s
    sleep   40s
    wait until element is visible    ${DefaultProvider}    120s
    Run Keyword Until Success   click element    ${DefaultProvider}
    #click element    ${DefaultProvider}
    wait until page contains    Enter Default Provider    30s
    input text    ${DefaultProviderName}    ABC
    input text    ${DefaultProviderPhone}    111-222-3333
    click element    //label[@for="IsLetterOfAgreement-radio-694-1"]    #click yes
    sleep    1s
    click element    ${Save_DefaultProvider}

*** Variables ***
${Service_Auth1} =    //*[@id="PlanOfCareService"]/div[2]/table/tbody/tr[1]/td[8]
${Service_Auth2} =    //*[@id="PlanOfCareService"]/div[2]/table/tbody/tr[2]/td[8]
${BackToAuthHome} =    //a[@class="humana-plum back-link secondary updateTab"]/u
${Service_Auth_type} =    //form[@id="form-ploc-auth-view"]/div[2]//div[@class="small-6 columns valueField"]
*** Keywords ***
Verify Auth Details of Services from Autharization
    [Arguments]    ${UserData}
    sleep    4s
    wait until element is visible    ${Service_Auth1}    30s
    scroll element into view    //div[@id="PlanOfCareService-gridContent"]/div/div[2]
    ${UserData.Service_Auth1} =    get text    ${Service_Auth1}
    ${UserData.Service_Auth2} =    get text    ${Service_Auth2}
    ${UserData.Service_Auth1_status} =    get text    //*[@id="PlanOfCareService"]/div[2]/table/tbody/tr[1]/td[6]
    ${UserData.Service_Auth2_status} =    get text    //*[@id="PlanOfCareService"]/div[2]/table/tbody/tr[2]/td[6]
    wait until element is visible    ${Service_Auth1}    30s
    scroll element into view    ${Service_Auth1}
    set focus to element    ${Service_Auth1}
    sleep    2s
    click element    ${Service_Auth1}
    wait until element is visible    ${Service_Auth_type}    20s
    scroll element into view    ${Service_Auth_type}
    sleep    1s
    ${UserData.Service_Auth1_type} =    get text    ${Service_Auth_type}
    click element    //a[@id="view-service-cancel-btn"]      #cancel link
    wait until page contains element    ${Service_Auth2}    30s
    scroll element into view    ${Service_Auth2}
    set focus to element    ${Service_Auth2}
    sleep    2s
    click element    ${Service_Auth2}
    wait until element is visible    ${Service_Auth_type}    20s
    scroll element into view    ${Service_Auth_type}
    sleep    1s
    ${UserData.Service_Auth2_type} =    get text    ${Service_Auth_type}
    sleep    2s
    click element    //a[@id="view-service-cancel-btn"]      #cancel link
    sleep    2s
    ${UserData.Service_Auth1} =    strip string    ${UserData.Service_Auth1}    mode=both
    ${UserData.Service_Auth1_status} =    strip string    ${UserData.Service_Auth1_status}    mode=both
    ${UserData.Service_Auth1_type} =    strip string    ${UserData.Service_Auth1_type}    mode=both
    ${UserData.Service_Auth2} =    strip string    ${UserData.Service_Auth2}    mode=both
    ${UserData.Service_Auth2_status} =    strip string    ${UserData.Service_Auth2_status}    mode=both
    ${UserData.Service_Auth2_type} =    strip string    ${UserData.Service_Auth2_type}    mode=both
    log to console    ${UserData.Service_Auth1}
    log to console    ${UserData.Service_Auth1_status}
    log to console    ${UserData.Service_Auth1_type}
    log to console    ${UserData.Service_Auth2}
    log to console    ${UserData.Service_Auth2_status}
    log to console    ${UserData.Service_Auth2_type}
    click link    Member Central
    sleep    2s
    navigate authorization page
    scroll element into view    //*[@id="MemberCentralAuth-gridContent"]//td[text()='${UserData.Service_Auth1}']
    page should contain element    //*[@id="MemberCentralAuth-gridContent"]//td[text()='${UserData.Service_Auth1}']
    sleep    1s
    scroll element into view    //*[@id="MemberCentralAuth-gridContent"]//td[text()='${UserData.Service_Auth2}']
    page should contain element    //*[@id="MemberCentralAuth-gridContent"]//td[text()='${UserData.Service_Auth2}']
    sleep    1s
    scroll element into view    //*[@id="MemberCentralAuth-gridContent"]//td[text()='${UserData.Service_Auth1}']
    click element    //*[@id="MemberCentralAuth-gridContent"]//td[text()='${UserData.Service_Auth1}']
    page should contain element    //*[@id="OverAllStatus" and contains(text(),'${UserData.Service_Auth1_status}')]
    page should contain element    //*[@id="AuthorizationTypeCode" and contains(text(),'${UserData.Service_Auth1_type}')]
    click element    ${BackToAuthHome}    ## back to auth page
    sleep    2s
    wait until element is visible    //*[@id="MemberCentralAuth-gridContent"]//td[text()='${UserData.Service_Auth2}']
    click element    //*[@id="MemberCentralAuth-gridContent"]//td[text()='${UserData.Service_Auth2}']
    page should contain element    //*[@id="OverAllStatus" and contains(text(),'${UserData.Service_Auth2_status}')]
    page should contain element    //*[@id="AuthorizationTypeCode" and contains(text(),'${UserData.Service_Auth2_type}')]

*** Variables ***
${Auth_Attachment} =    //div[@id="left-nav"]//a[text()='Attachments']
${Char101} =    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*** Keywords ***
Validate Attachmemt in Auth
    [Arguments]    ${AuthValue}
    wait until element is visible    //*[@id="MemberCentralAuth-gridContent"]//td[contains(text(),'${AuthValue}')]    30s
    click element    //*[@id="MemberCentralAuth-gridContent"]//td[contains(text(),'${AuthValue}')]
    wait until element is visible    ${Auth_Attachment}    20s
    click element    ${Auth_Attachment}
    wait until page contains    Authorization - Attachments    20s
    page should contain element    //tbody/tr/td[contains(text(),'${AuthValue}')]
    page should contain element    //tbody/tr/td[contains(text(),'.pdf')]

Verify Attachmemt not attached for Auth
    [Arguments]    ${AuthValue}
    sleep    4s
    log to console    ${AuthValue}
    ${ChkAuth} =  run keyword and return status   element should be visible    //*[@id="MemberCentralAuth-gridContent"]//td[contains(text(),'${AuthValue}')]
    run keyword unless    ${ChkAuth}    Drag And Drop By Offset    //div[@class='k-scrollbar k-scrollbar-vertical']    0    90
    sleep    2s
    scroll element into view    //*[@id="MemberCentralAuth-gridContent"]//td[contains(text(),'${AuthValue}')]
    sleep    1s
    click element    //*[@id="MemberCentralAuth-gridContent"]//td[contains(text(),'${AuthValue}')]
    wait until element is visible    ${Auth_Attachment}    20s
    click element    ${Auth_Attachment}
    wait until page contains    Authorization - Attachments    20s
    page should not contain element    //tbody/tr/td[contains(text(),'${AuthValue}')]
    page should not contain element    //tbody/tr/td[contains(text(),'.pdf')]

Draw signature on Canvas
    [Arguments]    ${Canvas_Xpath}
    wait until page contains element    ${Canvas_Xpath}    10 seconds
    mouse down    ${Canvas_Xpath}
    Drag And Drop By Offset    ${Canvas_Xpath}     90    0
    Drag And Drop By Offset    ${Canvas_Xpath}     -70   0
    Drag And Drop By Offset    ${Canvas_Xpath}     0    70

Draw Dignature and save PlanOfCare
    click element    //label[@for="MedicaidILSignatureTermCode-radio-1078-1"]    #Accepting T&C
    sleep    3s    #To draw the signature
    Draw signature on Canvas    ${Canvas1}
    Draw signature on Canvas    ${Canvas2}
    Draw signature on Canvas    ${Canvas3}
    scroll element into view    //*[@id="RelationshipToMemberCode"]
    select from list by label    id:RelationshipToMemberCode    Guardian
    wait until element is visible    ${btn_SavePlanOfCare}
    click element    ${btn_SavePlanOfCare}
    sleep   10s
    ${var_RiskAgrimentDetails} =    run keyword and return status   page should contain element    //textarea[@id="ControlId3952"]
    run keyword if    ${var_RiskAgrimentDetails}    input text    ${RiskAgrimentDetails}    xyz
    sleep   10s
    ${var_ReviewType} =    run keyword and return status    page should contain element    //*[@name='ReviewType']
    run keyword if    ${var_ReviewType}    select from list by label    name:ReviewType    Administrative Edit
    sleep   15s
#old    ${Member_selfDirectedOption} =    run keyword and return status    page should contain element    //select[@id="ControlId4008"]
#old    run keyword if    ${Member_selfDirectedOption}    select from list by label    id:ControlId4008    Declined
#old    ${Var_DetailsOfReview} =    run keyword and return status    page should contain element    ${DetailsOfReview}
#old    run keyword if    ${Var_DetailsOfReview}    input text    ${DetailsOfReview}    xyz
#old    wait until element is visible    //label[@for="IsCareManagerVerified-radio-694-1"]
    ${Chk_Servce} =    run keyword and return status    page should contain element    //label[@for="IsCareManagerVerified-radio-694-1"]
    run keyword if    ${Chk_Servce}    select the radio button in services
    sleep    10s
    ${var_btn_SavePlanOfCare} =    run keyword and return status    element should be visible    ${btn_SavePlanOfCare}
    run keyword if    ${var_btn_SavePlanOfCare}    click element    ${btn_SavePlanOfCare}
    sleep    10s
#old    ${CHK_ContactType} =    run keyword and return status    page should contain    Please fill all required fields for the highlighted grid line(s) below
# old xpath    #//div[@id='PlanOfCareMemberContact']//tr[@class='k-alt highlighted-row-mandatory']
    ${CHK_ContactType} =    run keyword and return status    page should contain element    //div[@id='PlanOfCareMemberContact']//tr[@class='k-alt k-master-row highlighted-row-mandatory']
    run keyword if    ${CHK_ContactType}    Provide contact type Info and submit PLOC
    sleep    20s
#old    ${CHK_ContactType_1} =    run keyword and return status    page should contain     Some errors occurred. Please see below for details.
#old    run keyword if    ${CHK_ContactType_1}    Provide another contact type Info and submit PLOC

    ${var2_btn_SavePlanOfCare} =    run keyword and return status    element should be visible    ${btn_SavePlanOfCare}
    run keyword if    ${var2_btn_SavePlanOfCare}    click element    ${btn_SavePlanOfCare}
# old   page should contain    Plan of Care has been saved successfully

select the radio button in services
    wait until element is visible    //label[@for="IsCareManagerVerified-radio-694-1"]    20s
    scroll element into view    //label[@for="IsCareManagerVerified-radio-694-1"]
    sleep    1s
    click element    //label[@for="IsCareManagerVerified-radio-694-1" and text()='Yes']

Validate Member Natural/Community Support Info BHPrimary
    [Arguments]    ${UserData}
    sleep    2s
    wait until page contains element    //*[@id="PlanOfCareMemberContact"]//table[@data-role="selectable"]
    sleep    1s
    scroll element into view    //*[@id="PlanOfCareMemberContact"]//table[@data-role="selectable"]
##    scroll element into view    //*[contains(text(),'Member Natural/Community Support Contact Information')]
#    page should contain element    //*[@id="PlanOfCareMemberContact"]//tbody/tr[1]/td[1][text()='test']
    ${Name} =    get table cell    //*[@id="PlanOfCareMemberContact"]//table[@data-role="selectable"]    1    1
    ${Name} =    strip string    ${Name}    mode=both

    ${Phone} =    get table cell    //*[@id="PlanOfCareMemberContact"]//table[@data-role="selectable"]    1    2
    ${Phone} =    strip string    ${Phone}    mode=both

    ${SupportType} =    get table cell    //*[@id="PlanOfCareMemberContact"]//table[@data-role="selectable"]    1    4
    ${SupportType} =    strip string    ${SupportType}    mode=both

    set local variable    ${Name}
    set local variable    ${Phone}

    should be equal as strings    ${Name}    ${UserData.Q73a}
    should be equal as strings    ${Phone}    ${UserData.Q73b}
    should be equal as strings    ${SupportType}    ${UserData.Q73d}

*** Variables ***
${ReviewDate} =    //input[@id="ReviewDate"]
${ReviewType} =    //select[@id="ReviewType"]
${BehavioralHealthCrisisPlan} =    //*[@id="BehavioralHealthCrisisPlan"]/a/u
${PrintPlanOfCare} =    //div[@id="print-PlanofCare"]
${Print_LTSSServicePlan} =    //div[@id="print-LTSSServicePlan"]
${PrintAll} =    //div[@id="print-PrintAll"]
${PLOC_History} =    //a[@id="history-plan-of-care-button" and text()='History']
${PLOC_History1} =    //tbody//tr[1]/td[1]    #//div[@id="PlocHistory-gridContent"]//input[@id="0-PlocHistory-checkbox"]
${PLOC_History2} =    //tbody//tr[2]/td[1]
${PLOC_History1_Details} =    //div[@id="PlocHistory-gridContent"]//tbody/tr[1]/td[2]

*** Keywords ***
Review Type Verification in PLOC
    [Arguments]    ${UserData}
    ${EditStatus1} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus1}    click element    //a[@id="edit-plan-of-care-button"]
    wait until element is visible    ${ReviewType}     20s
    page should contain element    //select[@id="ReviewType"]/option[text()='Administrative Edit']
    select from list by label    id:ReviewType    Administrative Edit
    page should contain element    //select[@id="ReviewType"]/option[text()='Reviewed with Member per Model of Care']
#    input text    ${DetailsOfReview}    ${Char101}${Char101}${Char101}${Char101}${Char101}
#    page should contain element    //*[@id="DetailsAdministrativeEditReview-error" and text()='Details of Review should not exceed 500 characters']
    element should be disabled    ${ReviewDate}
    page should contain element    //input[@id="LateEntry" and @disabled="disabled"]
    select from list by label    id:ReviewType    Reviewed with Member per Model of Care
#    input text    ${DetailsOfReview}    pqr
    sleep    2s
    click element    //label[@for="LateEntry" and text()='Late Entry']
#    click element    //input[@id="LateEntry"]
    sleep    1s
    Enter Curent Date    ${ReviewDate}
    sleep    1s
#    wait until element is visible    ${BehavioralHealthCrisisPlan}    30s
#    scroll element into view    ${BehavioralHealthCrisisPlan}
    wait until element is visible    //*[@id="left-nav"]//*[text()="Attestation"]    40s
    scroll element into view    //*[@id="left-nav"]//*[text()="Attestation"]
    click element    //*[@id="left-nav"]//*[text()="Attestation"]
    sleep    2s
    Select Attestation Radio Buttons
    #sleep    2m
    Draw Dignature and save PlanOfCare
    Verify Auth Details of Services from Autharization    ${UserData}

Check Hostory of Plan Of Care
    [Arguments]    ${UserData}
    sleep    3s
    wait until element is visible    ${PLOC_History}    20s
    click element    ${PLOC_History}
    wait until page contains element    ${PLOC_History1}    20s
    click element    ${PLOC_History1}
    sleep    1s
    click element    ${PLOC_History1_Details}
    element should contain    ${Service_Auth1}    ${UserData.Service_Auth1}
    element should contain    ${Service_Auth2}    ${UserData.Service_Auth2}
    element should contain    //*[@id="PlanOfCareService"]/div[2]/table/tbody/tr[1]/td[6]    ${UserData.Service_Auth1_status}
    element should contain    //*[@id="PlanOfCareService"]/div[2]/table/tbody/tr[2]/td[6]    ${UserData.Service_Auth2_status}
    wait until element is visible    //a[@id="print-button"]//div[@class="plan-of-care-print-drop"]    30s
    click element    //a[@id="print-button"]//div[@class="plan-of-care-print-drop"]
    sleep    1s
#    click element    ${PrintPlanOfCare}     #print
#    back to PLOC page
    click element    ${PLOC_History}
    sleep    1s
    wait until page contains element    ${PLOC_History2}    20s
    click element    ${PLOC_History1}
    sleep    1s
    click element    ${PLOC_History2}
    sleep    1s
    page should contain element    //a[@id="button-ploc-compare" and text()='Compare']

Folloup Plan validation in PLOC BH Primary
    [Arguments]    ${UserData}
    scroll element into view    //*[text()='Follow-Up Plan']
    sleep    2s
    ${Chk_FrequencyOf_Coordinator} =    get text    //select[@id="CareCooridinatorContactFrequency"]//option[@selected="selected"]
    ${Chk_FrequencyOf_Coordinator} =    strip string    ${Chk_FrequencyOf_Coordinator}    mode=both
    log to console    ${Chk_FrequencyOf_Coordinator}
    should be equal as strings    ${Chk_FrequencyOf_Coordinator}    ${UserData.Q98}

    sleep    2s
    wait until element is visible    //select[@id="FollowupType"]//option[@selected="selected"]
    ${FollowupType} =    get text    //select[@id="FollowupType"]//option[@selected="selected"]
    ${FollowupType} =    strip string    ${FollowupType}    mode=both
    log to console    ${FollowupType}
    should be equal as strings    ${FollowupType}    ${UserData.Q100}
    page should contain element    //*[@id='FollowupScheduleDate' and text()='${UserData.Q101}']

Print with and without PHI BH Primary
    [Arguments]    ${UserData}
    click link    Member Central
    wait until element is visible    ${CPCM}    30s
    click element    ${CPCM}
    click element    //span[contains(text(),'${UserData.CaseId}')]
    click element    ${CompAssessment}
    wait until element is visible    ${PrintIcon}    20s
    click element    ${PrintIcon}
    element should be visible    ${WithPHI}
    element should be visible    ${WithoutPHI}
#    click element    ${WithPHI}

Fill BH Primary Assessment
    [Arguments]    ${UserData}
    sleep    4s
    ${CHK_GetStarted} =    run keyword and return status    element should be visible    ${GetStarted}
    run keyword IF    ${CHK_GetStarted}    BH Primary_start with get Started    ${UserData}
    sleep    4s
    ${ResumeBtn} =   run keyword and return status  element should be visible    ${btn_Resume}
    run keyword IF  ${ResumeBtn}    click element    ${btn_resume}
    Demographic    ${UserData}
    Social Determinants of Health (SDOH)    ${UserData}
    Memory    ${UserData}
    General Health, Sensory & Communication    ${UserData}
    Activities of Daily Living    ${UserData}
    Instrumental Activities of Daily Living    ${UserData}
    Health Systems and Status    ${UserData}
    Behavioral Health    ${UserData}
    Residential Living Environment    ${UserData}
    Nutrition    ${UserData}
    Medication     ${UserData}
    Caregiver     ${UserData}
    Social Resources    ${UserData}
    Advance Directives    ${UserData}
    Summary and Conclusions    ${UserData}
    set focus to element    ${BH_ReviewAndSubmit}
    sleep    2s
    double click element    ${BH_ReviewAndSubmit}
    wait until element is visible    ${BH_Submit}    30s
    sleep    5s
    click element    ${BH_Submit}
    sleep    1s
    click element    ${BH_AcknowledgeAndSubmit}
#    click link    Preview & Submit
#    wait until element is visible    //*[text()='Case - Preview Assessment: Comprehensive']
#    click element    ${BH_Submit}
#    wait until element is visible    ${BH_AcknowledgeAndSubmit}
#    click element    ${BH_AcknowledgeAndSubmit}


Keep ALL Exixting Details BH Primary
    [Arguments]    ${UserData}
    click element    ${btn_Reassess}
    sleep    10s
    wait until element is visible    //a[@id="btnkeepExisingData" and contains(text(),'Keep All the Existing Details')]    20s
    click element    //a[@id="btnkeepExisingData" and contains(text(),'Keep All the Existing Details')]
    wait until element is visible    //*[text()='Case - Take Assessment: Comprehensive']    30s
    input text    ${Q1_input}    ${UserData.Q1_updated}
    select from list by label    ${Q4}    ${UserData.Q4}
    click link    Preview & Submit
    wait until element is visible    //*[text()='Case - Preview Assessment: Comprehensive']    20s
    sleep    4s
    click element    ${BH_Submit}
    wait until element is visible    ${BH_AcknowledgeAndSubmit}    30s
    click element    ${BH_AcknowledgeAndSubmit}
    log to console    Changes done in assessment


Demographic
    [Arguments]  ${UserData}
    sleep    2s
    Run keyword Until Success    double click element    ${Demographic}
    sleep    2s
    Run keyword Until Success    input text    ${Q1_input}  ${UserData.Q1}
    sleep    1s
    input text    ${PhoneNumberExtension}     ${UserData.PhoneNumberExtension}
#    input text    ${PhoneNumberExtension}    1234
    select from list by label  ${Q3}  ${UserData.Q3}
    select from list by label    ${Q4}  ${UserData.Q4}
    select radio button     ${Q5}  ${UserData.Q5}
    input text    ${NameOfFacility}  ${UserData.NameOfFacility}
    select from list by label    ${Q6}  ${UserData.Q6}
    select radio button     ${Q7}  ${UserData.Q7}
    select from list by label    ${Q8}  ${UserData.Q8}
    select radio button     ${Q9}  ${UserData.Q9}
    select from list by label    ${Q10}  ${UserData.Q10}
    select checkbox    ${Q11}
    select radio button     ${Q12}  ${UserData.Q12}
    select from list by label    ${Q13}  ${UserData.Q13}
    input text    ${Comment_Detail1}    ${UserData.Comment_Details1}
    select radio button     ${Q14}  ${UserData.Q14}
    wait until element is visible    ${CopmpleteAndNext}    30s
    click element    ${CopmpleteAndNext}


Social Determinants of Health (SDOH)
    [Arguments]  ${UserData}
    sleep    3s
    select radio button     ${Q15}  ${UserData.Q15}
    select radio button     ${Q16}  ${UserData.Q16}
    select radio button     ${Q17}  ${UserData.Q17}
    select checkbox    ${Q18}
    select checkbox    ${BH_Q19}
    #click element    ${BH_Q20}
    select checkbox    ${BH_Q20}
    select checkbox    ${BH_Q21}
    #click element    ${BH_Q21}
    select checkbox    ${BH_Q22}
    sleep    1s
    input text    ${Comment_Detail2}  ${UserData.Comment_Details2}
#   input text    //textarea[@id="SDOHMCD_BH_SDOHMCDQ9"]  ${UserData.Notes&Summary1}
    #input text    xpath://textarea[@id="SDOHMCD_BH_SDOHMCDQ9"]   text
    input text    ${NotesSummary1}  ${UserData.NotesSummary1}
    wait until element is visible    ${CopmpleteAndNext}    30s
    sleep    10s
    click element    ${CopmpleteAndNext}
    sleep    2s


Memory
    [Arguments]  ${UserData}
    sleep    4s
    wait until element is visible    //input[@id='option_0_MEMOMCD_BH_MEMOMCDQ1']    30s
    click element    //input[@id='option_0_MEMOMCD_BH_MEMOMCDQ1']    #${Q23}
    #Run keyword Until Success    select radio button    ${Q23}  ${UserData.Q23}
    select radio button    MEMOMCD_BH_MEMOMCDCRQ2  ${UserData.Q24}
    select radio button    ${BH_Q25}  ${UserData.Q25}
    select radio button    ${BH_Q26}  ${UserData.Q26}
    select radio button    ${BH_Q27}  ${UserData.Q27}
    sleep    2s
  #  set focus to element  ${Notes&Summary2}    "abx"
    input text    ${NotesSummary2}  ${UserData.NotesSummary2}
    click element    ${CopmpleteAndNext}


General Health, Sensory & Communication
    [Arguments]  ${UserData}
    sleep    3s
    select from list by label    ${BH_Q28}  ${UserData.Q28}
    select from list by label    ${BH_Q29}  ${UserData.Q29}
    select from list by label    ${BH_Q30}  ${UserData.Q30}
    select from list by label    ${BH_Q31}  ${UserData.Q31}
    select radio button    ${BH_Q32}  ${UserData.Q32}
    select radio button    ${BH_Q33}  ${UserData.Q33}
    select from list by label    ${BH_Q34}  ${UserData.Q34}
    select from list by label    ${BH_Q35}  ${UserData.Q35}
    select radio button    ${BH_Q36}  ${UserData.Q36}
    select radio button    ${BH_Q37}  ${UserData.Q37}
    sleep    2s
  #  select radio button    ${Q38}  ${UserData.Q38}
    click element    ${BH_Q38}
    select radio button    ${BH_Q39}  ${UserData.Q39}
    input text    ${NotesSummary3}  ${UserData.NotesSummary3}
    click element    ${CopmpleteAndNext}


Activities of Daily Living
    [Arguments]  ${UserData}
    sleep    3s
    select radio button    ${Q40a}  ${UserData.Q40a}
    select radio button    ${Q40b}  ${UserData.Q40b}
    select radio button    ${Q40c}  ${UserData.Q40c}
    select radio button    ${Q40d}  ${UserData.Q40d}
    select radio button    ${Q40e}  ${UserData.Q40e}
    select radio button    ${Q40f}  ${UserData.Q40f}
    select checkbox    ${UsesAssistiveDeviceFor}
    select radio button    ${BH_Q41}  ${UserData.Q41}
    select radio button    ${Q42a}  ${UserData.Q42a}
    select radio button    ${Q42b}  ${UserData.Q42b}
    select radio button    ${Q42c}  ${UserData.Q42c}
    select radio button    ${Q42d}  ${UserData.Q42d}
    select radio button    ${Q42e}  ${UserData.Q42e}
    select radio button    ${Q42f}  ${UserData.Q42f}
    input text    ${NotesSummary4}  ${UserData.NotesSummary4}
    click element    ${CopmpleteAndNext}



Instrumental Activities of Daily Living
    [Arguments]  ${UserData}
    sleep    4s
    select radio button    ${Q43a}  ${UserData.Q43a}
    select radio button    ${Q43b}  ${UserData.Q43b}
    select radio button    ${Q43c}  ${UserData.Q43c}
    select radio button    ${Q43d}  ${UserData.Q43d}
    select radio button    ${Q43e}  ${UserData.Q43e}
    select radio button    ${Q43f}  ${UserData.Q43f}
    select radio button    ${Q43g}  ${UserData.Q43g}
    select radio button    ${Q43h}  ${UserData.Q43h}
    select checkbox    ${UsesAssistiveDeviceFor_2}
    select checkbox    ${UsesAssistiveDeviceFor_4}
    select radio button    ${BH_Q44}  ${UserData.Q44}
    select radio button    ${Q45a}  ${UserData.Q45a}
    select radio button    ${Q45b}  ${UserData.Q45b}
    select radio button    ${Q45c}  ${UserData.Q45c}
    select radio button    ${Q45d}  ${UserData.Q45d}
    select radio button    ${Q45e}  ${UserData.Q45e}
    select radio button    ${Q45f}  ${UserData.Q45f}
    select radio button    ${Q45g}  ${UserData.Q45g}
    select radio button    ${Q45h}  ${UserData.Q45h}
    input text    ${NotesSummary5}  ${UserData.NotesSummary5}
    click element    ${CopmpleteAndNext}



Health Systems and Status
    [Arguments]  ${UserData}
    sleep    4s
    input text    ${BH_Q46}  ${UserData.Q46}
    input text    ${BH_Q47}  ${UserData.Q47}
    select radio button    ${BH_Q48}   ${UserData.Q48}
    select radio button    ${Cardiovascular_Heart}    ${UserData.Cardiovascular_Heart}
    select radio button    ${Respiratory}   ${UserData.Respiratory}
    select radio button    ${Endocrine_Glands}    ${UserData.Endocrine_Glands}
    select radio button    ${Musculoskeletal}   ${UserData.Musculoskeletal}
    select radio button    ${Gastrointestinal}   ${UserData.Gastrointestinal}
    select radio button    ${Neurological}   ${UserData.Neurological}
    select radio button    ${Renal}   ${UserData.Renal}
    select radio button    ${RenalDetails_Dialysis}   ${UserData.RenalDetails_Dialysis}
    input text    ${AdditionalRenalDetails}    ${UserData.AdditionalRenalDetails}
    select radio button    ${Blood_Hematological}   ${UserData.Blood_Hematological}
    select radio button    ${InfectiousDisease}   ${UserData.InfectiousDisease}
    select radio button    ${Skin_Integumentary}   ${UserData.Skin_Integumentary}
    select radio button    ${Reproductive}   ${UserData.Reproductive}
    select radio button    ${EyesEarsNoseThroat}   ${UserData.EyesEarsNoseThroat}
    select radio button    ${Cancer}   ${UserData.Cancer}
    select radio button    ${RareorOther}   ${UserData.RareorOther}
    select radio button    ${BehavioralHealth}   ${UserData.BehavioralHealth}
    select from list by label    ${BH_Q50}    ${UserData.Q50}
    input text    ${Description}    ${UserData.Description}
    select checkbox    ${ActivityRestrictions}
    select checkbox    ${No_MemberDeclines}
    input text    ${DetailsOfResources}    ${UserData.DetailsOfResources}
    input text    ${healthstatusdetails}    ${UserData.healthstatusdetails}
#    scroll element into view    //*[@id="option_0_HSSMCDGRIDQ22_1_HSSMCD_BH_HSSMCDQ46"]
    select radio button    ${BH_Q51}    ${UserData.Q51}
    select radio button    ${BH_Q52}    ${UserData.Q52}
#    select radio button    ${Q52a}    ${UserData.Q52a}
    click element    //*[@id="option_0_HSSMCDGRIDQ22_1_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52b}    ${UserData.Q52b}
    click element    //*[@id="option_1_HSSMCDGRIDQ23_0_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52c}    ${UserData.Q52c}
    click element    //*[@id="option_2_HSSMCDGRIDQ24_1_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52d}    ${UserData.Q52d}
    click element    //*[@id="option_3_HSSMCDGRIDQ25_1_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52e}    ${UserData.Q52e}
    click element    //*[@id="option_4_HSSMCDGRIDQ26_0_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52f}    ${UserData.Q52f}
    click element    //*[@id="option_5_HSSMCDGRIDQ27_0_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52g}    ${UserData.Q52g}
    click element    //*[@id="option_6_HSSMCDGRIDQ28_1_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52h}    ${UserData.Q52h}
    click element    //*[@id="option_7_HSSMCDGRIDQ29_0_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52i}    ${UserData.Q52i}
    click element    //*[@id="option_8_HSSMCDGRIDQ30_1_HSSMCD_BH_HSSMCDQ46"]
#    select radio button    ${Q52j}    ${UserData.Q52j}
    click element    //*[@id="option_9_HSSMCDGRIDQ31_1_HSSMCD_BH_HSSMCDQ46"]
    set selenium implicit wait    10s
    #select radio button    ${BH_SelfNeglect1}    ${UserData.SelfNeglect}
    scroll element into view    //input[@name='HSSMCD_BH_HSSMCDQ46a' and @value='No']
    click element    //input[@name='HSSMCD_BH_HSSMCDQ46a' and @value='No']
    select radio button    ${BH_Q53}    ${UserData.Q53}
    sleep    5s
    select radio button    ${BH_Q54}    ${UserData.Q54}
    #click element    //div[@role="radiogroup"]//div//input[@id="option_1_HSSMCD_BH_HSSMCDQ49"]
    input text    ${NotesSummary6}  ${UserData.NotesSummary6}
    click element    ${CopmpleteAndNext}


Behavioral Health
    [Arguments]  ${UserData}
    sleep  3s
    wait until element is visible    ${BH_Q55}
    #select radio button     ${Q55}    ${UserData.Q55}
    click element    ${BH_Q55}
    #sleep  3s
    select from list by label    ${BH_Q56}    ${UserData.Q56}
    select from list by label    ${BH_Q57}    ${UserData.Q57}
    select from list by label    ${BH_Q58}    ${UserData.Q58}
    select from list by label    ${BH_Q59}    ${UserData.Q59}
    select radio button     ${Q60a}    ${UserData.Q60a}
    select radio button     ${Q60b}    ${UserData.Q60b}
    select from list by label    ${BH_Q61}    ${UserData.Q61}
    select radio button     ${BH_Q62}    ${UserData.Q62}
    input text    ${BH_Q62Details}    ${UserData.Q62Details}
    select radio button     ${BH_Q62a}    ${UserData.Q62a}
    input text    ${BH_Q62aDetails}     ${UserData.Q62aDetails}
    select radio button     ${BH_Q62b}    ${UserData.Q62b}
    select radio button     ${BH_Q63}    ${UserData.Q63}
    input text    ${Q64a}    ${UserData.Q64a}
    input text    ${Q64b}    ${UserData.Q64b}
    input text    ${Q64c}    ${UserData.Q64c}
    input text    ${Q64d}    ${UserData.Q64d}
    input text    ${Q64e}    ${UserData.Q64e}
    input text    ${Q64f}    ${UserData.Q64f}
    input text    ${NotesSummary7}    ${UserData.NotesSummary7}
    click element    ${CopmpleteAndNext}



Residential Living Environment
    [Arguments]  ${UserData}
    sleep    3s
    select from list by label    ${BH_Q65}    ${UserData.Q65}
    sleep    2s
    select checkbox    ${BH_Q66a}
    select checkbox    ${BH_Q66b}
    select checkbox    ${BH_Q66c}
    select checkbox    ${BH_Q66d}
    wait until page contains element    xpath://input[@id="option_3_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q5"]
    Run keyword Until Success    select checkbox    ${BH_Q66e}
    #select checkbox    id:option_3_RESIMCD_BH_RESIMCD_SQ2_RESIMCDS2Q5   #${Q66e}
    #sleep    5s
    select checkbox    ${BH_Q66f}
    wait until page contains element    ${Q66g_Xpath}
    Run keyword Until Success    select checkbox    ${BH_Q66g}
    select checkbox    ${BH_Q66h}
    input text    ${BH_Q66i}    ${UserData.Q66i}
    select radio button    ${BH_Q67}    ${UserData.Q67}
    input text    ${NotesSummary8}    ${UserData.NotesSummary8}
    click element    ${CopmpleteAndNext}


Nutrition
    [Arguments]  ${UserData}
    sleep    3s
    select radio button    ${BH_Q68}    ${UserData.Q68}
    select radio button    ${BH_Q69}    ${UserData.Q69}
    select radio button    ${BH_Q70}    ${UserData.Q70}
    input text    ${Q70_ft}    ${UserData.Q70_ft}
    input text    ${Q70_inch}    ${UserData.Q70_inch}
    input text    ${NotesSummary9}    ${UserData.NotesSummary9}
    click element    ${CopmpleteAndNext}

Medication
    [Arguments]  ${UserData}
    sleep    3s
    input text    ${BH_Q72a}    ${UserData.Q72a}
    select from list by label    ${BH_Q72b}    ${UserData.Q72b_1}
    select from list by label    ${BH_Q72b}    ${UserData.Q72b_2}
    input text    ${BH_Q73a}    ${UserData.Q73a}
    input text    ${BH_Q73b}    ${UserData.Q73b}
    input text    ${BH_Q73c}    ${UserData.Q73c}
    select from list by label    ${BH_Q73d}    ${UserData.Q73d}
    input text    ${BH_Q73e}    ${UserData.Q73e}
    input text    ${BH_Q73f}    ${UserData.Q73f}
    input text    ${BH_Q74}    ${UserData.Q74}
    input text    ${NotesSummary10}    ${UserData.NotesSummary10}
    click element    ${CopmpleteAndNext}



Caregiver
    [Arguments]  ${UserData}
    sleep    3s
    select radio button    ${BH_Q75}    ${UserData.Q75}
    input text    ${BH_Q76a}    ${UserData.Q76a}
    input text    ${BH_Q76b}    ${UserData.Q76b}
    input text    ${BH_Q76c}    ${UserData.Q76c}
    Run keyword Until Success    input text    ${Caregiver_Ph_No}    ${UserData.Caregiver_Ph_No}
    select radio button    ${BH_Q77}    ${UserData.Q77}
    select radio button    ${BH_Q78}    ${UserData.Q78}
    select from list by label    ${BH_Q79}    ${UserData.Q79}
    select checkbox    ${BH_Q80}
    select radio button    ${BH_Q81}    ${UserData.Q81}
    select radio button    ${BH_Q82}    ${UserData.Q82}
    select from list by label    ${BH_Q83}    ${UserData.Q83}
    input text    ${BH_Q84}    ${UserData.Q84}
    select radio button    ${BH_Q85}    ${UserData.Q85}
    select radio button    ${BH_Q86}    ${UserData.Q86}
    select radio button    ${BH_Q87}    ${UserData.Q87}
#    select radio button    ${BH_Q88}    ${UserData.Q88}
    ${RadioButton1}    Get WebElement    ${BH_Q88}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton1}
    select radio button    ${BH_Q89a}    ${UserData.Q89a}
    select radio button    ${BH_Q89b}    ${UserData.Q89b}
    select radio button    ${BH_Q89c}    ${UserData.Q89c}
    select radio button    ${BH_Q89d}    ${UserData.Q89d}
    select radio button    ${BH_Q89e}    ${UserData.Q89e}
    select radio button    ${BH_Q89f}    ${UserData.Q89f}
    select radio button    ${BH_Q89g}    ${UserData.Q89g}
    select radio button    ${BH_Q89h}    ${UserData.Q89h}
    input text    ${NotesSummary11}    ${UserData.NotesSummary11}
    click element    ${CopmpleteAndNext}




Social Resources
    [Arguments]  ${UserData}
    sleep    3s
    Run keyword Until Success    select radio button    ${BH_Q90a}    ${UserData.Q90a}
    select radio button    ${BH_Q90b}    ${UserData.Q90b}
    select radio button    ${BH_Q90c}    ${UserData.Q90c}
    select radio button    ${BH_Q92}    ${UserData.Q92}
    select radio button    ${BH_Q93}    ${UserData.Q93}
    select radio button    ${BH_Q94}    ${UserData.Q94}
    input text    ${NotesSummary12}    ${UserData.NotesSummary12}
    click element    ${CopmpleteAndNext}


Advance Directives
    [Arguments]  ${UserData}
    sleep    3s
    select radio button    ${BH_Q95}    ${UserData.Q95}
    select checkbox    ${BH_Q96a}
    select checkbox    ${BH_Q96b}
    input text    ${NotesSummary13}    ${UserData.NotesSummary13}
    click element    ${CopmpleteAndNext}


Summary and Conclusions
    [Arguments]  ${UserData}
    sleep    3s
    select from list by label    ${BH_Q97}    ${UserData.Q97}
    select from list by label    ${BH_Q98}    ${UserData.Q98}
    input text    ${BH_Q99}    ${UserData.Q99}
    sleep    1s
    select from list by label    ${BH_Q100}    ${UserData.Q100}
    Run keyword Until Success    input text    ${BH_Q101}    ${UserData.Q101}
    Run keyword Until Success    select radio button    ${BH_Q102}    ${UserData.Q102}
    input text    ${NotesSummary14}    ${UserData.NotesSummary14}
    click element    //h3[@id="assessmentPageTitle"]

Select Attestation Radio Buttons
    ${RadioButton1}    Get WebElement    //label[@for="ControlId3973-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton1}

    ${RadioButton2}    Get WebElement    //label[@for="ControlId3974-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton2}

    ${RadioButton3}    Get WebElement    //label[@for="ControlId3975-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton3}

    ${RadioButton4}    Get WebElement    //label[@for="ControlId3976-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton4}

    ${RadioButton5}    Get WebElement    //label[@for="ControlId3977-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton5}

    ${RadioButton6}    Get WebElement    //label[@for="ControlId3978-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton6}

    ${RadioButton7}    Get WebElement    //label[@for="ControlId3979-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton7}

    ${RadioButton8}    Get WebElement    //label[@for="ControlId3980-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton8}

    ${RadioButton9}    Get WebElement    //label[@for="ControlId3981-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton9}

    ${RadioButton10}    Get WebElement    //label[@for="ControlId3983-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton10}

    ${RadioButton11}    Get WebElement    //label[@for="ControlId3984-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton11}

    ${RadioButton12}    Get WebElement    //label[@for="ControlId3985-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton12}

    ${RadioButton13}    Get WebElement    //label[@for="ControlId3986-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton13}

    ${RadioButton14}    Get WebElement    //label[@for="ControlId3987-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton14}

    ${RadioButton15}    Get WebElement    //label[@for="ControlId3988-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton15}

    ${RadioButton16}    Get WebElement    //label[@for="ControlId3989-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton16}

    ${RadioButton17}    Get WebElement    //label[@for="ControlId3990-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton17}

    ${RadioButton18}    Get WebElement    //label[@for="ControlId4226-radio-0-1"]
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton18}

    scroll element into view    //span[@for="ControlId3975"]
    sleep    2s
    page should contain    APS: 1-866-800-1409
    page should contain    OIG: 1-800-368-1463
    page should contain    SLF Hotline: 1-800-226-0768
    page should contain    Nursing Home Hotline: 1-800-252-4343

    scroll element into view    //span[@for="ControlId3980"]
    sleep    2s
    page should contain    24 hour Nurse  Advice Line: 1-800-622-9529
    page should contain    Customer Service: 1-800-787-3311
    page should contain    Behavioral Health Crisis Line: 1-855-371-9234

#    element text should be    //span[@for="ControlId3980"]/span/br[2]    Customer Service: 1-800-787-3311


Run keyword Until Success
    [Arguments]   ${KW}  @{KWARGS}
    wait until keyword succeeds  10s  1s    ${KW}  @{KWARGS}

##### Amol Pawar: 09/30/2021   Changes For IL Exploratory 01 (POA_PHI information)
*** Variables ***
${Edit_AltInfo} =    //a[@id='editAlternateInfo' and text()='Edit']
${EnterAlternateInfo} =    //a[@id="enterAlternateInfo" and text()='Enter Alternate Info']
${POAName} =    //input[@id='POAName']
${POAPHI_Chkbox} =    (//label[@for='IsPHIChecked'])[2]
${POARelationship} =    //input[@id='POARelationship']
${POAPhoneNumber} =    //input[@id='POAPhoneNumber']
${POAAddress} =    //input[@id='POAAddress']
${saveAlternateInfo} =    //a[@id='saveAlternateInfo']

*** Keywords ***
Fill POA_PHI information and save
    [Arguments]    ${UserData}
    sleep    8s
    set selenium implicit wait    20s
#    wait until element is visible    ${Edit_AltInfo}    20s
    ${Chk_EnterAlternateInfo} =    run keyword and return status    element should be visible    ${EnterAlternateInfo}    30s
    run keyword if    ${Chk_EnterAlternateInfo}    click element    ${EnterAlternateInfo}
    sleep    4s
    ${Chk_Edit_AltInfo} =    run keyword and return status    element should be visible    ${Edit_AltInfo}    30s
    run keyword if    ${Chk_Edit_AltInfo}    click element    ${Edit_AltInfo}
    sleep    2s
    scroll element into view    ${POAPHI_Chkbox}
    sleep    1s
    ${Chk_POAName} =    run keyword and return status    element should be visible    ${POAName}    30s
    run keyword if    ${Chk_POAName}    Enter POA_PHI information    ${UserData}
    ${Chk_POAName1} =    run keyword and return status    element should not be visible    ${POAName}
    run keyword if    ${Chk_POAName1}    select POA_PHI checkbox and Provide POA_PHI info    ${UserData}

Enter POA_PHI information
    [Arguments]    ${UserData}
    sleep    2s
    input text    ${POAName}    ${UserData.POAName}
    input text    ${POARelationship}    ${UserData.POARelationship}
    input text    ${POAPhoneNumber}    ${UserData.POAPhoneNumber}
    input text    ${POAAddress}    ${UserData.POAAddress}
    set focus to element    ${saveAlternateInfo}
    sleep    1s
    click link    ${saveAlternateInfo}

select POA_PHI checkbox and Provide POA_PHI info
    [Arguments]    ${UserData}
    click element    ${POAPHI_Chkbox}
    wait until element is visible    ${POAName}    10s
    Enter POA_PHI information    ${UserData}

LTC navigate to CompAssessment
    [Arguments]    ${UserData}
    click link  Member Central
    click element    ${CPCM}
    sleep    2s
    click element    //span[contains(text(),'${UserData.LTC_CaseId}')]
    click element    ${CompAssessment}
    sleep    4s
    ${Reassess} =   run keyword and return status  element should be visible    ${btn_Reassess}
    run keyword IF    ${Reassess}   Reset to ALL New   ${UserData}

Validate POA_PHI information in MLOC
    [Arguments]    ${UserData}
    sleep    3s
    log to console    Assessment is submitted
    Navigate to Medicaid Plan of Care
    sleep    2s
    ${EditStatus} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus}    click element    //a[@id="edit-plan-of-care-button"]
    sleep    1s
    scroll element into view    //*[contains(text(),'Member Natural/Community Support Contact Information')]
    table should contain    //div[@id="PlanOfCareMemberContact"]    ${UserData.POAName}
    table should contain    //div[@id="PlanOfCareMemberContact"]    ${UserData.POAPhoneNumber}

Exploratory Fill Remaining Details and SubmitPLOC
    scroll element into view    //*[@id="Services"]/a
    sleep    2s
    click element    //label[@for="IsCareManagerVerified-radio-694-1"]
    wait until element is visible    ${ReviewType}     20s
    page should contain element    //select[@id="ReviewType"]/option[text()='Administrative Edit']
    select from list by label    id:ReviewType    Administrative Edit
    page should contain element    //select[@id="ReviewType"]/option[text()='Reviewed with Member per Model of Care']
#    input text    ${DetailsOfReview}    ${Char101}${Char101}${Char101}${Char101}${Char101}
#    page should contain element    //*[@id="DetailsAdministrativeEditReview-error" and text()='Details of Review should not exceed 500 characters']
    element should be disabled    ${ReviewDate}
    page should contain element    //input[@id="LateEntry" and @disabled="disabled"]
    select from list by label    id:ReviewType    Reviewed with Member per Model of Care
#    input text    ${DetailsOfReview}    pqr
    sleep    2s
    click element    //label[@for="LateEntry" and text()='Late Entry']
    sleep    1s
    Enter Curent Date    ${ReviewDate}
    sleep    1s
#    scroll element into view    //label[@for="ControlId3973-radio-0-1"]
#    sleep    2s
    wait until element is visible    //*[@id="left-nav"]//*[text()="Attestation"]    30s
    click element    //*[@id="left-nav"]//*[text()="Attestation"]
    sleep    2s
    Select Attestation Radio Buttons
    #sleep    2m
    click element    //label[@for="MedicaidILSignatureTermCode-radio-1078-1"]    #Accepting T&C
    sleep    3s    #To draw the signature
    Draw signature on Canvas    ${Canvas1}
    Draw signature on Canvas    ${Canvas2}
    Draw signature on Canvas    ${Canvas3}
    scroll element into view    //*[@id="RelationshipToMemberCode"]
    select from list by label    id:RelationshipToMemberCode    Guardian
    wait until element is visible    ${btn_SavePlanOfCare}
    click element    ${btn_SavePlanOfCare}

#######Changes by Amol Pawar:    for IL Exploritory 02 (Backup provider fields Mandatory)
Navigate to MPOC and Add Services for IL Exploritory 02
    [Arguments]    ${UserData}
    sleep    10s
    log to console    Assessment is submitted
    Navigate to Medicaid Plan of Care
    sleep    2s
    ${EditStatus} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus}    click element    //a[@id="edit-plan-of-care-button"]
    Adding Services    ${UserData}
    Adding Services for Exploritory    ${UserData}    ${UserData.SourceType1}    ${UserData.Service1}
    Services Save And Add
    Adding Services for Exploritory    ${UserData}    ${UserData.SourceType2}    ${UserData.Service2}
    Services Save And Add
    Adding Services for Exploritory    ${UserData}    ${UserData.SourceType3}    ${UserData.Service3}
    Services Save And Add
    Adding Services for Exploritory    ${UserData}    ${UserData.SourceType4}    ${UserData.Service4}
    Services Save And Add
    Adding Services for Exploritory    ${UserData}    ${UserData.SourceType5}    ${UserData.Service5}
    Services Save And Add
    Adding Services for Exploritory    ${UserData}    ${UserData.SourceType6}    ${UserData.Service6}
    wait until page contains element    //a[@id="services-save-and-add-btn"]
    click link    ${Services_Save_btn}
    sleep    2s
    ${DuplicateService} =    run keyword and return status    element should be visible    //*[@id="modal-header-title" and text()='Duplicate Service']
    run keyword if    ${DuplicateService}    click element  //*[@id="btnYes"]
    sleep    2s

Adding Services for Exploritory
    [Arguments]    ${UserData}    ${SourceType}    ${Service}
    sleep    2s
    select from list by index    id:PlanOfCareServiceSourceCode    0
    sleep    1s
    select from list by label    id:PlanOfCareServiceSourceCode    ${UserData.Source}
    sleep    4s
    wait until page contains    Service Information    20s
    set selenium implicit wait    20s
    run keyword if    '${UserData.ServiceStartDate}' == '${EMPTY}'    Enter Curent Date    //*[@id="StartDate"]
    ...    ELSE    input text    //*[@id="StartDate"]    ${UserData.ServiceStartDate}
    sleep    1s
    ${DateToday} =      get current date    result_format=%m/%d/%Y
    ${DateAfter2} =        Add Time To Date  ${DateToday}    +2 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    run keyword if    '${UserData.ServiceEndDate}' == '${EMPTY}'    input text    //*[@id="EndDate"]    ${DateAfter2}
    ...    ELSE    input text    //*[@id="EndDate"]    ${UserData.ServiceEndDate}
    sleep    1s
    select from list by label    id:ServiceType    ${SourceType}
    sleep    5s
    wait until element is visible    //select[@id="ServiceDescription"]    20s
    set selenium implicit wait    20s
    select from list by label    id:ServiceDescription   ${Service}
    select from list by label    //select[@id="LtssAuthScope"]   Other - Please Specify
    wait until element is visible    //textarea[@id="ScopeOthers"]    10s
    input text    //textarea[@id="ScopeOthers"]    ${UserData.ScopeOthers}
    input text    //textarea[@id="BarrierOthers"]    ${UserData.BarrierOthers}
    scroll element into view    ${Add_Services_btn}
    click element    ${Add_Services_btn}
    wait until page contains element    //*[text()='Frequency']    30s
    select from list by index    id:Frequency    0
    sleep    1s
    select from list by label    id:Frequency    ${UserData.Friquency}
    sleep    1s
    click element    //label[@for="CalculateFrequencyBy-radio-523-2"]
    ${chk_TotalUnits} =  run keyword and return status    element should be visible    //input[@id="Total"]
    run keyword if    ${chk_TotalUnits}    input text    //input[@id="Total"]    ${UserData.TotalUnits}
    ${chk_Units} =  run keyword and return status    element should be visible    //input[@id="Sunday"]
    run keyword if    ${chk_Units}    Fill the weekly Units    ${UserData}
    sleep    1s
    run keyword if    '${SourceType}' == 'ADULT DAY CARE'    Check Backup Provider Fields Mendatory
    run keyword if    '${SourceType}' == 'HOME HEALTH CARE SERVICES'    Check Backup Provider Fields Mendatory
    run keyword if    '${SourceType}' == 'HOMEMAKER'    Check Backup Provider Fields Mendatory
    run keyword if    '${SourceType}' == 'PERSONAL CARE'    Check Backup Provider Fields Mendatory
    run keyword if    '${SourceType}' == 'NURSING SERVICES'    Check Backup Provider Fields Mendatory
    log to console    ${SourceType}
    sleep    2s
    click link    ${Save_SarviceDetails}
    wait until page contains    Provider Information
    ${Chk_Provider} =    run keyword and return status    page should contain element    //*[@id="Provider"]/div[2]/table/tbody/tr[1]
    run keyword if    ${Chk_Provider}    Select the Provider
    ...    ELSE    Select the Default Provider
    sleep    4s
    wait until element is visible    //*[@id="clear-primary-provider-summary"]//img    30s
    click element    //*[@for="PlocAuthorizationTypeCode-radio-1-7"]     #Auth Type
    select from list by label    id:PlocRequestTypeCode    ${UserData.RequestType}

Services Save And Add
    wait until page contains element    //a[@id="services-save-and-add-btn"]
    click link    ${Services_SaveAndAdd_btn}
    sleep    2s
    ${DuplicateService} =    run keyword and return status    element should be visible    //*[@id="modal-header-title" and text()='Duplicate Service']
    run keyword if    ${DuplicateService}    click element  //*[@id="btnYes"]
    sleep    2s

######## changes for IL Exploratory 03
*** Variables ***
${ServiceTypePath} =    //*[@id="PlanOfCareService"]/div[2]/table/tbody//tr//td[text()='HOMEMAKER']
${AuthStatusPath} =    //div[@id="OverAllStatus"]
${AuthValuePath} =    //div[@id="AuthId"]

*** Keywords ***
Verify Attachment for Pended Auth
    wait until element is visible    ${ServiceTypePath}    30s
    scroll element into view    ${ServiceTypePath}
    sleep    1s
    click element    ${ServiceTypePath}
    wait until element is visible    ${AuthStatusPath}    20s
    scroll element into view    ${AuthStatusPath}
    sleep    1s
    ${OverAllStatus} =    get text    ${AuthStatusPath}
    ${OverAllStatus} =    strip string    ${OverAllStatus}    mode=both
    set local variable    ${OverAllStatus}
    log to console    ${OverAllStatus}
    scroll element into view    ${AuthValuePath}
    sleep    1s
    ${AuthValue} =    get text    ${AuthValuePath}
    ${AuthValue} =    strip string    ${AuthValue}    mode=both
    set local variable    ${AuthValue}
    log to console    ${AuthValue}
    click element    //a[@id="view-service-cancel-btn"]      #cancel link
    wait until element is visible    ${ServiceTypePath}    30s
    click link    Member Central
    sleep    2s
    navigate authorization page
    sleep    1s
    run keyword if    '${OverAllStatus}' == 'Pended'    Verify Attachmemt not attached for Auth    ${AuthValue}


Navigate to MPLOC and Add Serivies
    [Arguments]    ${UserData}
    sleep    3s
    log to console    Assessment is submitted
    Navigate to Medicaid Plan of Care
    sleep    2s
    ${EditStatus} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus}    click element    //a[@id="edit-plan-of-care-button"]
    scroll element into view    //*[@id="Services"]/a
    sleep    2s
    click element    //label[@for="IsCareManagerVerified-radio-694-1"]
    sleep    2s
    click element    //a[@id="add-services-goals"]     #Add servies
    wait until page contains    Add Service    20s
    wait until page contains    Source
    select from list by index    id:PlanOfCareServiceSourceCode    0
    sleep    1s
    select from list by label    id:PlanOfCareServiceSourceCode    ${UserData.Source}
    sleep    4s
    wait until page contains    Service Information    20s
    set selenium implicit wait    20s
    Adding Services Again    ${UserData}


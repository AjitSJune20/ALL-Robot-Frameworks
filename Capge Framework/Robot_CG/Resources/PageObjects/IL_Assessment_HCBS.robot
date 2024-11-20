*** Settings ***
Documentation  This script is used to Submit IL Assessment for HCBS

Library  SeleniumLibrary
Library  String
Resource  ../Definitions/HumanaGui.robot
Resource  ../PageObjects/IL_Assessment.robot
Resource  ../PageObjects/SC_E2E_Regession_PO.robot


*** Variables ***
${HCBS_CaseID} =     xpath://div[@class="ui-widget-content slick-row even"]//child::div[@class="slick-cell l2 r2"]
#HCBS_Demographic
${HCBS_Q1} =    name:DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q1
${HCBS_WaiverCodeDate} =    xpath://input[@id="DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q1a"]
${HCBS_ILDonScore} =   xpath://input[@id="DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q2"]
${HCBS_Q2} =    xpath://input[@id="DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q3a"]
${HCBS_PhoneNumExtension} =    xpath://input[@id="DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q3b"]
${HCBS_Q4} =    name:DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q6
${HCBS_Q5} =    name:DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q7
${HCBS_Q6Xpath} =    //label[@for="option_0_DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q7b"]
#${HCBS_Q6} =    DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q7b
${HCBS_Q6a} =    DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q7e
${HCBS_Q7} =    name:DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q7b1
${HCBS_Q8} =    DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q8
${HCBS_Q9} =    name:DEMOMCD_HCBS_DEMOMCDQ1
${HCBS_Q10} =    DEMOMCD_HCBS_DEMOMCDQ2
${HCBS_Q11} =    name:DEMOMCD_HCBS_DEMOMCDQ4a
${HCBS_Q12} =    id:option_0_DEMOMCD_HCBS_DEMOMCDQ5
${HCBS_Q13} =    DEMOMCD_HCBS_DEMOMCDQ6
${HCBS_Q14} =    name:DEMOMCD_HCBS_DEMOMCDQ7
${HCBS_Q14a} =    DEMOMCD_HCBS_DEMOMCDQ8
${HCBS_Q15} =    DEMOMCD_HCBS_DEMOMCDQ9
${HCBS_EmergencyRiskLevel} =     name:DEMOMCD_HCBS_DEMOMCDQ9a
${HCBS_EmergencyRiskLevelDetails} =    xpath://textarea[@id="DEMOMCD_HCBS_DEMOMCDQ9b"]

#HCBS_Social Determinants of Health (SDOH
#${HCBS_Q16} =    xpath://label[@for="option_0_SDOHMCD_HCBS_SDOHMCDQ1"]  #SDOHMCD_HCBS_SDOHMCDQ1
${HCBS_Q17} =    xpath://label[@for="option_0_SDOHMCD_HCBS_SDOHMCDQ2"]   #SDOHMCD_HCBS_SDOHMCDQ2
${HCBS_Q16} =    SDOHMCD_HCBS_SDOHMCDQ1
#${HCBS_Q17} =    SDOHMCD_HCBS_SDOHMCDQ2
${HCBS_Q18} =    SDOHMCD_HCBS_SDOHMCDQ3
${HCBS_Q19} =    id:option_2_SDOHMCD_HCBS_SDOHMCDQ4
${HCBS_Q20} =    id:option_2_SDOHMCD_HCBS_SDOHMCDQ5
${HCBS_Q21} =    id:option_0_SDOHMCD_HCBS_SDOHMCDQ6
${HCBS_Q22} =    id:option_2_SDOHMCD_HCBS_SDOHMCDQ7
${HCBS_Q23} =    id:option_1_SDOHMCD_HCBS_SDOHMCDQ8
${HCBS_Comment_Details1} =    xpath://input[@id="SDOHMCD_HCBS_SDOHMCDQ8a"]
${HCBS_NotesSummary1} =    xpath://textarea[@id="SDOHMCD_HCBS_SDOHMCDQ9"]

#HCBS_Memory
${HCBS_Q24} =    MEMOMCD_HCBS_MEMOMCDQ1
${HCBS_Q25} =    MEMOMCD_HCBS_MEMOMCDCRQ2
${HCBS_Q26} =    MEMOMCD_HCBS_MEMOMCDQ7
${HCBS_Q27} =    MEMOMCD_HCBS_MEMOMCDQ8
${HCBS_Q28} =    MEMOMCD_HCBS_MEMOMCDQ9
${HCBS_NotesSummary2} =    xpath://textarea[@id="MEMOMCD_HCBS_MEMOMCDQ11"]

#HCBS_General Health, Sensory & Communication
${HCBS_Q29} =    name:GENEMCD_HCBS_GENEMCDQ1
${HCBS_Q30} =    name:GENEMCD_HCBS_GENEMCDQ2
${HCBS_Q31} =    name:GENEMCD_HCBS_GENEMCDQ3
${HCBS_Q32} =    name:GENEMCD_HCBS_GENEMCDQ4
${HCBS_Q33} =    GENEMCD_HCBS_GENEMCDQ5
${HCBS_Q34} =    GENEMCD_HCBS_GENEMCDQ8
${HCBS_Q35} =    name:GENEMCD_HCBS_GENEMCDQ11
${HCBS_Q36} =    name:GENEMCD_HCBS_GENEMCDQ12
${HCBS_Q37} =    GENEMCD_HCBS_GENEMCDQ13
${HCBS_Q38} =    GENEMCD_HCBS_GENEMCDQ16
${HCBS_Q39} =    GENEMCD_HCBS_GENEMCDQ19
${HCBS_Q40} =    GENEMCD_HCBS_GENEMCDQ21
${HCBS_NotesSummary3} =    xpath://textarea[@id="GENEMCD_HCBS_GENEMCDQ23"]

#Activities of Daily Living
${HCBS_Q41a} =    ADLMCDGRID1Q1
${HCBS_Q41b} =    ADLMCDGRID1Q2
${HCBS_Q41c} =    ADLMCDGRID1Q3
${HCBS_Q41d} =    ADLMCDGRID1Q4
${HCBS_Q41e} =    ADLMCDGRID1Q5
${HCBS_Q41f} =    ADLMCDGRID1Q6
${HCBS_Q41UsesAsistiveDeviceFor} =    id:option_0_ADLMCD_HCBS_ADLMCDQ1
${HCBS_Q42} =    ADLMCD_HCBS_ADLMCDQ2
${HCBS_Q43a} =    ADLMCDGRID2Q1
${HCBS_Q43b} =    ADLMCDGRID2Q2
${HCBS_Q43c} =    ADLMCDGRID2Q3
${HCBS_Q43d} =    ADLMCDGRID2Q4
${HCBS_Q43e} =    ADLMCDGRID2Q5
${HCBS_Q43f} =    ADLMCDGRID2Q6
${HCBS_NotesSummary4} =    xpath://textarea[@id="ADLMCD_HCBS_ADLMCDQ4"]

#HCBS_Instrumental Activities of Daily Living
${HCBS_Q44a} =   IADLMCDQ1a
${HCBS_Q44b} =   IADLMCDQ1b
${HCBS_Q44c} =   IADLMCDQ1c
${HCBS_Q44d} =   IADLMCDQ1d
${HCBS_Q44e} =   IADLMCDQ1e
${HCBS_Q44f} =   IADLMCDQ1f
${HCBS_Q44g} =   IADLMCDQ1g
${HCBS_Q44h} =   IADLMCDQ1h
${HCBS_Q44UsesAsistiveDeviceFor} =    id:option_0_IADLMCD_HCBS_IADLMCDQ1
${HCBS_Q45} =    IADLMCD_HCBS_IADLMCDQ2a
${HCBS_Q46a} =   IADLMCDQ3a
${HCBS_Q46b} =   IADLMCDQ3b
${HCBS_Q46c} =   IADLMCDQ3c
${HCBS_Q46d} =   IADLMCDQ3d
${HCBS_Q46e} =   IADLMCDQ3e
${HCBS_Q46f} =   IADLMCDQ3f
${HCBS_Q46g} =   IADLMCDQ3g
${HCBS_Q46h} =   IADLMCDQ3h
${HCBS_NotesSummary5} =   xpath://textarea[@id="IADLMCD_HCBS_IADLMCDQ4"]

#HCBS_Health Systems and Status
${HCBS_Q47} =    xpath://input[@id="HSSMCD_HCBS_HSSMCDQ1aa"]
${HCBS_Q48} =    xpath://input[@id="HSSMCD_HCBS_HSSMCDQ1b"]
${HCBS_Q49} =    HSSMCD_HCBS_HSSMCDQ1
${HCBS_Q50} =    HSSMCD_HCBS_HSSMCDQ2
${HCBS_Q51} =    HSSMCD_HCBS_HSSMCDQ3
${HCBS_Cardiovascular_Heart} =    HSSMCD_HCBS_HSSMCDQ8
${HCBS_Respiratory} =    HSSMCD_HCBS_HSSMCDQ10
${HCBS_Endocrine_Glands} =    HSSMCD_HCBS_HSSMCDQ12
${HCBS_Musculoskeletal} =    HSSMCD_HCBS_HSSMCDQ14
${HCBS_Gastrointestinal} =    HSSMCD_HCBS_HSSMCDQ16
${HCBS_Neurological} =    HSSMCD_HCBS_HSSMCDQ18
${HCBS_Renal} =    HSSMCD_HCBS_HSSMCDQ20
${HCBS_RenalDetails_Dialysis} =    HSSMCDGRIDQ80
${HCBS_AdditionalRenalDetails} =    xpath://input[@id="HSSMCD_HCBS_HSSMCDQ21"]
${HCBS_Blood_Hematological} =    HSSMCD_HCBS_HSSMCDQ22
${HCBS_InfectiousDisease} =    HSSMCD_HCBS_HSSMCDQ24
${HCBS_Skin_Integumentary} =    HSSMCD_HCBS_HSSMCDQ26
${HCBS_Reproductive} =    HSSMCD_HCBS_HSSMCDQ28
${HCBS_EyesEarsNoseThroat} =    HSSMCD_HCBS_HSSMCDQ30
${HCBS_Cancer} =    HSSMCD_HCBS_HSSMCDQ32
${HCBS_RareorOther} =    HSSMCD_HCBS_HSSMCDQ34
${HCBS_BehavioralHealth} =    HSSMCD_HCBS_HSSMCDQ36
${HCBS_Q53} =    name:HSSMCD_HCBS_HSSMCDQ38
${HCBS_Description} =    xpath://textarea[@id="HSSMCD_HCBS_HSSMCDQ38a"]
${HCBS_CurrentPainMngmtTechnique} =    id:option_0_HSSMCD_HCBS_HSSMCDQ39
${HCBS_ManagingYourPain} =    id:option_0_HSSMCD_HCBS_HSSMCDQ40
${HCBS_DetailsOfResources} =    xpath://input[@id="HSSMCD_HCBS_HSSMCDQ40a"]
${HCBS_healthstatusdetails} =    xpath://input[@id="HSSMCD_HCBS_HSSMCDQ41"]
${HCBS_Q54} =    HSSMCD_HCBS_HSSMCDQ42
${HCBS_Q55} =    HSSMCD_HCBS_HSSMCDQ45
${HCBS_Q55a} =    HSSMCDGRIDQ22
${HCBS_Q55b} =    HSSMCDGRIDQ23
${HCBS_Q55c} =    HSSMCDGRIDQ24
${HCBS_Q55d} =    HSSMCDGRIDQ25
${HCBS_Q55e} =    HSSMCDGRIDQ26
${HCBS_Q55f} =    HSSMCDGRIDQ27
${HCBS_Q55g} =    HSSMCDGRIDQ28
${HCBS_Q55h} =    HSSMCDGRIDQ29
${HCBS_Q55i} =    HSSMCDGRIDQ30
${HCBS_Q55j} =    HSSMCDGRIDQ31
${HCBS_SelfNeglect} =    xpath://input[@id="option_1_HSSMCD_HCBS_HSSMCDQ46a"]
${HCBS_Q56} =    HSSMCD_HCBS_HSSMCDQ48
${HCBS_Q57} =    HSSMCD_HCBS_HSSMCDQ49
${HCBS_NotesSummary6} =    xpath://textarea[@id="HSSMCD_HCBS_HSSMCDQ50"]


#HCBS_Behavioral Health
${HCBS_Q58} =    BHMCD_HCBS_BHMCDQ1
${HCBS_Q59} =    name:BHMCD_HCBS_BHMCDQ2
${HCBS_Q60} =    name:BHMCD_HCBS_BHMCDQ3
${HCBS_Q61} =    name:BHMCD_HCBS_BHMCDQ24
${HCBS_Q62} =    name:BHMCD_HCBS_BHMCDQ27
${HCBS_Q63a} =    BHMCD_HCBS_BHMCDS1_BHMCDQ6
${HCBS_Q63b} =    BHMCD_HCBS_BHMCDS1_BHMCDQ7
${HCBS_Q64} =    name:BHMCD_HCBS_BHMCDQ20
${HCBS_Q65} =    BHMCD_HCBS_BHMCDQ21
${HCBS_Q65Details} =    xpath://input[@id="BHMCD_HCBS_BHMCDQ21a"]
${HCBS_Q65a} =   BHMCD_HCBS_BHMCDQ22
${HCBS_Q65aDetails} =    xpath://input[@id="BHMCD_HCBS_BHMCDQ22a"]
${HCBS_Q65b} =    BHMCD_HCBS_BHMCDQ23
${HCBS_Q66} =    BHMCD_HCBS_BHMCDS2_BHMCDQ30
${HCBS_Q67a} =    xpath://input[@id="BHMCD_HCBS_BHMCDS3_BHMCDQ38"]
${HCBS_Q67b} =    xpath://input[@id="BHMCD_HCBS_BHMCDS3_BHMCDQ39"]
${HCBS_Q67c} =    xpath://input[@id="BHMCD_HCBS_BHMCDS3_BHMCDQ40"]
${HCBS_Q67d} =    xpath://input[@id="BHMCD_HCBS_BHMCDS3_BHMCDQ41"]
${HCBS_Q67e} =    xpath://input[@id="BHMCD_HCBS_BHMCDS3_BHMCDQ42"]
${HCBS_Q67f} =    xpath://input[@id="BHMCD_HCBS_BHMCDS3_BHMCDQ43d"]
${HCBS_NotesSummary7} =    xpath://textarea[@id="BHMCD_HCBS_BHMCDQ44"]

# HCBS_Residential Living Environment
${HCBS_Q68} =    name:RESIMCD_HCBS_RESIMCDQ1
${HCBS_NotesSummary8} =    //textarea[@id="RESIMCD_HCBS_RESIMCDQ5"]

#HCBS_Nutrition
${HCBS_Q71} =    NUTRMCD_HCBS_NUTRMCDQ1
${HCBS_Q72} =    NUTRMCD_HCBS_NUTRMCDQ3
${HCBS_Q73} =    NUTRMCD_HCBS_NUTRMCDQ5
${HCBS_Q74} =    NUTRMCD_HCBS_NUTRMCDQ6
${HCBS_Q74_ft} =    //input[@id="NUTRMCD_HCBS_NUTRMCD_GQ1_NUTRMCDQ6ai"]
${HCBS_Q74_inch} =    //input[@id="NUTRMCD_HCBS_NUTRMCD_GQ1_NUTRMCDQ6aii"]
${HCBS_Q75} =    NUTRMCD_HCBS_NUTRMCDQ8
${HCBS_NotesSummary9} =    //textarea[@id="NUTRMCD_HCBS_NUTRMCDQ10"]

#HCBS_Medication
${HCBS_Q79} =    //textarea[@id="MEDIMCD_HCBS_MEDIMCDQ23"]
${HCBS_NotesSummary10} =    //textarea[@id="MEDIMCD_HCBS_MEDIMCDQ19"]

#HCBS_Caregiver
#${HCBS_Q80} =    option_0_CAREMCD_HCBS_CAREMCDQ1
${HCBS_Q80} =    CAREMCD_HCBS_CAREMCDQ1
${HCBS_NotesSummary11} =    //*[@id="CAREMCD_HCBS_CAREMCDQ17"]

#HCBS_Social Resources
${HCBS_Q95a} =    SOCIMCD_HCBS_SOCIMCDQ2
${HCBS_Q95b} =    SOCIMCD_HCBS_SOCIMCDQ3
${HCBS_Q95c} =    SOCIMCD_HCBS_SOCIMCDQ4
${HCBS_Q97} =    SOCIMCDGRIDQ1
${HCBS_Q98} =    SOCIMCDGRIDQ2
${HCBS_Q99} =    SOCIMCDGRIDQ3
${HCBS_NotesSummary12} =    //*[@id="SOCIMCD_HCBS_SOCIMCDQ10"]

#HCBS_Advance Directives
${HCBS_Q100} =    ADMCD_HCBS_ADMCDQ1
${HCBS_Q101a} =    id:option_0_ADMCD_HCBS_ADMCDS1_ADMCDQ3
${HCBS_Q101b} =    option_1_ADMCD_HCBS_ADMCDS1_ADMCDQ4
${HCBS_NotesSummary13} =    //*[@id="ADMCD_HCBS_ADMCDQ5"]

#HCBS_Summary and Conclusions
${HCBS_Q102} =    name:SnCMCD_HCBS_SnCMCDQ1
${HCBS_Q103} =    name:SnCMCD_HCBS_SnCMCDQ2
${HCBS_Q104} =    //input[@id="SnCMCD_HCBS_SnCMCDQ3"]
${HCBS_Q105} =    name:SnCMCD_HCBS_SnCMCDQ4
${HCBS_Q106} =    //input[@id="SnCMCD_HCBS_SnCMCDQ5"]
${HCBS_Q107} =    SnCMCD_HCBS_SnCMCDQ6
${HCBS_NotesSummary14} =    //textarea[@id="SnCMCD_HCBS_SnCMCDQ7"]
${HCBS_version1} =    //input[@id="0-OdmAssessmentHistoryGrid-checkbox"]//following::label[1]
${HCBS_version2} =    //input[@id="0-OdmAssessmentHistoryGrid-checkbox"]//following::label[2]
${PrintIcon} =    //a[@id="print-button"]//div[@class="plan-of-care-print-drop"]
${WithPHI} =    //*[@id="print-WithPHI"]
${WithoutPHI} =    //*[@id="print-WithoutPHI"]
${btn_Add_MemberContact} =    //*[@id="add-member-contact-information"]
${HCBS_ContactType} =    id:ILContactType
${HCBS_SupportType} =    id:SupportType
${btn_cancel_MemberContact} =    //a[@id="add-member-contact-information-modal-cancel-btn"]
${HCBS_GoalReviewed} =    //*[@id="GoalReviewed"]
${HCBS_GoalFocus} =    //*[@id="GoalFocus"]
${HCBS_MemberStrengths} =    //*[@id="MemberStrengths"]
${HCBS_MemberPreferences} =    //*[@id="MemberPreferences"]
${HCBS_GoalBarriers} =    //*[@id="GoalBarriers"]
${HCBS_GoalInterventions} =    //*[@id="GoalInterventions"]
${HCBS_GoalFrequency} =    //*[@id="GoalFrequency"]
${HCBS_GoalDetails} =    //textarea[@id="Details"]
${HCBS_GoalStatus} =    //select[@id="GoalStatus"]
${HCBS_GoalPriority} =    //select[@id='GoalPriority']
${HCBS_StageofChange} =    //select[@id='StageofChange']
${HCBS_Progress} =    //textarea[@id="Progress"]

*** Keywords ***

HCBS_start with get Started
    [Arguments]    ${UserData}
    sleep    4s
    wait until page contains element    //a[contains(text(),'Get Started')]
    select from list by label    id:DETE_MCD_DETEMCDQ2    Illinois MMAI
    sleep    3s
    click element    //input[@name='DETE_MCD_DETEMCDQ3' and @value='${UserData.HCBS_CaseType}']
    sleep    3s
    click element    ${GetStarted}

Fill HCBS Assessment
    [Arguments]    ${UserData}
    sleep    4s
    ${CHK_GetStarted} =    run keyword and return status    element should be visible    ${GetStarted}
    run keyword IF    ${CHK_GetStarted}    HCBS_start with get Started    ${UserData}
    sleep    4s
    ${ResumeBtn} =   run keyword and return status  element should be visible    ${btn_Resume}
    Run keyword Until Success    run keyword IF  ${ResumeBtn}   click element    ${btn_resume}
    HCBS_Demographic    ${UserData}
    HCBS_Social Determinants of Health (SDOH)    ${UserData}
    HCBS_Memory    ${UserData}
    HCBS_General Health, Sensory & Communication    ${UserData}
    HCBS_Activities of Daily Living    ${UserData}
    HCBS_Instrumental Activities of Daily Living    ${UserData}
    HCBS_Health Systems and Status    ${UserData}
    HCBS_Behavioral Health    ${UserData}
    HCBS_Residential Living Environment    ${UserData}
    HCBS_Nutrition    ${UserData}
    HCBS_Medication    ${UserData}
    HCBS_Caregiver    ${UserData}
    HCBS_Social Resources    ${UserData}
    HCBS_Advance Directives    ${UserData}
    HCBS_Summary and Conclusions    ${UserData}
    click link    Preview & Submit
    #click button     ${BH_ReviewAndSubmit}
    click element    ${BH_Submit}
    click element    ${BH_AcknowledgeAndSubmit}

jump to compAssessment
    [Arguments]  ${UserData}
    SearchPage.Click on the Member Central
    click element    ${CPCM}
    click element    //span[contains(text(),'${UserData.HCBS_CaseID}')]
    click element    ${CompAssessment}

Check The History
    [Arguments]  ${UserData}
    sleep    4s
    click link    History
    element should be visible    //*[contains(text(),'Select two assessments of the same type to compare. To print select up to four versions only.')]
    sleep    2s
    click element    ${HCBS_version1}
    sleep    2s
    click element    ${HCBS_version2}
    wait until element is visible    //*[@id="btnCompareAssessment"]
    click link    Compare
    wait until element is visible    //label[text()='Show only the differences']
    click element    //label[text()='Show only the differences']

User Take IL Assessment HCBS
    [Arguments]  ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    sleep    3s
    Search For Member   ${UserData}
    Select The Member
    jump to compAssessment    ${UserData}
    sleep    4s
    ${Reassess} =   run keyword and return status  element should be visible    ${btn_Reassess}
    run keyword IF    ${Reassess}   Reset to ALL New   ${UserData}
    Fill HCBS Assessment    ${UserData}
    log to console    HCBS Assessment is submitted
    wait until element is visible    ${btn_Reassess}    30s
    sleep    2s
    ${Reassess} =   run keyword and return status  element should be visible    ${btn_Reassess}
    run keyword IF    ${Reassess}   Keep ALL Exixting Details   ${UserData}
    log to console    Changes done in assessment
    wait until element is visible    ${btn_Reassess}
    sleep    2s
    ${Reassess} =   run keyword and return status  element should be visible    ${btn_Reassess}
    run keyword IF    ${Reassess}   Reset to ALL New   ${UserData}
    Fill HCBS Assessment    ${UserData}
    log to console    HCBS Assessment is submitted again
    wait until element is visible    (//a[@id="button-CompAssesment-History"])[1]
    Check The History    ${UserData}
##old    page should contain element    //*[text()='${UserData.HCBS_Q2_updated}']
    log to console    updated change is verified through history
    click link    Member Central
    wait until element is visible    ${CPCM}
    click element    ${CPCM}
    click element    //span[contains(text(),'${UserData.HCBS_CaseID}')]
    click element    ${CompAssessment}
    wait until element is visible    ${PrintIcon}
    click element    ${PrintIcon}
    element should be visible    ${WithPHI}
    element should be visible    ${WithoutPHI}
####old    click element    ${WithPHI}            # Not needed
    Navigate to Medicaid Plan of Care
    ${EditStatus} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus}    click element    //a[@id="edit-plan-of-care-button"]
####old   Folloup Plan validation in PLOC HCBS    ${UserData}      # Old changes
    Case Create Plan Of Care    ${UserData}
    Fill values Member Natural/Community Support Info    ${UserData}
    Follow up Plan Details    ${UserData}     # newly added section

    ${WaiverCodeStatus} =    run keyword and return status    element should be visible    //label[@for="ControlId4008" and contains(text(),'Member Self-Directed Option Discussed')]
    run keyword if    ${WaiverCodeStatus}    Fill up Member Self Directed Option discussed info    ${UserData}
    Contact information Update    ${UserData}

    Fill form in Strengths, Preferences, and Self Care Capabilities    ${UserData}
    Adding Services    ${UserData}
    Adding Services Again    ${UserData}
    scroll element into view    //label[@for="ControlId3973-radio-0-1"]
    sleep    1s
    double click element    //label[@for="ControlId3973-radio-0-1"]
    sleep    2s
    Select Attestation Radio Buttons
    Draw Dignature and save PlanOfCare
    Verify Auth Details of Services from Autharization    ${UserData}
    click link    Member Central
    sleep    2s
    Navigate Authorization Page
    sleep    1s
    run keyword if    '${UserData.Service_Auth2_status}' == 'Approved'    Validate Attachmemt in Auth    ${UserData.Service_Auth2}
    run keyword if    '${UserData.Service_Auth1_status}' == 'Approved'    Validate Attachmemt in Auth    ${UserData.Service_Auth1}
    Navigate to Medicaid Plan of Care
    Print PLOC Review type and Check Hostory    ${UserData}

Folloup Plan validation in PLOC HCBS
    [Arguments]    ${UserData}
    scroll element into view    //*[text()='Follow-Up Plan']
#    wait until element is visible    //select[@id="CareCooridinatorContactFrequency"]//option[@selected="selected"]
    sleep    2s
    ${Chk_FrequencyOf_Coordinator} =    get text    //select[@id="CareCooridinatorContactFrequency"]//option[@selected="selected"]
    ${Chk_FrequencyOf_Coordinator} =    strip string    ${Chk_FrequencyOf_Coordinator}    mode=both
    log to console    ${Chk_FrequencyOf_Coordinator}
    should be equal as strings    ${Chk_FrequencyOf_Coordinator}    ${UserData.HCBS_Q103}
    sleep    2s
    wait until element is visible    //select[@id="FollowupType"]//option[@selected="selected"]
    ${FollowupType} =    get text    //select[@id="FollowupType"]//option[@selected="selected"]
    ${FollowupType} =    strip string    ${FollowupType}    mode=both
    log to console    ${FollowupType}
    should be equal as strings    ${FollowupType}    ${UserData.HCBS_Q105}
    page should contain element    //*[@id='FollowupScheduleDate' and text()='${UserData.HCBS_Q106}']

Fill form in Strengths, Preferences, and Self Care Capabilities
    [Arguments]    ${UserData}
    scroll element into view    //div[@id="AreaOfFocus"]
    wait until element is visible    //*[@id="add-areaoffocus-goals"]
    click element    //*[@id="add-areaoffocus-goals"]
    wait until page contains    Add Strengths, Preferences, and Self Care Capabilities
    click element    //label[@for="GoalType-radio-514-6"]
#Old Code Starts HEre to enter current date and Target Date - Not in use updated on 05-Sep-2022
#    press keys    //input[@id="StartDate"]    RETURN
#    Enter Curent Date    //input[@id="StartDate"]
#    sleep    2s
#    press keys    //input[@id="TargetDate"]    RETURN
#    Enter Curent Date    //input[@id="TargetDate"]
#    input text    //input[@id="TargetDate"]    ${UserData.TargetDate}
    #press keys    //input[@id="TargetDate"]//following-sibling::span/span    RETURN
#Old Code Ends HEre to enter current date and Target Date - Not in use
    click element   //button[@aria-controls='StartDate_dateview']
    press keys    None    RETURN
    sleep   2s
    click element   //button[@aria-controls='TargetDate_dateview']
    press keys    None    RETURN
    sleep    1s
    scroll element into view    //input[@id="TargetDate"]
    sleep    4s
    select from list by label    ${HCBS_GoalStatus}    ${UserData.HCBS_GoalStatus}
    sleep    2s
    run keyword if    '${UserData.HCBS_GoalStatus}' == 'Met'    Enter Curent Date    //input[@id="CompletionDate"]
    select from list by label    ${HCBS_GoalPriority}    ${UserData.HCBS_GoalPriority}
    select from list by label    ${HCBS_GoalReviewed}    ${UserData.HCBS_GoalReviewed}
    select from list by label    ${HCBS_GoalFocus}    ${UserData.HCBS_GoalFocus}
    select from list by label    ${HCBS_MemberStrengths}    ${UserData.HCBS_MemberStrengths}
    select from list by label    ${HCBS_MemberPreferences}    ${UserData.HCBS_MemberPreferences}
    select from list by label    ${HCBS_StageofChange}    ${UserData.HCBS_StageofChange}
    select from list by label    ${HCBS_GoalBarriers}    ${UserData.HCBS_GoalBarriers}
    select from list by label    ${HCBS_GoalInterventions}    ${UserData.HCBS_GoalInterventions}
#    select from list by label    ${HCBS_GoalFrequency}    ${UserData.HCBS_GoalFrequency}
    input text    ${HCBS_GoalDetails}    ${UserData.HCBS_GoalDetails}
    input text    ${HCBS_Progress}    ${UserData.HCBS_Progress}
    click element    //*[@id="areaoffocus-save-btn"]

#    Validation On Strengths, Preferences, and Self Care Capabilities    ${UserData}

Validation On Strengths, Preferences, and Self Care Capabilities
    [Arguments]    ${UserData}
    Check Alphabetical Sort for DropDown    ${HCBS_StageofChange}
    Validate Dropdown values    ${HCBS_StageofChange}   ${UserData.HCBS_StageofChange_List}

#    Check Alphabetical Sort for DropDown    ${HCBS_GoalBarriers}
    Validate Dropdown for long Values    ${HCBS_GoalBarriers}   ${UserData.HCBS_GoalBarriers_List}

#    Check Alphabetical Sort for DropDown    ${HCBS_GoalInterventions}
#    Validate Dropdown for long Values    ${HCBS_GoalInterventions}   ${UserData.HCBS_GoalInterventions_List}

    input text    ${HCBS_GoalDetails}    ${Char8000}    #${Char1000}${Char1000}${Char1000}${Char1000}${Char1000}${Char1000}${Char1000}${Char1000}@
    input text    ${HCBS_Progress}    ${Char8000}    #${Char1000}${Char1000}${Char1000}${Char1000}${Char1000}${Char1000}${Char1000}${Char1000}@

    sleep    2s
    page should contain    Goal Details should not exceed 8000 characters
    page should contain    Progress should not exceed 8000 characters
    input text    ${HCBS_GoalDetails}    ${UserData.HCBS_GoalDetails}
    input text    ${HCBS_Progress}    ${UserData.HCBS_Progress}
    click element    //*[@id="areaoffocus-save-btn"]

*** Variables ***
${Char8000} =    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${BackupPlan} =    //input[@id="BackupPlan"]
${BackupPlan_Que} =    //label[@for="BackupPlan"]/following-sibling::a[text()='?']
${OtherSupportType} =    //input[@id="OtherSupportType"]
${ContactInfo_Name} =    //input[@id="Name"]
${ContactInfo_Phone} =    //input[@id="Phone"]
${static_field} =    //*[@id="add-member-contact-information-form"]/div[3]
${MemberSelfDirectedOption} =    //select[@id="ControlId4008"]

*** Keywords ***
Fill values Member Natural/Community Support Info
    [Arguments]    ${UserData}
    scroll element into view    //*[contains(text(),'Member Natural/Community Support Contact Information')]
    click element    ${btn_Add_MemberContact}
    wait until page contains    Add Member Support Contact Information
    select from list by label    ${HCBS_ContactType}    ${UserData.HCBS_ContactType}
    select from list by label    ${HCBS_SupportType}    ${UserData.HCBS_SupportType}
    element text should be    ${static_field}    ${UserData.static_field}
    input text    ${BackupPlan}    ${UserData.BackupPlan}
    click element    ${BackupPlan_Que}
    wait until element is visible    //div[@class="scrollable"]    10s
    ${cueingNote} =    get text    //div[@class="scrollable"]
    log to console    ${cueingNote}
    @{Cueingnotes_array} =    split to lines    ${cueingNote}
    log    ${Cueingnotes_array}[0]
    log    ${Cueingnotes_array}[2]
    should be equal as strings    ${Cueingnotes_array}[0]    ${UserData.cueingNote_1}
    should be equal as strings    ${Cueingnotes_array}[2]    ${UserData.cueingNote_2}
    input text    ${OtherSupportType}    ${UserData.OtherSupportType}
    input text    ${ContactInfo_Name}    ${UserData.ContactInfo_Name}
    scroll element into view    ${ContactInfo_Phone}
    sleep    1s
    input text    ${ContactInfo_Phone}    ${UserData.ContactInfo_Phone}
    click link    Save and Add
    sleep    2s
    select from list by label    ${HCBS_ContactType}    ${UserData.HCBS_ContactType1}
    page should contain element    //a[@class="button button-green disabled"]    #Save, save and Add disabled
    sleep    1s
    click link    Cancel

Keep ALL Exixting Details
    [Arguments]    ${UserData}
    click element    ${btn_Reassess}
    sleep    2s
    #wait until element is visible    //a[@id="btnkeepExisingData"]
    click element    //a[@id="btnkeepExisingData" and contains(text(),'Keep All the Existing Details')]
    wait until element is visible    //*[text()='Case - Take Assessment: Comprehensive']
    input text    ${HCBS_Q2}    ${UserData.HCBS_Q2_updated}
    select from list by label    ${HCBS_Q5}    ${UserData.HCBS_Q5}
    click link    Preview & Submit
    wait until element is visible    //*[text()='Case - Preview Assessment: Comprehensive']
    sleep    2s
    click element    ${BH_Submit}
    wait until element is visible    ${BH_AcknowledgeAndSubmit}
    click element    ${BH_AcknowledgeAndSubmit}


HCBS_Demographic
    [Arguments]    ${UserData}
    sleep    4s
    double click element    ${Demographic}
    sleep    4s
    run keyword until success    select from list by label    ${HCBS_Q1}    ${UserData.HCBS_Q1}
    sleep    3s
    input text    ${HCBS_WaiverCodeDate}    ${UserData.HCBS_WaiverCodeDate}
    sleep    1s
    input text    ${HCBS_ILDonScore}    ${UserData.HCBS_ILDonScore}
    input text    ${HCBS_Q2}    ${UserData.HCBS_Q2}
    input text    ${HCBS_PhoneNumExtension}     ${UserData.HCBS_PhoneNumExtension}
    select from list by label    ${HCBS_Q4}    ${UserData.HCBS_Q4}
    select from list by label    ${HCBS_Q5}    ${UserData.HCBS_Q5}
    set selenium implicit wait    6s
    press keys    ${HCBS_WaiverCodeDate}    TAB
   # scroll element into view   //label[contains(text(),'Private Residence')]
    click element    //label[contains(text(),'Private Residence')]     #${HCBS_Q6Xpath}
    select radio button    ${HCBS_Q6a}    ${UserData.HCBS_Q6a}
   # run keyword until success    select radio button    ${HCBS_Q6}    ${UserData.HCBS_Q6}
   # wait until page contains element    xpath://input[@id="option_0_DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q7b"]
    #run keyword until success    click element   xpath://input[@id="option_0_DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q7b"]    # //input[@id="option_0_DEMOMCD_HCBS_DEMOMCDS1_DEMOMCDS1Q7b"]//parent::div//parent::div[@role="radiogroup"]
    select from list by label    ${HCBS_Q7}    ${UserData.HCBS_Q7}
    run keyword until success   select radio button    ${HCBS_Q8}    ${UserData.HCBS_Q8}
    run keyword until success   select from list by label    ${HCBS_Q9}    ${UserData.HCBS_Q9}
    run keyword until success    select radio button    ${HCBS_Q10}    ${UserData.HCBS_Q10}
    run keyword until success    select from list by label    ${HCBS_Q11}    ${UserData.HCBS_Q11}
    select checkbox    ${HCBS_Q12}
    select radio button    ${HCBS_Q13}    ${UserData.HCBS_Q13}
    select from list by label    ${HCBS_Q14}    ${UserData.HCBS_Q14}
    select radio button    ${HCBS_Q14a}    ${UserData.HCBS_Q14a}
    run keyword until success    select radio button    ${HCBS_Q15}    ${UserData.HCBS_Q15}
    run keyword until success    select from list by label    ${HCBS_EmergencyRiskLevel}    ${UserData.HCBS_EmergencyRiskLevel}
    input text    ${HCBS_EmergencyRiskLevelDetails}    ${UserData.HCBS_EmergencyRiskLevelDetails}
    click element    ${CopmpleteAndNext}

HCBS_Social Determinants of Health (SDOH)
    [Arguments]    ${UserData}
    sleep    3s
    Run keyword Until Success    select radio button    ${HCBS_Q16}    ${UserData.HCBS_Q16}
    #Run keyword Until Success    click element    ${HCBS_Q16}
    #Run keyword Until Success    select radio button    ${HCBS_Q17}    ${UserData.HCBS_Q17}
    sleep    3s
    Run keyword Until Success    click element    ${HCBS_Q17}
    select radio button    ${HCBS_Q18}    ${UserData.HCBS_Q18}
    select checkbox    ${HCBS_Q19}
    select checkbox    ${HCBS_Q20}
    select checkbox    ${HCBS_Q21}
    select checkbox    ${HCBS_Q22}
    select checkbox    ${HCBS_Q23}
    input text    ${HCBS_Comment_Details1}    ${UserData.HCBS_Comment_Details1}
    input text    ${HCBS_NotesSummary1}    ${UserData.HCBS_NotesSummary1}
    click element    ${CopmpleteAndNext}

HCBS_Memory
    [Arguments]    ${UserData}
    sleep    3s
    select radio button    ${HCBS_Q24}    ${UserData.HCBS_Q24}
    select radio button    ${HCBS_Q25}    ${UserData.HCBS_Q25}
    select radio button    ${HCBS_Q26}    ${UserData.HCBS_Q26}
    select radio button    ${HCBS_Q27}    ${UserData.HCBS_Q27}
    select radio button    ${HCBS_Q28}    ${UserData.HCBS_Q28}
    input text    ${HCBS_NotesSummary2}    ${UserData.HCBS_NotesSummary2}
    click element    ${CopmpleteAndNext}

HCBS_General Health, Sensory & Communication
    [Arguments]    ${UserData}
    sleep    3s
    select from list by label    ${HCBS_Q29}    ${UserData.HCBS_Q29}
    select from list by label    ${HCBS_Q30}    ${UserData.HCBS_Q30}
    select from list by label    ${HCBS_Q31}    ${UserData.HCBS_Q31}
    select from list by label    ${HCBS_Q32}    ${UserData.HCBS_Q32}
    select radio button    ${HCBS_Q33}    ${UserData.HCBS_Q33}
    select radio button    ${HCBS_Q34}    ${UserData.HCBS_Q34}
    select from list by label    ${HCBS_Q35}    ${UserData.HCBS_Q35}
    select from list by label    ${HCBS_Q36}    ${UserData.HCBS_Q36}
    select radio button    ${HCBS_Q37}    ${UserData.HCBS_Q37}
    select radio button    ${HCBS_Q38}    ${UserData.HCBS_Q38}
    select radio button    ${HCBS_Q39}    ${UserData.HCBS_Q39}
    select radio button    ${HCBS_Q40}    ${UserData.HCBS_Q40}
    input text    ${HCBS_NotesSummary3}    ${UserData.HCBS_NotesSummary3}
    click element    ${CopmpleteAndNext}

HCBS_Activities of Daily Living
    [Arguments]    ${UserData}
    sleep    3s
    select radio button    ${HCBS_Q41a}    ${UserData.HCBS_Q41a}
    sleep    3s
    select radio button    ${HCBS_Q41b}    ${UserData.HCBS_Q41b}
    select radio button    ${HCBS_Q41c}    ${UserData.HCBS_Q41c}
    select radio button    ${HCBS_Q41d}    ${UserData.HCBS_Q41d}
    select radio button    ${HCBS_Q41e}    ${UserData.HCBS_Q41e}
    select radio button    ${HCBS_Q41f}    ${UserData.HCBS_Q41f}
    select checkbox    ${HCBS_Q41UsesAsistiveDeviceFor}
    select radio button    ${HCBS_Q42}    ${UserData.HCBS_Q42}
    select radio button    ${HCBS_Q43a}    ${UserData.HCBS_Q43a}
    select radio button    ${HCBS_Q43b}    ${UserData.HCBS_Q43b}
    select radio button    ${HCBS_Q43c}    ${UserData.HCBS_Q43c}
    select radio button    ${HCBS_Q43d}    ${UserData.HCBS_Q43d}
    select radio button    ${HCBS_Q43e}    ${UserData.HCBS_Q43e}
    select radio button    ${HCBS_Q43f}    ${UserData.HCBS_Q43f}
    input text    ${HCBS_NotesSummary4}    ${UserData.HCBS_NotesSummary4}
    click element    ${CopmpleteAndNext}

HCBS_Instrumental Activities of Daily Living
    [Arguments]    ${UserData}
    sleep    3s
    select radio button    ${HCBS_Q44a}    ${UserData.HCBS_Q44a}
    select radio button    ${HCBS_Q44b}    ${UserData.HCBS_Q44b}
    select radio button    ${HCBS_Q44c}    ${UserData.HCBS_Q44c}
    select radio button    ${HCBS_Q44d}    ${UserData.HCBS_Q44d}
    select radio button    ${HCBS_Q44e}    ${UserData.HCBS_Q44e}
    select radio button    ${HCBS_Q44f}    ${UserData.HCBS_Q44f}
    select radio button    ${HCBS_Q44g}    ${UserData.HCBS_Q44g}
    select radio button    ${HCBS_Q44h}    ${UserData.HCBS_Q44h}
    select checkbox    ${HCBS_Q44UsesAsistiveDeviceFor}
    select radio button    ${HCBS_Q45}    ${UserData.HCBS_Q45}
    select radio button    ${HCBS_Q46a}    ${UserData.HCBS_Q46a}
    select radio button    ${HCBS_Q46b}    ${UserData.HCBS_Q46b}
    select radio button    ${HCBS_Q46c}    ${UserData.HCBS_Q46c}
    select radio button    ${HCBS_Q46d}    ${UserData.HCBS_Q46d}
    select radio button    ${HCBS_Q46e}    ${UserData.HCBS_Q46e}
    select radio button    ${HCBS_Q46f}    ${UserData.HCBS_Q46f}
    select radio button    ${HCBS_Q46g}    ${UserData.HCBS_Q46g}
    select radio button    ${HCBS_Q46h}    ${UserData.HCBS_Q46h}
    input text    ${HCBS_NotesSummary5}    ${UserData.HCBS_NotesSummary5}
    click element    ${CopmpleteAndNext}

HCBS_Health Systems and Status
    [Arguments]    ${UserData}
    sleep    3s
    input text    ${HCBS_Q47}    ${UserData.HCBS_Q47}
    input text    ${HCBS_Q48}    ${UserData.HCBS_Q48}
    select radio button    ${HCBS_Q49}    ${UserData.HCBS_Q49}
    select radio button    ${HCBS_Q50}    ${UserData.HCBS_Q50}
    select radio button    ${HCBS_Q51}    ${UserData.HCBS_Q51}
    select radio button    ${HCBS_Cardiovascular_Heart}    ${UserData.HCBS_Cardiovascular_Heart}
    select radio button    ${HCBS_Respiratory}    ${UserData.HCBS_Respiratory}
    select radio button    ${HCBS_Endocrine_Glands}    ${UserData.HCBS_Endocrine_Glands}
    select radio button    ${HCBS_Musculoskeletal}    ${UserData.HCBS_Musculoskeletal}
    select radio button    ${HCBS_Gastrointestinal}    ${UserData.HCBS_Gastrointestinal}
    select radio button    ${HCBS_Neurological}    ${UserData.HCBS_Neurological}
    select radio button    ${HCBS_Renal}    ${UserData.HCBS_Renal}
    select radio button    ${HCBS_RenalDetails_Dialysis}    ${UserData.HCBS_RenalDetails_Dialysis}
    input text    ${HCBS_AdditionalRenalDetails}    ${UserData.HCBS_AdditionalRenalDetails}
    select radio button    ${HCBS_Blood_Hematological}    ${UserData.HCBS_Blood_Hematological}
    select radio button    ${HCBS_InfectiousDisease}    ${UserData.HCBS_InfectiousDisease}
    select radio button    ${HCBS_Skin_Integumentary}    ${UserData.HCBS_Skin_Integumentary}
    select radio button    ${HCBS_Reproductive}    ${UserData.HCBS_Reproductive}
    select radio button    ${HCBS_EyesEarsNoseThroat}    ${UserData.HCBS_EyesEarsNoseThroat}
    select radio button    ${HCBS_Cancer}    ${UserData.HCBS_Cancer}
    select radio button    ${HCBS_RareorOther}    ${UserData.HCBS_RareorOther}
    select radio button    ${HCBS_BehavioralHealth}    ${UserData.HCBS_BehavioralHealth}
    select from list by label    ${HCBS_Q53}    ${UserData.HCBS_Q53}
    input text    ${HCBS_Description}    ${UserData.HCBS_Description}
    select checkbox    ${HCBS_CurrentPainMngmtTechnique}
    select checkbox    ${HCBS_ManagingYourPain}
    input text    ${HCBS_DetailsOfResources}    ${UserData.HCBS_DetailsOfResources}
    input text    ${HCBS_healthstatusdetails}    ${UserData.HCBS_healthstatusdetails}
    select radio button    ${HCBS_Q54}    ${UserData.HCBS_Q54}
    select radio button    ${HCBS_Q55}    ${UserData.HCBS_Q55}
    select radio button    ${HCBS_Q55a}    ${UserData.HCBS_Q55a}
    select radio button    ${HCBS_Q55b}    ${UserData.HCBS_Q55b}
    select radio button    ${HCBS_Q55c}    ${UserData.HCBS_Q55c}
    select radio button    ${HCBS_Q55d}    ${UserData.HCBS_Q55d}
    select radio button    ${HCBS_Q55e}    ${UserData.HCBS_Q55e}
    select radio button    ${HCBS_Q55f}    ${UserData.HCBS_Q55f}
    select radio button    ${HCBS_Q55g}    ${UserData.HCBS_Q55g}
    select radio button    ${HCBS_Q55h}    ${UserData.HCBS_Q55h}
    select radio button    ${HCBS_Q55i}    ${UserData.HCBS_Q55i}
    select radio button    ${HCBS_Q55j}    ${UserData.HCBS_Q55j}
    #wait until page contains element    xpath://label[@for="option_0_HSSMCD_HCBS_HSSMCDQ46a"]
    press keys    ${HCBS_SelfNeglect}    TAB
    press keys    ${HCBS_SelfNeglect}    ARROW_LEFT
    #click element    //div[@id="HSSMCD_HCBS_HSSMCDQ46a"]//input[@value="${UserData.HCBS_SelfNeglect}"]
    #click element    xpath://label[@for="option_0_HSSMCD_HCBS_HSSMCDQ46a"]
    #sleep    4s
    #run keyword until success    click element    xpath://*[@id="HSSMCD_HCBS_HSSMCDQ46a"]/div[1]/label
    select radio button    ${HCBS_Q56}    ${UserData.HCBS_Q56}
    select radio button    ${HCBS_Q57}    ${UserData.HCBS_Q57}
    input text    ${HCBS_NotesSummary6}    ${UserData.HCBS_NotesSummary6}
    click element    ${CopmpleteAndNext}

HCBS_Behavioral Health
    [Arguments]    ${UserData}
    sleep    3s
    Run keyword Until Success  select radio button    ${HCBS_Q58}    ${UserData.HCBS_Q58}
    select from list by label    ${HCBS_Q59}    ${UserData.HCBS_Q59}
    select from list by label    ${HCBS_Q60}    ${UserData.HCBS_Q60}
    select from list by label    ${HCBS_Q61}    ${UserData.HCBS_Q61}
    select from list by label    ${HCBS_Q62}    ${UserData.HCBS_Q62}
    select radio button    ${HCBS_Q63a}    ${UserData.HCBS_Q63a}
    select radio button    ${HCBS_Q63b}    ${UserData.HCBS_Q63b}
    select from list by label    ${HCBS_Q64}    ${UserData.HCBS_Q64}
    select radio button    ${HCBS_Q65}    ${UserData.HCBS_Q65}
    input text    ${HCBS_Q65Details}    ${UserData.HCBS_Q65Details}
    select radio button    ${HCBS_Q65a}    ${UserData.HCBS_Q65a}
    input text    ${HCBS_Q65aDetails}    ${UserData.HCBS_Q65aDetails}
    select radio button    ${HCBS_Q65b}    ${UserData.HCBS_Q65b}
    select radio button    ${HCBS_Q66}    ${UserData.HCBS_Q66}
    input text    ${HCBS_Q67a}    ${UserData.HCBS_Q67a}
    input text    ${HCBS_Q67b}    ${UserData.HCBS_Q67b}
    input text    ${HCBS_Q67c}    ${UserData.HCBS_Q67c}
    input text    ${HCBS_Q67d}    ${UserData.HCBS_Q67d}
    input text    ${HCBS_Q67e}    ${UserData.HCBS_Q67e}
    input text    ${HCBS_Q67f}    ${UserData.HCBS_Q67f}
    input text    ${HCBS_NotesSummary7}    ${UserData.HCBS_NotesSummary7}
    click element    ${CopmpleteAndNext}

HCBS_Residential Living Environment
    [Arguments]  ${UserData}
    sleep    3s
    select from list by label    ${HCBS_Q68}    ${UserData.HCBS_Q68}
    sleep    2s
    input text    ${HCBS_NotesSummary8}     ${UserData.HCBS_NotesSummary8}
    click element    ${CopmpleteAndNext}

HCBS_Nutrition
    [Arguments]  ${UserData}
    sleep    3s
    select radio button    ${HCBS_Q71}    ${UserData.HCBS_Q71}
    select radio button    ${HCBS_Q72}    ${UserData.HCBS_Q72}
    select radio button    ${HCBS_Q73}    ${UserData.HCBS_Q73}
    select radio button    ${HCBS_Q74}    ${UserData.HCBS_Q74}
    input text    ${HCBS_Q74_ft}    ${UserData.HCBS_Q74_ft}
    input text    ${HCBS_Q74_inch}    ${UserData.HCBS_Q74_inch}
    sleep    4s
    press keys    //input[@name='NUTRMCD_HCBS_NUTRMCDQ8' and @value='Yes']    ARROW_LEFT
    #press keys    //*[@id="NUTRMCD_HCBS_NUTRMCD_GQ1_NUTRMCDQ6aii"]    ARROW_LEFT
    #click element    //input[@name='NUTRMCD_HCBS_NUTRMCDQ8' and @value='No']
    #select radio button    NUTRMCD_HCBS_NUTRMCDQ8    No
    input text    ${HCBS_NotesSummary9}     ${UserData.HCBS_NotesSummary9}
    click element    ${CopmpleteAndNext}

HCBS_Medication
    [Arguments]  ${UserData}
    sleep    3s
    input text    ${HCBS_Q79}     ${UserData.HCBS_Q79}
    input text    ${HCBS_NotesSummary10}     ${UserData.HCBS_NotesSummary10}
    click element    ${CopmpleteAndNext}

HCBS_Caregiver
    [Arguments]  ${UserData}
    #select radio button    ${HCBS_Q80}    ${UserData.HCBS_Q80}
#    run keyword until success   select radio button    ${HCBS_Q80}    ${UserData.HCBS_Q80}
    ${RadioButton1}    Get WebElement    //input[@id='option_0_CAREMCD_HCBS_CAREMCDQ1']
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${RadioButton1}
    input text    ${HCBS_NotesSummary11}     ${UserData.HCBS_NotesSummary11}
    click element    ${CopmpleteAndNext}

HCBS_Social Resources
    [Arguments]  ${UserData}
    sleep    2s
    select radio button    ${HCBS_Q95a}    ${UserData.HCBS_Q95a}
    select radio button    ${HCBS_Q95b}    ${UserData.HCBS_Q95b}
    select radio button    ${HCBS_Q95c}    ${UserData.HCBS_Q95c}
    select radio button    ${HCBS_Q97}    ${UserData.HCBS_Q97}
    select radio button    ${HCBS_Q98}    ${UserData.HCBS_Q98}
    select radio button    ${HCBS_Q99}    ${UserData.HCBS_Q99}
    input text    ${HCBS_NotesSummary12}     ${UserData.HCBS_NotesSummary12}
    click element    ${CopmpleteAndNext}

HCBS_Advance Directives
    [Arguments]  ${UserData}
    sleep    3s
    select radio button    ${HCBS_Q100}    ${UserData.HCBS_Q100}
    select checkbox    ${HCBS_Q101a}
    select checkbox    ${HCBS_Q101b}
    input text    ${HCBS_NotesSummary13}     ${UserData.HCBS_NotesSummary13}
    click element    ${CopmpleteAndNext}

HCBS_Summary and Conclusions
    [Arguments]  ${UserData}
    sleep    2s
    select from list by label    ${HCBS_Q102}    ${UserData.HCBS_Q102}
    select from list by label    ${HCBS_Q103}    ${UserData.HCBS_Q103}
    input text    ${HCBS_Q104}     ${UserData.HCBS_Q104}
    press keys    ${HCBS_Q104}    TAB
    select from list by label    ${HCBS_Q105}    ${UserData.HCBS_Q105}
    sleep    2s
    input text    ${HCBS_Q106}     ${UserData.HCBS_Q106}
    press keys    ${HCBS_Q106}    TAB
    press keys    //input[@id="option_1_SnCMCD_HCBS_SnCMCDQ6"]    ARROW_LEFT
    #sleep    4s
    #Run keyword Until Success    select radio button    ${HCBS_Q107}    ${UserData.HCBS_Q107}
    input text    ${HCBS_NotesSummary14}     ${UserData.HCBS_NotesSummary14}

## Newly added keywords added here
*** Variables ***
${ReasonForCarePlanUpdate} =    //select[@id='ReasonForCarePlanUpdate']
${btn_ContactInformation_Add} =    //a[@id="add-care-coordination-phone-number"]
${CareCordiator_PhoneNumber} =    //form[@id="add-care-coordination-phone-number-form"]//input[@id="PhoneNumber"]
${CareCordiator_Email} =    //input[@id="EmailAddress"]
${btn_CareCordiator_Save} =    //a[@id="save-btn"]
${btn_CareCordiator_Edit} =    //a[@id="edit-care-coordination-btn"]
${btn_save editedContactInfo} =    //a[@id="edit-save-btn"]

*** Keywords ***
Case Create Plan Of Care
    [Arguments]    ${UserData}
    sleep    3s
    page should contain element    //h4[text()='Contact Information']
    select from list by label    ${ReasonForCarePlanUpdate}    ${UserData.ReasonForCarePlanUpdate}
    click link    ${btn_ContactInformation_Add}
    wait until element is visible    //h4[text()='Add Care Coordination Information']    30s
    input text    ${CareCordiator_PhoneNumber}    ${UserData.CareCordiator_PhoneNumber}
    click element    //label[@for="PhoneType-radio-517-1"]
    click element    //label[@for="IsPrimary-radio-520-1"]
    input text    ${CareCordiator_Email}    ${UserData.CareCordiator_Email}
    sleep    2s
    click element    ${btn_CareCordiator_Save}
#    page should contain element    //div[text()="Information has been added successfully."]
    sleep    3s
    element should be visible    //div[@id="PlanOfCareCoordinatorPhone-gridContent"]//tbody/tr/td[text()='${UserData.CareCordiator_PhoneNumber}']    30s
    element text should be    //div[@id="PlanOfCareCoordinatorPhone-gridContent"]//tbody/tr/td[text()='${UserData.CareCordiator_PhoneNumber}']//following-sibling::td[3]    ${UserData.CareCordiator_Email}


*** Variables ***
${CarePlanReview} =    //select[@id="CarePlanReview"]
${CpReviewFollowUpDate} =    //input[@id="MaxCpReviewFollowUpDate"]
${CpFollowupMethod} =    //select[@id="FollowupMethodforCPReview"]
${FacetoFaceOngoingContact} =    //select[@id="FacetoFaceOngoingContact"]
${blankEmailAdd} =    //div[@id="PlanOfCareCoordinatorPhone"]//tbody/tr//td[@title='']

*** Keywords ***
Follow up Plan Details
    [Arguments]    ${UserData}
    scroll element into view    ${CarePlanReview}
    ${Date_Annual} =     Get Nth Date From Current Date    +365
    ${Date_30} =     Get Nth Date From Current Date    +30
    ${Date_90} =     Get Nth Date From Current Date    +90

    select from list by label    ${CarePlanReview}    Every 30 Days
    sleep    2s
    select from list by label    ${CarePlanReview}    Annually    #${UserData.CarePlanReview}
    sleep    2s
    ${Cp_FollowUpDate_1} =    get element attribute    ${CpReviewFollowUpDate}    value
    log    ${Cp_FollowUpDate_1}
    should be equal as strings    ${Cp_FollowUpDate_1}     ${Date_Annual}

    select from list by label    ${CarePlanReview}    Every 30 Days
    sleep    2s
    ${Cp_FollowUpDate_2} =    get element attribute    ${CpReviewFollowUpDate}    value
    should be equal as strings    ${Cp_FollowUpDate_2}     ${Date_30}

    select from list by label    ${CarePlanReview}    Every 30 Days
    sleep    2s
    select from list by label    ${CarePlanReview}    Every 90 Days
    sleep    2s
    ${Cp_FollowUpDate_3} =    get element attribute    ${CpReviewFollowUpDate}    value
    should be equal as strings    ${Cp_FollowUpDate_3}     ${Date_90}

    Check Alphabetical Sort for DropDown    ${CarePlanReview}
    Validate Dropdown values    ${CarePlanReview}   ${UserData.CarePlanReview_List}

    Check Alphabetical Sort for DropDown    ${CpFollowupMethod}
    Validate Dropdown values    ${CpFollowupMethod}   ${UserData.CpFollowupMethod_List}
    select from list by label    ${CpFollowupMethod}    ${UserData.CpFollowupMethod}

    Check Alphabetical Sort for DropDown    ${FacetoFaceOngoingContact}
    Validate Dropdown values    ${FacetoFaceOngoingContact}   ${UserData.FacetoFaceOngoingContact_List}
    select from list by label    ${FacetoFaceOngoingContact}    ${UserData.FacetoFaceOngoingContact}


Fill up Member Self Directed Option discussed info
    [Arguments]    ${UserData}
    select from list by label    ${MemberSelfDirectedOption}   ${UserData.MemberSelfDirectedOption}
    Validate Dropdown values    ${MemberSelfDirectedOption}   ${UserData.MemberSelfDirectedOption_List}

Contact information Update
    [Arguments]    ${UserData}
    ${status_contactInfo} =    run keyword and return status    element should be visible    ${blankEmailAdd}
    run keyword if    ${status_contactInfo}    Edit ContactInfo to fill email address    ${UserData}

Edit ContactInfo to fill email address
    [Arguments]    ${UserData}
    click element    ${blankEmailAdd}
    wait until element is visible    ${btn_CareCordiator_Edit}    20s
    scroll element into view    ${btn_CareCordiator_Edit}
    click element    ${btn_CareCordiator_Edit}
    wait until element is visible    ${CareCordiator_Email}
    input text    ${CareCordiator_Email}    ${UserData.CareCordiator_Email}
    sleep    2s
    click element    ${btn_save editedContactInfo}
    page should contain element    //div[text()="Information has been saved successfully."]


Check Alphabetical Sort for DropDown
    [Arguments]    ${Dropdown_Xpath}
    @{Dropdownlist_Array}    get list items    ${Dropdown_Xpath}
    @{CopyValues}   Copy List   ${Dropdownlist_Array}
    log    Before Sort: ${CopyValues}
    @{CopyValue_1}    sort Assc   ${CopyValues}
    log    After Sort: ${CopyValue_1}
    lists should be equal    ${CopyValue_1}    ${Dropdownlist_Array}

Validate Dropdown values
    [Arguments]   ${Dropdown_Xpath}    ${Dropdown_Values}
    ${Dropdownlist_Item}    get list items    ${Dropdown_Xpath}
    log    ${Dropdownlist_Item}
    ${Dropdown_Values}    split string    ${Dropdown_Values}     ,
    should be equal as strings    ${Dropdownlist_Item}    ${Dropdown_Values}

Validate Dropdown for long Values
    [Arguments]   ${Dropdown_Xpath}    ${Dropdown_Values}
    ${Dropdownlist_Item}    get list items    ${Dropdown_Xpath}
    log    ${Dropdownlist_Item}
    ${Dropdown_Values}    split string    ${Dropdown_Values}     @
    should be equal as strings    ${Dropdownlist_Item}    ${Dropdown_Values}

#Old changes
#    ${chk_Narrativeinfo} =    run keyword and return status    page should contain element    //*[@id="left-nav"]//*[text()="Narrative Information"]
#    run keyword if    ${chk_Narrativeinfo}    click element    //*[@id="left-nav"]//*[text()="Narrative Information"]
#    ...    ELSE   Navigate to Medicaid Plan of Care
#    sleep    2s
#    ${EditStatus1} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
#    run keyword if    ${EditStatus1}    click element    //a[@id="edit-plan-of-care-button"]
#    scroll element into view    //div[@id="NarrativeInformation"]/a
#    page should contain element    //div[@id="ControlId4074" and contains(text(),'${UserData.HCBS_NotesSummary4}')]
#    page should contain element    //div[@id="ControlId4075" and contains(text(),'${UserData.HCBS_NotesSummary5}')]
#    page should contain element    //div[@id="ControlId4053" and contains(text(),'${UserData.HCBS_NotesSummary6}')]
#    page should contain element    //div[@id="ControlId4054" and contains(text(),'${UserData.HCBS_NotesSummary8}')]
#    page should contain element    //div[@id="ControlId4055" and contains(text(),'${UserData.HCBS_NotesSummary7}')]
#    sleep    2s
#    ${chk_crisisPlan} =    run keyword and return status    page should contain element    //*[@id="left-nav"]//*[text()="Behavioral Health Crisis Plan"]
#    run keyword if    ${chk_crisisPlan}    click element    //*[@id="left-nav"]//*[text()="Behavioral Health Crisis Plan"]
#    ...    ELSE   Navigate to Medicaid Plan of Care
#    sleep    2s
#    ${EditStatus1} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
#    run keyword if    ${EditStatus1}    click element    //a[@id="edit-plan-of-care-button"]

#    ${chk_Attestation} =    run keyword and return status    page should contain element    //*[@id="left-nav"]//*[text()="Attestation"]
#    run keyword if    ${chk_Attestation}    click element    //*[@id="left-nav"]//*[text()="Attestation"]
#    ...    ELSE   Navigate to Medicaid Plan of Care
#    sleep    2s
#    ${EditStatus1} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
#    run keyword if    ${EditStatus1}    click element    //a[@id="edit-plan-of-care-button"]
#    sleep    2s
##    click element    //*[@id="left-nav"]//*[text()="Attestation"]
##    scroll element into view    (//*[text()='Attestation'])[2]

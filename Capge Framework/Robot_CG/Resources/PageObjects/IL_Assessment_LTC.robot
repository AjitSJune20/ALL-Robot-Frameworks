*** Settings ***
Documentation  This script is used to Submit IL Assessment for LTC

Library  SeleniumLibrary
Library  String
Resource  ../Definitions/HumanaGui.robot
Resource  ../PageObjects/IL_Assessment.robot

*** Variables ***
#LTC_Demographic
${LTC_Q1} =    //input[@id="DEMOMCD_LTC_DEMOMCDS1_DEMOMCDS1Q3a"]
${LTC_PhoneNumberExtension} =    //input[@id="DEMOMCD_LTC_DEMOMCDS1_DEMOMCDS1Q3b"]
${LTC_Q3} =    name:DEMOMCD_LTC_DEMOMCDS1_DEMOMCDS1Q6
${LTC_Q4} =    name:DEMOMCD_LTC_DEMOMCDS1_DEMOMCDS1Q7
${LTC_Q5} =    DEMOMCD_LTC_DEMOMCDS1_DEMOMCDS1Q7b
${LTC_Q6} =    name:DEMOMCD_LTC_DEMOMCDS1_DEMOMCDS1Q7b1
${LTC_Q7} =    DEMOMCD_LTC_DEMOMCDS1_DEMOMCDS1Q8
${LTC_Q8} =    name:DEMOMCD_LTC_DEMOMCDQ1
${LTC_Q9} =    DEMOMCD_LTC_DEMOMCDQ2
${LTC_Q10} =    name:DEMOMCD_LTC_DEMOMCDQ4a
${LTC_Q11} =    id:option_0_DEMOMCD_LTC_DEMOMCDQ5
${LTC_Q12} =    DEMOMCD_LTC_DEMOMCDQ6
${LTC_Q13} =    name:DEMOMCD_LTC_DEMOMCDQ7
${LTC_Comment_Details1} =    //input[@id="DEMOMCD_LTC_DEMOMCDQ7a"]

#LTC_Memory
${LTC_Q14} =    MEMOMCD_LTC_MEMOMCDQ1
${LTC_Q15} =    MEMOMCD_LTC_MEMOMCDCRQ2
${LTC_Q16} =    MEMOMCD_LTC_MEMOMCDQ7
${LTC_Q17} =    MEMOMCD_LTC_MEMOMCDQ9
${LTC_NotesSummary1} =    //textarea[@id="MEMOMCD_LTC_MEMOMCDQ11"]

#LTC_General Health, Sensory & Communication
${LTC_Q18} =    name:GENEMCD_LTC_GENEMCDQ1
${LTC_Q19} =    name:GENEMCD_LTC_GENEMCDQ2
${LTC_Q20} =    GENEMCD_LTC_GENEMCDQ5
${LTC_Q21} =    GENEMCD_LTC_GENEMCDQ8
${LTC_Q22} =    name:GENEMCD_LTC_GENEMCDQ11
${LTC_Q23} =    name:GENEMCD_LTC_GENEMCDQ12
${LTC_Q24} =    GENEMCD_LTC_GENEMCDQ13
${LTC_Q25} =    GENEMCD_LTC_GENEMCDQ16
${LTC_Q26} =    GENEMCD_LTC_GENEMCDQ19
${LTC_Q27} =    GENEMCD_LTC_GENEMCDQ21
${LTC_NotesSummary2} =    //textarea[@id="GENEMCD_LTC_GENEMCDQ23"]

#LTC_Activities of Daily Living
${LTC_Q28a} =    ADLMCDGRID1Q1
${LTC_Q28b} =    ADLMCDGRID1Q2
${LTC_Q28c} =    ADLMCDGRID1Q3
${LTC_Q28d} =    ADLMCDGRID1Q4
${LTC_Q28e} =    ADLMCDGRID1Q5
${LTC_Q28f} =    ADLMCDGRID1Q6
${LTC_UsesAssistiveDeviceFor} =   id:option_0_ADLMCD_LTC_ADLMCDQ1
${LTC_Q29} =    ADLMCD_LTC_ADLMCDQ2
${LTC_Q30a} =    ADLMCDGRID2Q1
${LTC_Q30b} =    ADLMCDGRID2Q2
${LTC_Q30c} =    ADLMCDGRID2Q3
${LTC_Q30d} =    ADLMCDGRID2Q4
${LTC_Q30e} =    ADLMCDGRID2Q5
${LTC_Q30f} =    ADLMCDGRID2Q6
${LTC_NotesSummary3} =    //textarea[@id="ADLMCD_LTC_ADLMCDQ4"]

#LTC_Instrumental Activities of Daily Living
${LTC_Q31a} =    IADLMCDQ1a
${LTC_Q31b} =    IADLMCDQ1b
${LTC_Q31c} =    IADLMCDQ1c
${LTC_Q31d} =    IADLMCDQ1d
${LTC_Q31e} =    IADLMCDQ1e
${LTC_Q31f} =    IADLMCDQ1f
${LTC_Q31g} =    IADLMCDQ1g
${LTC_Q31h} =    IADLMCDQ1h
#${UsesAssistiveDeviceFor_2} =
#${UsesAssistiveDeviceFor_4} =
${LTC_Q32} =    IADLMCD_LTC_IADLMCDQ2a
${LTC_Q33a} =    IADLMCDQ3a
${LTC_Q33b} =    IADLMCDQ3b
${LTC_Q33c} =    IADLMCDQ3c
${LTC_Q33d} =    IADLMCDQ3d
${LTC_Q33e} =    IADLMCDQ3e
${LTC_Q33f} =    IADLMCDQ3f
${LTC_Q33g} =    IADLMCDQ3g
${LTC_Q33h} =    IADLMCDQ3h
${LTC_NotesSummary4} =    //textarea[@id="IADLMCD_LTC_IADLMCDQ4"]

#LTC_Health Systems and Status
${LTC_Q34} =    //input[@id="HSSMCD_LTC_HSSMCDQ1aa"]
${LTC_Q35} =    //input[@id="HSSMCD_LTC_HSSMCDQ1b"]
${LTC_Q36} =    HSSMCD_LTC_HSSMCDQ1
${LTC_Q37} =    HSSMCD_LTC_HSSMCDQ2
${LTC_Q39} =    id:option_0_HSSMCD_LTC_HSSMCDQ7
${LTC_Q40} =    name:HSSMCD_LTC_HSSMCDQ38
${LTC_Q41} =    HSSMCD_LTC_HSSMCDQ42
${LTC_Q42} =    HSSMCD_LTC_HSSMCDQ45
${LTC_Q43} =    HSSMCD_LTC_HSSMCDQ49
${LTC_NotesSummary5} =    //*[@id="HSSMCD_LTC_HSSMCDQ50"]

#LTC_Behavioral Health
${LTC_Q44} =    BHMCD_LTC_BHMCDQ1
${LTC_Q45} =    name:BHMCD_LTC_BHMCDQ2
${LTC_Q46} =    name:BHMCD_LTC_BHMCDQ3
${LTC_Q47} =    name:BHMCD_LTC_BHMCDQ24
${LTC_Q49} =    name:BHMCD_LTC_BHMCDQ20
${LTC_Q50} =    BHMCD_LTC_BHMCDQ21
${LTC_Q50_ParticipatDetails} =    //input[@id="BHMCD_LTC_BHMCDQ21b"]
${LTC_Q50a} =    BHMCD_LTC_BHMCDQ22
${LTC_Q50aDetails} =    //input[@id="BHMCD_LTC_BHMCDQ22a"]
${LTC_Q50b} =    BHMCD_LTC_BHMCDQ23
${LTC_Q51} =    BHMCD_LTC_BHMCDS2_BHMCDQ30
${LTC_NotesSummary6} =    //textarea[@id="BHMCD_LTC_BHMCDQ44"]

#LTC_Nutrition
${LTC_Q53} =    NUTRMCD_LTC_NUTRMCDQ1
${LTC_Q54} =    NUTRMCD_LTC_NUTRMCDQ3
${LTC_Q55} =    NUTRMCD_LTC_NUTRMCDQ5
${LTC_Q56} =    NUTRMCD_LTC_NUTRMCDQ6
${LTC_NotesSummary7} =    //textarea[@id="NUTRMCD_LTC_NUTRMCDQ10"]

#LTC_Medication
${LTC_Q59} =    //textarea[@id="MEDIMCD_LTC_MEDIMCDQ23"]
${LTC_NotesSummary8} =    //textarea[@id="MEDIMCD_LTC_MEDIMCDQ19"]

#LTC_Social Resources
${LTC_Q60a} =    SOCIMCD_LTC_SOCIMCDQ2
${LTC_Q60b} =    SOCIMCD_LTC_SOCIMCDQ3
${LTC_Q60c} =    SOCIMCD_LTC_SOCIMCDQ4
${LTC_Q62} =    SOCIMCDGRIDQ1
${LTC_Q63} =    SOCIMCDGRIDQ2
${LTC_Q64} =    SOCIMCDGRIDQ3
${LTC_NotesSummary9} =    //textarea[@id="SOCIMCD_LTC_SOCIMCDQ10"]

#LTC_Advance Directives
${LTC_Q65} =    ADMCD_LTC_ADMCDQ1
${LTC_Q66a} =    id:option_3_ADMCD_LTC_ADMCDS1_ADMCDQ3
${LTC_Q66b} =    id:option_1_ADMCD_LTC_ADMCDS1_ADMCDQ4
${LTC_NotesSummary10} =    //textarea[@id="ADMCD_LTC_ADMCDQ5"]

#LTC_Summary and Conclusions
${LTC_Q67} =    SnCMCD_LTC_SnCMCDQ1
${LTC_Q68} =    SnCMCD_LTC_SnCMCDQ2
${LTC_Q69} =    //input[@id="SnCMCD_LTC_SnCMCDQ3"]
${LTC_Q70} =    SnCMCD_LTC_SnCMCDQ4
${LTC_Q71} =    //input[@id="SnCMCD_LTC_SnCMCDQ5"]
${LTC_Q72} =    SnCMCD_LTC_SnCMCDQ6
${LTC_NotesSummary11} =    //textarea[@id="SnCMCD_LTC_SnCMCDQ7"]


*** Keywords ***
LTC_start with get Started
    [Arguments]    ${UserData}
    sleep    4s
    wait until page contains element    //a[contains(text(),'Get Started')]
    select from list by label    id:DETE_MCD_DETEMCDQ2    Illinois MMAI
    sleep    3s
    click element    //input[@name='DETE_MCD_DETEMCDQ3' and @value='${UserData.LTC_CaseType}']
    sleep    3s
    click element    ${GetStarted}

Keep ALL Exixting Details LTC
    [Arguments]    ${UserData}
    sleep    2s
    click element    ${btn_Reassess}
    sleep    2s
    click element    //a[@id="btnkeepExisingData" and contains(text(),'Keep All the Existing Details')]
    wait until element is visible    //*[text()='Case - Take Assessment: Comprehensive']
    input text    ${LTC_Q1}    ${UserData.LTC_Q1Updated}
    select from list by label    ${LTC_Q4}  ${UserData.LTC_Q4}
    click link    Preview & Submit
    wait until element is visible    //*[text()='Case - Preview Assessment: Comprehensive']
    click element    ${BH_Submit}
    wait until element is visible    ${BH_AcknowledgeAndSubmit}
    click element    ${BH_AcknowledgeAndSubmit}
    log to console    Changes done in assessment

User Take IL Assessment LTC
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    SearchPage.Click on the Member Central
    set focus to element    //ul[@class="MemberCentral-dropdown-menu-left"]//a[text()="CP CM Cases"]
    sleep    1s
    click element    ${CPCM}
    sleep    2s
    click element    //span[contains(text(),'${UserData.LTC_CaseId}')]
    click element    ${CompAssessment}
    sleep    4s
    ${Reassess} =   run keyword and return status  element should be visible    ${btn_Reassess}
    run keyword IF    ${Reassess}   Reset to ALL New   ${UserData}
    Fill LTC Assessment    ${UserData}
    log to console    LTC Assessment is submitted
    sleep    2s
    ${Reassess} =   run keyword and return status  element should be visible    ${btn_Reassess}
    run keyword IF    ${Reassess}   Keep ALL Exixting Details LTC   ${UserData}
    log to console    Changes done in LTC assessment
    wait until element is visible    ${btn_Reassess}
    sleep    2s
    ${Reassess} =   run keyword and return status  element should be visible    ${btn_Reassess}
    run keyword IF    ${Reassess}   Reset to ALL New   ${UserData}
    Fill LTC Assessment    ${UserData}
    log to console    LTC Assessment is submitted again
    wait until element is visible    (//a[@id="button-CompAssesment-History"])[1]
    set selenium implicit wait    10s
    Check The History    ${UserData}
##old    page should contain element    //*[text()='${UserData.LTC_Q1Updated}']
    log to console    updated change is verified through history
##old   Print with and without PHI LTC    ${UserData}
    Navigate to Medicaid Plan of Care
    sleep    2s
    ${EditStatus} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus}    click element    //a[@id="edit-plan-of-care-button"]
###old    Folloup Plan validation in PLOC LTC    ${UserData}      # Old changes
    Case Create Plan Of Care    ${UserData}
    Fill values Member Natural/Community Support Info    ${UserData}
    Follow up Plan Details    ${UserData}     # newly added section

    ${WaiverCodeStatus} =    run keyword and return status    element should be visible    //label[@for="ControlId4008" and contains(text(),'Member Self-Directed Option Discussed')]
    run keyword if    ${WaiverCodeStatus}    Fill up Member Self Directed Option discussed info    ${UserData}
    Contact information Update    ${UserData}

    Fill form in Strengths, Preferences, and Self Care Capabilities    ${UserData}
    Adding Services    ${UserData}
    Adding Services Again    ${UserData}
     sleep    10s
    ### Old changes below
#old    scroll element into view    //div[@id="NarrativeInformation"]/a
#old    page should contain element    //div[@id="ControlId4074" and contains(text(),'${UserData.LTC_NotesSummary4}')]
#old    page should contain element    //div[@id="ControlId4075" and contains(text(),'${UserData.LTC_NotesSummary5}')]
#old    page should contain element    //div[@id="ControlId4053" and contains(text(),'${UserData.LTC_NotesSummary6}')]
    ${chk_Attestation} =    run keyword and return status    page should contain element    //*[@id="left-nav"]//*[text()="Attestation"]
    run keyword if    ${chk_Attestation}    click element    //*[@id="left-nav"]//*[text()="Attestation"]
    ...    ELSE   Navigate to Medicaid Plan of Care
    sleep    10s
    ${EditStatus1} =    run keyword and return status    element should be visible    //a[@id="edit-plan-of-care-button"]
    run keyword if    ${EditStatus1}    click element    //a[@id="edit-plan-of-care-button"]
    sleep    10s
    click element    //*[@id="left-nav"]//*[text()="Attestation"]
    sleep    10s
    Select Attestation Radio Buttons
    Draw Dignature and save PlanOfCare
    Verify Auth Details of Services from Autharization    ${UserData}
    click link    Member Central
    sleep    5s
    Navigate Authorization Page
    sleep    5s
    run keyword if    '${UserData.Service_Auth2_status}' == 'Approved'    Validate Attachmemt in Auth    ${UserData.Service_Auth2}
    run keyword if    '${UserData.Service_Auth1_status}' == 'Approved'    Validate Attachmemt in Auth    ${UserData.Service_Auth1}
    Navigate to Medicaid Plan of Care
    Print PLOC Review type and Check Hostory    ${UserData}

Fill LTC Assessment
    [Arguments]    ${UserData}
    sleep    4s
    ${CHK_GetStarted} =    run keyword and return status    element should be visible    ${GetStarted}
    run keyword IF    ${CHK_GetStarted}    LTC_start with get Started    ${UserData}
    sleep    4s
    ${ResumeBtn} =   run keyword and return status  element should be visible    ${btn_Resume}
    run keyword IF  ${ResumeBtn}    click element    ${btn_resume}
    LTC_Demographic    ${UserData}
    LTC_Memory    ${UserData}
    LTC_General Health, Sensory & Communication    ${UserData}
    LTC_Activities of Daily Living    ${UserData}
    LTC_Instrumental Activities of Daily Living   ${UserData}
    LTC_Health Systems and Status   ${UserData}
    LTC_Behavioral Health   ${UserData}
    LTC_Nutrition   ${UserData}
    LTC_Medication   ${UserData}
    LTC_Social Resources   ${UserData}
    LTC_Advance Directives   ${UserData}
    LTC_Summary and Conclusions   ${UserData}
    click element    ${BH_ReviewAndSubmit}
    click element    ${BH_Submit}
    click element    ${BH_AcknowledgeAndSubmit}

Print with and without PHI LTC
    [Arguments]    ${UserData}
    click link    Member Central
    wait until element is visible    ${CPCM}
    click element    ${CPCM}
    click element    //span[contains(text(),'${UserData.LTC_CaseId}')]
    click element    ${CompAssessment}
    wait until element is visible    ${PrintIcon}
    click element    ${PrintIcon}
    element should be visible    ${WithPHI}
    element should be visible    ${WithoutPHI}
#    click element    ${WithPHI}

Folloup Plan validation in PLOC LTC
    [Arguments]    ${UserData}
    scroll element into view    //*[text()='Follow-Up Plan']
#    wait until element is visible    //select[@id="CareCooridinatorContactFrequency"]//option[@selected="selected"]
    sleep    2s
    ${Chk_FrequencyOf_Coordinator} =    get text    //select[@id="CareCooridinatorContactFrequency"]//option[@selected="selected"]
    ${Chk_FrequencyOf_Coordinator} =    strip string    ${Chk_FrequencyOf_Coordinator}    mode=both
    log to console    ${Chk_FrequencyOf_Coordinator}
    should be equal as strings    ${Chk_FrequencyOf_Coordinator}    ${UserData.LTC_Q68}
    sleep    2s
    wait until element is visible    //select[@id="FollowupType"]//option[@selected="selected"]
    ${FollowupType} =    get text    //select[@id="FollowupType"]//option[@selected="selected"]
    ${FollowupType} =    strip string    ${FollowupType}    mode=both
    log to console    ${FollowupType}
    should be equal as strings    ${FollowupType}    ${UserData.LTC_Q70}
    page should contain element    //*[@id='FollowupScheduleDate' and text()='${UserData.LTC_Q71}']

LTC_Demographic
     [Arguments]    ${UserData}
     sleep    2s
     Run keyword Until Success    double click element    ${Demographic}
     sleep    2s
     Run keyword Until Success    input text    ${LTC_Q1}  ${UserData.LTC_Q1}
     sleep    1s
     input text    ${LTC_PhoneNumberExtension}     ${UserData.LTC_PhoneNumberExtension}
#    input text    ${PhoneNumberExtension}    1234
     select from list by label  ${LTC_Q3}  ${UserData.LTC_Q3}
     select from list by label    ${LTC_Q4}  ${UserData.LTC_Q4}
     select radio button     ${LTC_Q5}  ${UserData.LTC_Q5}
     select from list by label    ${LTC_Q6}  ${UserData.LTC_Q6}
     select radio button     ${LTC_Q7}  ${UserData.LTC_Q7}
     set selenium implicit wait    10s
     select from list by label    ${LTC_Q8}  ${UserData.LTC_Q8}
     scroll element into view    ${LTC_Q10}
     sleep    1s
     select radio button     ${LTC_Q9}  ${UserData.LTC_Q9}
     select from list by label    ${LTC_Q10}  ${UserData.LTC_Q10}
     select checkbox    ${LTC_Q11}
     select radio button     ${LTC_Q12}  ${UserData.LTC_Q12}
     select from list by label    ${LTC_Q13}  ${UserData.LTC_Q13}
     input text    ${LTC_Comment_Details1}    ${UserData.LTC_Comment_Details1}
     click element    ${CopmpleteAndNext}


LTC_Memory
    [Arguments]    ${UserData}
    sleep    2s
    select radio button     ${LTC_Q14}  ${UserData.LTC_Q14}
    select radio button     ${LTC_Q15}  ${UserData.LTC_Q15}
    select radio button     ${LTC_Q16}  ${UserData.LTC_Q16}
    select radio button     ${LTC_Q17}  ${UserData.LTC_Q17}
    input text    ${LTC_NotesSummary1}    ${UserData.LTC_NotesSummary1}
    click element    ${CopmpleteAndNext}

LTC_General Health, Sensory & Communication
    [Arguments]    ${UserData}
    sleep    3s
    select from list by label    ${LTC_Q18}  ${UserData.LTC_Q18}
    select from list by label    ${LTC_Q19}  ${UserData.LTC_Q19}
    select radio button     ${LTC_Q20}  ${UserData.LTC_Q20}
    select radio button     ${LTC_Q21}  ${UserData.LTC_Q21}
    select from list by label    ${LTC_Q22}  ${UserData.LTC_Q22}
    select from list by label    ${LTC_Q23}  ${UserData.LTC_Q23}
    select radio button     ${LTC_Q24}  ${UserData.LTC_Q24}
    select radio button     ${LTC_Q25}  ${UserData.LTC_Q25}
    select radio button     ${LTC_Q26}  ${UserData.LTC_Q26}
    select radio button     ${LTC_Q27}  ${UserData.LTC_Q27}
    input text    ${LTC_NotesSummary2}    ${UserData.LTC_NotesSummary2}
    click element    ${CopmpleteAndNext}

LTC_Activities of Daily Living
    [Arguments]    ${UserData}
    sleep    3s
    select radio button    ${LTC_Q28a}  ${UserData.LTC_Q28a}
    select radio button    ${LTC_Q28b}  ${UserData.LTC_Q28b}
    select radio button    ${LTC_Q28c}  ${UserData.LTC_Q28c}
    select radio button    ${LTC_Q28d}  ${UserData.LTC_Q28d}
    select radio button    ${LTC_Q28e}  ${UserData.LTC_Q28e}
    select radio button    ${LTC_Q28f}  ${UserData.LTC_Q28f}
    select checkbox    ${LTC_UsesAssistiveDeviceFor}
    select radio button    ${LTC_Q29}  ${UserData.LTC_Q29}
    select radio button    ${LTC_Q30a}  ${UserData.LTC_Q30a}
    select radio button    ${LTC_Q30b}  ${UserData.LTC_Q30b}
    select radio button    ${LTC_Q30c}  ${UserData.LTC_Q30c}
    select radio button    ${LTC_Q30d}  ${UserData.LTC_Q30d}
    select radio button    ${LTC_Q30e}  ${UserData.LTC_Q30e}
    select radio button    ${LTC_Q30f}  ${UserData.LTC_Q30f}
    input text    ${LTC_NotesSummary3}  ${UserData.LTC_NotesSummary3}
    click element    ${CopmpleteAndNext}

LTC_Instrumental Activities of Daily Living
    [Arguments]    ${UserData}
    sleep    4s
    select radio button    ${LTC_Q31a}  ${UserData.LTC_Q31a}
    select radio button    ${LTC_Q31b}  ${UserData.LTC_Q31b}
    select radio button    ${LTC_Q31c}  ${UserData.LTC_Q31c}
    select radio button    ${LTC_Q31d}  ${UserData.LTC_Q31d}
    select radio button    ${LTC_Q31e}  ${UserData.LTC_Q31e}
    select radio button    ${LTC_Q31f}  ${UserData.LTC_Q31f}
    select radio button    ${LTC_Q31g}  ${UserData.LTC_Q31g}
    select radio button    ${LTC_Q31h}  ${UserData.LTC_Q31h}
    select radio button    ${LTC_Q32}  ${UserData.LTC_Q32}
    select radio button    ${LTC_Q33a}  ${UserData.LTC_Q33a}
    select radio button    ${LTC_Q33b}  ${UserData.LTC_Q33b}
    select radio button    ${LTC_Q33c}  ${UserData.LTC_Q33c}
    select radio button    ${LTC_Q33d}  ${UserData.LTC_Q33d}
    select radio button    ${LTC_Q33e}  ${UserData.LTC_Q33e}
    select radio button    ${LTC_Q33f}  ${UserData.LTC_Q33f}
    select radio button    ${LTC_Q33g}  ${UserData.LTC_Q33g}
    select radio button    ${LTC_Q33h}  ${UserData.LTC_Q33h}
    input text    ${LTC_NotesSummary4}  ${UserData.LTC_NotesSummary4}
    click element    ${CopmpleteAndNext}

LTC_Health Systems and Status
    [Arguments]  ${UserData}
    sleep    4s
    input text    ${LTC_Q34}  ${UserData.LTC_Q34}
    input text    ${LTC_Q35}  ${UserData.LTC_Q35}
    select radio button    ${LTC_Q36}  ${UserData.LTC_Q36}
    select radio button    ${LTC_Q37}  ${UserData.LTC_Q37}
    select checkbox    ${LTC_Q39}
    select from list by label    ${LTC_Q40}  ${UserData.LTC_Q40}
    select radio button    ${LTC_Q41}  ${UserData.LTC_Q41}
    select radio button    ${LTC_Q42}  ${UserData.LTC_Q42}
    scroll element into view    ${LTC_NotesSummary5}
    select radio button    ${LTC_Q43}  ${UserData.LTC_Q43}
    input text    ${LTC_NotesSummary5}  ${UserData.LTC_NotesSummary5}
    click element    ${CopmpleteAndNext}

LTC_Behavioral Health
    [Arguments]  ${UserData}
    sleep  3s
    select radio button    ${LTC_Q44}  ${UserData.LTC_Q44}
    select from list by label    ${LTC_Q45}  ${UserData.LTC_Q45}
    select from list by label    ${LTC_Q46}  ${UserData.LTC_Q46}
    select from list by label    ${LTC_Q47}  ${UserData.LTC_Q47}
    select from list by label    ${LTC_Q49}  ${UserData.LTC_Q49}
    select radio button    ${LTC_Q50}  ${UserData.LTC_Q50}
    input text    ${LTC_Q50_ParticipatDetails}  ${UserData.LTC_Q50_ParticipatDetails}
    select radio button    ${LTC_Q50a}  ${UserData.LTC_Q50a}
    input text    ${LTC_Q50aDetails}  ${UserData.LTC_Q50aDetails}
    select radio button    ${LTC_Q50b}  ${UserData.LTC_Q50b}
    select radio button    ${LTC_Q51}  ${UserData.LTC_Q51}
    input text    ${LTC_NotesSummary6}  ${UserData.LTC_NotesSummary6}
    click element    ${CopmpleteAndNext}

LTC_Nutrition
    [Arguments]  ${UserData}
    sleep   3s
    select radio button    ${LTC_Q53}  ${UserData.LTC_Q53}
    select radio button    ${LTC_Q54}  ${UserData.LTC_Q54}
    select radio button    ${LTC_Q55}  ${UserData.LTC_Q55}
    select radio button    ${LTC_Q56}  ${UserData.LTC_Q56}
    input text    ${LTC_NotesSummary7}  ${UserData.LTC_NotesSummary7}
    click element    ${CopmpleteAndNext}

LTC_Medication
    [Arguments]  ${UserData}
    sleep    3s
    input text    ${LTC_Q59}  ${UserData.LTC_Q59}
    input text    ${LTC_NotesSummary8}  ${UserData.LTC_NotesSummary8}
    click element    ${CopmpleteAndNext}

LTC_Social Resources
    [Arguments]  ${UserData}
    sleep    3s
    select radio button    ${LTC_Q60a}    ${UserData.LTC_Q60a}
    select radio button    ${LTC_Q60b}    ${UserData.LTC_Q60b}
    select radio button    ${LTC_Q60c}    ${UserData.LTC_Q60c}
    select radio button    ${LTC_Q62}    ${UserData.LTC_Q62}
    select radio button    ${LTC_Q63}    ${UserData.LTC_Q63}
    select radio button    ${LTC_Q64}    ${UserData.LTC_Q64}
    input text    ${LTC_NotesSummary9}    ${UserData.LTC_NotesSummary9}
    click element    ${CopmpleteAndNext}

LTC_Advance Directives
    [Arguments]  ${UserData}
    sleep    3s
    select radio button    ${LTC_Q65}    ${UserData.LTC_Q65}
    select checkbox    ${LTC_Q66a}
    select checkbox    ${LTC_Q66b}
    input text    ${LTC_NotesSummary10}    ${UserData.LTC_NotesSummary10}
    click element    ${CopmpleteAndNext}

LTC_Summary and Conclusions
    [Arguments]  ${UserData}
    sleep    3s
    select from list by label    ${LTC_Q67}    ${UserData.LTC_Q67}
    select from list by label    ${LTC_Q68}    ${UserData.LTC_Q68}
    input text    ${LTC_Q69}    ${UserData.LTC_Q69}
    select from list by label    ${LTC_Q70}    ${UserData.LTC_Q70}
    input text    ${LTC_Q71}    ${UserData.LTC_Q71}
    select radio button    ${LTC_Q72}    ${UserData.LTC_Q72}
    input text    ${LTC_NotesSummary11}    ${UserData.LTC_NotesSummary11}

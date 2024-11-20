*** Settings ***
Resource    ../Definitions/HumanaGui.robot
Resource    ../PageObjects/MCD_VariousFlowsPO.robot
Resource    ../PageObjects/FL_ExploratoryPO.robot
Resource    ../PageObjects/Task.robot
Resource    ../PageObjects/KY_Assessment_HealthRisk.robot

Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Various Flow_Member Central_Task
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to Tasks
    CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${UserData}

Various Flow_MemberCentral_Auth_Task
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}
    Navigate to Auth Task
    CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${UserData}

Various Flow_MemberCentral_CPCM Case_Task
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    Various Flows Create case of CPCM   ${UserData}
    Navigate to task under CPCM
    CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${UserData}

Various Flow_MemberCentral_LTSS Cases_Task
    [Arguments]    ${UserData}
     Navigate To Role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
     MyWorkPage.Click on the Member Central
     Click on the LTSS Case
     FLASSESSMENTPR.SELECT THE CASE
     Navigate to task under LTSS
     Various Flows Create Task for LTSS Case

Various Flow_My work LTSS Cases_Task
    [Arguments]    ${UserData}
    Navigate to MyWork LTSS Cases
    Open LTSS case from myQueue List
    Various Flows Create Task for LTSS Case

Various Flow_My work_Authorization_Task
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}
    click element    //a[@id="view-take-ownership"]
    sleep    4s
    Get Auth Value after Submission    ${UserData}
    Navigation.Navigate to MyWork Authorizations
    Navigate to Task Under myworkAuth    ${UserData}
    CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${UserData}

Various Flow_My work_CPCM Case_Task
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    Various Flows Create case of CPCM   ${UserData}
    get Case details and navigate to MyWork CPCM case
    Navigate to task under CPCM
    CPCM – Tasks – Valid - Tasks_Add_Save_Validation    ${UserData}
    Close task Under CPCM case

Various Flow_Member MY Work_Edit CPCM Case
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    Various Flows Create case of CPCM   ${UserData}
    get Case details and navigate to MyWork CPCM case
    Edit And Save CPCM Case

Various Flow_Member MY Work_Referral_Create Case
    [Arguments]    ${UserData}
    Navigate to role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to MyWork Referrals
    Navigate on My Work Referral to Create Case    ${UserData}    ${UserData.QueueName}

Various Flow_assessment from MyWork-Assessment-Take as New
    [Arguments]    ${UserData}
    KY HealthRisk Assessment    ${UserData}
    wait until element is visible    ${latestCreationDate}    30s
    sleep    3s
    Navigate to MyWork Assessment
    Open Assessment from MyWork_Assessment
    Take As New and Submit assessment from Existing Assess    ${UserData}
    Verify details of Ass at MC level

Various Flow_assessment from MyWork-CPCM Cases-Assessment
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    Various Flows Create case of CPCM   ${UserData}
    get Case details and navigate to MyWork CPCM case
    Navigate to Assessment under MyWork CPCM case    ${UserData}
    Fillup the answers of Ky HRA Assessment    ${UserData}
    Void the Assessment
    wait until element is visible    //span[@id="CaseId"]    30s
    Close Case

Various Flow_assessment from MyWork-Auth-Assessment
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}
    click element    //a[@id="view-take-ownership"]
    wait until element is visible    //a[@id="view-take-ownership"]    30s
    Get Auth Value after Submission    ${UserData}
    Navigation.Navigate to MyWork Authorizations
    Open Auth from MyWork Authorization    ${UserData}
    Navigate to Auth level Assessment    ${UserData}
    Fillup the answers of Ky HRA Assessment    ${UserData}
    Void the Assessment
*** Variables ***
${AuthID}        100228362
*** Keywords ***

Various Flow_Comm Rec_My Work_Auth_Comm Rec
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}
    click element    //a[@id="view-take-ownership"]
    wait until element is visible    //a[@id="view-take-ownership"]    30s
    Get Auth Value after Submission    ${UserData}
    Navigation.Navigate to MyWork Authorizations
#####    Open Auth from MyWork Authorization    ${UserData}      ////Alternative Code to selct auth
    click element    //*[contains(text(),'${UserData.AuthID_Value}')]
###    click element    //*[contains(text(),'100228362')]
    Comm record link from MYWork Auth
    Navigate to Create Comm Record
    Add Outbound Communication Record at Auth Level   ${UserData}

Various Flow_Comm Rec_My Work_LtssCase_Comm Rec
    [Arguments]    ${UserData}
    navigate to role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    navigate to mywork ltss cases
####    Open Case from my work Ltss case    ${UserData}
    click element    //*[contains(text(),'${UserData.LTSSCase_Value}')]
    Navigate to LTSS Comm Rec
    Navigate to Create Comm Record
    Add Outbound Communication Record in Ltss case_Various Flows   ${UserData}

Various Flow_Comm Rec_My Work_CPCM Case_Add Comm Rec
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    Various Flows Create case of CPCM   ${UserData}
    get Case details and navigate to MyWork CPCM case
    Navigate to Communication record under CPCM case
    Navigate to Create Comm Record
    Add Communication Record in MW CPCM_Various Flows    ${UserData}
    Close the exisisting cpcm case

Various Flow_Comm Rec_Case ID Search_Add_Comm Rec
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to CPCM Cases
    Various Flows Create case of CPCM   ${UserData}
    Get Case details and search the Case ID
    Navigate to Communication record under CPCM case
    Navigate to Create Comm Record
    Add Communication Record in MW CPCM_Various Flows    ${UserData}
#    Close the exisisting cpcm case

Various Flow_Comm Rec_Auth ID Search_Add_Comm Rec
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}
    click element    //a[@id="view-take-ownership"]
    wait until element is visible    //a[@id="view-take-ownership"]    30s
    Get Auth Value after Submission    ${UserData}
    Search the AuthID    ${UserData}
    Comm record link from MYWork Auth
    Navigate to Create Comm Record
    Add Outbound Communication Record at Auth Level   ${UserData}


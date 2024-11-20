*** Settings ***
Documentation  This script is used to Create Authorization
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime

Resource  ../Definitions/HumanaGui.robot


#  ************************************Fragile Pediatric RuleOpAuth**************************
*** Variables ***
${Fragile_CPCM_Cases} =    xpath://ul[@class="MemberCentral-dropdown-menu-left"]//a[text()="CP CM Cases"]
${Fragile_Tasks} =     //ul[@class='side-nav']//a[text()='Tasks']
${Fragile_Close_btn} =    //*[@id='view-task-close-btn']//u[text()='Close']
${Fragile_MC_Tasks} =     //ul[@class="MemberCentral-dropdown-menu-right"]//a[text()='Tasks']
${Fragile_PrimaryName} =    EMPTY


*** Keywords ***
MCD Regression Auth Creation
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.click on the Member Central
    Navigate Authorization Page
    User Inputs for Authorization    ${UserData}
#    #Log the Status    ${UserData}

GO To latest task in CPCM case
    [Arguments]  ${UserData}
   # click link  Member Central
   # sleep    2s
   # click element    ${Fragile_CPCM_Cases}
    Navigate to CPCM Cases
    click element    //span[contains(text(),'${UserData.Fragile_CaseID}')]
    click element    ${Fragile_Tasks}

    ${Desc_check1} =   run keyword and return status  page should not contain element    //th[@data-field="DisplayFollowUpDate" and @aria-sort="descending"]
    run keyword IF    ${Desc_check1}   click element    //th[@data-field="DisplayFollowUpDate"]

    ${Desc_check2} =   run keyword and return status  page should not contain element    //th[@data-field="DisplayFollowUpDate" and @aria-sort="descending"]
    run keyword IF    ${Desc_check2}   click element    //th[@data-field="DisplayFollowUpDate"]

    ${Desc_check3} =   run keyword and return status  page should contain element    //th[@data-field="DisplayFollowUpDate" and @aria-sort="descending"]
    run keyword IF    ${Desc_check3}   click element    //*[@id="CaseTask"]/div[2]/div[1]/table/tbody/tr[1]
    wait until element is visible    //*[@id="modal-header-title" and text()='View Task']

Fragile Pediatric RuleOpAuth
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
    sleep    15m
    GO To latest task in CPCM case    ${UserData}

    ${Fragile_PrimaryName} =    get text    //label[text()='Current Primary Queue']//following::span[@id='PrimaryQueueName'][2]
    ${Fragile_PrimaryName} =    strip string    ${Fragile_PrimaryName}    mode=both
    set global variable    ${Fragile_PrimaryName}
#    ${Fragile_PrimaryName} =    get text    //a[@id="authLink"]
    log to console    runtime value: ${Fragile_PrimaryName}

    Fragile_AuthTask_Validation    ${UserData}     #Validation
    click element    ${Fragile_Close_btn}
    set selenium implicit wait    10s
    click link  Member Central
    sleep    2s
    click element    ${Fragile_MC_Tasks}
    click element    //*[@id="MemberCentralTask"]/div[2]/div[1]/table/tbody/tr[1]
    Fragile_AuthTask_Validation    ${UserData}     #Validation


Fragile_AuthTask_Validation
    [Arguments]    ${UserData}
    sleep    3s
    ${date} =    Get Current Date    result_format=%m/%d/%Y
    #should be equal as strings    ${Fragile_PrimaryName}    ${UniversalLoggedInUserName}
    page should contain element    //*[@id="modal-header-title" and contains(text(),'View Task')]
    page should contain element    //div[@class="small-9 columns Wordbreak" and contains(text(),'${UserData.Fragile_Subject}')]
    #page should contain element    //td[contains(text(),'${UserData.Fragile_Description}')]
    page should contain element    //div[@id='Priority' and contains(text(),'${UserData.Fragile_Priority}')]
    page should contain element    //div[@id='TypeDescription' and contains(text(),'${UserData.Fragile_TaskType}')]
    page should contain element    //div[@id='FollowUpDate' and contains(text(),'${date}')]
#    page should contain element    //div[@id='FollowUpDate' and contains(text(),'${UserData.Fragile_FollowUpDate}')]
    page should contain element    //div[@id='QueueNameAutoComplete' and contains(text(),'${Fragile_PrimaryName}')]
    #element should contain    //div[@id='QueueNameAutoComplete']    ${Fragile_PrimaryName}
#  ************************************SCPH_Routing_BariatrcRule**************************

*** Keywords ***
SCPH_Routing_BariatrcRule
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
    page should contain element    //td[@title=' Potential Bariatrics Case ' and text()='${UserData.BRMessage_1649038}']
    page should contain element    //span[@id='AssignedQueue' and contains(text(),'${UserData.AssignedQueue_1649039}')]


#  ************************************FU_IPAuth_TC01_TaskGenerate**************************
*** Variables ***
${AuthId_Path} =    //span[@id="AuthId"]
${AuthID_Value} =    EMPTY

*** Keywords ***
FU_IPAuth_TC01_TaskGenerate
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
    ${AuthID_Value} =    get text    ${AuthId_Path}
    set global variable    ${AuthID_Value}
    ${AuthID_Value} =    strip string    ${AuthID_Value}    mode=both
    log to console    ${AuthID_Value}
    #
    #click element    //*[text()='088302727']
    #
    Check If Auth Approved
    sleep    20m
    GO To latest task in CPCM case    ${UserData}
    1562707_Validate fields    ${UserData}

1562707_Validate fields
    [Arguments]    ${UserData}
    log to console    Inside Keyword:${AuthID_Value}
    page should contain element    //div[@class='small-9 columns Wordbreak' and contains(text(),'Follow Up with Member and Provider as applicable ${AuthID_Value}')]
    #Member had an Inpt Post ER tx and now was discharged on 06-01-2021 with DC-To Home and RPM High.
    ${CurrentDate} =    Get Current Date    result_format=%m-%d-%Y
    wait until page contains element    //*[@id="TaskDetailComments"]/div[2]/table/tbody/tr/td[3]
    sleep    1s
    scroll element into view    //*[@id="TaskDetailComments"]/div[2]/table/tbody/tr/td[3]
    page should contain element    //*[@class="maskable" and contains(text(),'Member had an ${UserData.AdmissionType} and now was discharged on ${CurrentDate} with DC-To Home and RPM High. From Auth ID - ${AuthID_Value}')]
#    page should contain element    //*[@class="maskable" and contains(text(),'Member had an ${UserData.AdmissionType} and now was discharged on ${CurrentDate} with ${UserData.DischargeDis} and RPM High. From Auth ID - 88302808')]
    page should contain element    //div[@class="bottom-divider editTaskHeaderDetails"]//*[contains(text(),'${UserData.Source_1562707}')]
    page should contain element    //div[@id='TypeDescription' and text()='${UserData.TaskType_1562707}']

#  ***********************************1571736_CLIN_MF32_BHIP_Auth**************************
*** Keywords ***
1571736_CLIN_MF32_BHIP_Auth
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
#    Navigate To Role
#    Applying the Role   ${UserData}
#    1571736_BH_IPAuthCreation    ${UserData}
#
#1571736_BH_IPAuthCreation
#    [Arguments]    ${UserData}
#    Search For Member   ${UserData}
#    Select The Member
#    Click on the Member Central
#    Navigate Authorization Page
#    User Inputs for Authorization    ${UserData}

#*********************************** 1843173_Inpatient_Psych_Referal **************************
*** Variables ***
${edit-bhip-auth} =    //a[@id="edit-bhip-auth-info-partial"]
${link_Referals} =    //*[@id="member-center-menu-dropdown"]/div/ul[3]/li[6]/a     #//ul[@class="MemberCentral-dropdown-menu-right"]//a[text()='Referrals']
${RecentAuth} =    //td[@title=" Approved "]//preceding-sibling::td[@title=" BHInpatient "]
${GeneratedReferal} =    //tbody//td[@title=" KY: Medicaid CM-BH "]
${submitCase} =    //a[@id="button-submit-cpcmcase" and text()='Submit']
*** Keywords ***
1843173_Inpatient_Psych_Referal
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
    set selenium implicit wait    5s
    click link  Member Central
    sleep    1s
    click element    ${link_Referals}
    Validate if Referals is not Created
    click link  Member Central
    sleep    1s
    click element  ${AuthMenu}
    sleep    1s
    click element    ${RecentAuth}
    click element    ${edit-bhip-auth}
    Edit Admission Date back to 55Days      # 55 days back from current date
    sleep    2s
    click link    Submit Auth
    sleep    20s
    click link    Member Central
    sleep    1s
    click element    ${link_Referals}
    #click link  Member Central
    # wait until element is visible    ${link_Referals}
    Validate if Referals is Created
    click element    ${GeneratedReferal}
    sleep    2s
    page should contain element    //div[@id='ReferralReason' and text()='BH IP Follow Up']     # validate CM referal reason
    click link    Create Case
    sleep    3s
    page should contain element    //span[text()='BH IP Auth' and @title="BH IP Auth"]      #validate CM referal source
    page should contain element    //span[contains(text(),'Medicaid Case Management') and @title="Medicaid Case Management (MCM)"]
    click link    ${submitCase}
    ${finalStatus} =    run keyword and return status    page should contain element    //*[contains(text(),'Case details have been updated successfully')]
    run keyword if    ${finalStatus}    log to console    Test case is Passes for :1843173 Inpatient Psych BHIP Referal

Edit Admission Date back to 55Days
    sleep    1s
    clear element text    ${AdmissionDate}
    ${DateToday} =      get current date    result_format=%m/%d/%Y
    ${Date_Backto55} =        Add Time To Date  ${DateToday}    -55 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
    log to console    ${Date_Backto55}
    sleep    2s
    scroll element into view    ${AdmissionDate}
    input text     ${AdmissionDate}    ${Date_Backto55}

Validate if Referals is Created
    sleep    3s
    page should contain element    //div[@class="small-5 columns hide-for-medium-down"]//h3[text()='Referrals']
    page should contain element     ${GeneratedReferal}


Validate if Referals is not Created
    sleep    3s
    page should contain element    //div[@class="small-5 columns hide-for-medium-down"]//h3[text()='Referrals']
    page should contain element    //div[@id="MemberReferrals-Zero-Count-div"]//h6[text()='No Records Found']

*** Settings ***
Library  SeleniumLibrary
Library    OperatingSystem
Library  ../../CustomLibs/DataCreation.py
Resource  ../../Data/Config.robot
Resource  ../PageObjects/LandingPage.robot
Resource  ../PageObjects/Navigation.robot
Resource  ../Definitions/HumanaGui.robot

*** Variables ***
${UniversalMemberName}
${UniversalMemberID}
${UniversalMemberDOB}
@{MemberDOBList}
${UniversalLoggedInUserName}

*** Keywords ***
Begin Web Test
    create_a_txt_file    ${FILE_PATH}
###### Saranya 8/2 Change to add the Download Directory for PDF
#    ${Download_Dir} =    Create Dictionary    download.default_directory=C:\Users\SNG9716\RobotLocal\Data
#    Open Browser    about:blank    ${BROWSER}   options=add_experimental_option("prefs",${Download_Dir})
    Open Browser    about:blank    ${BROWSER}
##################################################
    maximize browser window
    LandingPage.Load CGX
    Verify Landing Page Load
    set selenium implicit wait  5 Seconds
    page should contain link  CGX 2.0
    click element  //a[@class ='secondary list' and text()='CGX 2.0']
    ${Okaybutton} =   run keyword and return status  page should contain element    //*[@id="ok-button"]
    run keyword if  ${Okaybutton}    Click Ok Button
    run keyword if   '${ENVIRONMENT}' == 'qa' and '${INSTANCE}' == 'qa2'    Navigate to QA2
    ...         ELSE IF  '${ENVIRONMENT}' == 'qa' and '${INSTANCE}' == 'offcycleqa'    Navigate to OffCycleQA


Click Ok Button
    page should contain element  //*[@id="ok-button"]
    click element  //*[@id="ok-button"]

End Web Test
    close browser

Navigate to QA2
    page should contain element  //*[@id="cgx_qa2_web"]
    click element  //*[@id="cgx_qa2_web"]
    page should contain element  //*[@id="ok-button"]
    click element  //*[@id="ok-button"]

Navigate to OffCycleQA
    page should contain element  //*[@id="cgx_qa2_web"]
    click element  //*[@id="cgx_offcycleqa_web"]
    page should contain element  //*[@id="ok-button"]
    click element  //*[@id="ok-button"]



My Work Assessments Navigation
     Navigate to MyWork Assessment

My Work Authorizations Navigation
     Navigate to MyWork Authorizations

My Work Behavioral Navigation
     Navigate to MyWork Behavioral Segment

My Work CP CM Cases Navigation
     Navigate to MyWork CPCM Case

My Work Consultations Navigation
     Navigate to MyWork Consultations

My Work Fax Navigation
     Navigate to MyWork Fax Status

My Work LTSS Navigation
    Navigate to MyWork LTSS Cases

My Work Manage Queues Navigation
    Navigate to MyWork Manage Queues

My Work Provider Search Navigation
    Navigate to MyWork Provider Search
    click element   //div[@id='provider-search-request']//u[contains(text(),'Cancel')]
    set selenium implicit wait  10 Seconds

My Work Recent Work Navigation
    Navigate to MyWork Recent Work

My Work Referral Requests Navigation
    Navigate to MyWork Referral Request

My Work Referrals Navigation
    Navigate to MyWork Referrals

My Work Reset Global Settings Navigation
    Navigate to MyWork Reset Global Settings

My Work Tasks Navigation
    Navigate to MyWork Tasks

My Work Routes Navigation
    Navigate to MyWork Routes
    set selenium implicit wait  10 Seconds
    run keyword if   '${INSTANCE}' == 'qa2'    go to   https://qa2-carehub.humana.com/cgx/Search
    ...         ELSE IF  '${INSTANCE}' == 'offcycleqa'    go to   https://offcycleqa-carehub.humana.com/cgx/Search
    ...         ELSE     go to    https://carehub.humana.com/cgx/Search

Admin Assessment Template Downmerge Navigation
    Navigate to Admin Assessment Template Downmerge

Admin Care Plan Configuration Navigation
    Navigate to Admin Care Plan Configuration

Admin Communication Record Configuration Navigation
    Navigate to Admin Communication Record Configuration

Admin Letter Template Configuration Navigation
    Navigate to Admin Letter Template Configuration

Admin Role Emulator Navigation
    Navigate to Admin Role Emulator




Member Central Alternate Info Navigation
    Navigate to Alternate Info

Member Central MemberAssessment Navigation
    Navigate to MemberAssessment

Member Central Authorizations Navigation
    Navigate to Authorizations

Member Central Behavioral Segment Navigation
    Navigate to Behavioral Segment

Member Central MemberCarePlan Navigation
    Navigate to MemberCarePlan

Member Central Care Plan 3 Navigation
    Navigate to Care Plan 3

Member Central Clinical Consultation Navigation
    Navigate to Clinical Consultation
    set selenium implicit wait  5 Seconds

Member Central Communication Record Navigation
    Navigate to Communication Record

Member Central Considerations Navigation
    Navigate to Considerations

Member Central CPCM Cases Navigation
    Navigate to CPCM Cases

Member Central ICT Request Navigation
    Navigate to ICT Request

Member Central Letters Navigation
    Navigate to Letters

Member Central LTSS Cases Navigation
    Navigate to LTSS Cases

Member Central Medicaid Plan of Care Navigation
    Navigate to Medicaid Plan of Care

Member Central Medical List Navigation
    Navigate to Medical List

Member Central Medical List - OML Navigation
    Navigate to Medical List - OML

Member Central Member Attachments Navigation
    Navigate to Member Attachments

Member Central Member Consultation Navigation
    Navigate to Member Consultation

Member Central Member Info Navigation
    Navigate to Member Info

Member Central Member Movement Navigation
    Navigate to Member Movement

Member Central Member Timeline Navigation
    Navigate to Member Timeline

Member Central Notes Navigation
    Navigate to Notes

Member Central Provider Search Navigation
    Navigate to Provider Search

Member Central Referral Request Navigation
    Navigate to Referral Request

Member Central Referrals Navigation
    Navigate to Referrals

Member Central Risk Ranking Navigation
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role    ${UserData}
    Search For Member    ${UserData}
    select the member
    Navigate to Risk Ranking

Member Central Risk Ranking Navigation Non LTSS
    Navigate to Risk Ranking
Member Central Tasks Navigation
    Navigate to Tasks

Member Central Plan of Care Navigation
    Navigate to Plan of Care

Member Central Plan of Care LTSS Navigation
    [Arguments]    ${UserData}
    Search For Member    ${UserData}
    select the member
    Navigate to Plan of Care LTSS

Member Central Alternate Info Navigation - Not in Focus
    Navigate to Alternate Info Not in Focus

Member Central MemberAssessment Navigation - Not in Focus
    Navigate to MemberAssessment Not in Focus

Member Central Authorizations Navigation - Not in Focus
    Navigate to Authorizations Not in Focus

Member Central Behavioral Segment Navigation - Not in Focus
    Navigate to Behavioral Segment Not in Focus

Member Central MemberCarePlan Navigation - Not in Focus
    Navigate to MemberCarePlan Not in Focus

Member Central Care Plan 3 Navigation - Not in Focus
    Navigate to Care Plan 3 Not in Focus

Member Central Clinical Consultation Navigation - Not in Focus
    Navigate to Clinical Consultation Not in Focus

Member Central Communication Record Navigation - Not in Focus
    Navigate to Communication Record Not in Focus

Member Central Considerations Navigation - Not in Focus
    Navigate to Considerations Not in Focus

Member Central CPCM Cases Navigation - Not in Focus
    Navigate to CPCM Cases Not in Focus

Member Central ICT Request Navigation - Not in Focus
    Navigate to ICT Request Not in Focus

Member Central Letters Navigation - Not in Focus
    Navigate to Letters Not in Focus

Member Central LTSS Cases Navigation - Not in Focus
    Navigate to LTSS Cases Not in Focus

Member Central Medicaid Plan of Care Navigation - Not in Focus
    Navigate to Medicaid Plan of Care Not in Focus

Member Central Medical List Navigation - Not in Focus
    Navigate to Medical List Not in Focus

Member Central Medical List - OML Navigation - Not in Focus
    Navigate to Medical List - OML Not in Focus

Member Central Member Attachments Navigation - Not in Focus
    Navigate to Member Attachments Not in Focus

Member Central Member Consultation Navigation - Not in Focus
    Navigate to Member Consultation Not in Focus

Member Central Member Info Navigation - Not in Focus
    Navigate to Member Info Not in Focus

Member Central Member Movement Navigation - Not in Focus
    Navigate to Member Movement Not in Focus

Member Central Member Timeline Navigation - Not in Focus
    Navigate to Member Timeline Not in Focus

Member Central Notes Navigation - Not in Focus
    Navigate to Notes Not in Focus

Member Central Provider Search Navigation - Not in Focus
    Navigate to Provider Search Not in Focus

Member Central Referral Request Navigation - Not in Focus
    Navigate to Referral Request Not in Focus

Member Central Referrals Navigation - Not in Focus
    Navigate to Referrals Not in Focus

Member Central Risk Ranking Navigation - Not in Focus
    Navigate to Risk Ranking Not in Focus

Member Central Tasks Navigation - Not in Focus
    Navigate to Tasks Not in Focus

Member Central Plan of Care Navigation - Not in Focus
    Navigate to Plan of Care Not in Focus

Member Central Service Cart Navigation
    Navigate to Service Cart in Focus
    Revert the Role

#Keyword to get Member's basic details-----
Get Member Details
    ${UniversalMemberName} =    get text    //div[@id="member-information"]//a[@id="member-name-link"]
    ${UniversalMemberID} =  get text    //div[@id="member-information"]//div[@class="small-2 columns"][2]
    ${UniversalMemberDOB} =  get text    //div[@id="member-information"]//div[@class="small-2 columns"][3]
    @{MemberDOBList} =    split string    ${UniversalMemberDOB}    ,
    ${UniversalMemberDOB} =  get from list    ${MemberDOBList}    0
    ${UniversalLoggedInUserName} =    get text    //span[@class='humana-bold humana-darkgrey right user-name']
    ${UniversalMemberName} =    strip string    ${UniversalMemberName}    mode=both
    ${universalMemberID} =    strip string    ${universalMemberID}    mode=both
    ${UniversalMemberDOB} =    strip string    ${UniversalMemberDOB}    mode=both
    ${UniversalLoggedInUserName} =  strip string    ${UniversalLoggedInUserName}    mode=both
    set global variable    ${UniversalLoggedInUserName}
    set global variable    ${UniversalMemberName}
    set global variable    ${UniversalMemberID}
    set global variable    ${UniversalMemberDOB}
    log to console    ${UniversalMemberName}
    log to console    ${UniversalMemberID}
    log to console    ${UniversalMemberDOB}
    log to console    ${UniversalLoggedInUserName}

Validate No Masking
    [Arguments]    ${UserData}
    ${status} =  run keyword and return status   should not be true    "*" in """${UserData}"""
    set local variable    ${status}
    ${status} =    convert to string    ${status}
    should be equal as strings    ${Status}    True


###############################################################################
#Added/Changed  :  Sanket : 06/25/2021
#Description: Added for Atlas

##################################################################################


Begin Web Test Atlas
    create_a_txt_file
    open browser  about:blank  ${BROWSER}
    maximize browser window
    LandingPage.Load CGX
    Verify Landing Page Load
    set selenium implicit wait  5 Seconds
    # click element  //*[@id="apps-heading"]
     click element  //a[@class ='secondary list' and text()='AtlasUI2.0']
     run keyword if    '${INSTANCE_Atlas}' == 'qa2'    Navigate to QA2
    ...         ELSE IF    '${INSTANCE_Atlas}' == 'UAT'    Navigate to Atlas UAT
    ...         ELSE      Navigate to Atlas QA3

Navigate to Atlas UAT
    set selenium implicit wait    10 Seconds
    wait until page contains element    //html/body/div[1]/div[2]/div[1]/a
    seleniumlibrary.go to       https://UAT-atlas.humana.com/atlasuiconfig?

Navigate to Atlas QA3
    set selenium implicit wait    10 Seconds
    wait until page contains element    //html/body/div[1]/div[2]/div[1]/a
    seleniumlibrary.go to       https://qa3-atlas.humana.com/atlasuiconfig?

Delete Unnecessary Screenshots
    remove files  ${OUTPUTDIR}\\selenium-screenshot-*.png

###################################################################################

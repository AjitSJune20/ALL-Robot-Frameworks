*** Settings ***
Library  SeleniumLibrary
Resource  ../../Data/TestData.robot


*** Variables ***
${NotInFocus} =     //div[@class='alert-box']


*** Keywords ***

Navigate to Alternate Info
    set selenium implicit wait  5 Seconds
    click link  Member Central
    click element  //a[@href='/cgx/MemberCentral/MemberInfo/Index?loadAlternateInfo=true']
    page should contain element  //h3[contains(text(),'Alternate Information')]

Navigate to MemberAssessment
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Assessment/MemberAssessment/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[contains(text(),'Assessments')]
    set selenium implicit wait  5 Seconds

Navigate to Behavioral Segment
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberBehavioralSegment/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[contains(text(),'Behavioral Segment Engagement Tips - View')]
    set selenium implicit wait  5 Seconds

Navigate to MemberCarePlan
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/CarePlan/MemberCarePlan/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[contains(text(),'Member Care Plans')]
    set selenium implicit wait  5 Seconds

Navigate to Care Plan 3
    set selenium implicit wait  3 Seconds
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[contains(text(),'Care Plans 3.0')]
    set selenium implicit wait  20 Seconds
    ${title_var} =    get window titles
    #Title Should Be    Careplan
    select window  title=${title_var}[0]



Navigate to Clinical Consultation
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberClinicalConsultation/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Clinical Consultations']
    set selenium implicit wait  5 Seconds

Navigate to Considerations
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberInfo/Index?loadConsiderationsInfo=true']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Considerations']
    set selenium implicit wait  5 Seconds

Navigate to ICT Request
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberIct/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='ICT Request']
    set selenium implicit wait  5 Seconds

Navigate to Letters
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberLetters/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Letters']
    set selenium implicit wait  5 Seconds

Navigate to LTSS Cases
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberLtssClinicalCase/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='LTSS Cases']
    set selenium implicit wait  5 Seconds

Navigate to Medicaid Plan of Care
    click link  Member Central
    set selenium implicit wait  30 Seconds
    click element  //a[@href='/cgx/Ltss/PlanOfCare/MedicaidCpcmCasePlanOfCare']
    set selenium implicit wait  3 Seconds
    #title should be     Create Plan of Care


Navigate to Medical List
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberMedicalList/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Medical List']
    set selenium implicit wait  5 Seconds

Navigate to Medical List - OML
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Oml/OmlList/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Medical List - OML']
    set selenium implicit wait  5 Seconds

Navigate to Member Attachments
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberAttachments/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Attachments']
    set selenium implicit wait  5 Seconds


Navigate to Member Consultation
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberConsultation/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Consultations']
    set selenium implicit wait  5 Seconds

Navigate to Member Info
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberInfo/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Member Information']
    set selenium implicit wait  5 Seconds


Navigate to Member Movement
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberMovement/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Member Movement']
    set selenium implicit wait  5 Seconds

Navigate to Member Timeline
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberTimeline/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  //h3[text()='Member Timeline']
    set selenium implicit wait  5 Seconds

Navigate to Notes
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Notes/MemberNote/Index']
    set selenium implicit wait  10 Seconds
    page should contain element  //h3[text()='Notes']
    set selenium implicit wait  5 Seconds

Navigate to Plan of Care
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@class='planofCareMenu' and contains(text(),'Plan of Care')]
    set selenium implicit wait  15 Seconds
   # title should be     Plan of Care
    page should contain element    //div[@class="alert-box" and contains(text()," LTSS program eligibility")]
    set selenium implicit wait  5 Seconds

Navigate to Plan of Care LTSS
    set selenium implicit wait  15 Seconds
    click link  Member Central
    click element  //ul[@class="MemberCentral-dropdown-menu-right"]//a[text()="Plan of Care"]
    PAGE SHOULD CONTAIN ELEMENT    //h3[contains(text(),'Plan of Care')]
    title should be     Plan of Care


Navigate to Provider Search
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/ProviderSearch/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[text()='Provider Search']
    set selenium implicit wait  5 Seconds

Navigate to Referral Request
    click link  Member Central
    set selenium implicit wait  1 Seconds
    wait until element is visible    //a[@href='/cgx/MemberCentral/MemberReferralRequest/Index']    30s
    click element  //a[@href='/cgx/MemberCentral/MemberReferralRequest/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[text()='Referral Request']
    set selenium implicit wait  5 Seconds

Navigate to Risk Ranking
    set selenium implicit wait  5 Seconds
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Ltss/RiskRanking/Index?IsFromMemberCentralMenu=true']
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[text()='Risk Ranking']

Navigate to Authorizations
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberAuth/Index?IsfromAuthMenu=true']
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[text()='Authorizations']
    set selenium implicit wait  5 Seconds

Navigate to Communication Record
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[contains(text(),'Communication Record')]
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[text()='Communication Record']
    set selenium implicit wait  5 Seconds

Navigate to Referrals
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberReferrals/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[text()='Referrals']
    set selenium implicit wait  5 Seconds

Navigate to CPCM Cases
    click link  Member Central
    set selenium implicit wait  3 Seconds
    click element  //a[text()='CP CM Cases'and @href='/cgx/Case/MemberCpcmCase/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[text()='CP CM Cases']
    set selenium implicit wait  5 Seconds

Navigate to Tasks
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Task/MemberTask/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[contains(text(),'Tasks')]
    set selenium implicit wait  5 Seconds

#********************My Work Links Navigation********************************
Navigate to MyWork Assessment
    click link    My Work
    set selenium implicit wait  1 Seconds
    wait until element is visible    //a[@href='/cgx/Assessment/MyWorkAssessment/Index']    20s
    click element  //a[@href='/cgx/Assessment/MyWorkAssessment/Index']
    page should contain element  //h3[contains(text(),'Assessments')]

Navigate to MyWork Authorizations
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyAuthorizations/Index?rel=Authorization']
    page should contain element  //h3[contains(text(),'Authorizations')]

Navigate to MyWork Behavioral Segment
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyWorkBehavioralSegments/Index?isFromMenu=true']
    set selenium implicit wait  5 Seconds
    page should contain element  //h3[contains(text(),'Behavioral Segment Engagement Tips Admin - View')]

Navigate to MyWork Consultations
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyWorkConsultations/Index']
    page should contain element  //h3[contains(text(),'Consultations')]

Navigate to MyWork CPCM Case
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Case/MyWorkCpcmCase/Index']
    page should contain element  //h3[contains(text(),'CP CM Cases')]

Navigate to MyWork Fax Status
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Fax/FaxAuthorization/MyWorkFaxStatus']
    page should contain element  //h3[contains(text(),'Fax Status')]

Navigate to MyWork LTSS Cases
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyWorkLtssClinicalCase/Index']
    page should contain element  //h3[contains(text(),'LTSS Cases')]

Navigate to MyWork Manage Queues
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyWorkManageQueue/Index']
    page should contain element  //h3[contains(text(),'Manage Queues')]


Navigate to MyWork Recent Work
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyWorkRecentWork/Index']
    page should contain element  //h3[contains(text(),'Recent Work')]

Navigate to MyWork Provider Search
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //li[@id='MyWorkProviderSearch']
    set selenium implicit wait  5 Seconds
    page should contain element  //h4[contains(text(),'Provider Search')]


Navigate to MyWork Referral Request
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyWorkReferralRequest/Index']
    page should contain element  //h3[contains(text(),'Referral Request')]

Navigate to MyWork Referrals
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyWorkReferrals/Index']
    page should contain element  //h3[contains(text(),'Referrals')]


Navigate to MyWork Reset Global Settings
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/ResetSettings/Index']
    page should contain element  //h3[contains(text(),'Reset Global Settings')]


Navigate to MyWork Routes
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MyWork/MyWorkRoutes/Index?isFromMenu=true']
    set selenium implicit wait  20 Seconds
    page should contain element  //h3[contains(text(),'Routes')]
    set selenium implicit wait  5 Seconds

Navigate to MyWork Tasks
    click link    My Work
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Task/MyWorkTasks/Index?rel=Task']
    page should contain element  //h3[contains(text(),'Tasks')]



#********************Admin Links Navigation********************************
Navigate to Admin Assessment Template Downmerge
    click link  Admin
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Assessment/AssessmentDownMerge']
    page should contain element  //h3[contains(text(),'Assessment Template Downmerge')]


Navigate to Admin Care Plan Configuration
    click link  Admin
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/CareplanAdmin']
    page should contain element  //h3[contains(text(),'Care Plan Configuration')]


Navigate to Admin Communication Record Configuration
    click link  Admin
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Admin/CommRecConfig']
    page should contain element  //h3[contains(text(),'Communication Record Configuration')]


Navigate to Admin Letter Template Configuration
    click link  Admin
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Admin/LetterTemplate']
    page should contain element  //h3[contains(text(),'Letter Template Configuration')]


Navigate to Admin Role Emulator
    click link  Admin
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Admin/Emulator']
    page should contain element  //h3[contains(text(),'Role Emulator')]


#***********************Not In Focus *******************************************************

Navigate to Alternate Info Not in Focus
    set selenium implicit wait  5 Seconds
    click link  Member Central
    click element  //a[@href='/cgx/MemberCentral/MemberInfo/Index?loadAlternateInfo=true']
    page should contain element  ${NotInFocus}

Navigate to MemberAssessment Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Assessment/MemberAssessment/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Behavioral Segment Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberBehavioralSegment/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}


Navigate to MemberCarePlan Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/CarePlan/MemberCarePlan/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Care Plan 3 Not in Focus
    set selenium implicit wait  3 Seconds
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[contains(text(),'Care Plans 3.0')]
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Clinical Consultation Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberClinicalConsultation/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Considerations Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberInfo/Index?loadConsiderationsInfo=true']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to ICT Request Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberIct/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Letters Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberLetters/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to LTSS Cases Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberLtssClinicalCase/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Medicaid Plan of Care Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Ltss/PlanOfCare/MedicaidCpcmCasePlanOfCare']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Medical List Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberMedicalList/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Medical List - OML Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Oml/OmlList/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Member Attachments Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberAttachments/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds


Navigate to Member Consultation Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberConsultation/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Member Info Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberInfo/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds


Navigate to Member Movement Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberMovement/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Member Timeline Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberTimeline/Index']
    set selenium implicit wait  3 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Notes Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Notes/MemberNote/Index']
    set selenium implicit wait  10 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Plan of Care Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@class='planofCareMenu' and contains(text(),'Plan of Care')]
    set selenium implicit wait  15 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Provider Search Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/ProviderSearch/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Referral Request Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberReferralRequest/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Risk Ranking Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Ltss/RiskRanking/Index?IsFromMemberCentralMenu=true']
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Authorizations Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberAuth/Index?IsfromAuthMenu=true']
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Communication Record Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[contains(text(),'Communication Record')]
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Referrals Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/MemberCentral/MemberReferrals/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to CPCM Cases Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[text()='CP CM Cases'and @href='/cgx/Case/MemberCpcmCase/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Tasks Not in Focus
    click link  Member Central
    set selenium implicit wait  1 Seconds
    click element  //a[@href='/cgx/Task/MemberTask/Index']
    set selenium implicit wait  5 Seconds
    page should contain element  ${NotInFocus}
    set selenium implicit wait  5 Seconds

Navigate to Service Cart in Focus
    set selenium implicit wait  5 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    click link  Member Central
    click element  //a[@href="/cgx/MemberCentral/ServiceCart/Index"]
    page should contain element  //h3[contains(text(),'Service Cart')]

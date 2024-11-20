*** Settings ***
Resource    ../Definitions/HumanaGui.robot
Resource    ../Definitions/NFAssessmentCreation.robot
Resource    ../PageObjects/FLENDToENDPOM.robot



*** Keywords ***
TC01 FL End to End Regression
    [Arguments]    ${UserData}
     navigate to role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
     MyWorkPage.Click on the Member Central
     Navigate to Authorizations
     Create LTSS Auth for FL Members    ${UserData}
     Create Another LTSS Auth For FL    ${UserData}
     Navigate to Service Cart in Focus
     Validate Service Cart before creating Comp2_0 Assessment
     Navigate to LTSS Cases
     select the case
     sleep    5s
     Click on Comp Assessment    ${UserData}     # 1st assessment
     User Inputs Demographic   ${UserData}
     User Input Memory    ${UserData}
     User Input General Health     ${UserData}
     User Inputs ADL    ${UserData}
     User Inputs IADL    ${UserData}
#     #sleep    1m
     User Inputs Health Condition    ${UserData}
     User Inputs Mental Health   ${UserData}
     User Inputs Residential Living  ${UserData}
     User Inputs Nutrition    ${UserData}
     User Inputs Medication   ${UserData}
     User Inputs Social Resources    ${UserData}
     User Inputs Caregiver     ${UserData}
     Preview Page validation    ${UserData}
     Acknowledge and Submit
     Retake Comp 2_0 PR Assessment with Existing Data    ${UserData}     # 1st Assessment but Changing only one questions ans
     sleep   30s
     Take Supplemental Assessment 2_0    ${UserData}
     Verfiy Supplemental Service on Grid
     Naviagate to Risk Raking
     Validate Risk Raking Page     ${UserData}
     Navigate to Comp Assessment2_0
     Validate View Comp Assessment2_0      ${UserData}     # need to change xpaths
     Validate Comparsion screen for Comp2_0 PR Assessment
     Change role to LTSS Pilot CC     ${UserData}
     Navigate to Service Cart in Focus
     Validate Service cart after submitting the Comp Assessment2_0     ${UserData}
     Adding Serives in Service Cart     ${UserData}
     Verify added service under pended services
     Provider Search Validation in Add Service Screen     ${UserData}
     sleep  10s
     MyWorkPage.Click on the Member Central
     Navigate to Authorizations
     Verify Plane of care

TC01 FL End to End Regression Part_2
      [Arguments]    ${UserData}
     Change role to LTSS Pilot CC     ${UserData}
     Navigate to LTSS Cases
     Select the Case
     User create the NF Assessment    ${UserData}       # 3rd assessment
     Navigate to Comp Assessment2_0
     Validate View Comp Assessment2_0 for special char



TC02 FL End to End Regression
     [Arguments]    ${UserData}
     navigate to role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
#     Adding POA information to member   ${UserData}
     Navigate to Authorizations
     Note down Active auths
     Navigate to LTSS Cases
     select the case
     Click on Comp Assessment    ${UserData}     # 1st Assessment
     User Inputs Demographic   ${UserData}
     User Input Memory    ${UserData}
     User Input General Health     ${UserData}
     User Inputs ADL    ${UserData}
     User Inputs IADL    ${UserData}
     #sleep    1m
     User Inputs Health Condition    ${UserData}
     User Inputs Mental Health   ${UserData}
     User Inputs Residential Living  ${UserData}
     User Inputs Nutrition    ${UserData}
     User Inputs Medication   ${UserData}
     User Inputs Social Resources    ${UserData}
     User Inputs Caregiver     ${UserData}
     Acknowledge and Submit
     Get LTSS Efective Date from Case Details    ${UserData}
     Get Review Date from view Comp Aseesment page    ${UserData}
     Validate Plan of Care    ${UserData}



TC02 FL End to End Regression Part_2
     [Arguments]    ${UserData}
     Search For Member   ${UserData}
     Select The Member
     MyWorkPage.Click on the Member Central
     Navigate Authorization Page
     User Inputs for Authorization    ${UserData}
     Note Down Auth ID After Submission of Auth    ${UserData}
     navigate to role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
     Navigate to Plan of Care for FL
     Validate PLOC For Medical Auth   ${UserData}












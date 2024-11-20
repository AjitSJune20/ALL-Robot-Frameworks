*** Settings ***
Resource  ../Definitions/Common.robot
Resource  ../PageObjects/IL_Assessment.robot
Resource  ../PageObjects/IL_Assessment_LTC.robot
Library    SeleniumLibrary

*** Keywords ***
Exploratory Testing POA_PHI info mapped in MPLOC
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to Alternate Info
    Fill POA_PHI information and save    ${UserData}
#    LTC navigate to CompAssessment    ${UserData}
#    Fill LTC Assessment    ${UserData}
    Validate POA_PHI information in MLOC    ${UserData}
    Exploratory Fill Remaining Details and SubmitPLOC

Critical Services_Backup provider fields_Mandatory
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    LTC navigate to CompAssessment    ${UserData}
    Fill LTC Assessment    ${UserData}
    Navigate to MPOC and Add Services for IL Exploritory 02    ${UserData}
    Exploratory Fill Remaining Details and SubmitPLOC

Attachments Not Generated For Pended LTSS Auths
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
#    LTC navigate to CompAssessment    ${UserData}
#    Fill LTC Assessment    ${UserData}
    Navigate to MPLOC and Add Serivies    ${UserData}
    Exploratory Fill Remaining Details and SubmitPLOC
    Navigate to Medicaid Plan of Care
    sleep    2s
    Verify Attachment for Pended Auth

#######################


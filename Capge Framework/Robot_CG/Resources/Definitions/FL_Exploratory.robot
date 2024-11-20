*** Settings ***
Resource    ../Definitions/HumanaGui.robot
Resource    ../PageObjects/FL_ExploratoryPO.robot
Resource    ../PageObjects/MCD_RegressionPO.robot
Resource  ../PageObjects/SC_E2E_Regession_PO.robot

Library    AutoItLibrary
Library    SeleniumLibrary
Library    OperatingSystem


*** Keywords ***
TC02_FL_Create comm rec at various level
    [Arguments]    ${UserData}
     Navigate To Role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
     MyWorkPage.Click on the Member Central
     Click on the LTSS Case
     Select the Case
     Navigate to LTSS Comm Rec
     Navigate to Create Comm Record
     Verify Late Entry Fields Date_Time_TimeZone
     Add Outbound Communication Record in Ltss case   ${UserData}
#     Get Member Details from Comm Rec
#     Select Filter as per communicationType    ${UserData}    ${UserData.CommunicationType}
#     Verify Filter for Ltss Comm Rec    ${UserData}    ${UserData.CommunicationType}
#     Clear all filter
#     Select Filter as per communicationType    ${UserData}    ${UserData.Inbound_Filter}
#     Verify Filter for Ltss Comm Rec    ${UserData}    ${UserData.Inbound_Filter}
#     Clear all filter
#     Select Filter as per communicationType    ${UserData}    ${UserData.Research_Filter}
#     Verify Filter for Ltss Comm Rec    ${UserData}    ${UserData.Research_Filter}
#     Navigate to Communication Record
#     verify the Comm record details from LTSS Level    ${UserData}
#     Navigate to Add Comm Record to verify Side Banner
#     Click left Side Banner and Verify Details    ${UserData}
#     Verify Print and Pdf downloading on History and Edit screen

TC05_FL_Create comm rec at Member Central Level
    [Arguments]    ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to Communication Record
    Create communication record at MC Level    ${UserData}
    Get MemberDetails from Comm Rec at MC level
    Select Filter asper communicationType at MC Level    ${UserData}    ${UserData.CommunicationType}
    Verify Filter for Comm Rec at MC level    ${UserData}    ${UserData.CommunicationType}
    Clear all filter at MC level
    Select Filter asper communicationType at MC Level    ${UserData}    ${UserData.Inbound_Filter}
    Verify Filter for Comm Rec at MC level    ${UserData}    ${UserData.Inbound_Filter}
    Clear all filter at MC level
    Select Filter asper communicationType at MC Level    ${UserData}    ${UserData.Research_Filter}
    Verify Filter for Comm Rec at MC level    ${UserData}    ${UserData.Research_Filter}
    Clear all filter at MC level
    Check PDF Download in ViewScreen at MC level    ${UserData}
    Check PDF Download in History at MC level
    Check PDF Download in EditScreen at MC level

TC07_FL_Create comm rec at Auth Level
    [Arguments]    ${UserData}
    MCD Regression Auth Creation    ${UserData}
    Get Auth Value after Submission    ${UserData}
    scroll element into view    ${Auth_Comm_rec}
    click element    ${Auth_Comm_rec}
    Navigate to Create Comm Record
    Verify Late Entry Fields Date_Time_TimeZone
    Add Outbound Communication Record at Auth Level   ${UserData}
    Get Member Details from Auth level Comm Rec
    Navigate to Communication Record
    verify the Comm record details from Auth Level    ${UserData}
    Navigate to Authlevel Comm Rec    ${UserData}
    Check PDF Download in ViewScreen at Auth level    ${UserData}
    Check PDF Download in HistoryScreen at Auth level    ${UserData}
    Check PDF Download in EditScreen at Auth level    ${UserData}


##### Created by Navya Paidipati      ############
TC03 FL ET Verify Community Living Support Plan Comm Rec Comm rec CLSP Yes
     [Arguments]   ${UserData}
     navigate to role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
     Navigate to LTSS Cases
     select the case
     Navigate to Communication record page under LTSS Case
     Navigate to Create Comm Record under LTSS Case
     Verify Community Living Support Plan Comm Rec   ${UserData}
     Navigate to view Comm record under LTSS case
     Validate View Comm record under LTSS case    ${UserData}



TC01 FL ET Verify Units & frequency on Add Service Details Pop-Up
     [Arguments]    ${UserData}
     navigate to role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
     MyWorkPage.Click on the Member Central
     Navigate to Authorizations
     Create LTSS Auth and Validate Units & frequency on Add Service Details Pop-Up   ${UserData}

TC04 FL ET Verify View Service and Edit Service pop-up for Non HCBS Service_Create
     [Arguments]      ${UserData}
     navigate to role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
     Navigate to LTSS Cases
     select the case
     Navigate to Edit PLOC under LTSS case
     Navigate to Service section in Edit PLOC Page
     Removing Existing Nature support and Routine Medical Care Services
     Adding Services In Service pop up    ${UserData}
     Validate Natural Support System Service for View and Edit screen in PLOC     ${UserData}
     Validate Routine Medical Care Service for View and Edit screen in PLOC      ${UserData}
     Submit PLOC for FL
     Navigate to Edit PLOC under LTSS case
     Validate Natural Support System Service for View and Edit screen in PLOC     ${UserData}
     Validate Routine Medical Care Service for View and Edit screen in PLOC      ${UserData}


TC06 FL ET Create Comm record and verify that user is able to view it in Member Central
     [Arguments]      ${UserData}
     navigate to role
     Applying the Role   ${UserData}
     Search For Member   ${UserData}
     Select The Member
     navigate to cpcm cases
#     sleep    2s
#     click element    //*[text()='C000204493']
     Create CP CM case and Note down Case ID by answering only Mandatory fileds     ${UserData}
     Navigate to Communication record under CPCM case
     Create Comm Record under CPCM case level for FL     ${UserData}
     Navigate to Communication Record
     Verify Comm record created under CP CM Case is displaying on MC Comm record screen    ${UserData}
     navigate to cpcm cases
     Selecting CP CM case for PDF validation     ${UserData}
     Navigate to Communication record under CPCM case
     Validate Print functionality for view Comm record under CPCM case
     Validate Print functionality for History Comm record under CPCM case
     Validate Print functionality for Edit Comm record under CPCM case




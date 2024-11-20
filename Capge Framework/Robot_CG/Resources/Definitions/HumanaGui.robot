*** Settings ***
Resource  ../PageObjects/SearchPage.robot
Resource  ../PageObjects/MyWorkPage.robot
Resource  ../PageObjects/Role Emulator.robot
Resource  ../PageObjects/CpCmCase.robot
Resource  ../PageObjects/FLAssessmentPR.robot
Resource  ../PageObjects/Authorization.robot
Resource  ../PageObjects/ManageQueue.robot
Resource  ../PageObjects/Smoke_Buttons.robot

*** Keywords ***

Validate My Work Page
    My works page validation

Search For Member
    [Arguments]  ${UserData}
    set selenium implicit wait  5 Seconds
    MyWorkPage.Member Search    ${UserData}


Search For Member1
    [Arguments]  ${UserData}
    set selenium implicit wait  5 Seconds
    SearchPage.Member1 Search    ${UserData}


Select The Member
    set selenium implicit wait  5 Seconds
   SearchPage.Member Selection
    SearchPage.Verify Details

Navigate To Role
  #My works page validation
  Click on the Admin Tab
  Click on the Role Emulator


Business Validation In Role Emulator
  [Arguments]  ${UserData}
  Select the Roles  ${UserData}
  Business Unit Validation  ${UserData}

Applying the Role
    [Arguments]  ${UserData}
    Select the Roles  ${UserData}
    Apply User Role

User Create Cases
   [Arguments]  ${UserData}
   Navigate To Role
   Applying the Role   ${UserData}
   Search For Member   ${UserData}
   Select The Member
   Click on the Member Central
   Click on the CP CM Cases
   Create Case   ${UserData}

User Edit CPCM Case
    [Arguments]  ${UserData}
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Click on the Member Central
    Click on the CP CM Cases
    Edit Case   ${UserData}

User Take LTSS Assessment
   [Arguments]  ${UserData}
   Navigate To Role
   Applying the Role   ${UserData}
   Search For Member   ${UserData}
   Select The Member
   MyWorkPage.Click on the Member Central
   Click on the LTSS Case
   Select the Case
   User create the PR Assessment    ${UserData}

User create the PR Assessment
   [Arguments]    ${UserData}
   Click on Comp Assessment    ${UserData}
   User Inputs Demographic   ${UserData}
   User Input Memory    ${UserData}
   User Input General Health     ${UserData}
   User Inputs ADL    ${UserData}
  User Inputs IADL    ${UserData}
   User Inputs Health Condition    ${UserData}
   User Inputs Mental Health   ${UserData}
  User Inputs Residential Living  ${UserData}
   User Inputs Nutrition    ${UserData}
   User Inputs Medication   ${UserData}
   User Inputs Social Resources    ${UserData}
   User Inputs Caregiver     ${UserData}
   Acknowledge and Submit


Validate Auth View
    [Arguments]    ${UserData}
    Auth Search    ${UserData}
    Validate Fields    ${UserData}

Create Authorization
   [Arguments]  ${UserData}
   Search For Member   ${UserData}
   Select The Member
   MyWorkPage.Click on the Member Central
   Navigate Authorization Page
   User Inputs for Authorization    ${UserData}
#   Log the Status    ${UserData}

Void Authorization
    [Arguments]  ${UserData}
   Search For Member   ${UserData}
   Select The Member
   Click on the Member Central
   Void Auth    ${UserData}

Smoke Void
    [Arguments]  ${UserData}
    Smoke Void Auth    ${UserData}


User Navigate to Manage Queue Page
    [Arguments]  ${UserData}
    Navigate to Manage Queue    ${UserData}

User Search New Member Queue
    Search for New Member Queue


Validate the Queues
    [Arguments]  ${UserData}
    ${QueueStatus} =    run keyword and return status    Validate the Queue Table    ${UserData}
    User Update The Status   ${QueueStatus}    ${UserData}


User Associate the Queue
   [Arguments]  ${UserData}
   Associate the Queue  ${UserData}

Manage Queue Page
    [Arguments]    ${UserData}
    My Manage Queue Page    ${UserData}

Validate the Associated Queue
    [Arguments]  ${UserData}
    Validate in the LTTS Case    ${UserData}


#Smoke_Buttons Scenarios

TC_AuthorizationDetails_NewAuth_Button_Verify
    Authorization_Details_NewAuth_Button_Verify

TC_AuthorizationDetails_BuildAuth_Button_Verify
    Authorization_Details_BuildFax_Button_Verify

TC_AuthorizationDetails_TakeOwnership_RemoveOwnership_Button_Verify
    Authorization_Details_Take_RemoveOwnership_Button_Verify

TC_AuthorizationDetails_AuthHistory_OwnershipHistory_Button_Verify
    Authorization_Details_AuthHistory_OwnershipHistory_Button_Verify
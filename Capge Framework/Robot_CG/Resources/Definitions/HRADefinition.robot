*** Settings ***
Resource  ../PageObjects/SearchPage.robot
Resource  ../PageObjects/Role Emulator.robot
Resource  ../PageObjects/CpCmCase.robot
Resource  ../PageObjects/HRA_Assessment.robot


*** Keywords ***
User Create SNP HRA Assessments
   [Arguments]  ${UserData}
   Navigate To Role
   Applying the Role   ${UserData}
   Search For Member   ${UserData}
   Select The Member
   Click on the Member Central
   Click on the CP CM Cases
   User Enter into Assessments  ${UserData}
   User Takes SNP Assessments  ${UserData}
   Validate the SNP EmailID    ${UserData}
   Revert the Role


User Void the Assessment
    [Arguments]   ${UserData}
    Navigate To Role
    set selenium implicit wait  10 seconds
    ${PageLoading} =    run keyword and return status  element should be visible    ${Loading}    None
    RUN KEYWORD IF    ${PageLoading}    Page Loading Wait
    click element  ${RoleBtn}
    click element  //li[contains(text(),'HAH SNP Manager')]
    Apply User Role
    Search For Member   ${UserData}
    Select The Member
    Click on the Member Central
    Click on the CP CM Cases
    Void The Assessment    ${UserData}


User Create CPSNP HRA with Late Entry Assessments
   [Arguments]  ${UserData}
   Navigate To Role
   Applying the Role   ${UserData}
   Search For Member   ${UserData}
   Select The Member
   Click on the Member Central
   Click on the CP CM Cases
   User Enter into Assessments  ${UserData}
   User Takes CPSNP Assessments  ${UserData}
   Validate the Save Button
   Validate the CP Late Entry    ${UserData}
   User Enter CPSecondHalf Inputs Assessment    ${UserData}


User Create CPSNP HRA Assessments
   [Arguments]  ${UserData}
   Navigate To Role
   Applying the Role   ${UserData}
   Search For Member   ${UserData}
   Select The Member
   Click on the Member Central
   Click on the CP CM Cases
   User Enter into Assessments  ${UserData}
   User Takes CPSNP Assessments  ${UserData}
   User Enter CPSecondHalf Inputs Assessment    ${UserData}
   Validate the CPSNP EmailID    ${UserData}
   Revert the Role





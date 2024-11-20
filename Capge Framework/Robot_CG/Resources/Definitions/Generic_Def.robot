*** Settings ***

Resource    ../Definitions/HumanaGui.robot
Resource    ../PageObjects/Generic_PO.robot
Resource    ../PageObjects/SC_E2E_Regession_PO.robot


*** Keywords ***
TC11_Exploratory in Auth testing Ownership, Edit, History & Filter
    [Arguments]    ${UserData}
    Search For Member   ${UserData}
    Select The Member
    MyWorkPage.Click on the Member Central
    Navigate Authorization Page
    Navigate to Create Auth Page
###    #Verify Member Details in Member Info Section   ${UserData}      #Not In Use- in this script
    Create IPAuth for Generic test scenerio   ${UserData}
    Get Auth Value after Submission    ${UserData}
    Validate Add and Remove Auth Ownership    ${UserData}      # also, edit auth, check histry covered in this keyword
#    Authorization Grid Filter    ${UserData}                   #Not In Use- in this script
#    Mywork Recent Work    ${UserData}                          #Not In Use- in this script


TC12_Verify Owner,Co-Owner details AND Manage Queue verify referral records
    [Arguments]    ${UserData}
    User Navigate to Manage Queue Page    ${UserData}
    Validate the Queue Table    ${UserData}
    click element    //div/label[@for='QueueSearchGridselectAll']
    Manage Queue Page    ${UserData}
    Navigate to MyWork Referrals
#    View My Work Referral Records    ${UserData}    ${UserData.QueueName}
    View My Work Referral Records    ${UserData}    ${UserData.QueueName_1}


TC13_Exploratory Testing Role Emulator End to End Scenario
    [Arguments]    ${UserData}
    Navigate To Role
    Validation before clicking on View role Summary
    Select the role and click on View Role Summary    ${UserData}
    Validation After clicking on View role Summary    ${UserData}
    Business Validation In Role Emulator    ${UserData}
    Validate fields after clicking Reset
    Select the role and click on View Role Summary    ${UserData}
    Validation After Reset and clicking on View role Summary     ${UserData}
    Verify Role    ### Export to Excel keyword to be added here
    element should be enabled    ${ApplyBtn}
    Validate fields after clicking Reset
    Select the role and click on View Role Summary     ${UserData}
    Validate apply button and confirmation popp


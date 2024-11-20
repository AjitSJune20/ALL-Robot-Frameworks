*** Settings ***
Documentation  This script is used to select/Validate the Roles
Library  OperatingSystem
Library    SeleniumLibrary

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/PageObjects/Navigation.robot
Resource  ../Resources/Definitions/SearchOperations.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown    End Web Test


# Note:
# Command to run all the test under tests
##  robot -d results tests/Core_Regression.robot



*** Test Cases ***
TC01_Verify LTSS  Auth is created from Member Central for FL LTSS _Member  Central_Authorization_Create LTSS Authorization_New auth_Keep member [ Change member , Keep all new]
    [Tags]    MCD_Flows
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to LTSS Cases
    Create LTSS Authorization    ${TC_MCDAUTH_001}
    Verify all Fileds of LTSS Auth
    Verify Auth in Grid
    Create LTSS Authorization    ${TC_MCDAUTH_002}
    Verify all Fileds of LTSS Auth
    Verify Auth in Grid
    Create LTSS Authorization    ${TC_MCDAUTH_003}
    Verify all Fileds of LTSS Auth
    Verify Auth in Grid
    Create LTSS Authorization    ${TC_MCDAUTH_004}

TC02_ Verify LTSS Auth is created from My Work_Create LTSS -> Existing LTSS Auth_[New Auth_Keep member-> Change member & Keep All new functionality]
    [Tags]    CoreRegression
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to LTSS Cases
    Navigate to MyWork Authorizations
    Create My Work LTSS Auth    ${TC_MCDAUTH_005}
    click element    //u[contains(text(),'Back')]
    Search MyWork Auth    ${UserData}
    New Auth Keep Member
    Create My Work LTSS Auth    ${TC_MCDAUTH_006}
    click element    //u[contains(text(),'Back')]
    Search MyWork Auth    ${UserData}
    Verify all Fileds of LTSS Auth
    New Auth Keep Member
    Create My Work LTSS Auth    ${TC_MCDAUTH_007}


TC03_Verify Medical Auth is created from My Work for FL member using MCD user role_Medical Auth_My Work_Create Auth_Existing auth -> New auth ->[Keep member, Change member, Keep all new]
    [Tags]    CoreRegression
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Navigate to LTSS Cases
    Navigate to MyWork Authorizations
    Create My Work LTSS Auth    ${TC_MCDAUTH_005}


TC04_Search Auth using Auth Id_Search_Auth ID_LTSS Auth_Medical Auth_Case Id
    [Tags]    CoreRegression
    Navigate To Role
    Applying the Role   ${UserData}
    Create LTSS Auth    ${TC_MCDAUTH_010}
    sleep   3s
    Create Authorization    ${TC_CROP03}
    sleep   3s
    Search_Auth_valid_Auth_Details_Page   ${TC_MCDAUTH_010}
    Search_Auth_valid_Auth_Details_Page   ${TC_CROP00}



TC05_Verify new auth is created by selecting "Change member" for existing auth_Member Central _Authorization_Existing Medical  auth_New Auth_Change Member_ All New
    [Tags]    CoreRegression
    Navigate To Role
    Applying the Role   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    Click on the Member Central
    Navigate Authorization Page
    sleep    10s
    click element    //span[contains(text(),'Auth ID')]

    User Inputs for Authorization    ${UserData}
    page should contain element    //h3[contains(text(),'Authorization - Details')]




    Create Authorization    ${TC_CROP04}
    sleep   3s
    Search_Auth_valid_Auth_Details_Page   ${TC_CROP00}
    Create All New Auth

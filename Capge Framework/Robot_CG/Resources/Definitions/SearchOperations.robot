*** Settings ***
#Resource  ../PageObjects/SearchPage.robot
Resource  ../PageObjects/SearchPage_Sanket.robot
Resource  ../PageObjects/Navigation.robot
Resource  ../Definitions/HumanaGui.robot
Resource  ../../Data/TestData.robot

*** Variables ***



*** Keywords ***

MC - Search - Auth - Valid - Clear
    [Arguments]  ${UserData}
    Search_Auth_Valid_Clear     ${UserData}

MC - Search - Auth - Valid - Max Length
    [Arguments]  ${UserData}
    Search_Auth_Valid_Max_Length    ${UserData}

MC - Search - Auth - valid - Auth Details Page
    [Arguments]  ${UserData}
    Search_Auth_valid_Auth_Details_Page     ${UserData}

MC - Search - Auth - Invalid - Invalid Data
    [Arguments]  ${UserData}
    Search_Auth_Invalid_Invalid_Data      ${UserData}

MC - Search - Auth - Invalid - Required Fields
    [Arguments]  ${UserData}
    Search_Auth_Invalid_Required_Fields      ${UserData}

Regression - Search & Banner Validations
    [Arguments]  ${UserData}
    Search_and_Banner      ${UserData}


MC - Search - Case - Valid - Clear
    [Arguments]  ${UserData}
    Search_Case_Valid_Clear      ${UserData}

MC - Search - Case - Valid - Max Length
    [Arguments]  ${UserData}
    Search_Case_Valid_Max_Length      ${UserData}

MC - Search - Case - Invalid - Case Details Page
    [Arguments]  ${UserData}
    Search_Case_Invalid_Case_Details_Page      ${UserData}

MC - Search - Case - Invalid - Invalid Data
    [Arguments]  ${UserData}
    Search_Case_Invalid_Invalid_Data      ${UserData}

MC - Search - Case - Invalid -Required Fields     #
    [Arguments]  ${UserData}
    Search_Case_Invalid_Required_Fields      ${UserData}

MC - Search - Invalid - Invalid Data
    [Arguments]  ${UserData}
    Search_Invalid_Invalid_Data      ${UserData}

MC - Search - Member - Valid - Search           #
    [Arguments]  ${UserData}
    Search_Member_Valid_Search      ${UserData}

MC - Search - Member - Valid - Clear
    [Arguments]  ${UserData}
    Search_Member_Valid_Clear      ${UserData}

MC - Search - Member - Valid - Max Length
    [Arguments]  ${UserData}
    Search_Member_Valid_Max_Length      ${UserData}

MC - Search - Member - Valid - Search Using First and Last Name
    [Arguments]  ${UserData}
    Search_Member_Valid_First_and_Last_Name      ${UserData}

MC - Search - Member - Valid - Search Using Subscriber ID
    [Arguments]  ${UserData}
    Search_Member_Valid_Subscriber_ID      ${UserData}

MC - Search - Member - Invalid - Invalid Data
    [Arguments]  ${UserData}
    Search_Member_Invalid_Invalid_Data      ${UserData}

MC - Search - Member - Invalid - Required Fields
    [Arguments]  ${UserData}
    Search_Member_Invalid_Required_Fields      ${UserData}

MC - Search - Member - Advance Search - Medicare iD
    [Arguments]  ${UserData}
    Search_Member_Advance_Search_Medicare_ID      ${UserData}

MC - Search - Member - Advance Search - Medicaid ID
    [Arguments]  ${UserData}
    Search_Member_Advance_Search_Medicaid_ID      ${UserData}

MC - Search - Member - Advance Search - SSN
    [Arguments]  ${UserData}
    Search_Member_Advance_Search_SSN      ${UserData}

MC - Search - Member - Advance Search - Max Length
    [Arguments]  ${UserData}
    Search_Member_Advance_Search_Max_Length      ${UserData}
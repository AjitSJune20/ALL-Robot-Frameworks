*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Data/TestData.robot


*** Variables ***
${Search_Element} =  //a[@href="/cgx/Search"]
${Back_Button} =  //*[@id="back-button"]
${Search Results_Heading} =  //*[@id="search-results"]/div[2]/div/h3
${SubscriberId_InputBox} =  //input[@id='SubscriberId']
${Search_Button} =  //a[@id="btnSearch"]
${RecordTab} =    //a[@href="#record"]
${PhoneNumber} =  //span[@class="phone-number"]
${AuthId}=    //input[@id="authIdField"]
${MemberPolice} =    //table[@role="grid"]//*[contains(text(),"MCD")]  #//*[@id="PolicySearch"]/div[2]/div[1]/table/tbody/tr[2]
${MaxLengthTestDataTextBox} =   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
${InvalidTestDataTextBox} =     ñóǹ äŝçíì 汉语/漢語  华语/華語 Huáyǔ; 中文 Zhōngwén 漢字仮名交じり文 Lech Wałęsa æøå


*** Keywords ***

My works page validation
    set selenium implicit wait  10 Seconds
    page should contain  My Work
    page should contain  Member Central
    page should contain  Admin
    page should contain element  //span[contains(text(),"Initiate Call")]
    page should contain link  ${Search_Element}
    page should contain element    //a[@id="create-authorization"]
    wait until page contains    Authorizations

Member Search
    [Arguments]  ${UserData}
    set selenium implicit wait  10 seconds
    page should contain element  ${Search_Element}
    wait until page does not contain  //*[@id="loading-ajax"]
    click link  ${Search_Element}
    page should contain element  ${Back_Button}
    page should contain element  ${Search Results_Heading}
    input text    ${SubscriberId_InputBox}    ${UserData.SubscriberId1}
    click element  ${Search_Button}


Member1 Search
     [Arguments]  ${UserData}
    set selenium implicit wait  10 seconds
    page should contain element  ${Search_Element}
    wait until page does not contain  //*[@id="loading-ajax"]
    click link  ${Search_Element}
    page should contain element  ${Back_Button}
    page should contain element  ${Search Results_Heading}
    input text    ${SubscriberId_InputBox}    ${UserData.SubscriberId2}
    click element  ${Search_Button}

Auth Search
    [Arguments]  ${UserData}
    page should contain element  ${Search_Element}
    click link  ${Search_Element}
    page should contain element  ${Back_Button}
    click element   ${RecordTab}
    input text    ${AuthId}    ${UserData.AuthId}
    click element  ${Search_Button}

Auth Search Modified
    [Arguments]  ${AuthIdToSearch}
    page should contain element  ${Search_Element}
    click link  ${Search_Element}
    page should contain element  ${Back_Button}
    click element   ${RecordTab}
    input text    ${AuthId}    ${AuthIdToSearch}
    click element  ${Search_Button}

Member Selection
    click element  //table[@role='grid' and @class="k-selectable"]
    Sleep    2 seconds
    ${Result} =    Run Keyword And Return Status    page should contain link    Yes, Change Member
    Run Keyword And Return If    ${Result}    click link    Yes, Change Member
    ${Policy} =    Run Keyword And Return Status    Element Should Be Visible   //*[@id="PolicySearch-gridContent"]
    Run Keyword And Return If    ${Policy}    SearchPage.Select Member Policy
    ${Policy1} =    run keyword and return status    element should be visible    //li/a[@id="noPoliciesConfirmButton"]
    run keyword if   ${Policy1}   click element    //li/a[@id="noPoliciesConfirmButton"]



Select Member Policy
    click element    //td [@title=" MCD "]

Verify Details
    set selenium implicit wait  25 seconds
#    seleniumlibrary.wait until element is visible    //div[@id='MemberId']    30s
    seleniumlibrary.wait until page contains element    //div[@id='MaskedMemberId']    30s

Click on the Member Central
    set selenium implicit wait  30 Seconds
    page should contain element  //u[contains(text(),'Member Details')]
    click link  Member Central

*** Variables ***
${ProviderSName} =  //input[@id='ProviderName']
${ProviderSTIN} =  //input[@id='TaxIdentificationNumber']
${ProviderSID} =  //input[@id='NewProviderId']
${ProviderSIDType} =  //select[@id='ProviderIdType']
${ProviderSIDError} =  //span[@id='NewProviderId-error']
${ProvideSearchBtn} =   //a[@id="btnMemberProviderSearch"]
${ProviderSNameError} =     //span[@id='ProviderName-error']
${NoRecordsFound} =    //h6[contains(text(),"No Records Found")]
${PSBackBtn} =    //a[@id="btnProviderGridBack"]
${PSClear} =    //a[@id="btnMemberProviderClear"]
${PSClearSearchError} =    //span[contains(text(),'Provider Search requires at least one of the above')]
*** Keywords ***

Search for Provider
     [Arguments]    ${UserData}
     wait until page does not contain  //*[@id="loading-ajax"]
     select from list by label    ${ProviderSIDType}    NPI
     input text    ${ProviderSID}    610703799986986060970
     click element    ${ProvideSearchBtn}
     wait until page does not contain  //*[@id="loading-ajax"]
     page should contain element    ${ProviderSIDError}
     clear element text    ${ProviderSID}
     input text    ${ProviderSName}    Norton Audubon Hospital validate the provider name with maximum length error which is Automation testing
     click element    ${ProvideSearchBtn}
     wait until page does not contain  //*[@id="loading-ajax"]
     page should contain element   ${ProviderSNameError}
     input text     ${ProviderSName}    Norton Audubon Hospital
     input text    ${ProviderSTIN}    610703791
     click element    ${ProvideSearchBtn}
     page should contain    Results
     page should contain element    ${NoRecordsFound}
     click element    ${PSBackBtn}
     input text    ${ProviderSTIN}    610703799
     click element    ${ProvideSearchBtn}
     page should contain    Results
     page should contain element    //td[@title=' Par ']
     click element    ${PSBackBtn}
     click element    ${PSClear}
     click element    ${ProvideSearchBtn}
     page should contain element    ${PSClearSearchError}

#***********************************************************************************************************************
#Added/Changed  :  Sanket : 06/16/2021
#Description: Added Code for Below TestCases
    #4495586_CGX - MC - Search - Auth - Valid - Clear
    #4495588_CGX - MC - Search - Auth - Valid - Max Length
    #4495592_CGX - MC - Search - Auth - Invalid - Invalid Data
    #4495593_CGX - MC - Search - Auth - Invalid - Required Fields
    #4495590_CGX - MC - Search - Auth - valid - Auth Details Page



*** Variables ***
${Notes} =  //a[@href="/cgx/Notes/MemberNote/Index"]
${Imp1} =    //a[@class='imp-link benefit-icon-link']
${Imp2} =    //span[contains(text(),'IMP 2.0')]

*** Keywords ***
Search_Auth_Valid_Clear
    [Arguments]    ${UserData}
    set selenium speed    0.5s
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.AuthId}
    click element    //span[contains(text(),'Clear')]
    ${str}    get text    //input[@id='authIdField']
    ${value}    get length    ${str}



Search_Auth_Valid_Max_Length
    [Arguments]    ${UserData}
    set selenium speed    0.5s
    input text    //input[@id='authIdField']    1234567890123
    click element    //span[contains(text(),'Search')]
    page should contain element    //span[contains(text(),'Auth/CDR ID should not exceed 12 characters')]
    click element    //span[contains(text(),'Clear')]

Search_Auth_Invalid_Invalid_Data
    [Arguments]  ${UserData}
    set selenium speed    0.5s
    input text    //input[@id='authIdField']    @
    click element    //span[contains(text(),'Search')]
    page should contain element    //span[contains(text(),'Please enter letters and numbers only')]
    click element    //span[contains(text(),'Clear')]

Search_Auth_Invalid_Required_Fields
    [Arguments]  ${UserData}
    set selenium speed    0.5s
    click element    //span[contains(text(),'Search')]
    page should contain element    //label[@id='requiredErrorField']

Search_Auth_valid_Auth_Details_Page
    [Arguments]  ${UserData}
    set selenium speed    0.5s
    input text    //input[@id='authIdField']    ${UserData.AuthId}
    click element    //span[contains(text(),'Search')]
#    wait until page does not contain  //*[@id="loading-ajax"]    8 seconds
    wait until element is visible    //h3[contains(text(),'Authorization - Details')]
#    run keyword if  page should contain element    //a[contains(@id,'auth-info-partial')]   #and page should contain element    //span[@id='AuthId']
#    run keyword if  page should contain element    //span[@id='AuthId']
    ${AuthId}    get text    //span[@id='AuthId']
    should be equal as strings  ${AuthId}  ${UserData.AuthId}

###############################################################################
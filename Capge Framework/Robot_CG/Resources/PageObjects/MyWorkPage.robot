*** Settings ***
Library  SeleniumLibrary



*** Variables ***
${Search_Element} =  //a[@href="/cgx/Search"]
${Back_Button} =  //*[@id="back-button"]
${Search Results_Heading} =  //*[@id="search-results"]/div[2]/div/h3
${SubscriberId_InputBox} =  //input[@id="SubscriberId"]
${Search_Button} =  //a[@id="btnSearch"]
${RecordTab} =    //a[@href="#record"]
${PhoneNumber} =  //span[@class="phone-number"]
${AuthId}=    //input[@id="authIdField"]
${MemberPolice} =    //*[@id="PolicySearch"]/div[2]/div[1]/table/tbody/tr[1]


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
    click link  ${Search_Element}
    page should contain element  ${Back_Button}
    page should contain element  ${Search Results_Heading}
    input text  ${SubscriberId_InputBox}  ${UserData.SubscriberId}
    click element  ${Search_Button}

Auth Search
    [Arguments]  ${UserData}
    page should contain element  ${Search_Element}
    click link  ${Search_Element}
    page should contain element  ${Back_Button}
    click element   ${RecordTab}
    input text    ${AuthId}    ${UserData.AuthId}
    click element  ${Search_Button}

Member Selection
    click element  //table[@role='grid' and @class="k-selectable"]
    Sleep    1 seconds
    ${Result} =    Run Keyword And Return Status    Element Should Be Visible   //a[@id="yesChangeMemberButton"]
    Run Keyword And Return If    ${Result}    Change the Member
    ${Policy} =    Run Keyword And Return Status    Element Should Be Visible   //*[@id="PolicySearch-gridContent"]
    Run Keyword And Return If    ${Policy}    MyWorkPage.Select Member Policy

Select Member Policy
    click element    ${MemberPolice}

Change the Member
     click element    //a[@id="yesChangeMemberButton"]

Verify Details
    set selenium implicit wait  25 seconds
    wait until page contains element  ${PhoneNumber}

Click on the Member Central
    set selenium implicit wait  30 Seconds
    page should contain element  //u[contains(text(),'Member Details')]
    click link  Member Central

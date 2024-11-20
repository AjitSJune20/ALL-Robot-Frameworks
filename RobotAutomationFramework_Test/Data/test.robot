*** Settings ***
Library  SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***

*** Test Cases ***
TC1
    Open Browser    about:blank     chrome
    Maximize Browser Window
    Go To    file:///C:/Users/asing480/Downloads/Selenium/index.html
    Set Selenium Implicit Wait    5s
   
    Wait Until Element Is Enabled    //*[text()='Click Me']
    #Wait For Condition	return jQuery.active == 0
    Click Element    //*[text()='Click Me']
    Wait Until Page Contains Element    //img[@class='img-conti']   20s
    Page Should Contain Element    //img[@class='img-conti']
    Wait Until Element Is Enabled    locator
*** Keywords ***


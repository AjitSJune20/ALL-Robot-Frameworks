*** Settings ***
Library     SeleniumLibrary
Resource    ../../CommonFunctionLibrary/Config.robot
#Resource    ../PageObjects/LaunchBrowser_PO.robot
# robot -d results Tests/LaunchBrowser.robot
*** Variables ***
${username}    //input[@id='userName']
${emailid}     //input[@id='userEmail']
${currentaddress}       //textarea[@id='currentAddress']
${permanentaddress}     //textarea[@id='permanentAddress']
${submit}       //button[@class='btn btn-primary']
${checkbox}     https://demoqa.com/checkbox
${nike}     //span[@class='rct-checkbox']
${text}     //span[text()='You have selected :']
*** Test Cases ***
EmailId=jagadeeshreddy2411@gmail.com
*** Keywords ***
LaunchingBrowser
    [Arguments]     ${UserData}
    Open
    input text    ${username}   ${UserData.UN}
    input text    ${emailid}    ${UserData.EmailID}
    input text    ${currentaddress}     Tirupati,venkatagiri
    input text    ${permanentaddress}   Tirupati,venkatagir
    click button    ${submit}
    go to     ${checkbox}
    click element    ${nike}

*** Keywords ***
Open
    open browser   ${URL.${ENVIRONMENT}}  ${BROWSER}
    maximize browser window




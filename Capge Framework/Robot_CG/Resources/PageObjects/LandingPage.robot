*** Settings ***
Library  SeleniumLibrary
Resource  ../../Data/Config.robot

*** Variables ***
${Search_Box}=  //*[@id="toolbar-search"]
${HSS_link} =  //a[@href='/hss/landing']
${UserName} =    //input[@type="email"]
${Next} =    //input[@type="submit"]
${Passwrd} =    //input[@name="passwd"]
${Yes} =    //input[@value="Yes"]

*** Keywords ***
Load CGX
    go to  ${URL.${ENVIRONMENT}}
    sleep    2 seconds
    Log  ${URL}

Verify Landing Page Load
    set selenium implicit wait    15 Seconds
    ${signin} =  run keyword and return status  element should be visible    ${UserName}
    run keyword if    ${signin}    Sign In with Userid
    page should contain  Hi
    wait until element is visible   ${Search_Box}    2 Seconds
    page should contain link  https://www.humana.com/

Sign In with Userid
     input text   ${UserName}    ajitsingh101@humana.com
     click element    ${Next}
     sleep   2 Seconds
     wait until page contains element    ${Passwrd}
     input password    ${Passwrd}    kavita4$
     wait until page contains element    ${Next}
     click element    ${Next}
     sleep    2 Seconds
     CLICK ELEMENT    ${Yes}
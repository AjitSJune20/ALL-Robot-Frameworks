*** Settings ***
Library     SeleniumLibrary
Resource    ../../CommonFunctionLibrary/Config.robot
*** Keywords ***
Open
    open browser   ${URL.${ENVIRONMENT}}  ${BROWSER}
    maximize browser window

Address


*** Settings ***
Library     SeleniumLibrary
Resource    ../CommonFunctionLibrary/Config.robot
Resource    ../../PageObjects/LauncBrowser_Def.robot
# robot -d results Tests/LaunchBrowser.robot

*** Test Cases ***
Test1
    [Template]  LaunchingBrowser
    ${TC_01}

*** Settings ***
Library  ../../CustomLibs/DataCreation.py
Resource  ../../Data/Config.robot


*** Keywords ***
Get Data and Format
    [Arguments]    ${UserData}
    create data excel    ${UserData}
    format_data    ${UserData}
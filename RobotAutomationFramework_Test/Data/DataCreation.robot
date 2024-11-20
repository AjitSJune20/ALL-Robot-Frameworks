*** Settings ***
Library     ../CustomLibs/DataCreation.py
Resource    ../CommonFunctionLibrary/Config.robot

# robot -d results Data/DataCreation.robot
*** Variables ***
#${FILEPATH}     ${EXECDIR}\\Data
*** Test Cases ***
Sample Test
    Get Data and Format    ${FILEPATH}

*** Keywords ***
Get Data and Format
    [Arguments]     ${UserData}
    Create Data Excel    ${UserData}
    Format Data    ${UserData}
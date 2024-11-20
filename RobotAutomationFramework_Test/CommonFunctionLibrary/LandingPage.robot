*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    Collections
Resource    ../CommonFunctionLibrary/Config.robot

# robot -d results CommonFunctionLibrary/LandingPage.robot
*** Variables ***
${Table_RowsCount}=          //div[@id='DrugPricing']//table[@class='Table-light-Padded']/tbody/tr
${Table_ColumnsCount}=      //div[@id='DrugPricing']//table[@class='Table-light-Padded']/tbody/tr[1]/td
@{TableData}

*** Test Cases ***
*** Keywords ***
Begin Web Test
    Open Browser    about:blank     ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

Press Enter Key
    Set Selenium Implicit Wait    5s
    Press Keys    None    RETURN

Load URL
    Go To    ${URL.${ENVIRONMENT}}
    Sleep    2s
    Log    ${URL}

Remove Unnecessary SceenShots
    Remove Files    ${OUTPUT_DIR}\\selenium-screenshot-*.png

Retrieve Table Data
    ${rows}     Get Element Count    ${Table_RowsCount}
    ${cols}     Get Element Count    ${Table_ColumnsCount}
    FOR    ${rowIndex}    IN RANGE    1    ${rows} + 1
            Nested Loop    ${rowIndex}    ${cols}
    END

Nested Loop
    [Arguments]     ${rowIndex}    ${cols}
    FOR    ${colIndex}    IN RANGE    1    ${cols} - 1
        ${CurText}    Get Text    ${Table_RowsCount}\[${rowIndex}]/td[${colIndex}]
        Log    ${CurText}
        Append To List  ${TableData}     ${CurText}
    END
*** Settings ***
Library    DateTime
Library    SeleniumLibrary
*** Variables ***
${CoverageResult}=  Coverage Match Successful
${rowIndex}=      1
${colIndex}=      1
${Table_RowsCount}=    //div[@id='drug-pricing-myRx-drugs']//table[@class='table border-light padded']/tbody/tr
                     #//div[@id='drug-pricing-myRx-drugs']//table[@class='table border-light padded']/tbody/tr
*** Test Cases ***
Test
    #Check Coverage
    Xpath
#    DateTIme
    #cHECK
    #PassFailStatus

*** Keywords ***
Xpath
            ${curText}=      Set variable     ${Table_RowsCount}\[${rowIndex}]/td[${colIndex}]
            //div[@id='drug-pricing-myRx-drugs']//table[@class='table border-light padded']/tbody/tr[1]/td[1]
           #//div[@id='drug-pricing-myRx-drugs']//table[@class='table border-light padded']/tbody/tr/[1]/td[1]
            Log    ${curText}
            Log to console    ${curText}
DateTIme
    ${execution_date}=    get current date    result_format=%d/%m/%Y
    log to console  \n${execution_date}
    ${execution_time}=    get current date    result_format=%I:%M %p
    log to console  ${execution_time}
PassFailStatus
    ${CoverageStatus}  Set Variable     False
    RUN KEYWORD IF    ${CoverageStatus}==False     fail     CoverageMatch Failed
cHECK
    ${IsExist_In_Coverage}    run keyword and return status  should contain    ${CoverageResult}   Coverage Match Successful
    log to console  \n${IsExist_In_Coverage}
    ${Result}=     RUN KEYWORD IF    ${IsExist_In_Coverage}     CoverageMatchPassStatus
                            ...         ELSE     CoverageMatchFailStatus
    log to console  Ajit
    log to console  ${Result}
    sleep    2
CoverageMatchPassStatus
    ${Result}  Set Variable     Coverage Match Successful
CoverageMatchFailStatus
    ${Result}     Set Variable     Coverage Match Failed

Check Coverage
    ${date}=    get current date
    log to console  ${date}
    ${All_Coverage}=  Set Variable  Ajit
    ${UserDataIN_Coverage}=  Set Variable  Manoranjan
    #${Result}=  Set Variable
    #Set Test Variable   ${Result}




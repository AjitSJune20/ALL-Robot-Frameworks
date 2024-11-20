*** Settings ***
Library  SeleniumLibrary



*** Variables ***




*** Keywords ***

Protegrity My works Consultation validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    ${Consult_FirstName}    get text    //div[@class='k-grid-content']//tr[1]/td[4]
    ${Consult_LastName}    get text    //div[@class='k-grid-content']//tr[1]/td[5]


    should be equal as strings  ${Consult_FirstName}  ${UserData.FirstName}
    should be equal as strings  ${Consult_LastName}  ${UserData.LastName}
    reload page

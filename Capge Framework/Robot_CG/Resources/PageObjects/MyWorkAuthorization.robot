*** Settings ***
Library  SeleniumLibrary



*** Variables ***
${FullName} =  //span[contains(text(),'Member Name:')]/following::span[1]
${Back_Button} =  //*[@id="back-button"]
${Search Results_Heading} =  //*[@id="search-results"]/div[2]/div/h3



*** Keywords ***

Protegrity My worksAuthorization Validation
    [Arguments]  ${UserData}
    click element    //div[@class='grid-canvas']/div/div[5]
    click element    //img[contains(@src,'grid_more_icon_web.png')]
    ${FullName_Auth}    get text    ${FullName}
    ${Name}      split string   ${FullName_Auth}     ,
    ${FirstName_Auth_Actual}    strip string     ${Name}[1]
    ${LastName_Auth_Actual}    strip string     ${Name}[0]
    should be equal as strings  ${FirstName_Auth_Actual}  ${UserData.FirstName}
    should be equal as strings  ${LastName_Auth_Actual}  ${UserData.LastName}
    reload page


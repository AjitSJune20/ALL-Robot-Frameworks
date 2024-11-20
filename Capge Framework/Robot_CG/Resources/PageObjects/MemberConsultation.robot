*** Settings ***
Library  SeleniumLibrary



*** Variables ***
${MC_FullName} =    //div[@class='member-banner']/div/div[1]
${MC_MemberId} =    //div[@class='member-banner']/div/div[2]



*** Keywords ***

Protegrity Member Consultations validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //div[@class='k-grid-content']//tr[1]/td[1]
    ${FullName}    get text    ${MC_FullName}
    ${Name}      split string   ${FullName}    ,
    ${MC_FirstName}    strip string     ${Name}[1]
    ${MC_LastName}    strip string     ${Name}[0]
    ${MC_Member_Id}    get text    ${MC_MemberId}


    should be equal as strings  ${MC_FirstName}  ${UserData.FirstName}
    should be equal as strings  ${MC_LastName}  ${UserData.LastName}
    should be equal as strings  ${MC_Member_Id}  ${UserData.SubscriberId}
    reload page
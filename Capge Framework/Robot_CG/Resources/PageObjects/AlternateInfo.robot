*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Data/TestData.robot


*** Variables ***
${ZipCode_Alt_Info} =    //label[contains(text(),'Zip Code')]/following::div[1]
${Email_Alt_Info} =   //label[contains(text(),'Email Address')]/following::div[1]
${StreetAdd_Alt_Info} =  //label[contains(text(),'Address')]/following::div[1]
${Phone_Alt_Info} =  //div[@id='phoneNumbersGrid']//div[@class='grid-canvas']/div//div[@class='slick-cell l1 r1']/span


*** Keywords ***
View_Alternate_Info_Protegrity
    [Arguments]  ${UserData}
    set selenium speed    1s
    ${ZipCode}      get text    ${ZipCode_Alt_Info}
    ${ZipCode_Alt_Info}      strip string    ${ZipCode}
    ${ZipCode_Alt_Info_Actual}    convert to string    ${ZipCode_Alt_Info}
    ${Email_Alt_Info2}      get text    ${Email_Alt_Info}
    ${Email_Alt_Info_Actual}    convert to string    ${Email_Alt_Info2}
    ${StreetAdd_Alt_Info}      get text    ${StreetAdd_Alt_Info}
    ${StreetAdd_Alt_Info2}    remove string    ${StreetAdd_Alt_Info}    ,
    ${StreetAdd_Alt_Info_Actual}    convert to string    ${StreetAdd_Alt_Info2}
    ${ContactPhone_Alt_Info2}      get text    ${Phone_Alt_Info}
    ${ContactPhone_Alt_Info_Actual}    convert to string    ${ContactPhone_Alt_Info2}

    should be equal as strings  ${ZipCode_Alt_Info_Actual}  ${UserData.ZipCode}
    should be equal as strings  ${Email_Alt_Info_Actual}  ${UserData.Email}
    should be equal as strings  ${StreetAdd_Alt_Info_Actual}  ${UserData.StreetAddress}
    should be equal as strings  ${ContactPhone_Alt_Info_Actual}  ${UserData.ContactPhone}
    reload page


Protegrity_Add_Alternate_Info
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //a[@id='createTemp']
    ${Address}      get text    //div[@class='member-banner']/div/div[4]
    ${Add}      split string   ${Address}     ,
    ${StreetAddress_AltInfo}    strip string     ${Add}[0]
    ${ZipCode_Alt_Info_Actual}    strip string     ${Add}[4]

    ${DOB}      get text    //div[@class='member-banner']/div/div[3]
    ${BirthDayMonth}      split string   ${DOB}     /
    ${DOB_AltInfo}    strip string     ${BirthDayMonth}[1]
    ${ContactPhone_AltInfo}      get text    //div[@class='member-banner']/div/div[5]


    should be equal as strings  ${ZipCode_Alt_Info_Actual}  ${UserData.ZipCode}
    should be equal as strings  ${ContactPhone_AltInfo}  ${UserData.ContactPhone}
    should be equal as strings  ${StreetAddress_AltInfo}  ${UserData.StreetAddress}
    should be equal as strings  ${DOB_AltInfo}  ${UserData.DOB}
    reload page
*** Settings ***
Documentation  This script is used for Medicaid ID in member banner and Ltss service auth print and IL Address, Backup provider fields verification

Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    AutoItLibrary
Library    Pdf2TextLibrary
Library    String

Resource    ../Definitions/HumanaGui.robot
Resource    ../PageObjects/Generic_PO.robot


*** Variables ***
${Expand_MemberInfo} =    //a[@id="expand-member-information"]
${Customize_MemberInfo} =    //a[@id="customize-member-information"]
${btn_SaveSetting} =    //a[@id="save-settings-btn"]
${McdID_Source} =    //div[@id="HideList"]//div[text()='Medicaid Id']
${McdID_Target} =    //div[@id="ShowList"]/div/div[9]/div
#${Actual_McdID} =    //span[@id="Medicaid Id"]/text()     #//div[@id="expandable-section"]//span[@id="Medicaid Id"]
${Actual_McdID} =    //div[@id="expandable-section"]//span[@id="Medicaid Id"]

*** Keywords ***
Verification of MCD_ID from MemberInfo section
    set selenium implicit wait    30s
    scroll element into view    ${Expand_MemberInfo}
    click link    ${Expand_MemberInfo}
    sleep    4s
    ${status} =    run keyword and return status    page should not contain element    //div[@id="expandable-section"]//span[contains(text(),'Medicaid Id')]    10s
    run keyword if    ${status}    Drag MedicaidID From customize setting
    Check Medicaid value from MemberInfo

Drag MedicaidID From customize setting
    wait until element is visible    ${Expand_MemberInfo}    30s
    click link    ${Expand_MemberInfo}
    wait until element is visible    ${Customize_MemberInfo}    30s
    click link    ${Customize_MemberInfo}
    wait until element is visible    ${btn_SaveSetting}    20s
    drag and drop    ${McdID_Source}    ${McdID_Target}    #(//div[@id="ShowList"]/div/div/div[@data-description="Placeholder"])[1]
    wait until element is visible    //div[@id="ShowList"]//div[text()='Medicaid Id']     30s
    sleep    2s
    click element    ${btn_SaveSetting}

Check Medicaid value from MemberInfo
    ${ExpectedMcdID} =    get text    //div[contains(@id,'MedicaidId')]
    ${ExpectedMcdID} =    strip string    ${ExpectedMcdID}    mode=both
    log to console    ${ExpectedMcdID}
    Sleep   3s
    set focus to element    ${Actual_McdID}
    sleep    3s
    ${McdID_On_Banner} =    get text    ${Actual_McdID}
    ${McdID_On_Banner} =    strip string    ${McdID_On_Banner}    mode=both
    log    ${McdID_On_Banner}
    log to console    ${McdID_On_Banner}

    ${Mcdid_status} =    run keyword and return status    element should be visible    ${Actual_McdID}    10s
    run keyword if    ${Mcdid_status}    should be equal as strings    ${ExpectedMcdID}    ${McdID_On_Banner}
    ...         ELSE    Check McdID by Expanding memberBanner    ${ExpectedMcdID}    ${McdID_On_Banner}

Check McdID by Expanding memberBanner
    [Arguments]        ${ExpectedMcdID}    ${McdID_On_Banner}
    scroll element into view    ${Expand_MemberInfo}
    click link    ${Expand_MemberInfo}
    sleep    5s
    should be equal as strings    ${ExpectedMcdID}    ${McdID_On_Banner}

## TC02 Create LTSS auth_verify Medicaid ID on LTSS Service authorization Print
*** Variables ***
${LTSSAuthHeader}=    //h3[contains(text(),'View Authorization')]
${LTSSAuthMedicaidID}=    //div[@id='MedicaidIdDDM']
${LTSSAuthPrintBtn}=    //a[@id='btnViewltssAuthPrint']
${SavePdfBtn}=    //button[@id='save']

*** Keywords ***
Validate Medicaid ID On LTSS Service Authorization Print
     set selenium speed    0.5s
     wait until element is visible     ${LTSSAuthHeader}      10s
     set focus to element     ${LTSSAuthMedicaidID}
     sleep    3s
     ${LTSSAuthMedicaidID}=    get text    ${LTSSAuthMedicaidID}
     sleep    3s
     set focus to element     //div[@id='memberMailResAddress']//span[@id='memberaddressdiv']
     sleep    3s
     ${MemberAddress}      get text   //div[@id='memberMailResAddress']//span[@id='memberaddressdiv']
     sleep    3s

     @{Add}      split string   ${MemberAddress}   ,
    log    ${Add}[0]
    log    ${Add}[1]
    log    ${Add}[2]
    log    ${Add}[3]
    ${StreetAddress}=     strip string    ${Add}[0]    mode=both
#    ${StreetAddress}=     remove string    ${Add}[0]    ${SPACE}
    ${MemberCity}=    remove string    ${Add}[1]    ${SPACE}
    ${Memberstate}=   remove string    ${Add}[2]    ${SPACE}
    ${MemberZipcode}=    remove string    ${Add}[3]    ${SPACE}

     page should contain element    ${LTSSAuthPrintBtn}
     click element    ${LTSSAuthPrintBtn}
     sleep    10s
     @{WindowHandles}=  Get Window Handles
     sleep    4s
     switch window   ${WindowHandles}[1]
     sleep    3s
     maximize browser window
     sleep    30s
     #WaitForActiveWindow    PrintLtssAuthorization - Profile 1 - Microsoft​ Edge      Chrome Legacy Window     100
     WaitForActiveWindow    PrintLtssAuthorization - Google Chrome      Chrome Legacy Window     100
     sleep    5s
     #Control Click    PrintLtssAuthorization - Profile 1 - Microsoft​ Edge    Chrome Legacy Window    [CLASS:Chrome_RenderWidgetHostHWND; INSTANCE:1]    LEFT    1     1444    21
     Control Click    PrintLtssAuthorization - Google Chrome    Chrome Legacy Window    [CLASS:Chrome_RenderWidgetHostHWND; INSTANCE:1]    LEFT    1     1167    29
     WaitForActiveWindow    Save As    &Save
     sleep    5s
     Control Click    Save As    &Save   [CLASS:Button; INSTANCE:2]    LEFT    1     28    16
     sleep    5s
     ${fileStatus} =    run keyword and return status    file should exist    ${PDFFILE_PATH}\\PrintEntity.pdf
     run keyword if    ${fileStatus}    Replace the existing pdf
     sleep    5s
     ${Data1} =    Convert Pdf To Txt    ${PDFFILE_PATH}\\PrintEntity.pdf
     #${Data1} =    Get Text From Pdf    ${PDFFILE_PATH}\\PrintEntity.pdf
#    ${Data1} =    Get Text From PDF    \\\\LOUISILON02S\\USERDAT01\\AOS6140\\Downloads\\CGX_100133754_20210714042508.pdf
     #log to console    ${Data1}
     log    ${Data1}       #    should be true    "Your doctor has requested a review of the decision we notified you about on IDNLetterDate_txt." in "${Data1}"
     sleep    2s
     ${matched}     Get Regexp Matches    ${Data1}     ${LTSSAuthMedicaidID}
     log    ${matched}
     List Should Contain Value   ${matched}    ${LTSSAuthMedicaidID}
#     should be true    "${LTSSAuthMedicaidID}" in "${Data1}"
#     should be true    "${StreetAddress}" in "${Data1}"
#     should be true    "${MemberCity}" in "${Data1}"
#     should be true    "${Memberstate}" in "${Data1}"
#     should be true    "${MemberZipcode}" in "${Data1}"
    sleep    4s
     switch window   ${WindowHandles}[0]
     sleep    3s

Replace the existing pdf
    Control Click    Confirm Save As    &Yes     [CLASS:Button; INSTANCE:1]    LEFT    1    26   9

## 03
Open Alternet information screen
    ${status} =    run keyword and return status    element should be visible    ${btn_EnterAlternateInfo}    30s
    run keyword if    ${status}    click element    ${btn_EnterAlternateInfo}
    ...    ELSE    Edit alternet information

Edit alternet information
    sleep    20s
    wait until element is visible    ${btn_EditAlternateInfo}    30s
    set focus to element    ${btn_EditAlternateInfo}
    sleep    1s
    click element    ${btn_EditAlternateInfo}


Fill Contact Information under Alternet Info screen
    [Arguments]    ${UserData}
    set selenium implicit wait    30s
    sleep    2s
    Open Alternet information screen
    wait until element is visible    ${btn_SAVEAlternateInfo}    30s
    scroll element into view    ${Contact_Address}
    select from list by label    ${Contact_PhysycalLocation}    ${UserData.Contact_PhysycalLocation}
    input text    ${Contact_Address}    ${UserData.Contact_Address}
    input text    ${Contact_Address2}    ${UserData.Contact_Address2}
    input text    ${Contact_City}    ${UserData.Contact_City}
    select from list by label    ${Contact_State}    ${UserData.Contact_State}
    input text    ${Contact_ZipCode}    ${UserData.Contact_ZipCode}
    input text    ${Contact_Email}    ${UserData.Contact_Email}
    sleep    2s
    click element    ${btn_SAVEAlternateInfo}

Verify details filled in Alternet info screen
    [Arguments]    ${UserData}
    set selenium implicit wait    30s
    scroll element into view    ${Contact_Address}
    page should contain element    //input[@id='Address' and @value='${UserData.Contact_Address}']
    page should contain element    //input[@id='Address2' and @value='${UserData.Contact_Address2}']
    page should contain element    //input[@id='City' and @value='${UserData.Contact_City}']
    page should contain element    //input[@id='ZipCode' and @value='${UserData.Contact_ZipCode}']
    page should contain element    //select[@id="State"]//option[@selected="selected" and text()='${UserData.Contact_State}']

*** Variables ***
${CareManagerType} =    //select[@id="CareProviderTypeCode"]
${CareProviderName} =    //input[@id="CareProviderName"]
${CareProviderStartDate} =    //input[@id="CareProviderStartDate"]
${btn_CareProvider_Save} =    //a[@id="button-care-provider-save"]

*** Keywords ***
Verify the fields in Additional care Details and submit the details
    [Arguments]    ${UserData}
    element should be enabled    ${btn_Caremanager_Add}
    page should contain element    ${DD_MandatoryRoute}/option[text()='190 days']
    page should contain element    ${DD_MandatoryRoute}/option[text()='Readmission']
    select from list by label    ${DD_MandatoryRoute}    ${UserData.MandatoryRoute}

    click element    ${btn_Caremanager_Add}
    page should contain    Add Care Manager    30s
    wait until element is visible    ${CareManagerType}    30s
    select from list by label    ${CareManagerType}    ${UserData.CareManagerType}
    input text    ${CareProviderName}    ${UserData.CareProviderName}
    Enter Curent Date    ${CareProviderStartDate}
    click link    ${btn_CareProvider_Save}
    wait until element is visible    //div[@id="CareProviderGrid"]//tbody/tr/td    30s
    page should contain element    //div[@id="CareProviderGrid"]//tbody/tr/td[text()='${UserData.CareManagerType}']
    page should contain element    //div[@id="CareProviderGrid"]//tbody/tr/td[text()='${UserData.CareProviderName}']
    sleep    1s
    click element    ${btn_SAVEAlternateInfo}

*** Variables ***
${btn_EnterAlternateInfo} =    //a[@id="enterAlternateInfo"]
${btn_EditAlternateInfo} =    //a[@id="editAlternateInfo"]
${btn_SAVEAlternateInfo} =    //a[@id="saveAlternateInfo"]
${Contact_PhysycalLocation} =    //select[@id='PhysicalLocationCode']
${Contact_Address} =    //input[@id="Address"]
${Contact_Address2} =    //input[@id="Address2"]
${Contact_City} =    //input[@id="City"]
${Contact_State} =    //select[@id="State"]
${Contact_ZipCode} =    //input[@id="ZipCode"]
${Contact_Email} =    //input[@id="EmailAddress"]
${Contact_AltInfoTab} =    //a[@id="Alternate-Info-tab"]
${btn_Caremanager_Add} =    //a[@id="member-care-provider-add-btn"]
@{MandatoryRoute_Values} =   EMPTY
${DD_MandatoryRoute} =    //select[@id="ViewMandatoryRoute"]    #/option

## TC05_Verify the member having Mailing Address, Residential and Address State of Issue from same state in the Member Banner
*** Keywords ***
Checking State in Member Banner
    Residential Address

Residential Address
    sleep    10s
    click element    //div//span[@id="MemberAddressDropdown"]
    ${Address} =    get text    (//div[@class="LockText printAddressInfo"]//div//div)[1]
    log    ${Address}
    @{Add}      split string   ${Address}    ,
    ${State} =    remove string    ${Add}[2]    ${SPACE}
#    ${Size} =     get length    ${Add}
    log    ${Add}[0]
    log    ${Add}[1]
    log    ${Add}[2]
#    ${State} =    ${Add}[2]
    log    ${Add}[2]
    log to console    ${Add}[2]
    should be equal as strings    ${State}    IL

    ${Address1} =    get text    (//div[@class="LockText printAddressInfo"]//div//div)[2]
    log    ${Address1}
    @{Add1}      split string   ${Address1}    ,
    ${State1} =    remove string    ${Add1}[2]    ${SPACE}
#    ${Size} =     get length    ${Add}
    log    ${Add1}[0]
    log    ${Add1}[1]
    log    ${Add1}[2]
#    ${State} =    ${Add}[2]
    log    ${Add1}[2]
    log to console    ${Add1}[2]
    should be equal as strings    ${State1}    IL

    click element    //a[@id="expand-member-information"]
    wait until element is visible    //span[@id="State of Issue"]    5s
    element should contain    //span[@id="State of Issue"]    IL

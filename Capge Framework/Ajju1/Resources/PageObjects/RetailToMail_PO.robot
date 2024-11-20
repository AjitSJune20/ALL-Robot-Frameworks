*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem

Library  ../../CustomLibs/XLUtils.py
Library  ../../CustomLibs/DataCreation.py
Resource  ../../CustomLibs/Config.robot
Resource  ../CommonFunctionLibrary/LandingPage.robot

*** Variables ***
${Search_Box}=  (//input[@id='filterLinks'])[1]
${RxConnectPro_Lnk}=  //a[@class='secondary list'][normalize-space()='Rx Connect Pro']
${RxConnect_MemberID}=  //input[@id='search-text']
${RetailToMail}=    //a[@id='rtm-link']
${Form_FormHeader}=     (//h3[contains(text(),'Associate View - Member Information')])[2]
${Form_HowtoHearAbout}=  //select[@data-bind="options: MemberDispositions, optionsText: 'MemberDispositionName', optionsValue: 'MemberDispositionName', value: MemberDisposition, optionsCaption: 'Select'"]
${Form_CallType}=   (//select[@data-bind='options: CallTypes, optionsText: "CallName", optionsValue: "CallName", value: CallType, disable: (CallTypes == undefined)'])[1]
${Form_ButtonContinue}=  //b[normalize-space()='Continue']
${Button_Continue}=     //button[@id='PreloginYesButton']//strong[contains(text(),'Yes')]
${Button_YesConti}=     //a[@id='YesContinue']
${AddNewPrescrp}=      //em[normalize-space()='Add a new prescription']
${RTM_DrugName}=       //div[@data-bind='foreach: drugs']//div[1]//div[5]//input[2]
${Drug_LabelName}=      //div[@data-bind='foreach: drugs']//div[1]//div[5]//div[1]//select[1]
${Drug_Qnty}=       (//input[@id='rqdPackageError'])[1]
${Drug_Freq}=       //div[@data-bind='foreach: drugs']//div[1]//div[8]//div[1]//select[1]
${Btn_Calculate}=   (//strong[contains(text(),'Calculate price')])[3]
${FreqDosage}=      //div[@data-bind='foreach: drugs']//div[1]//div[6]//div[1]//select[1]
${path}=     C:\RobotFramework\Data\DrugPricingMedicare_2022.xlsx
${PassResult}=  Success
${FailResult}=   Failed
${MemberIDError}=   Member id not found

*** Keywords ***
Click_RxConnectPro_Link
    click link      ${RxConnectPro_Lnk}

Verify_RxConnectMemberID
    set selenium timeout    20
    wait until element is visible   ${RxConnect_MemberID}

Enter_MemberID
    [Arguments]    ${UserData}
    input text  ${RxConnect_MemberID}  ${UserData.MemberID}
    press keys    None    RETURN

Verify_RTM_HomePage
    [Arguments]    ${UserData}
    ${M_IDError}    run keyword and return status  element should be visible    //span[contains(text(),'No member found that matches your search. Please v')]    None
    log to console  ${M_IDError}
    ${M_IDError2}=     set variable if    ${M_IDError}      ${FailResult}
    log    ${M_IDError2}
    RUN KEYWORD IF    ${M_IDError}      Failed_Result   ${UserData}
    RUN KEYWORD IF    ${M_IDError}==True     fail     Member ID not Found  #Member ID not Found

Click on RTM Link
    click link    ${RetailToMail}

Verify_RTM_Form_Header
    switch window   New                                     #   Select 2nd Tab of Browser
    set selenium timeout    20
    wait until element is visible    ${Form_FormHeader}

Fill_Associate_View_Member_Information_Form
    select from list by index    ${Form_HowtoHearAbout}    1
    select from list by index    ${Form_CallType}    1
    click element    ${Form_ButtonContinue}
    click element    ${Button_Continue}
    sleep    2
    click link    ${Button_YesConti}

Select Checkbox and Click on Add a Presciption
    select checkbox    medicationCheckbox                   #First checkbox should be selected
    click element      ${AddNewPrescrp}                     #Click on Add a Presciption
    select checkbox    AddPrescriptionCheckbox              #Select 2nd checkbox before entering the Drug Name

Enter the Drug Details and Click On Calculate Button
    [Arguments]    ${UserData}
    input text    ${RTM_DrugName}   ${UserData.DrugName}    # Enter the Drug Name Details
    sleep    2
    press keys  ${RTM_DrugName}    TAB
    select from list by label    ${Drug_LabelName}     ${UserData.LabelName}    # Enter the Drug Label Name
    sleep    2
    input text    ${Drug_Qnty}  ${UserData.Qty}
    sleep    2
    select from list by label    ${Drug_Freq}     ${UserData.Frequency}
    click element    ${Btn_Calculate}
    sleep    10

Retrive Drug Cost to Application and Store in Excel
    [Arguments]    ${UserData}
    ${HP_Cost}=  get text     //span[@data-bind='text: RightsourcePrice'][normalize-space()]
     log    ${HP_Cost}
    ${Retail_Cost}=  get text     //span[@data-bind='text: RetailPrice'][normalize-space()]
    log    ${Retail_Cost}
    ${Saving_Cost}=  get text     //span[@data-bind='text: Saving'][normalize-space()]
    log    ${Saving_Cost}
    sleep    2
    close all browsers
#    @{windowHndle}=     get window handles
#    switch window    ${windowHndle}[1]
#    log    ${windowHndle}[1]
#    close window
#    sleep    2
#    switch window    ${windowHndle}[0]
#    log    ${windowHndle}[0]

#Save result Data in Excel
    ${Date_Message}     get current date    result_format=%d/%m/%y
    Log     ${Date_Message}
    ${Time_Message}     get current date    result_format=%I:%M:%S:%p
    Log     ${Time_Message}
    @{ColArrary}    create list    N    O    P   X   Y   Z
    ${TotalValuesCount}    get length     ${ColArrary}
    log    ${TotalValuesCount}
    @{AuthValuesList}    create list    ${PassResult}    ${Date_Message}     ${Time_Message}    ${HP_Cost}     ${Retail_Cost}     ${Saving_Cost}
    add_fax_Detail_into_TestData   ${TotalValuesCount}   ${UserData.SheetName}    ${ColArrary}    ${UserData.RowNo}    ${AuthValuesList}


Failed_Result
    close all browsers
    [Arguments]    ${UserData}
    ${Date_Message}     get current date    result_format=%d/%m/%y
    Log     ${Date_Message}
    ${Time_Message}     get current date    result_format=%I:%M:%S:%p
    Log     ${Time_Message}
    @{ColArrary}    create list    N    O    P  AE
    ${TotalValuesCount}    get length     ${ColArrary}
    log    ${TotalValuesCount}
    @{AuthValuesList}    create list    ${FailResult}    ${Date_Message}     ${Time_Message}    ${MemberIDError}
    add_fax_Detail_into_TestData   ${TotalValuesCount}   ${UserData.SheetName}    ${ColArrary}    ${UserData.RowNo}    ${AuthValuesList}

Delete Unnecessary Screenshots
    remove files  ${OUTPUTDIR}\\selenium-screenshot-*.png
    remove files  ${OUTPUTDIR}\\Screenshots\\selenium-screenshot-*.png


Capture ScreenShot
    [Arguments]  ${UserData}    ${Xpath_ScreenshotCapture_Screen}     #Parameter1: RowNumber , #Parameter2: Xpath of Screenshot Page
    set screenshot directory    ${OUTPUTDIR}\\Screenshots
#    capture page screenshot     filename=${TEST_NAME}-{index}.png   #${OUTPUTDIR}\\Screenshots
    ${TC_ID}=   Evaluate    ${UserData.RowNo}-1
    ${TC_Name}  Catenate    SEPARATOR=  RTM_M  ${TC_ID}       #Output: UDLS_M1
    scroll element into view    ${Xpath_ScreenshotCapture_Screen}     #Xpath of the screen where you want to take screenshot
    capture page screenshot     filename=${TC_Name}.png   #${OUTPUTDIR}\\Screenshots



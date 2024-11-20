*** Settings ***
Library    DateTime
Library    OperatingSystem
Library    String
Library    SeleniumLibrary
Library    Collections

*** Variable ***
${ZipCode}=  //input[@placeholder='Enter Zip code']
${Search for Plans}=  //button[normalize-space()='Search for plans']
${Search DrugList}=    //button[normalize-space()='Search Drug List']
${No I'd rather enter my prescriptions Manually}=    //img[@src='/static/images/No-Id-rather-enter.png']
${DrugName}=    //input[@id='drug-name']
${Xpath_ScreenshotCapture_Screen}
${Xpath_Default_Screenshot_Screen}=     //div[@class='plan-year flex-row']


*** Keyword ***
Enter ZipCode
    [Arguments]  ${UserData}
    input text  ${ZipCode}   ${UserData.IN_ZipCode}

OptionalStep-Select CityName RadioButton
    set selenium implicit wait  2 seconds
    ${IsVisible_CountryCode_RadioButton} =    run keyword and return status  element should be visible    //form[@class='location-selector']//div[@class='form-group']    None
    log     ${IsVisible_CountryCode_RadioButton}
    RUN KEYWORD IF    ${IsVisible_CountryCode_RadioButton}        Click on CountryCode Radio Button   #${UserData}

Click on CountryCode Radio Button
    click element  //form[@class='location-selector']//div[@class='form-group']//div[1]

Click Search for Plans
    set selenium implicit wait    8 Seconds
    Click element   ${Search for Plans}

Select Plan Name
    [Arguments]  ${UserData}
#    Click element   //span[normalize-space()='${UserData.IN_PlanName}']
    ${Status}=  run keyword and return status    Click element   //span[normalize-space()='${UserData.IN_PlanName}']
    run keyword if    '${Status}'=='False'       run keyword and Continue on Failure    fail    "Failed:Couldn't click Element"
    log     This line is executed

Verify Coverage Match       #Add Stauts (Success/Fail, Date, Time, CoverageMatchStatus)
    [Arguments]  ${UserData}
    ${execution_date}=    get current date    result_format=%d/%m/%Y
    ${execution_time}=    get current date    result_format=%I:%M:%S:%p   #result_format=%I:%M %p
    ${CoverageStatus}    run keyword and return status  should contain    ${CoverageValuesList}   ${UserData.IN_Coverage}
    log     ${CoverageValuesList}
    log     ${UserData.IN_Coverage}
    ${CoverageResult}=  Set Variable if  ${CoverageStatus}  Coverage Match Successfull    Coverage Match Failed
    ${Status_InCoverage}=  Set Variable if  ${CoverageStatus}  Success    Failed

    @{ColArrary}    create list    I   J   K    L
    ${TotalValuesCount}    get length     ${ColArrary}
    log     ${TotalValuesCount}
    @{CoverageValuesList}    create list    ${Status_InCoverage}    ${execution_date}     ${execution_time}     ${CoverageResult}
    add_Application_Detail_into_Excel_TestData   ${TotalValuesCount}   ${UserData.SheetName}    ${ColArrary}    ${UserData.RowNum}    ${CoverageValuesList}
    RUN KEYWORD IF    ${CoverageStatus}==False     fail     Coverage Match Failed  #It Makes test Report Failed if Coverage not found


Capture ScreenShot-ZipPlanName
    [Arguments]  ${UserData}    #${Xpath_Screenshot_Screen}   #Parameter1: RowNumber , #Parameter2: Xpath of Screenshot Page
    set screenshot directory    ${OUTPUTDIR}\\Screenshots\\Medicare_ZipPlanValidation
    ${TC_ID}=   Evaluate    ${UserData.RowNum}-1
    ${TC_Name}  Catenate    SEPARATOR=  ZipPlan_M  ${TC_ID}       #Output: UDLS_M1
    scroll element into view    //span[normalize-space()='${UserData.IN_PlanName}']     #Xpath of the screen where you want to take screenshot
    capture page screenshot     filename=${TC_Name}.png   #${OUTPUTDIR}\\Screenshots
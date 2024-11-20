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
${Drug_Dose}=        //select[@id='dose']
${AddtoList}=       //button[@id='save-button']
${CheckCoverage}=   //button[normalize-space()='Check coverage']
${Tier}=      //span[@class='covered-tier']
${Covered}=     //span[@class='covered humana-bold']
${Quantity limit}=      //p[@class='arial quantity-limit text-small']
${Prior Authorization}=     //span[normalize-space()='Prior Authorization']
${Dispensing Limit}=        //span[normalize-space()='Dispensing Limit']
${Available at Specialty}=      //span[normalize-space()='Available at Specialty']
${Not_Covered}=   //span[@class='not-covered humana-bold']
${Covered_Under}=   //span[@class='humana-bold']
${Step_Therapy}=   //span[normalize-space()='Step Therapy']
${Coverage_In_Gap}=   //span[normalize-space()='Coverage in the Gap']
${Available_At_Mail_Order}=   //span[normalize-space()='Available at Mail Order']
${All_Coverage}=   //div[@class='drug-detail-content']
${SelectedLabelName_on_CoveragePage}=   //span[@class='drug-name humana-light']

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
    Click element   //span[normalize-space()='${UserData.IN_PlanName}']

Click On Search DrugList
    Click element   ${Search DrugList}

Click on No I'd rather Enter My Prescriptions Manually
    set selenium implicit wait    4 Seconds
    Click element   ${No I'd rather enter my prescriptions Manually}

Enter DrugName
    [Arguments]  ${UserData}
    input text  ${DrugName}  ${UserData.DrugName}
    sleep  3 seconds

Select Drug Name from List
    [Arguments]  ${UserData}
    Click element   //a[normalize-space()='${UserData.DrugName}']
#    Click element   //ul[@class='dropdown-menu']/li[1]

OptionalStep-Select DrugName RadioButton
    [Arguments]  ${UserData}
    set selenium implicit wait  2 seconds
    ${PageLoading} =    run keyword and return status  element should be visible    //label[normalize-space()='${UserData.DrugName}']    None
    log     ${PageLoading}
    RUN KEYWORD IF    ${PageLoading}        Page Loading Wait   ${UserData}

Page Loading Wait
    [Arguments]  ${UserData}
    wait until page does not contain    //label[normalize-space()='${UserData.DrugName}']
    click element  //label[normalize-space()='${UserData.DrugName}']

Select Dose Name
    [Arguments]  ${UserData}
    select from list by label   //select[@id='dose']    ${UserData.LabelName}

Click On AddtoList
    sleep   3s
    Click element   ${AddtoList}

Click On CheckCoverage
    Click element   ${CheckCoverage}

Capture All Displayed Coverage and Add that to Report  #capture and add all covrage displayed on web page to Result sheet
     # Check whether All Covegage Section Exists
#    ${IsExist_AllCoverage}    run keyword and return status  element should be visible    ${All_Coverage}    None
#    ${All_Coverage}=     RUN KEYWORD IF    ${IsExist_AllCoverage}     get text     ${All_Coverage}
#    ${All_Coverage}=     remove string   ${All_Coverage}     View alternatives
#    set selenium implicit wait    2 Seconds
    # 1. Check whether Tier Exists
    sleep   2s
    ${IsExist_Tier}    run keyword and return status  element should be visible    ${Tier}    None
    ${Tier}=     RUN KEYWORD IF    ${IsExist_Tier}     get text     ${Tier}
    set selenium implicit wait    2 Seconds
    # 2.Check whether Covered Exists
    ${IsExist_Covered}    run keyword and return status  element should be visible    ${Covered}    None
    ${O_Covered}=     RUN KEYWORD IF    ${IsExist_Covered}     get text     ${Covered}
    set selenium implicit wait    2 Seconds
    # 3. Check whether QuantityLimit Exists
    ${IsExist_QuantityLimit}    run keyword and return status  element should be visible    ${Quantity limit}    None
    ${Quantity Limit}=     RUN KEYWORD IF    ${IsExist_QuantityLimit}     get text     ${Quantity limit}
    set selenium implicit wait    2 Seconds
    # 4. Check whether Prior Authorization Exists
    ${IsExist_PriorAuthorization}    run keyword and return status  element should be visible    ${Prior Authorization}    None
    ${Prior Authorization}=     RUN KEYWORD IF    ${IsExist_PriorAuthorization}     get text     ${Prior Authorization}
    set selenium implicit wait    2 Seconds
    # 5. Check whether DispensingLimit Exists
    ${IsExist_DispensingLimit}    run keyword and return status  element should be visible    ${Dispensing Limit}    None
    ${Dispensing Limit}=     RUN KEYWORD IF    ${IsExist_DispensingLimit}     get text     ${Dispensing Limit}
    set selenium implicit wait    2 Seconds
     # 6. Check whether Available at Specialty Exists
    ${IsExist_AvailableAtSpecialty}    run keyword and return status  element should be visible    ${Available at Specialty}    None
    ${Available at Specialty}=     RUN KEYWORD IF    ${IsExist_AvailableAtSpecialty}     get text     ${Available at Specialty}
    set selenium implicit wait    2 Seconds
    # 7. Check whether NotCovered Exists
    ${IsExist_NotCovered}    run keyword and return status  element should be visible    ${Not_Covered}    None
    ${Not_Covered}=     RUN KEYWORD IF    ${IsExist_NotCovered}     get text     ${Not_Covered}
    set selenium implicit wait    2 Seconds
    # 8. Check whether CoveredUnder Part B only Exists
    ${IsExist_Covered_Under}    run keyword and return status  element should be visible    ${Covered_Under}    None
    ${Covered_Under}=     RUN KEYWORD IF    ${IsExist_Covered_Under}     get text     ${Covered_Under}
    set selenium implicit wait    2 Seconds
     # 9. Check whether Step Therapy Exists
    ${IsExist_Step_Therapy}    run keyword and return status  element should be visible    ${Step_Therapy}    None
    ${Step_Therapy}=     RUN KEYWORD IF    ${IsExist_Step_Therapy}     get text     ${Step_Therapy}
    set selenium implicit wait    2 Seconds
     # 10. Check whether Coverage in the Gap Exists
    ${IsExist_Coverage_In_Gap}    run keyword and return status  element should be visible    ${Coverage_In_Gap}    None
    ${Coverage_In_Gap}=     RUN KEYWORD IF    ${IsExist_Coverage_In_Gap}     get text     ${Coverage_In_Gap}
    # 11. Check whether "Available At Mail Order" Exists
    ${IsExist_Available_At_Mail_Order}    run keyword and return status  element should be visible    ${Available_At_Mail_Order}    None
    ${Available_At_Mail_Order}=     RUN KEYWORD IF    ${IsExist_Available_At_Mail_Order}     get text     ${Available_At_Mail_Order}
    set selenium implicit wait    2 Seconds

    #Add OutputData To ExcelSheet
    [Arguments]  ${UserData}
    @{ColArrary}    create list    R   S   T    U   V   W   X   Y   Z   AA   AB   #AC
    ${TotalValuesCount}    get length     ${ColArrary}
    log     ${TotalValuesCount}
    @{CoverageValuesList}    create list    ${Tier}     ${O_Covered}     ${Quantity limit}    ${Prior Authorization}    ${Dispensing Limit}    ${Available at Specialty}    ${Not_Covered}    ${Covered_Under}    ${Step_Therapy}    ${Coverage_In_Gap}    ${Available_At_Mail_Order}    #${All_Coverage}
    add_Application_Detail_into_Excel_TestData   ${TotalValuesCount}   ${UserData.SheetName}    ${ColArrary}    ${UserData.RowNum}    ${CoverageValuesList}
    Set Test Variable   @{CoverageValuesList}   @{CoverageValuesList}

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

Verify Dose (or) Label Name
    [Arguments]  ${UserData}
    ${O_LabelName}    get text    ${SelectedLabelName_on_CoveragePage}
    ${O_LabelName}=     should be equal as strings  ${O_LabelName}  ${UserData.LabelName}
    RUN KEYWORD IF    ${O_LabelName}!==None     fail     Incorrect Label Name Selected

Capture ScreenShot
    [Arguments]  ${UserData}    ${Xpath_ScreenshotCapture_Screen}     #Parameter1: RowNumber , #Parameter2: Xpath of Screenshot Page
    set screenshot directory    ${OUTPUTDIR}\\Screenshots\\Medicare_UDLSCoverage
#    capture page screenshot     filename=${TEST_NAME}-{index}.png   #${OUTPUTDIR}\\Screenshots
    ${TC_ID}=   Evaluate    ${UserData.RowNum}-1
    ${TC_Name}  Catenate    SEPARATOR=  UDLS_M  ${TC_ID}       #Output: UDLS_M1
    scroll element into view    ${Xpath_ScreenshotCapture_Screen}     #Xpath of the screen where you want to take screenshot
    capture page screenshot     filename=${TC_Name}.png   #${OUTPUTDIR}\\Screenshots

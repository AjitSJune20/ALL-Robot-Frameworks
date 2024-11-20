*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Library    OperatingSystem

*** Variables ***
${RxConnectPro_Lnk}=    //a[@class='secondary list'][normalize-space()='Rx Connect Pro']
${RxConnect_MemberID_InputBox}=  //input[@id='search-text']
${MemberID_not_Found}=  //span[contains(text(),'No member found that matches your search. Please v')]
${Drug_Name}=           //input[@id='drug-name']
${Captured_DrugName}=    (//input[@id='drug-name'])[1]
#${Actual_DrugList}=   (//ul[@id='ui-id-1'])[1] #//ul[@id='ui-id-1']
${Actual_DrugList}=   //ul[@id='ui-id-1']
${Drug_LabelName}=      //select[@id='drug-dose']
${Captured_DoseList}=    //*[@id="drug-dose"]
${Drug_Quantity}=       //input[@id='drug-quantity']
${Drug_Frequency}=       //select[@id='drug-frequency']
${DrugPrice_Search}=    //button[normalize-space()='Search']
${Table_RowsCount}=    //div[@id='drug-pricing-myRx-drugs']//table[@class='table border-light padded']/tbody/tr
${Table_ColumnsCount}=    //div[@id='drug-pricing-myRx-drugs']//table[@class='table border-light padded']/tbody/tr[1]/td
${PassResult}=  Success
${FailResult}=   Failed
@{Results}                      #This Variable is used for Storing Table values

*** Keywords ***
Click RxConnectPro Link
    set selenium implicit wait   20s                #    set selenium timeout    20
    wait until element is visible  ${RxConnectPro_Lnk}
    click link      ${RxConnectPro_Lnk}
    set selenium implicit wait   20s
    wait until element is visible   ${RxConnect_MemberID_InputBox}

Enter MemberID
    [Arguments]    ${UserData}= ${123}
    input text  ${RxConnect_MemberID_InputBox}  ${UserData.MemberID}
    press keys    None    RETURN
    set selenium implicit wait   5s
    ${M_IDError}    run keyword and return status  element should not be visible    ${MemberID_not_Found}    None
    ${M_IDError2}=     set variable if       ${M_IDError}==False      MemberID not Found-Expected MemberID:${UserData.MemberID}
    set test variable       ${M_IDError2}    ${M_IDError2}
    RUN KEYWORD IF    ${M_IDError}==False      Failed_Result   ${UserData}
    RUN KEYWORD IF    ${M_IDError}==False     Capture ScreenShot  ${UserData}
    RUN KEYWORD IF    ${M_IDError}==False     fail     Expected MemberID Not Found

Page_scroll_Down
    set selenium implicit wait   5s
    scroll element into view    ${DrugPrice_Search}

Enter DrugName
    [Arguments]    ${UserData}
    scroll element into view    ${DrugPrice_Search}
    input text  ${Drug_Name}  ${UserData.DrugName}
    sleep    2
    press keys    None    END
    press keys    None    BACKSPACE
    sleep    2
    ${Status}=  run keyword and return status    element should be visible    ${Actual_DrugList}
    run keyword if    ${Status}==True       click element    (//a[normalize-space()='${UserData.DrugName}'])[1]
    ${InputDrugName}=       get value      ${Captured_DrugName}

    # Drop downlist not found or drug Name mismatch
    ${M_IDError}    run keyword and return status   should be equal    ${UserData.DrugName.strip()}     ${InputDrugName.strip()}
    ${M_IDError2}=     set variable if       ${M_IDError}==False      DrugName Not Found-Expected DrugName:${UserData.DrugName.strip()}
    set test variable       ${M_IDError2}    ${M_IDError2}
    RUN KEYWORD IF    ${M_IDError}==False      Failed_Result   ${UserData}
    RUN KEYWORD IF    ${M_IDError}==False     Capture ScreenShot  ${UserData}
    RUN KEYWORD IF    ${M_IDError}==False     fail     Expected DrugName Not Found  #It Makes test Report Failed

Select Drug Dose
    [Arguments]    ${UserData}
    sleep    2s
    @{All_Dose_List}=   get list items     ${Captured_DoseList}
    log    ${All_Dose_List}
    ${Dose_Match_Status}=   run keyword and return status    list should contain value    ${All_Dose_List}     ${UserData.LabelName}
    RUN KEYWORD IF    ${Dose_Match_Status}==True   select from list by label    ${Drug_LabelName}     ${UserData.LabelName}
    ${M_IDError2}=     set variable if       ${Dose_Match_Status}==False      Dose Not Found-Expected Dose:${UserData.LabelName}
    set test variable       ${M_IDError2}    ${M_IDError2}
    RUN KEYWORD IF    ${Dose_Match_Status}==False     Failed_Result   ${UserData}
    RUN KEYWORD IF    ${Dose_Match_Status}==False     Capture ScreenShot  ${UserData}
    RUN KEYWORD IF    ${Dose_Match_Status}==False     fail     Expected Dose Not Found  #It Makes test Report Failed


Enter DrugQuantity
    [Arguments]    ${UserData}
    ${Drg_Qty_Enabled}=     run keyword and return status    element should be enabled      ${Drug_Quantity}
    run keyword if    ${Drg_Qty_Enabled}==True    input text  ${Drug_Quantity}  ${UserData.Qty}

Select Drug Frequency
    [Arguments]    ${UserData}
    ${Drg_Frq_Enabled}=     run keyword and return status    element should be enabled      ${Drug_Quantity}
    run keyword if    ${Drg_Frq_Enabled}==True      select from list by label    ${Drug_Frequency}     ${UserData.Frequency}

Click On Search Button
    CLICK ELEMENT    ${DrugPrice_Search}
    sleep    4s
    scroll element into view    //p[normalize-space()='Unable to display Alternatives at this time.']

Retrive Table Data
    [Arguments]    ${UserData}
    Capture ScreenShot  ${UserData}
    ${rows}=    get element count    ${Table_RowsCount}
    ${cols}=    get element count    ${Table_ColumnsCount}
    FOR     ${rowIndex}    IN RANGE    1   ${rows} + 1
            Nested loop     ${rowIndex}    ${cols}
    END
    log    ${Results}
    Store_Excel_Results     ${UserData}  @{Results}

Nested loop
     [Arguments]   ${rowIndex}   ${cols}
     FOR  ${colIndex}  IN RANGE     1      ${cols} - 1
             ${curText}=      Get Text     ${Table_RowsCount}\[${rowIndex}]/td[${colIndex}]
             Log     ${curText}
             Append to list     ${Results}  ${curText}
             log    ${Results}
     END

Store_Excel_Results
    [Arguments]    ${UserData}  @{Results}
    #sleep    2
    ${Date_Message}     get current date    result_format=%d/%m/%y
    ${Time_Message}     get current date    result_format=%I:%M:%S:%p
    @{ColArray}    create list    M    N   O   P   Q   R   S   T   U   V   W   X   Y
    ${TotalValuesCount}    get length     ${ColArray}
    @{AuthValuesList}    create list    ${PassResult}    ${Date_Message}     ${Time_Message}    ${Results[3]}    ${Results[1]}     ${Results[2]}     ${Results[4]}     ${Results[5]}    ${Results[9]}    ${Results[7]}     ${Results[8]}     ${Results[10]}     ${Results[11]}
    add_Application_Detail_into_Excel_TestData   ${TotalValuesCount}   ${UserData.SheetName}    ${ColArray}    ${UserData.RowNo}    ${AuthValuesList}

Failed_Result
    [Arguments]    ${UserData}
    ${Date_Message}     get current date    result_format=%d/%m/%y
    ${Time_Message}     get current date    result_format=%I:%M:%S:%p
    @{ColArray}    create list    M    N    O    Z
    ${TotalValuesCount}    get length     ${ColArray}
    @{AuthValuesList}    create list    ${FailResult}    ${Date_Message}     ${Time_Message}      ${M_IDError2}
    add_Application_Detail_into_Excel_TestData   ${TotalValuesCount}   ${UserData.SheetName}    ${ColArray}    ${UserData.RowNo}    ${AuthValuesList}


Capture ScreenShot
    [Arguments]  ${UserData}    #Parameter1: RowNumber
    set screenshot directory    ${OUTPUTDIR}\\Screenshots\\DrugPricing
    ${TC_ID}=   Evaluate    ${UserData.RowNo}-1
    ${TC_Name}  Catenate    SEPARATOR=  DP_M  ${TC_ID}       #Output: UDLS_M1
    execute javascript    window.scrollTo(0, document.body.scrollHeight)
    capture page screenshot     filename=${TC_Name}.png
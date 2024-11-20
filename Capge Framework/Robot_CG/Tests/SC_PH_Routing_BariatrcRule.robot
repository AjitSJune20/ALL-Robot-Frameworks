*** Settings ***
Library    RPA.PDF
Library    String
Library    SeleniumLibrary
Library     ExcelLibrary
Library    RPA.Excel.Files
#Library    Pdf2TextLibrary
#Library    OperatingSystem
#Library    RPA.Browser.Selenium
#Resource   test.resource
#Force Tags        pdf
Documentation  This script is used for SC_PH_Routing_BariatrcRule_TC_16

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/PageObjects/SC_PH_Routing_BariatrcRule.robot
Resource  ../Data/Config.robot


#Prerequisite
Test Setup  Begin Web Test
#Test Teardown  End Web Test

# Command to run all the test under tests/001_humanascript.robot
## robot -d results tests/SC_PH_Routing_BariatrcRule.robot
*** Variables ***
@{MONTHS}  Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec
*** Test Cases ***
#Get Auth Details From View Auth Screen
#        [Arguments]    ${UserData}
#       ${AuthId} =    get text    //span[@id='AuthId']
#       log to console   ${AuthId}
##       ${AuthIDCol}     set variable  AN
##       add_fax_Detail_into_TestData      ${AuthIDCol}     ${UserData.RowNum}    ${AuthId}
#       ${AuthMemberName}=    get text     (//a[@id='member-name-link']//u)[1]
#       log     ${AuthMemberName}
##       ${AuthIDCol}     set variable  AO
##       add_fax_Detail_into_TestData     ${AuthIDCol}     ${UserData.RowNum}    ${AuthMemberName}
#       ${AuthMemberDOBwithgender}=    get text     (//div[@id='member-information']//div//div[3])[1]
#       log    ${AuthMemberDOBwithgender}
#       ${MemberDOBAndAge}=       String.Split String      ${AuthMemberDOBwithgender}     ,
#       log    ${MemberDOBAndAge}[0]
#       ${AuthMemberDOB}=   Set Variable     ${MemberDOBAndAge}[0]
#       log     ${AuthMemberDOB}
#       ${AuthProvider}=  get text     (//div[@id='requesting-provider-panel']//div//div//div)[1]
#       log    ${AuthProvider}
#
#
#       @{ColArrary}    create list    AO   AP   AQ    AR
#       ${TotalValuesCount}    get length     ${ColArrary}
#       log    ${TotalValuesCount}
#       @{AuthValuesList}    create list    ${AuthId}     ${AuthMemberName}     ${AuthMemberDOB}     ${AuthProvider}
#       add_fax_Detail_into_TestData   ${TotalValuesCount}   ${UserData.SheetName}    ${ColArrary}    ${UserData.RowNum}    ${AuthValuesList}






#Dsmplr
 #   ${DateToday} =      get current date    result_format=%m/%d/%Y
 #   log to console    ${DateToday}
 #   ${DateTomorrow} =        Add Time To Date  ${DateToday}    -54 days   date_format=%m/%d/%Y    result_format=%m/%d/%Y
 #   log to console    ${DateTomorrow}

#TaskGenerate on FU IPAuth TC01
 #   [Template]    SCPH_Routing_BariatrcRule
#    ${TC_SCPH_TC16}

MakeAnyAuthApprove
#    ${Data1} =    Get Text From PDF    \\\\LOUISILON02S\\USERDAT01\\AOS6140\\Downloads\\CGX_100133754_20210714042508.pdf
#    log to console    ${Data1}
#    log    ${Data1}
#
##    should be true    "Your doctor has requested a review of the decision we notified you about on IDNLetterDate_txt." in "${Data1}"
#    should be true    "100133754" in "${Data1}"
#    should be true    "Authorization Number" in "${Data1}"
#    wait until element is visible    //img[@src="/cgx/Content/humana/images/Web/search_icon.png"]    40s
#    click element    //img[@src="/cgx/Content/humana/images/Web/search_icon.png"]
#    wait until element is visible    //label[@for="TempBabyMember"]    40s
#    Execute Javascript    document.getElementByXpath("//label[@for="TempBabyMember"]").checked    0

#    ${Today} =      get current date    result_format=%m_%d_%Y_%H_%M_%S
#    ${Today_1} =      get current date    result_format=datetime
#
#    log to console    ${Today}
#    log to console    ${Today_1}

#    ${Data1} =    Get Text From PDF    ${PDFFILE_PATH}\\PrintEntity.pdf
##    ${Data1} =    Get Text From PDF    \\\\LOUISILON02S\\USERDAT01\\AOS6140\\Downloads\\Mcleon_Liller_088314333_4556_20210929060026.pdf



#*** Testcase ***
#Convert month abbreviation to number
#    ${monthAbr}=  Set variable  Feb
#    ${month}=  evaluate  ${MONTHS}.index("Feb") + 1
#    Should be equal as numbers  ${month}  2
#    log    ${MONTHS}
#    log to console    ${MONTHS}[0]

#    open excel document    \\\\LOUISILON02S\\USERDAT01\\AOS6140\\Downloads\\Reports_1.xlsx    Reports
#    ${columndata} =    ExcelLibrary.read excel column    4    4    4    \\\\LOUISILON02S\\USERDAT01\\AOS6140\\Downloads//Reports_1.xlsx
#    log    ${columndata}


    ${time} =    get current date    result_format=%I:%M:%S %p
#    ${time} =    get current date    result_format=%H:%M:%S %p
    log to console   ${time}

#Verify Auth ID
#    [Arguments]    ${AuthValue}
#    Set Selenium Implicit Wait  10s
#    wait until page contains element      //div[@id='MemberCentralAuth']    30s
#    sleep   1s
#    Drag And Drop By Offset    //div[@class='k-scrollbar k-scrollbar-vertical']    0    90
#    sleep    2s
#    ${rowcount} =    get element count    //div[@id='MemberCentralAuth']//table/tbody/tr
#    ${rowcount}    EVALUATE    ${rowcount}+1
#    FOR   ${i}    IN RANGE    1    ${rowcount}
#           scroll element into view    //div[@id='MemberCentralAuth']//table/tbody/tr[${i}]/td[3]
#           ${AuthID} =    get text    //div[@id='MemberCentralAuth']//table/tbody/tr[${i}]/td[3]
#           log    ${AuthID}
#           run keyword if    '${AuthID}' == '${AuthValue}'    click element    //div[@id='MemberCentralAuth']//table/tbody/tr[${i}]/td[3]
#           exit for loop if    '${AuthID}' == '${AuthValue}'
##           exit for loop if    '${AuthID}' == '${AuthValue}'    View Auth details    ${i}
#    END


#    ${Value} =  run keyword and return status    should be true    "100133755" in "${Data1}"
#    log to console    ${Value}

#    ${detail_1}     Convert Pdf To Txt     ${FILE_PATH}//CGX_100133754_20210714042508.pdf
#    log    ${detail_1}
##    ${Data2} =    Find Text    text:Authorization Number
##    log to console    ${Data2}
#    ${ID_1}     Get Regexp Matches        ${detail_1}          Authorization Number
#    ${ID_2}     Get Regexp Matches        ${detail_1}          ICG00065

#    log to console    ${ID_1}
#    log to console    ${ID_2}
#    Run Keyword And Ignore Error          ${ID_1[0]} in ${detail_1}      LOG   ${ID_1}
#    Run Keyword If                        ${ID_2[0]} in ${detail_1}      LOG   ${ID_2}
#    log to console    hello
##    OPEN PDF    .//Data//CGX_100133754_20210714042508.pdf
##    ${info} =    get pdf info    ${FILE_PATH}//CGX_100133754_20210714042508.pdf
#    ${Data1} =    Get Text From PDF    ${FILE_PATH}//CGX_100133754_20210714042508.pdf
##    OPEN PDF    ${FILE_PATH}//CGX_100133754_20210714042508.pdf
#    ${info} =    convert    ${FILE_PATH}//CGX_100133754_20210714042508.pdf
##    log to console    ${Data1[1]}
##    ${Data2} =    Find Text    text:Authorization Number
##    ${Data1} =    convert    .//Data//CGX_100133754_20210714042508.pdf
#    ${Value} =    get regexp matches    ${info}    Authorization Number
#    log to console    ${Value}



#    OPEN PDF    ${FILE_PATH}//CGX_100133754_20210714042508.pdf
#    ${Data1} =    Get Text From PDF    ${FILE_PATH}//Livio_Anne.pdf
#    ${Data1} =    Get Text From PDF    ${FILE_PATH}//CGX_100133754_20210714042508.pdf
##    ${Data1} =    Get Text From PDF    .//Downloads//CompAssessment_20210614031751.pdf
#    log to console    ${Data1}
##    RPA Should Contain    ${Data1}[${1}].text    Authorization Number
#    ${Value} =  run keyword and return status    should be true    "100133754" in "${Data1}"
#    log to console    ${Value}


#    ${info} =    convert    ${FILE_PATH}//CGX_100133754_20210714042508.pdf
#    ${Data2} =    Find Text    pdf.get number of pages    #:Authorization Number
#    log to console    ${Data2}


##    create a txt file
#    For    ${Pages}    IN    @{Data1.Keys()}
#        append to list to File
#        ...  ./Data/Output.text
#        ...    ${Data1[${Pages}]}
#    END
#    ${data2} =    PDF.get input fields    ./Data/CGX_100133754_20210714042508.pdf
#   log to console    ${Data1}

#    auth search modified    088302731
#    sleep    10 Seconds
#    Check If Auth Approved



#Get Auth Details From View Auth Screen
#        [Arguments]    ${UserData}
#       ${AuthId} =    get text    //span[@id='AuthId']
#       log to console   ${AuthId}
##       ${AuthIDCol}     set variable  AN
##       add_fax_Detail_into_TestData      ${AuthIDCol}     ${UserData.RowNum}    ${AuthId}
#       ${AuthMemberName}=    get text     (//a[@id='member-name-link']//u)[1]
#       log     ${AuthMemberName}
##       ${AuthIDCol}     set variable  AO
##       add_fax_Detail_into_TestData     ${AuthIDCol}     ${UserData.RowNum}    ${AuthMemberName}
#       ${AuthMemberDOBwithgender}=    get text     (//div[@id='member-information']//div//div[3])[1]
#       log    ${AuthMemberDOBwithgender}
#       ${MemberDOBAndAge}=       String.Split String      ${AuthMemberDOBwithgender}     ,
#       log    ${MemberDOBAndAge}[0]
#       ${AuthMemberDOB}=   Set Variable     ${MemberDOBAndAge}[0]
#       log     ${AuthMemberDOB}
#       ${AuthProvider}=  get text     (//div[@id='requesting-provider-panel']//div//div//div)[1]
#       log    ${AuthProvider}
#
#
#
#
#       @{ColArrary}    create list    AO   AP   AQ    AR
#       ${TotalValuesCount}    get length     ${ColArrary}
#       log    ${TotalValuesCount}
#       @{AuthValuesList}    create list    ${AuthId}     ${AuthMemberName}     ${AuthMemberDOB}     ${AuthProvider}
#       add_fax_Detail_into_TestData   ${TotalValuesCount}   ${UserData.SheetName}    ${ColArrary}    ${UserData.RowNum}    ${AuthValuesList}




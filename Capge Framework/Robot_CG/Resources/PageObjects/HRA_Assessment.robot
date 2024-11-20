*** Settings ***
Library  SeleniumLibrary
Library    String
Library    Collections
Library    DateTime
Resource  ../../Data/TestData.robot
Resource  ../../Resources/Definitions/DataManager.robot
Resource  ../../Resources/Definitions/HumanaGui.robot


*** Variables ***
${AssessmentSidelink} =    //div[@id="left-nav"]//a[contains(text(),'Assessments')]
${TakeAssessBtn} =    //a[@id="btnTakeAssessmentCase" and @class="button"]
${AssessmentDpt} =    //select[@id="Department"]
#${LateEntry} =    //input[@id='IsLateEntry']

*** Keywords ***
User Enter into Assessments
    [Arguments]  ${UserData}
    set selenium implicit wait    10S
    click element    //span[starts-with(text(),'${UserData.CaseID}')]
    page should contain    Case - Details
    click element    ${AssessmentSidelink}
    page should contain    Case - Assessments
    click element    ${TakeAssessBtn}
    page should contain    Select Assessment Template
    select from list by label  ${AssessmentDpt}   ${UserData.Department}
    sleep    2s
    ${Feedback} =    run keyword and return status    page should contain element    //span[@class="axfeedback-close-feedback" ]
    run keyword if  ${Feedback}   click element    //span[@class="axfeedback-close-feedback" ]
    wait until page contains element    //u[starts-with(text(),'${UserData.AssessmentType}')]
    scroll element into view    //u[starts-with(text(),'${UserData.AssessmentType}')]
    click element    //u[starts-with(text(),'${UserData.AssessmentType}')]
    sleep    2s
    ${AlreadyExistingAsses} =    Run Keyword And Return Status   page should contain link    Yes
    run keyword if  ${AlreadyExistingAsses}  click link    Yes
    page should contain    Assessment
    ${AssessResume} =    Run Keyword And Return Status   page should contain link    Resume
    run keyword if  ${AssessResume}  click link    Resume
    ${AssessAllNew} =    Run Keyword And Return Status   page should contain link    Take as New
    run keyword if  ${AssessAllNew}  click link    Take as New


*** Variables ***
${SNPQ1} =    //select[@id="11207_Que_110500"]
${SNPQ3} =    //select[@id="11207_Que_110502"]
${SNPQ5} =    //select[@id="11207_Que_110503"]
${SNPQ6} =    //select[@id="11207_Que_20010"]
${SNPQ7} =    //select[@id="11207_Que_20019"]
${SNPQ8} =    //select[@id="11207_Que_20020"]
${SNPQ9} =    //select[@id="11207_Que_20022"]
${SNPQ10} =   //select[@id="11207_Que_110504"]
${SNPQ11} =   //select[@id="11207_Que_110505"]
${SNPQ12} =   //select[@id="11207_Que_110506"]
${SNPQ13} =   //select[@id="11207_Que_110507"]
${SNPQ14} =   //select[@id="11207_Que_110508"]
${SNPQ16} =   //select[@id="11207_Que_110510"]
${SNPQ17} =   //select[@id="11207_Que_110511"]
${SNPQ18} =  //textarea[@id="11207_Que_110512"]
${SNPQ19a} =  //textarea[@id="11207_Que_110513"]
${LateEntry} =   //input[@id='IsLateEntry']//following::label[1]
${LeDate} =    //input[@id="Date"]
${LeReason} =    //select[@id="ReasonId"]
*** Keywords ***

User Takes SNP Assessments
     [Arguments]  ${UserData}
     set selenium implicit wait    10s
     page should contain    SNP HRA
     sleep    2s
     click element     ${LateEntry}
     ${CurrentDate} =  Get Current Date    result_format=%m%d%Y
     wait until page contains element   ${LeDate}
     input text    ${LeDate}    ${CurrentDate}
     select from list by label    ${LeReason}   HRA Completed by member - online
     select from list by label    ${SNPQ1}    English
     @{HealthCondition} =  string_convert   ${UserData.Q2}
     FOR    ${item}    IN    @{HealthCondition}
        log to console    ${item}
        click element    //label[contains(text(),'${item}')]//preceding::label[1]
     END
     select from list by label   ${SNPQ3}    ${UserData.Q3}
    @{HelpLevel} =  string_convert   ${UserData.Q4}
     FOR    ${item}    IN    @{HelpLevel}
         click element    //label[contains(text(),'${item}')]//preceding::label[1]
     END
     select from list by label   ${SNPQ5}  ${UserData.Q5}
     select from list by label   ${SNPQ6}  ${UserData.Q6}
     select from list by label   ${SNPQ7}  ${UserData.Q7}
     select from list by label   ${SNPQ8}  ${UserData.Q8}
     select from list by label   ${SNPQ9}  ${UserData.Q9}
     select from list by label   ${SNPQ10}  ${UserData.Q10}
     select from list by label   ${SNPQ11}  ${UserData.Q11}
     select from list by label   ${SNPQ12}  ${UserData.Q12}
     select from list by label   ${SNPQ13}  ${UserData.Q13}
     select from list by label   ${SNPQ14}  ${UserData.Q14}
     ${SubmitDisable} =    run keyword and return status    page should contain element    //a[contains(text(),'Submit') and @class="button button-grey-out"]
     run keyword if    ${SubmitDisable}   log to console    "Submit button Not Enabled Yet Please fill all the Madatory fields"
     click link    Save
     wait until page does not contain  //*[@id="loading-ajax"]
     scroll element into view    ${SNPQ8}
     sleep    5s
     wait until page contains element    //a[@id="button-cancel-assessment"]
     click element    //a[@id="button-cancel-assessment"]
     sleep    2s
     page should contain    Confirmation
     click element    //a[@id="button-cancel-changes-yes"]
     wait until page contains    Case - Assessments
     click element    //td[contains(text(),'SNP HRA')]
     ${Type} =    get text    //*[@id="assessmentBannerBorder"]/div[3]/div/div/div[2]
     should be equal as strings   ${Type}     Online
     ${AssessResume} =    Run Keyword And Return Status   page should contain link    Resume
     run keyword if  ${AssessResume}  click link    Resume
     sleep  2s
     click element     ${LateEntry}
     sleep    1s
     scroll element into view     ${SNPQ16}
     @{PlaceToLive} =  string_convert   ${UserData.Q15}
      FOR    ${item}    IN    @{PlaceToLive}
         click element    //label[contains(text(),'${item}')]//preceding::label[1]
      END
     select from list by label   ${SNPQ16}  ${UserData.Q16}
     select from list by label   ${SNPQ17}  ${UserData.Q17}
     input text    ${SNPQ18}  ${UserData.Q18}
     click element    //label[contains(text(),'${UserData.Q19}')]//preceding::label[1]
     run keyword if    '${UserData.Q19}' == 'Yes'    input text    ${SNPQ19a}    ${UserData.Q19a}
     click link    Submit
     sleep    1s
     wait until page contains    View Assessment
     ${Type} =    get text    //*[@id="assessmentBannerBorder"]/div[3]/div/div/div[2]
     should be equal as strings   ${Type}     Telephonic



*** Variables ***
${CPSNPQ1} =   //select[@id="11205_Que_110500"]
${CPSNPQ3} =  //select[@id="11205_Que_110502"]
${CPSNPQ5} =  //select[@id="11205_Que_110503"]
${CPSNPQ6} =  //select[@id="11205_Que_20010"]
${CPSNPQ7} =  //select[@id="11205_Que_20019"]
${CPSNPQ8} =  //select[@id="11205_Que_20020"]
${CPSNPQ9} =  //select[@id="11205_Que_20022"]
${CPSNPQ10} =  //select[@id="11205_Que_110504"]
${CPSNPQ11} =  //select[@id="11205_Que_110505"]
${CPSNPQ12} =  //select[@id="11205_Que_110506"]
${CPSNPQ13} =  //select[@id="11205_Que_110507"]
${CPSNPQ14} =  //select[@id="11205_Que_110508"]
${CPSNPQ16} =  //select[@id="11205_Que_110510"]
${CPSNPQ17} =  //select[@id="11205_Que_110511"]
${CPSNPQ18} =  //textarea[@id="11205_Que_110512"]
${CPSNPQ19} =  //label[contains(text(),'Yes')]//preceding::label[1]
${CPSNPQ19a} =  //textarea[@id="11205_Que_110513"]
${CPSNPQ20} =  //textarea[@id="11205_Que_110515"]
${CPSNPQ21} =  //input[@id="11205_Que_009084_Feet"]
${CPSNPQ21a} =  //input[@id="11205_Que_009084_Inch"]
${CPSNPQ22} =  //select[@id="11205_Que_110520"]
${CPSNPQ23} =  //select[@id="11205_Que_110521"]
${CPSNPQ24} =  //select[@id="11205_Que_110522"]
${CPSNPQ25} =  //select[@id="11205_Que_110523"]
${CPSNPQ26} =  //select[@id="11205_Que_110524"]
${CPSNPQ27} =  //select[@id="11205_Que_110525"]
${CPSNPQ28} =  //select[@id="11205_Que_110526"]
${CPSNPStatus} =    //div[@class="row show-for-large-up scoreHeader"]//label[@id="percent" and (contains(text(),'100%'))]
*** Keywords ***
User Takes CPSNP Assessments
    [Arguments]  ${UserData}
    set selenium implicit wait    10s
    page should contain    SNP Care Plus HRA
    select from list by label    ${CPSNPQ1}    English
    @{CPHealthCondition} =  string_convert   ${UserData.Q2}
     FOR    ${item}    IN    @{CPHealthCondition}
        log to console    ${item}
        click element    //label[contains(text(),'${item}')]//preceding::label[1]
     END
    select from list by label   ${CPSNPQ3}  ${UserData.Q3}
    @{CPHelpLevel} =  string_convert   ${UserData.Q4}
     FOR    ${item}    IN    @{CPHelpLevel}
         click element    //label[contains(text(),'${item}')]//preceding::label[1]
     END
     select from list by label   ${CPSNPQ5}  ${UserData.Q5}
     select from list by label   ${CPSNPQ6}  ${UserData.Q6}
     select from list by label   ${CPSNPQ7}  ${UserData.Q7}
     select from list by label   ${CPSNPQ8}  ${UserData.Q8}
     select from list by label   ${CPSNPQ9}  ${UserData.Q9}
     select from list by label   ${CPSNPQ10}  ${UserData.Q10}
     select from list by label   ${CPSNPQ11}  ${UserData.Q11}
     select from list by label   ${CPSNPQ12}  ${UserData.Q12}
     select from list by label   ${CPSNPQ13}  ${UserData.Q13}
     select from list by label   ${CPSNPQ14}  ${UserData.Q14}
      @{CPPlaceToLive} =  string_convert   ${UserData.Q15}
     FOR    ${item}    IN    @{CPPlaceToLive}
         click element    //label[contains(text(),'${item}')]//preceding::label[1]
     END
     select from list by label   ${CPSNPQ16}  ${UserData.Q16}
     select from list by label   ${CPSNPQ17}  ${UserData.Q17}
     ${SubmitDisable} =    run keyword and return status    page should contain element    //a[contains(text(),'Submit') and @class="button button-grey-out"]
     run keyword if    ${SubmitDisable}   log to console    "Submit button Not Enabled Yet Please fill all the Madatory fields"

Validate the Save Button
     click link    Save
     wait until page does not contain  //*[@id="loading-ajax"]
     scroll element into view    ${CPSNPQ8}
     sleep    5s
     wait until page contains element    //a[@id="button-cancel-assessment"]
     click element    //a[@id="button-cancel-assessment"]
     sleep    2s
     page should contain    Confirmation
     click element    //a[@id="button-cancel-changes-yes"]
     wait until page contains    Case - Assessments



Validate the CP Late Entry
    [Arguments]  ${UserData}
     set selenium implicit wait    10s
     page should contain    SNP Care Plus HRA
     click element    //td[contains(text(),'SNP Care Plus HRA')]
     ${AssessResume} =    Run Keyword And Return Status   page should contain link    Resume
     run keyword if  ${AssessResume}  click link    Resume
     sleep    2s
     click element     ${LateEntry}
     ${CurrentDate} =  Get Current Date    result_format=%m%d%Y
     wait until page contains element   ${LeDate}
     input text    ${LeDate}    ${CurrentDate}
     select from list by label    ${LeReason}   HRA Completed by member - online
     click link    Save
     wait until page does not contain  //*[@id="loading-ajax"]
     scroll element into view    ${CPSNPQ8}
     sleep    2s
     wait until page contains element    //a[@id="button-cancel-assessment"]
     click element    //a[@id="button-cancel-assessment"]
     sleep    2s
     page should contain    Confirmation
     click element    //a[@id="button-cancel-changes-yes"]
     wait until page contains    Case - Assessments
     click element    //td[contains(text(),'SNP Care Plus HRA')]
     ${Type} =    get text    //*[@id="assessmentBannerBorder"]/div[3]/div/div/div[2]
     should be equal as strings   ${Type}     Online
     ${AssessResume} =    Run Keyword And Return Status   page should contain link    Resume
     run keyword if  ${AssessResume}  click link    Resume
     sleep    2s
     click element     ${LateEntry}

User Enter CPSecondHalf Inputs Assessment
    [Arguments]     ${UserData}
      set selenium implicit wait    10s
#      click element    //td[contains(text(),'SNP Care Plus HRA')]
#      ${AssessResume} =    Run Keyword And Return Status   page should contain link    Resume
#     run keyword if  ${AssessResume}  click link    Resume

      scroll element into view   ${CPSNPQ18}
     input text    ${CPSNPQ18}  ${UserData.Q18}
     scroll element into view    ${CPSNPQ20}
     click element    //label[contains(text(),'${UserData.Q19}')]//preceding::label[1]
     run keyword if    '${UserData.Q19}' == 'Yes'    input text    ${CPSNPQ19a}    ${UserData.Q19a}
     input text    ${CPSNPQ20}  ${UserData.Q20}
     input text    ${CPSNPQ21}  ${UserData.Q21}
     input text    ${CPSNPQ21a}  ${UserData.Q21a}
     select from list by label   ${CPSNPQ22}  ${UserData.Q22}
     select from list by label   ${CPSNPQ23}  ${UserData.Q23}
     select from list by label   ${CPSNPQ24}  ${UserData.Q24}
     select from list by label   ${CPSNPQ25}  ${UserData.Q25}
     select from list by label   ${CPSNPQ26}  ${UserData.Q26}
     select from list by label   ${CPSNPQ27}  ${UserData.Q27}
     select from list by label   ${CPSNPQ28}  ${UserData.Q28}
     ${SubmitEnable} =    run keyword and return status    page should contain link    //a[contains(text(),'Submit') and @class="button button-green"]
     run keyword if    ${SubmitEnable}   log to console    "Completed all the Required Fields"
     click link    Submit
     ${Stat} =    Run Keyword And Return Status   page should contain link    Save
    run keyword if  ${Stat}   click link    Cancel
     wait until page contains    View Assessment
     page should not contain link    Resume
     ${Type} =    get text    //*[@id="assessmentBannerBorder"]/div[3]/div/div/div[2]
     should be equal as strings   ${Type}     Telephonic


*** Variables ***
${HRAMemeber} =    //a[@id="member-name-link"]
${HRAAltInfo} =    //a[@id="Alternate-Info-tab"]
${ContactinfoSec} =    //u[contains(text(),"Contact Information")]
${HRAEmailAdress} =    //label[contains(text(),"Email Address")]//following::div[1]

*** Keywords ***
Validate the CPSNP EmailID
     [Arguments]     ${UserData}
     set selenium implicit wait    10s
     click element    ${HRAMemeber}
     sleep    2s
     wait until page does not contain  //*[@id="loading-ajax"]
     click element    ${HRAAltInfo}
     wait until page does not contain  //*[@id="loading-ajax"]
     wait until page contains element    //a[@id="alternate-info-history"]
     scroll element into view    ${ContactinfoSec}
     ${ValidEmail} =    get text    ${HRAEmailAdress}
     should be equal as strings   ${ValidEmail}     ${UserData.Q19a}
     log to Console     "Valid Email id Matched ${UserData.Q19a}"

Validate the SNP EmailID
     [Arguments]    ${UserData}
     click element    ${HRAMemeber}
     sleep    2s
     wait until page does not contain  //*[@id="loading-ajax"]
     click element    ${HRAAltInfo}
     wait until page does not contain  //*[@id="loading-ajax"]
     wait until page contains element    //a[@id="alternate-info-history"]
     scroll element into view    ${ContactinfoSec}
     ${ValidEmail} =    get text    ${HRAEmailAdress}
     should be equal as strings   ${ValidEmail}     ${UserData.Q19a}
     log to Console     "Valid Email id Matched ${UserData.Q19a}"



Void The Assessment
    [Arguments]     ${UserData}
    set selenium implicit wait    10S
    click element    //span[starts-with(text(),'${UserData.CaseID}')]
    page should contain    Case - Details
    click element    ${AssessmentSidelink}
    page should contain    Case - Assessments
    click element    ${TakeAssessBtn}
    page should contain    Select Assessment Template
    select from list by label  ${AssessmentDpt}   ${UserData.Department}
    sleep    2s
    ${Feedback} =    run keyword and return status    page should contain element    //span[@class="axfeedback-close-feedback" ]
    run keyword if  ${Feedback}   click element    //span[@class="axfeedback-close-feedback" ]
    wait until page contains element    //u[starts-with(text(),'${UserData.AssessmentType}')]
    scroll element into view    //u[starts-with(text(),'${UserData.AssessmentType}')]
    click element    //u[starts-with(text(),'${UserData.AssessmentType}')]
    sleep    2s
    ${AlreadyExistingAsses} =    Run Keyword And Return Status   page should contain link    Yes
    run keyword if  ${AlreadyExistingAsses}  click link    Yes
    page should contain link    Void
    click link    Void
    wait until page contains    Void Assessment
    sleep    1s
    select from list by label    //select[@id="VoidReason"]      Assessment completed on wrong individual
    sleep    1s
    click link    //a[@id="voidButton"]
    page should contain element    //div[@id="divVoidSuccess"]
  #######Validating the email id removed after the Void #######################
     click element    ${HRAMemeber}
     sleep    2s
     wait until page does not contain  //*[@id="loading-ajax"]
     click element    ${HRAAltInfo}
     wait until page does not contain  //*[@id="loading-ajax"]
     wait until page contains element    //a[@id="alternate-info-history"]
     scroll element into view    ${ContactinfoSec}
     ${ValidEmail} =    get text    ${HRAEmailAdress}
     should not be equal as strings  ${ValidEmail}     ${UserData.Q19a}
     log to Console     "Valid Email id removed"






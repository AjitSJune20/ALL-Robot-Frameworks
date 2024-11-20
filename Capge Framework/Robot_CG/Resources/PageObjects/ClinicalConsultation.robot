*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Data/TestData.robot
Resource  ../PageObjects/Navigation.robot


*** Variables ***
#################View Clinical Consult  #####################
#${Email} =   //div[@id='DisplayContactEmail']
${Contact_Email_CC} =    //div[@id='ContactEmail']
#${CaseHeader} =    //h3[contains(text(),'LTSS Cases')]
${Contact_Phone_CC} =    //div[@id='DisplayContactNumber']
${Contact_Email_G&A} =    //div[@id='ContactEmail']
${Contact_Phone_G&A} =    //div[@id='ContactNumber']

${Contact_Email_CC_Edit} =    //input[@id='ContactEmail']
${Contact_Phone_CC_Edit} =    //input[@id='ConsultationContactNumber']
${Edit_Btn_CC} =    //a[@id='ClinicalConsult-edit-btn']


*** Keywords ***

View_Clinical_Consult_Protegrity
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element   //table[@role='grid']//tr[@class='k-alt']
    ${EmailViewClinicalConsult_Actual}      get text    ${Contact_Email_CC}
    ${PhoneViewClinicalConsult_Actual}      get text    ${Contact_Phone_CC}
    should be equal as strings  ${EmailViewClinicalConsult_Actual}  ${UserData.EmailViewClinicalConsult}
    should be equal as strings  ${PhoneViewClinicalConsult_Actual}  ${UserData.PhoneViewClinicalConsult}

View_G&A_Consult_Protegrity
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element   //table/tbody/tr/td[contains(text(),'G&A Consultation')]
    ${EmailViewG&AConsult_Actual}      get text    ${Contact_Email_G&A}
    ${PhoneViewG&AConsult_Actual}      get text    ${Contact_Phone_G&A}
    should be equal as strings  ${EmailViewG&AConsult_Actual}  ${UserData.EmailViewG&AConsult}
    should be equal as strings  ${PhoneViewG&AConsult_Actual}  ${UserData.PhoneViewG&AConsult}


Protegrity Edit Clinical Consultation
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element   //table/tbody/tr/td[contains(text(),'Clinical Consultation')]
    click element    ${Edit_Btn_CC}
#    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
#    click element    //input[@id='DueDateTime']
    sleep    30s
    press keys    None    PgDn
    press keys    None    PgDn

    scroll element into view    //div[@class='row static-scrollable-area']//input[@id='ConsultationContactNumber']
    ${EmailEditCC_Actual}      get value    ${Contact_Email_CC_Edit}
    ${PhoneEditCC_Actual}      get value    ${Contact_Phone_CC_Edit}
    should be equal as strings  ${EmailEditCC_Actual}  ${UserData.Email}
    should be equal as strings  ${PhoneEditCC_Actual}  ${UserData.ContactPhone}

###### Amol Pawar Change for BSM StaticField in Create Mode and BSM StaticField should not display without Member(CGX backlog)
*** Variables ***
${Create_DropDown} =    //img[@id="dropdown-button"]
${Create_Btn_CC} =    //div[@id='CC']/a[text()='Clinical Consultation']
${BSM_field} =    //*[@id="BaseSellingMarket"]
${RouteReason} =    id:RouteReasonSelect
${DiagnosisCodeSearch} =    //input[@id="DiagnosisCodeSearch"]
${btn_AddDiagnosisCode} =    //a[@id="medical-add-secondary-button"]
${DiagnosisCode_Grid} =    //div[@id="AuthDirectSecondaryDiagnosisCodeGrid-gridContent"]
${CriteriaConsidered} =    id:CriteriaConsideredCode
${Criteria_Text} =    //textarea[@id="CriteriaConsideredText"]
${CopyOfPlanLanguage} =    //textarea[@id="CopyOfPlanLanguage"]
${OtherInfo} =    //textarea[@id="OtherInfo"]
${Contact_CC} =    //input[@id="ConsultationContactNumber"]
${Save_btn_CC} =    //a[@id="Consultation-save-btn"]
${MemberBannerExpand} =    //a[@id="expand-member-information"]
${Desc_Xpath} =    //div[@id="MemberCentralClinicalRoutes"]//table//tr[1]//div[text()='Created / Updated Date']//following-sibling::span[@class="k-icon k-i-arrow-s"]
${ColumnXpath} =    //div[@id="MemberCentralClinicalRoutes"]//table//tr[1]//div[text()='Created / Updated Date']
*** Keywords ***
Create Clinical Consultation
    [Arguments]  ${UserData}
    set selenium implicit wait    10s
    click element    ${Create_DropDown}
    wait until element is visible    ${Create_Btn_CC}    10s
    click element    ${Create_Btn_CC}
    wait until page contains    Create Clinical Consultation    20s
    Validate BSM Static Field in Clinical Consultation
    select from list by label    ${RouteReason}    ${UserData.RouteReason}
    input text    ${DiagnosisCodeSearch}    ${UserData.DiagnosisCodeSearch}
    sleep    1s
    click element    ${btn_AddDiagnosisCode}
    wait until element is visible    ${DiagnosisCode_Grid}    30s
    select from list by label    ${CriteriaConsidered}    ${UserData.CriteriaConsidered}
    input text    ${Criteria_Text}    ${UserData.Criteria_Text}
    input text    ${CopyOfPlanLanguage}    ${UserData.CopyOfPlanLanguage}
    input text    ${OtherInfo}    ${UserData.OtherInfo}
    input text    ${Contact_CC}    ${UserData.Contact}
    sleep    2s
    click element    ${Save_btn_CC}
    wait until page contains element    //table/tbody/tr/td[contains(text(),'Clinical Consultation')]    20s
##    click element   //table/tbody/tr/td[contains(text(),'Clinical Consultation')]

Validate BSM Static Field in Clinical Consultation
    click element    ${MemberBannerExpand}
    set focus to element    //span[@id="Base Selling Market"]
    sleep    1s
    ${BSM_field_Value}    get text    //span[@id="Base Selling Market"]
    ${BSM_field_Value}    strip string    ${BSM_field_Value}    mode=both
    LOG TO CONSOLE    ${BSM_field_Value}
##    page should contain element    //*[@id="BaseSellingMarket" and text()='${BSM_field_Value}']
    element text should be    ${BSM_field}    ${BSM_field_Value}


View Clinical Consultation
    [Arguments]  ${UserData}
    set selenium implicit wait    10s
    Make Grid Order Descending    ${Desc_Xpath}    ${ColumnXpath}
    click element    //table/tbody/tr[1]/td[contains(text(),'Clinical Consultation')]
    wait until element is visible    ${Edit_Btn_CC}    20s
    Validate BSM Static Field in Clinical Consultation

Edit Mode Clinical Consultation
    [Arguments]  ${UserData}
    sleep    1s
    click element    ${Edit_Btn_CC}
    wait until page contains    Edit Clinical Consultation    30s
    Validate BSM Static Field in Clinical Consultation
    sleep    1s
    click link    //a[@id="ClinicalConsultation-Cancel-btn"]
    wait until element is visible    //a[@id="button-cancel-consultation-changes-yes"]    30s
    click link    Yes
    log to console    1st test case passed

###    Amol Pawar, Generic Keyword for making any Grid in descending order
Make Grid Order Descending
    [Arguments]    ${Desc_Xpath}    ${ColumnXpath}
    sleep    1s
    set focus to element    ${ColumnXpath}
    ${status} =  run keyword and return status    page should not contain element    ${Desc_Xpath}    10 Seconds
    run keyword if    ${status}    double click element    ${ColumnXpath}
    sleep    01 Seconds
    ${status} =  run keyword and return status   page should not contain element    ${Desc_Xpath}    10 Seconds
    run keyword if    ${status}    double click element    ${ColumnXpath}
    sleep    01 Seconds
    run keyword if    ${status}  click element  //a[contains(@id,"SaveSettings")]

*** Variables ***
${RemoveMemberInFocus} =    //div[@id='navigation-bar']//a[@id="RemoveMemberInFocus"]/img   #//a[@id="RemoveMemberInFocus"]
${Member_removeLink} =    //a[@id="removeLink" and text()='Remove']
${Confirm_Yes} =    //a[@id="button-ClearMember-Yes"]
${ClinicalConsultation} =    //div[@id="tab-bar-options"]//following::a[text()='Clinical Consultations ']
${Column_DueDate} =    //div[@id="MyWorkClinicalRoutes"]/div[2]//span[text()='Due Date']
${DueDate_Desc} =    //div[@id="MyWorkClinicalRoutes"]/div[2]//span[2][@class="slick-sort-indicator slick-sort-indicator-desc"]
${MyWorkClinicalConsult_Grid} =    //div[@id="MyWorkClinicalRoutes"]/div[@class="slick-viewport"]/div/div[1]

*** Keywords ***
BSM StaticField should be empty when member Not in focus
    set selenium implicit wait    10s
    set focus to element    ${RemoveMemberInFocus}
    sleep    1s
    click element    ${RemoveMemberInFocus}
    wait until element is visible    ${Member_removeLink}   30s
    click element    ${Member_removeLink}
    wait until element is visible    ${Confirm_Yes}    20s
    click link    ${Confirm_Yes}
    sleep    2s
    Navigate to MyWork Routes
    set focus to element    ${ClinicalConsultation}
    sleep    1s
    click link    ${ClinicalConsultation}
    Make Grid Order Descending    ${DueDate_Desc}    ${Column_DueDate}
    set focus to element    ${MyWorkClinicalConsult_Grid}
    sleep    1s
    click element    ${MyWorkClinicalConsult_Grid}
    sleep    1s
#    wait until element is visible    ${BSM_field}    30s
    set focus to element    ${BSM_field}
    sleep    1s
    element text should be    ${BSM_field}    ${EMPTY}
#######################################################
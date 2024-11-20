*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library    String
#Library  ../../CustomLibs/DataCreation.py

Resource    ../Definitions/HumanaGui.robot
Resource    ../Definitions/Common.robot
#Resource  ../Data/TestData.robot



*** Variables ***

${IMPDropdownLink} =    //div[@id='dropdown-container']//span[contains(text(),'IMP 2.0')]
${IMP_link} =  //div[@id='dropdown-container']//div[@id='impLinks']//a[@id='imp-link']
${MemberCentral}=    //li[@class='has-dropdown hidden-for-medium-down menu-member-central active']/a
${MemberAthurizations}=    //a[@href='/cgx/MemberCentral/MemberAuth/Index?IsfromAuthMenu=true']
${SelectAuth}=    //table[@class='k-selectable']/tbody/tr[1]/td[3]
${AuthContactEditButton}=    (//a[contains(@id,'contact-info')])[3]
${Authletterlink}=    //a[@href='/cgx/Authorization/AuthorizationLetter']
${Addletter}=    //a[@id='add-letter']
${AuthLetterSelecttemplate}=    //a[@id='select-template']

*** Keywords ***
Protegrity IMP Banner
       [Arguments]    ${UserData}
       set selenium implicit wait  10 Seconds
       click element   //img[@class='more-benefits']
       element should be visible  ${IMPDropdownLink}
       click element   ${IMP_link}
       sleep    5sec
       @{WindowHandles}=  Get Window Handles
	   sleep    4s
	   @{WindowIdentifier}=    get window identifiers
       sleep    4s
	   switch window   ${WindowHandles}[1]
	   ${PhoneNumber}=    get text    //span[@class='phone-number']
	   log    ${PhoneNumber}
       Verify as per User Access  ${UserData}    ${PhoneNumber}  Phone      #${UserData.ContactPhone}
	   ${DOB}=    get text    //div[@class='small-2 columns'][3]
	   log    ${DOB}
	   ${string}=    Set Variable    ${DOB}
       ${str}=       String.Split String    ${string}    /
       Log    ${str}
       Log    ${str}[0]
       Log    ${str}[1]
       log    ${str}[2]
       #Verify as per User Access  ${UserData}    ${str}[1]  DOB       # ${UserData.DOB}
       ProtegrityPage.Validate No Masking    ${str}[1]
       #log    ${str}[3]
       #log    ${str}[4]
	   ${StreetAddress}=     get text    //div[@class='small-2 columns'][4]
	   log    ${StreetAddress}
	   @{StreetAdressIMp} =    split string    ${StreetAddress}    ${Space}
	   ${StreetAdressfirstline} =     remove string    ${StreetAdressIMp}[0]    ,
	   Verify as per User Access  ${UserData}    ${StreetAdressfirstline}  Street Adress
	   #Verify as per User Access  ${UserData}    ${StreetAdressIMp}[3]  Street Adress
	   capture page screenshot


Navigate Authorization Edit Page
    [Arguments]    ${UserData}
       set selenium implicit wait  10 Seconds
#       click element   ${MemberCentral}
#       sleep     4sec
#       click element    ${MemberAthurizations}
#       click element    ${SelectAuth}
       click element    ${AuthContactEditButton}
       wait until page does not contain  //*[@id="loading-ajax"]    50s
       wait until element is visible    (//*[contains(@id,'ContactNumber')])[3]     50s
       ${Phone}=      get value       (//*[contains(@id,'ContactNumber')])[3]
       log     ${Phone}
       Verify as per User Access    ${UserData}    ${Phone}    Phone
       ${EmailAddress}=     get value       (//*[contains(@id,'ContactEmail')])[3]
       log    ${EmailAddress}
       Verify as per User Access    ${UserData}     ${EmailAddress}    Email
       click element    //img[contains(@src,'grid_more_icon_web.png')]
       ${Address}      get text    ${StreeAddress}
       ${Add}      split string   ${Address}     ,
       ${StreetAddress_Auth_Actual}    strip string     ${Add}[0]
       ${ZipCodeAuth_Actual}    strip string     ${Add}[4]
       Verify as per User Access    ${UserData}  ${ZipCodeAuth_Actual}  ZIP Code
       Verify as per User Access    ${UserData}  ${Address}  Street Adress
       capture page screenshot

Navigate create letter page
        [Arguments]    ${UserData}
       set selenium implicit wait  10 Seconds
       click element   ${MemberCentral}
       sleep     4sec
       click element    ${MemberAthurizations}
       click element    ${SelectAuth}
       click element    ${Authletterlink}
       click element    ${Addletter}
       click element    ${AuthLetterSelecttemplate}
       scroll element into view    //h5[contains(text(),'Template')]
       click element    //a[contains(text(),'Medicare - Reversal of NDMC (IDN)')]
       ${ele}    Get WebElement    //a[contains(text(),'Select')]
       Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
       ${streetAddress}=     get text     //*[@id='memberPrimaryDiv']
       ${streetAddress1}=     get text     (//*[@id='memberPrimaryDiv']/div/div/label)[1]
       ${ZipCodewithstate}=     get text     (//*[@id='memberPrimaryDiv']/div/div/label)[2]
       ${str}=       String.Split String    ${streetAddress}    ,
       Log    ${str}
       Log    ${str}[0]
       log    ${str}[1]
       ${str1}=     string.split string    ${str}[1]       ${SPACE}
       ${str2} =    split string    ${str}[0]    \n
       log    ${str1}[0]
       log    ${str1}[1]
       log    ${str1}[2]
       Verify as per User Access  ${UserData}  ${str2}[0]  Street Adress
       Verify as per User Access  ${UserData}  ${str1}[2]  ZIP Code
       Capture Page Screenshot





*** Variables ***
${FirstName} =    //div[@id='MyWorkReferrals']//div[@class='slick-cell l6 r6']//span[1]
${LastName} =    //div[@id='MyWorkReferrals']//div[@class='slick-cell l7 r7']//span[1]
${MemberID} =    //div[@id='MyWorkReferrals']//div[@class='slick-cell l9 r9']//span[1]
${MemberIDInViewReferral} =    //div[@id='MemberId']
${MemberNameInViewReferral} =    //div[@id='MemberName']



*** Keywords ***
MYWork Referral Grid Validation
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    wait until page contains element    ${FirstName}    60s
    ${FirstNameText} =    get text    ${FirstName}
    ${LastNameText} =    get text    ${LastName}
    ${MemberIDText} =    get text    ${MemberId}
    log    ${MemberIDText}
    ${MemberIDText} =    strip string    ${MemberIDText}    mode=both
    log    ${MemberIDText}
    ${MemberIDText} =    remove string    ${MemberIDText}    [
    ${MemberIDText} =    remove string    ${MemberIDText}    ]
    ${MemberIDText} =    remove string    ${MemberIDText}    '
    log    ${MemberIDText}
    Verify as per User Access  ${UserData}    ${FirstNameText}  First Name
    Verify as per User Access  ${UserData}    ${LastNameText}  last Name
    Verify as per User Access  ${UserData}    ${MemberIDText}  Member ID
#    validate no masking    ${FirstNameText}
#    validate no masking    ${LastNameText}
#    validate no masking    ${MemberIDText}
    capture page screenshot


MyWork View Referral Screen Validation
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
#    click element    //span[contains(text(),'${UserData.MemberID}')]
    click element    //span[contains(text(),'H7091481800')]
    wait until page contains    View Referral    30s
    ${MemberIDTextInViewReferral} =    get text    ${MemberIDInViewReferral}
    ${MemberNameTextInViewReferral} =    get text    ${MemberNameInViewReferral}
    log    ${MemberNameTextInViewReferral}
    log    ${MemberIDTextInViewReferral}
    @{MemberFullName} =    split string   ${MemberNameTextInViewReferral}
    #log  @{MemberFullName}
    Verify as per User Access  ${UserData}    ${MemberIDTextInViewReferral}  Member ID
    Verify as per User Access  ${UserData}    @{MemberFullName}[0]  First Name     #${UserData.FirstName}
#    validate no masking    ${MemberIDTextInViewReferral}
#    validate no masking    ${MemberFullName}[0]
    ${lengthvalue} =    get length    ${MemberFullName}
    log     ${lengthvalue}
    ${LastNameInViewReferral} =    set variable   @{MemberFullName}[1]
    FOR    ${i}    IN RANGE    2   ${lengthvalue}
         ${LastNameInViewReferral} =    set variable    ${LastNameInViewReferral} @{MemberFullName}[${i}]
    END
    log   ${LastNameInViewReferral}
    Verify as per User Access  ${UserData}    ${LastNameInViewReferral}  last Name    #${UserData.LastName}
#    validate no masking    ${LastNameInViewReferral}
    capture page screenshot

####################### Member Info Screen ################################
*** Variables ***
${MemberInfoMemberID} =    //div[contains(@id,'MemberId')]
${MemberInfoSubscriber} =    //div[contains(@id,'Subscriber')]
${MemberInfoEmail} =    //div[contains(@id,'Email')]
${MemberInfoMedicaidId} =    //div[contains(@id,'MedicaidId')]
${MemberInfoSocialSecurity} =    //div[contains(@id,'Ssn')]


*** Keywords ***
Fields Validation in Member Info Screen
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    wait until page contains    Member Information    30s
    ${MemberInfoMemberIDText} =    get text    ${MemberInfoMemberID}
    log    ${MemberInfoMemberIDText}
    Verify as per User Access  ${UserData}    ${MemberInfoMemberIDText}  Member ID    #${UserData.SubscriberId1}
#    validate no masking    ${MemberInfoMemberIDText}
    ${MemberInfoSubScriberText} =    get text    ${MemberInfoSubscriber}
    ${join}      split string   ${MemberInfoSubScriberText}     ${Space}
    ${FirstName} =    remove string    ${join}[0]     ,
    Verify as per User Access  ${UserData}    ${FirstName}  First Name
    ${LastName} =    strip string    ${join}[1]     mode=both
    Verify as per User Access  ${UserData}    ${LastName}  last Name
    log    ${MemberInfoSubScriberText}
#    validate no masking    ${MemberInfoSubScriberText}
    ${MemberInfoEmailText} =    get text    ${MemberInfoEmail}
    log    ${MemberInfoEmailText}
    Verify as per User Access  ${UserData}    ${MemberInfoEmailText}  Email    #${UserData.Email}
#    validate no masking    ${MemberInfoEmailText}
    ${MemberInfoMedicaidIdText} =    get text    ${MemberInfoMedicaidId}
    log    ${MemberInfoMedicaidIdText}
    Verify as per User Access  ${UserData}    ${MemberInfoMedicaidIdText}  Medicare Id    #${UserData.MedicaidId}
#    validate no masking    ${MemberInfoMedicaidIdText}
    ${MemberInfoSocialSecurityText} =    get text    ${MemberInfoSocialSecurity}
    log    ${MemberInfoSocialSecurityText}
    Verify as per User Access  ${UserData}    ${MemberInfoSocialSecurityText}  SSN     #${UserData.SocialSecurityNo}
#    validate no masking    ${MemberInfoSocialSecurityText}
    capture page screenshot

############################# Auth Attachment Screen ##################

*** Variables ***
${AuthAttachment} =     //a[@href='/cgx/Authorization/AuthAttachment']
${AttachmentGrid} =    //div[@id='AuthorizationAttachment-gridContent']//table/tbody//tr[1]//td[3]
${ContactEmail} =    //label[text()='Contact Email']/following::div[1]
${ContactNumber} =    //label[text()='Contact Email']/following::label[contains(text(),'Contact ')]/following::div[1]
${Extension} =    //label[text()='Extension']/following::div[1]

*** Keywords ***
Navigate to Auth Attachment Screen
    set selenium implicit wait    10s
    scroll element into view    ${AuthAttachment}
    click element    ${AuthAttachment}
    wait until page contains    Authorization - Attachments     30s


View Attachment Screen Validation
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    click element    ${AttachmentGrid}
    wait until page contains     View Attachment    30s
    scroll element into view    ${ContactEmail}
    ${ContactEmailText} =    get text    ${ContactEmail}
    ${ContactEmailText} =    strip string    ${ContactEmailText}    mode=both
    log    ${ContactEmailText}
    Verify as per User Access  ${UserData}    ${ContactEmailText}  Email    #${UserData.Email}
#    validate no masking    ${ContactEmailText}
    ${ContactNumberText} =    get text    ${ContactNumber}
    ${ContactNumberText} =    strip string    ${ContactNumberText}    mode=both
    log    ${ContactNumberText}
    Verify as per User Access  ${UserData}    ${ContactNumberText}  Phone    #${UserData.PhoneNumber}
#    validate no masking    ${ContactNumberText}
    ${ExtensionText} =    get text    //label[text()='Extension']//following::div[1]
    ${ExtensionText} =    strip string    ${ExtensionText}    mode=both
    log    ${ExtensionText}
    Verify as per User Access  ${UserData}    ${ExtensionText}  Extension    #${UserData.Extension}
#    validate no masking    ${ExtensionText}
     scroll element into view    //label[text()='Extension']//following::div[1]
    capture page screenshot


######################    MyWork CP CM Screen ###################

*** Variables ***
${FirstNameMyWorkCPCMGrid} =    //div[@class='slick-cell l3 r3']//span[1]
${LastNameMyWorkCPCMGrid} =    //div[@class='slick-cell l4 r4']//span[1]
${MemberIDMyWorkCPCMGrid} =    //div[@class='slick-cell l5 r5']//span[1]
${MemberIDMyWorkViewCPCM} =    //div[@id='MemberId']
${MemberNameMyWorkViewCPCM} =    //div[@id='MemberName']




*** Keywords ***
MyWork CP CM Case Grid
     [Arguments]    ${UserData}
     set selenium implicit wait    10s
     wait until page contains    CP CM Cases    10s
     ${FirstNameMyWorkCPCMGridText} =    get text    ${FirstNameMyWorkCPCMGrid}
     Verify as per User Access  ${UserData}    ${FirstNameMyWorkCPCMGridText}  First Name    #${UserData.FirstName}
#     validate no masking    ${FirstNameMyWorkCPCMGridText}
     ${LastNameMyWorkCPCMGridText} =    get text    ${LastNameMyWorkCPCMGrid}
     Verify as per User Access  ${UserData}    ${LastNameMyWorkCPCMGridText}  last Name    #${UserData.LastName}
#     validate no masking    ${LastNameMyWorkCPCMGridText}
     ${MemberIDMyWorkCPCMGridText} =    get text    ${MemberIDMyWorkCPCMGrid}
     Verify as per User Access  ${UserData}    ${MemberIDMyWorkCPCMGridText}  Member ID    #${UserData.SubscriberId1}
#     validate no masking    ${MemberIDMyWorkCPCMGridText}
     capture page screenshot

MyWork CP Cm Case View Screen
   [Arguments]    ${UserData}
   set selenium implicit wait    10s
   click element    //div[@class='slick-cell l5 r5']//span[1]
   wait until page contains    Case - Details    30s
   ${MemberIDMyWorkViewCPCMText} =    get text    //div[contains(@id,'MemberId')]
   ${UserData.SubscriberId} =   set variable    ${UserData.SubscriberId1}
   log    ${UserData.SubscriberId1}
   Verify as per User Access  ${UserData}    ${MemberIDMyWorkViewCPCMText}  Member ID    #${UserData.SubscriberId}
#   validate no masking    ${MemberIDMyWorkViewCPCMText}
   ${MemberNameMyWorkViewCpCMText} =    get text    //div[contains(@id,'MemberName')]
   ${join}      split string   ${MemberNameMyWorkViewCpCMText}     ${SPACE}
   Verify as per User Access  ${UserData}    ${join}[0]  First Name
   Verify as per User Access  ${UserData}    ${join}[1]  last Name
#   validate no masking    ${MemberNameMyWorkViewCpCMText}
   capture page screenshot







############################# MYWork Tasks ##################################

*** Variables ***
${FirstNameMyWorkTaskGrid} =    //div[@class='slick-cell l3 r3']//span[1]
${LastNameMyWorkTaskGrid} =    //div[@class='slick-cell l4 r4']//span[1]
${MemberIDMyWorkTaskGrid} =    //div[@class='slick-cell l5 r5']//span[1]
${MemberDOBMyWorkTaskGrid} =    //div[@class='slick-cell l10 r10']//span[1]
${SerachInMyTask} =    //img[@id='btnMyWorkTasktoggleSearch']
${SearchBarInMyWorkTask} =    //input[@id='txtInlineFilter']
${MemberNameInMyWorkViewTask} =    //div[@class='member-banner']/div[1]/div[1]
${MemberDOBInMyWorkViewTasK} =    //div[@class='member-banner']/div[1]/div[3]
${MemberIDInMyWorkViewTask} =    //div[@class='member-banner']/div[1]/div[2]
${EditButtonInViewTask} =    //a[@id='task-edit-btn']

*** Keywords ***
MyWork Task Grid
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    wait until page contains    Tasks    30s
    click element    //span[text()='Member ID']
    sleep    1s
    click element    ${SerachInMyTask}
    sleep    1s
    wait until element is visible     ${SearchBarInMyWorkTask}    30s
    input text    ${SearchBarInMyWorkTask}     ${UserData.SubscriberId1}
    sleep    30s
    ${FirstNameMyWorkTasjGridText} =    get text    ${FirstNameMyWorkTaskGrid}
    Verify as per User Access  ${UserData}    ${FirstNameMyWorkTasjGridText}  First Name     #${UserData.FirstName}
#    validate no masking    ${FirstNameMyWorkTasjGridText}
    ${LastNameMyWorkTaskGridText} =    get text    ${LastNameMyWorkTaskGrid}
    Verify as per User Access  ${UserData}    ${LastNameMyWorkTaskGridText}  last Name    #${UserData.LastName}
#    validate no masking    ${LastNameMyWorkTaskGridText}
    ${MemberIdMyTaskgridText} =    get text    ${MemberIDMyWorkTaskGrid}
    Verify as per User Access  ${UserData}    ${MemberIdMyTaskgridText}  Member ID    #${UserData.SubscriberId}
#    validate no masking    ${MemberIdMyTaskgridText}
    open context menu    //span[text()='Member ID']
#    click element    //label[text()='Member DOB']
    click element    //span[@class='slick-columnpicker']//label[text()='Member DOB']/input
    click element    //span[text()='First Name']
    ${MemberDOBMyWorkTaskGridText} =    get text    ${MemberDOBMyWorkTaskGrid}
    log    ${MemberDOBMyWorkTaskGridText}
    Verify as per User Access  ${UserData}    ${MemberDOBMyWorkTaskGridText}  DOB    #${UserData.DOB}
#    validate no masking    ${MemberDOBMyWorkTaskGridText}
    capture page screenshot


MyWork View Task Screen Validation
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    click element    ${MemberIDMyWorkTaskGrid}
    wait until page contains    View Task    30s
    sleep    1s
    ${MemberNameInMyWorkViewTaskText} =    get text    ${MemberNameInMyWorkViewTask}
    ${MemberNameInMyWorkViewTaskText} =    strip string    ${MemberNameInMyWorkViewTaskText}    mode=both
    ${join}      split string   ${MemberNameInMyWorkViewTaskText}     ${SPACE}
    Verify as per User Access  ${UserData}    ${join}[0]  First Name
    Verify as per User Access  ${UserData}    ${join}[1]  last Name
#    validate no masking    ${MemberNameInMyWorkViewTaskText}
    ${MemberIdInMyworkViewTaskText} =    get text    ${MemberIDInMyWorkViewTask}
    ${MemberIdInMyworkViewTaskText} =    strip string    ${MemberIdInMyworkViewTaskText}    mode=both
    Verify as per User Access  ${UserData}    ${MemberIdInMyworkViewTaskText}  Member ID    #${UserData.SubscriberId}
#    validate no masking    ${MemberIdInMyworkViewTaskText}
    ${MemberDOBInMyWorkViewTaskText} =    get text    ${MemberDOBInMyWorkViewTasK}
    ${MemberDOBInMyWorkViewTaskText} =    strip string    ${MemberDOBInMyWorkViewTaskText}    mode=both
    @{MemberDOBInMyWorkViewTask} =    split string    ${MemberDOBInMyWorkViewTaskText}    ,
    Verify as per User Access  ${UserData}   @{MemberDOBInMyWorkViewTask}[0]   DOB #${UserData.DOB}
#    validate no masking    ${MemberDOBInMyWorkViewTask}[0]
    capture page screenshot

MyWork Edit Task Screen Validation
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    click element    ${EditButtonInViewTask}
    wait until page contains    Edit Task    30s
    sleep    1s
    ${MemberNameInMyWorkEditTaskText} =    get text    ${MemberNameInMyWorkViewTask}
    ${MemberNameInMyWorkEditTaskText} =    strip string    ${MemberNameInMyWorkEditTaskText}    mode=both
    ${join}      split string   ${MemberNameInMyWorkEditTaskText}     ${SPACE}
    Verify as per User Access  ${UserData}    ${join}[0]  First Name
    Verify as per User Access  ${UserData}    ${join}[1]  last Name
#    validate no masking    ${MemberNameInMyWorkEditTaskText}
    ${MemberIdInMyworkEditTaskText} =    get text    ${MemberIDInMyWorkViewTask}
    ${MemberIdInMyworkEditTaskText} =    strip string    ${MemberIdInMyworkEditTaskText}    mode=both
    Verify as per User Access  ${UserData}    ${MemberIdInMyworkEditTaskText}    Member ID    #${UserData.SubscriberId}
#    validate no masking    ${MemberIdInMyworkEditTaskText}
    ${MemberDOBInMyWorkEditTaskText} =    get text    ${MemberDOBInMyWorkViewTasK}
    ${MemberDOBInMyWorkEditTaskText} =    strip string    ${MemberDOBInMyWorkEditTaskText}    mode=both
    @{MemberDOBInMyWorkEditTaskText} =    split string    ${MemberDOBInMyWorkEditTaskText}    ,
    Verify as per User Access  ${UserData}   @{MemberDOBInMyWorkEditTaskText}[0]  DOB
#    validate no masking    ${MemberDOBInMyWorkEditTaskText}[0]
    capture page screenshot





######################### Communication Record ##############################

*** Variables ***
${ContactNumberViewCommunication} =    //label[text()='Contact Number']//following::div[1]
${ExtensionViewCommunicatio} =    //label[text()='Extension']//following::div[1]
${SelectCommuRecord} =    //div[@id='MemberCentralCommunicationRecord-gridContent']//table//tbody//tr[1]//td[4]
${EditCommButton} =    //a[@id='edit-commRec']
${ContactNumberEditCommRecord} =    (//input[contains(@name,'ContactNumber')])[1]
${ExtensionEditCommRecord} =    (//input[contains(@name,'Extension')])[1]
${BackButtonInCommRecord} =    //img[@src='/cgx/Content/humana/images/Web/back_plum.png']
${HistoryImg} =    //img[contains(@src,'carehub.humana.com/cgx/Content/humana/images/Web/history.png')][1]
${SelectRecord1} =    //input[@id='0-CommunicationRecordHistoryGrid-checkbox']//following::label[1]
${SelectRecord2} =    //input[@id='0-CommunicationRecordHistoryGrid-checkbox']//following::label[2]
${CompareButton} =    //a[@id='btnCompareCommRec']
${ContactNumberInCompareCommRecord} =    //div[text()='Contact Number']//following::div[1]
${ExtensionInCompareCommRecord} =    //div[text()='Extension']//following::div[1]



*** Keywords ***
View Communication record Screen
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    click element    ${SelectCommuRecord}
    wait until page contains element    //h3[contains(text(),'Communication Record')]     30s
    ${ExtensionViewCommRecordText} =    get text    ${extensionviewcommunicatio}
    ${ExtensionViewCommRecordText} =    strip string    ${ExtensionViewCommRecordText}    mode=both
    Verify as per User Access  ${UserData}    ${ExtensionViewCommRecordText}  Extension
#    validate no masking    ${ExtensionViewCommRecordText}
    ${ContactNumberViewCommRecordText} =    get text    ${ContactNumberViewCommunication}
    ${ContactNumberViewCommRecordText} =    strip string    ${ContactNumberViewCommRecordText}    mode=both
    Verify as per User Access  ${UserData}    ${ContactNumberViewCommRecordText}  Phone
#    validate no masking    ${ContactNumberViewCommRecordText}
    capture page screenshot


Edit Communication Record screen Validation
    [Arguments]    ${UserData}
    set selenium implicit wait    10s
    click element    ${EditCommButton}
    wait until page contains    Edit Communication Record     30s
    ${ExtensionEditCommRecordText} =    get element attribute    ${ExtensionEditCommRecord}   value
    Verify as per User Access  ${UserData}    ${ExtensionEditCommRecordText}  Extension
#    validate no masking    ${ExtensionEditCommRecordText}
    ${ContactNumberEditCommRecordText} =    get element attribute    ${contactnumbereditcommrecord}    value
    Verify as per User Access  ${UserData}     ${ContactNumberEditCommRecordText}  Phone
#    validate no masking    ${ContactNumberEditCommRecordText}
    capture page screenshot
    click element    ${BackButtonInCommRecord}
    sleep    1s
    wait until page contains element    //h3[contains(text(),'Communication Record')]     30s
    click element    ${BackButtonInCommRecord}
    wait until page contains    Communication Record    30s

Compare Communication Record
     [Arguments]    ${UserData}
     sleep    10s
     click element    ${HistoryImg}
     wait until page contains    Communication Record History    30s
     click element    ${SelectRecord1}
     click element    ${SelectRecord2}
     click element    ${CompareButton}
     wait until page contains    Compare Communication Records    30s
     ${ContactNumberInCompareCommRecordText} =    get text    ${ContactNumberInCompareCommRecord}
     ${ContactNumberInCompareCommRecordText} =   strip string    ${ContactNumberInCompareCommRecordText}    mode=both
     Verify as per User Access  ${UserData}    ${ContactNumberInCompareCommRecordText}  Phone
#     validate no masking    ${ContactNumberInCompareCommRecordText}
     ${ExtensionInCompareCommRecordText} =    get text    ${ExtensionInCompareCommRecord}
     ${ExtensionInCompareCommRecordText} =    strip string    ${ExtensionInCompareCommRecordText}    mode=both
     Verify as per User Access  ${UserData}    ${ExtensionInCompareCommRecordText}  Extension
#     validate no masking    ${ExtensionInCompareCommRecordText}
     scroll element into view    ${ExtensionInCompareCommRecord}
     capture page screenshot

Comm record Historical Screen
    [Arguments]    ${UserData}
    sleep    10s
    click element    //u[text()='Back']
    wait until element is visible    //div[@id='CommunicationRecordHistoryGrid']//table/tbody/tr[2]/td[2]    30s
    sleep    2s
    click element    //div[@id='CommunicationRecordHistoryGrid']//table/tbody/tr[2]/td[2]
    wait until element is visible    //label[text()='Contact Number']//following::div[1]     30s
    ${HisPhoneNumber} =    get text    //label[text()='Contact Number']//following::div[1]
    ${HisPhoneNumber} =    strip string    ${HisPhoneNumber}    mode=both
    ${HisExtension} =    get text    //label[text()='Extension']//following::div[1]
    ${HisExtension} =    strip string    ${HisExtension}    mode=both
    Verify as per User Access  ${UserData}    ${HisPhoneNumber}  Phone
    Verify as per User Access  ${UserData}    ${HisExtension}  Extension
    capture page screenshot




#######################################################################################################################

#Validate ZIP Code Field
#     [Arguments]    ${ZipCodeString}
#     ${ZipCode} =    Extract SubStrings from String for last occurance    ${ZipCodeString}     2
#     log   ${ZipCode}
#     Validate No Masking  ${ZipCode}[1]
#     Validate Masking   ${ZipCode}[0]
#
#Validate Street Adress
#     [Arguments]    ${StreetAdress}
#     @{StreetAdressList} =    split string    ${StreetAdress}     ,
#     ${SubStreetAdressList} =    Extract SubStrings from String for first occurance    ${StreetAdressList}[0]     0     4
#     log   ${SubStreetAdressList}
#     Validate No Masking  ${SubStreetAdressList}[0]
#     Validate Masking   ${SubStreetAdressList}[1]
#     validate no masking   ${StreetAdressList}[1]
#     validate no masking   ${StreetAdressList}[2]
#     ${SubStreetAdressList2} =    Extract SubStrings from String for last occurance    ${StreetAdressList}[3]      2
#     log   ${SubStreetAdressList2}
#     Validate No Masking  ${SubStreetAdressList2}[1]
#     Validate Masking   ${SubStreetAdressList2}[0]
#
#
#Validate First Name
#     [Arguments]    ${FirstName}
#     ${FirstNamelist} =    Extract SubStrings from String for first occurance    ${FirstName}     0      4
#     log   ${FirstNamelist}
#     Validate No Masking  ${FirstNamelist}[0]
#     Validate Masking   ${FirstNamelist}[1]
#
#Validate last Name
#     [Arguments]    ${lastName}
#     ${lastNamelist} =    Extract SubStrings from String for first occurance    ${lastName}     0      4
#     log   ${lastNamelist}
#     Validate No Masking  ${lastNamelist}[0]
#     Validate Masking   ${lastNamelist}[1]

############################################################################################################################
*** Variables ***
#View Task(Member Central) Masked Fields
#To Clik on the created task under Member entral Grid from the table
${MCTasksPageHeader} =    //h3[text()='Tasks']
${MCCreatedTaskUnderGrid} =    //div[@id="MemberCentralTask-gridContent"]//child::td[text()="Task_2437"]    #text() is the comment value entered while creating Task
${MCFirstTaskUnderGrid} =    //div[@id="MemberCentralTask-gridContent"]//tr[@role="row"][1]
${MCViewTaskMemBannerMemberId} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCViewTaskBannerMemberName} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][1]
${MCViewTaskBannerMemberDOB} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[contains(text(),'Yrs,')]
${MCViewTaskBannerMemberContact} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div/div[5]
${MCViewTaskBannerMemberStreetAddr} =    //div[@id='view-task']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCViewTaskPopUpTitle} =    //div[@id="view-task"]//child::h4[@id="modal-header-title" and text()="View Task"]

*** Keywords ***
View Task Screen Mask
    [Arguments]    ${UserData}
    Get Member Details
    Navigate to Tasks
    sleep  5 seconds
    wait until element is visible    //a[@id="add-new-tasks"]    20 Seconds
    page should contain element    ${MCTasksPageHeader}
    click element    ${MCFirstTaskUnderGrid}
    sleep  5 seconds
    wait until element is visible    ${MCViewTaskPopUpTitle}    10 Seconds
    page should contain element    ${MCViewTaskPopUpTitle}
    ${MemberID} =    get text    ${MCViewTaskMemBannerMemberId}
    ${MemberID} =    strip string    ${MemberID}
    Verify as per User Access  ${UserData}    ${MemberID}     Member ID
    ${MemberName} =    get text    ${MCViewTaskBannerMemberName}
    ${MemberName} =    split string    ${MemberName}    ,
    ${FirstName} =   set variable    ${MemberName}[0]
    ${LastName} =    set variable    ${MemberName}[1]
    ${FirstName} =   strip string    ${MemberName}[0]    mode=both
    ${LastName} =    strip string    ${MemberName}[1]    mode=both
    Verify as per User Access  ${UserData}    ${FirstName}  First Name
    Verify as per User Access  ${UserData}    ${LastName}  last Name
    ${MemberContact} =    get text    ${MCViewTaskBannerMemberContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    Verify as per User Access  ${UserData}    ${MemberContact}  Phone
    ${MemberAddress} =   get text    ${MCViewTaskBannerMemberStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[3]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[3]    mode=both
    Verify as per User Access  ${UserData}    ${MemberStreetAddress}  Street Adress
    Verify as per User Access  ${UserData}    ${MemberZipCode}  ZIP Code
    capture page screenshot
    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberName}
    set local variable    ${FirstName}
    set local variable    ${LastName}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}

#################################################################################################
*** Variables ***
#Change Ownership(Member Central Task) Masked Fields
${MCViewTaskChngOwnershipBtn} =    //a[@id='button-task-change-ownership']
${MCTaskChngOwnershipBannerMemberId} =    //div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCTaskChngOwnershipBannerContact} =    //div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div/div[5]
${MCTaskChngOwnershipBannerStreetAddr} =    //div[@id='task-change-ownership']//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCTaskChngOwnershipPopUpTitle} =    //div[@id="task-change-ownership"]//child::h4[@id="modal-header-title" and text()="Change Ownership"]
${MCTaskChngOwnershipCancelBth} =    //a[@id="task-change-ownership-cancel-btn"]

*** Keywords ***
View Task Change Ownership Screen Mask
    [Arguments]    ${UserData}
    sleep    5s
    click element    //a[@id='edit-tasks-grid']
    click element    //div[@id='MemberCentralTask-gridContent']//tbody//label
    click element    ${MCViewTaskChngOwnershipBtn}
    wait until element is visible    ${MCTaskChngOwnershipPopUpTitle}    20 Seconds
    page should contain element    ${MCTaskChngOwnershipPopUpTitle}
    ${MemberID} =    get text    ${MCTaskChngOwnershipBannerMemberId}
    ${MemberID} =    strip string    ${MemberID}
    Verify as per User Access  ${UserData}   ${MemberID}  Member ID
    ${MemberContact} =    get text    ${MCTaskChngOwnershipBannerContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    Verify as per User Access  ${UserData}    ${MemberContact}  Phone
    ${MemberAddress} =   get text    ${MCTaskChngOwnershipBannerStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[3]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[3]    mode=both
    Verify as per User Access  ${UserData}    ${MemberStreetAddress}  Street Adress
    Verify as per User Access  ${UserData}    ${MemberZipCode}  ZIP Code

    log to console    ${MemberID}
    log to console    ${MemberContact}
    log to console    ${MemberStreetAddress}
    log to console    ${MemberZipCode}
    click element     ${MCTaskChngOwnershipCancelBth}
    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}
    capture page screenshot
    reload page

##################################################################################################################
*** Variables ***
#Set Follow Up Date Taskk (Member Central) Masked Fields
${MCTaskGridEditBtn} =    //div[@id="member-task-grid-container"]//child::a[@id="edit-tasks-grid" and @class="button"]
${MCTaskGridChkBox} =    //div[@id="MemberCentralTask-gridContent"]//td[@class=" checkboxColumn checkboxCell "][1]
${MCFollowUpDateTask} =  //a[@id="button-task-followup-date"]
${MCFollowUpDateTaskPopUpTitle} =    //div[@id="task-followup-date"]//child::h4[@id="modal-header-title" and text()="Set Follow-up Date"]
${MCTaskGridDoneBtn} =    //div[@id="member-task-grid-container"]//child::ul[@class="button-group right"]//child::a[@id="edit-tasks-grid-done"]
${MCTaskFollowUpCancelLink} =    //a[@id="task-followup-date-cancel-btn"]
${MCFollowUpTaskBannerMemberId} =    //div[@id="task-followup-date"]//child::div[@class='member-banner']//child::div[@class="small-2 columns"][2]
${MCFollowUpTaskBannerStreetAddr} =    //div[@id="task-followup-date"]//child::div[@class='member-banner']//child::div[@class="small-2 columns"][4]
${MCFollowUpTaskBannerContact} =     //div[@id='task-followup-date']//child::div[@class='member-banner']//child::div/div[5]

*** Keywords ***
Set Follow Up Date Screen Mask
    [Arguments]    ${UserData}
    sleep    05 Seconds
    click element    ${MCTaskGridEditBtn}
    sleep    02 Seconds
    click element    ${MCTaskGridChkBox}
    sleep    02 Seconds
    click element    ${MCFollowUpDateTask}
    sleep    02 seconds
    wait until element is visible    ${MCFollowUpDateTaskPopUpTitle}    20 Seconds
    page should contain element    ${MCFollowUpDateTaskPopUpTitle}
    ${MemberID} =    get text    ${MCFollowUpTaskBannerMemberId}
    ${MemberID} =    strip string    ${MemberID}
    Verify as per User Access  ${UserData}    ${MemberID}  Member ID
    ${MemberContact} =    get text    ${MCFollowUpTaskBannerContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    Verify as per User Access  ${UserData}    ${MemberContact}  Phone
    ${MemberAddress} =   get text    ${MCFollowUpTaskBannerStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[3]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[3]    mode=both
    Verify as per User Access  ${UserData}    ${MemberStreetAddress}  Street Adress
    Verify as per User Access  ${UserData}    ${MemberZipCode}  ZIP Code
    capture page screenshot
    log to console    ${MemberID}
    log to console    ${MemberContact}
    log to console    ${MemberStreetAddress}
    log to console    ${MemberZipCode}
    click element     ${MCTaskFollowUpCancelLink}
    sleep    03 Seconds
    click element     ${MCTaskGridDoneBtn}
    sleep    03 Seconds
    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}

############################################################################################################
*** Variables ***
#Task Grid (Member Central) Masked Fields
${MCTaskGridMemberID} =    //div[@id="member-information"]//child::div[@class="small-2 columns"][2]
${MCTaskGridStreetAddr} =    //div[@id="member-information"]//child::div[@class="small-2 columns"][4]
${MCTaskGridContact} =    //div[@id="member-information"]//child::div[@class="small-2 columns"][5]

*** Keywords ***
Grid Task Screen Mask
    [Arguments]    ${UserData}
    sleep  5 seconds
    wait until element is visible    //a[@id="add-new-tasks"]    20 Seconds
    page should contain element    ${MCTasksPageHeader}
    ${MemberID} =    get text    ${MCTaskGridMemberID}
    ${MemberID} =    strip string    ${MemberID}
    #Verify as per User Access  ${UserData}    ${MemberID}  Member ID
    ${MemberContact} =    get text    ${MCTaskGridContact}
    ${MemberContact} =    strip string    ${MemberContact}    mode=both
    #Verify as per User Access  ${UserData}     ${MemberContact}  Phone
    ${MemberAddress} =   get text    ${MCTaskGridStreetAddr}
    ${MemberAddress} =    split string   ${MemberAddress}     ,
    ${MemberStreetAddress} =    set variable    ${MemberAddress}[0]
    ${MemberZipCode} =  set variable    ${MemberAddress}[3]
    ${MemberStreetAddress} =    strip string    ${MemberAddress}[0]    mode=both
    ${MemberZipCode} =  strip string    ${MemberAddress}[3]    mode=both
    Verify as per User Access  ${UserData}    ${MemberStreetAddress}  Street Adress
    Verify as per User Access  ${UserData}    ${MemberZipCode}  ZIP Code
    capture page screenshot
    log to console    ${MemberID}
    log to console    ${MemberContact}
    log to console    ${MemberStreetAddress}
    log to console    ${MemberZipCode}

    # setting all variables locally
    set local variable    ${MemberID}
    set local variable    ${MemberContact}
    set local variable    ${MemberStreetAddress}
    set local variable    ${MemberZipCode}

############################################################################################################
*** Variables ***
#Task History (Member Central) Masked Fields
${MCTaskHistoryImage} =    //td[@class="center historyCell"][1]
${MCTaskHistoryTitle} =    //h3[@class="humana-green left hide-for-medium" and text()="Task History"]
${MCTaskHistoryMemberID} =    //div[@id="DisplayMemberId"]
${MCTaskHistoryBackLink} =    //a[@id="tasks-history-back-btn"]

*** Keywords ***
Member Level Task History Screen Mask
    [Arguments]    ${UserData}
    click element    ${MCTaskHistoryImage}
    wait until element is visible    ${MCTaskHistoryTitle}    20 Seconds
    page should contain element    ${MCTaskHistoryTitle}
    ${MemberIdOnHistory} =    get text    ${MCTaskHistoryMemberID}
    ${MemberIdOnHistory} =    strip string    ${MemberIdOnHistory}
    Verify as per User Access  ${UserData}    ${MemberIdOnHistory}  Member ID
    capture page screenshot
    log to console    ${MemberIdOnHistory}
    click element    ${MCTaskHistoryBackLink}
    wait until element is visible    ${MCTasksPageHeader}    10 Seconds
    Sleep    03 Seconds
    # setting all variables locally
#    set local variable    ${MemberID}
#    set local variable    ${MemberContact}
#    set local variable    ${MemberStreetAddress}
#    set local variable    ${MemberZipCode}
#    set local variable    ${MemberIdOnHistory}

############################################################################################################
*** Variables ***
#Seach Member Masked Fields
${MCTaskSearchMemberFirstName} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][1]
${MCTaskSearchMemberLastName} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][2]
${MCTaskSearchMemberSSN} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][3]
${MCTaskSearchDOB} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][4]
${MCTaskSearchMedicareID} =    //div[@id="MemberSearch-gridContent"]//td[@role="gridcell"][5]

*** Keywords ***
Member Search Grid Screen Mask
    [Arguments]    ${UserData}
    ${FirstName} =   get text    ${MCTaskSearchMemberFirstName}
    ${LastName} =    get text    ${MCTaskSearchMemberLastName}
    ${FirstName} =   strip string    ${FirstName}    mode=both
    ${LastName} =    strip string    ${LastName}    mode=both
    Verify as per User Access  ${UserData}    ${FirstName}  First Name
    Verify as per User Access  ${UserData}    ${LastName}  last Name
    ${MemberSSN} =    get text    ${MCTaskSearchMemberSSN}
    ${MemberSSN} =    strip string    ${MemberSSN}    mode=both
    Verify as per User Access  ${UserData}    ${MemberSSN}  SSN
    ${MemberMedicareID} =   get text    ${MCTaskSearchMedicareID}
    ${MemberMedicareID} =   strip string    ${MemberMedicareID}    mode=both
    Verify as per User Access  ${UserData}    ${MemberMedicareID}  Medicare Id
    ${MemberDOB} =   get text    ${MCTaskSearchDOB}
    ${MemberDOB} =   strip string    ${MemberDOB}    mode=both
    scroll element into view    //div[@id='MemberSearch-Count-div']
    sleep    2s
    capture page screenshot
    log to console    ${FirstName}
    log to console    ${LastName}
    log to console    ${MemberSSN}
    log to console    ${MemberDOB}
    log to console    ${MemberMedicareID}
    # setting all variables locally

    set local variable    ${FirstName}
    set local variable    ${LastName}
    set local variable    ${MemberSSN}
    set local variable    ${MemberDOB}
    set local variable    ${MemberMedicareID}

##############################################################################################################
*** Variables ***
#View CDR Screen
${ViewCDRContactEmail} =    //label[contains(@for,"ContactEmail")]//ancestor::div[@class="small-6 columns"]//following-sibling::div[@class="small-6 columns valueField"]
${ViewCDRcontactNumber} =    //label[contains(@for,"ContactNumber")]//ancestor::div[@class="small-6 columns"]//following-sibling::div[@class="small-6 columns valueField"]
${ViewCDRNum} =    //span[@id="CdrAuthId"]

*** Keywords ***
View CDR Screen Mask
    [Arguments]    ${UserData}
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.SubscriberId1}
    click element    //a[@id='btnSearch']
#    auth search modified    ${UserData.CDRNumber}
    wait until element is visible    ${ViewCDRNum}
    ${CDRContactMail} =  get text    ${ViewCDRContactEmail}
    ${CDRContactMail} =    strip string    ${CDRContactMail}     mode=both
    ${CDRContactNumber} =  get text    ${ViewCDRcontactNumber}
    ${CDRContactNumber} =    strip string    ${CDRContactNumber}     mode=both
    Verify as per User Access  ${UserData}    ${CDRContactMail}  Email
    Verify as per User Access  ${UserData}       ${CDRContactNumber}  Phone
    capture page screenshot
    log to console    ${CDRContactMail}
    log to console    ${CDRContactNumber}



*** Variables ***
${ZipCode_Alt_Info} =    //label[contains(text(),'Zip Code')]/following::div[1]
${Email_Alt_Info} =   //label[contains(text(),'Email Address')]/following::div[1]
${StreetAdd_Alt_Info} =  //label[contains(text(),'Address')]/following::div[1]
${Phone_Alt_Info} =  //div[@id='phoneNumbersGrid']//div[@class='grid-canvas']/div//div[@class='slick-cell l1 r1']/span


*** Keywords ***
View_Alternate_Info_Protegrity
    [Arguments]  ${UserData}
    set selenium speed    1s
    scroll element into view    ${ZipCode_Alt_Info}
    ${ZipCode}      get text    ${ZipCode_Alt_Info}
    ${ZipCode_Alt_Info}      strip string    ${ZipCode}
    ${ZipCode_Alt_Info_Actual}    convert to string    ${ZipCode_Alt_Info}
    ${Email_Alt_Info2}      get text    ${Email_Alt_Info}
    ${Email_Alt_Info_Actual}    convert to string    ${Email_Alt_Info2}
    ${StreetAdd_Alt_Info}      get text    ${StreetAdd_Alt_Info}
    ${StreetAdd_Alt_Info2}    remove string    ${StreetAdd_Alt_Info}    ,
    ${StreetAdd_Alt_Info_Actual}    convert to string    ${StreetAdd_Alt_Info2}
    capture page screenshot
    scroll element into view    ${Phone_Alt_Info}
    ${ContactPhone_Alt_Info2}      get text    ${Phone_Alt_Info}
    ${ContactPhone_Alt_Info_Actual}    convert to string    ${ContactPhone_Alt_Info2}

    Verify as per User Access  ${UserData}  ${ZipCode_Alt_Info_Actual}  ZIP Code
    Verify as per User Access  ${UserData}  ${Email_Alt_Info_Actual}  Email
    Verify as per User Access  ${UserData}  ${StreetAdd_Alt_Info_Actual}  Street Adress
    Verify as per User Access  ${UserData}  ${ContactPhone_Alt_Info_Actual}  Phone
    capture page screenshot
    reload page


Protegrity_Add_Alternate_Info
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //a[@id='editAlternateInfo']
    sleep    3s
    click element    //a[@id='alternate-phone-number']
    wait until page does not contain  //*[@id="loading-ajax"]    10s

    ${Address}      get text    //div[@class='member-banner']/div/div[4]
    ${Add}      split string   ${Address}     ,
    ${StreetAddress_AltInfo}    strip string     ${Add}[0]
    ${ZipCode_Alt_Info_Actual}    strip string     ${Add}[3]

    ${DOB}      get text    //div[@class='member-banner']/div/div[3]
    ${BirthDayMonth}      split string   ${DOB}     /
    ${DOB_AltInfo}    strip string     ${BirthDayMonth}[1]
    ${ContactPhone_AltInfo}      get text    //div[@class='member-banner']/div/div[5]


    Verify as per User Access  ${UserData}  ${ZipCode_Alt_Info_Actual}  ZIP Code
    Verify as per User Access  ${UserData}  ${ContactPhone_AltInfo}  Phone
    Verify as per User Access  ${UserData}  ${StreetAddress_AltInfo}  Street Adress
    #Verify as per User Access  ${UserData}  ${DOB_AltInfo}  DOB
    ProtegrityPage.Validate No Masking    ${DOB_AltInfo}
    Capture Page Screenshot
    reload page


*** Variables ***
${FullName} =  //span[contains(text(),'Member Name:')]/following::span[1]
${Back_Button} =  //*[@id="back-button"]
${Search Results_Heading} =  //*[@id="search-results"]/div[2]/div/h3



*** Keywords ***
Protegrity My worksAuthorization Validation
    [Arguments]  ${UserData}
    #**************All Auths***********************
    click element    //span[contains(text(),'Auth ID')]
    click element    //img[@id='btnMyWorkAuthtoggleSearch']
    input text    //input[@id='txtInlineFilter']    ${UserData.SubscriberId}
#    click element    //div[@class='grid-canvas']/div/div[5]
    ${FirstName_Auth_Actual}    get text    //div[@class='grid-canvas']/div/div[9]
    ${LastName_Auth_Actual}    get text    //div[@class='grid-canvas']/div/div[8]
    Verify as per User Access  ${UserData}  ${FirstName_Auth_Actual}  First Name
    Verify as per User Access  ${UserData}  ${LastName_Auth_Actual}  last Name
    Capture Page Screenshot
    #**************Fax Auths***********************
    click element    //a[@id='Fax-Auths-tab']
    click element    //span[contains(text(),'Auth ID')]
    click element    //img[@id='btnMyWorkAuthFaxtoggleSearch']
    input text    //input[@id='txtInlineFilter']    ${UserData.SubscriberId}
#    click element    //div[@class='grid-canvas']/div/div[5]
    ${FirstName_Auth_Actual}    get text    //div[@class='grid-canvas']/div/div[9]
    ${LastName_Auth_Actual}    get text    //div[@class='grid-canvas']/div/div[8]
    Verify as per User Access  ${UserData}  ${FirstName_Auth_Actual}  First Name
    Verify as per User Access  ${UserData}  ${LastName_Auth_Actual}  last Name
    Capture Page Screenshot
    reload page

#Protegrity My worksAuthorization Validation
#    [Arguments]  ${UserData}
#    click element    //div[@class='grid-canvas']/div/div[5]
#    click element    //img[contains(@src,'grid_more_icon_web.png')]
#    ${FullName_Auth}    get text    ${FullName}
#    run keyword if  '${UserData.Access_Type}' == 'OffshoreUser'    Validate OffshoreUser Masking    ${FullName_Auth}
#    ...    ELSE IF  '${UserData.Access_Type}' != 'OffshoreUser'    MyWorkAuth   ${UserData}    ${FullName_Auth}
#    Capture Page Screenshot
#    reload page

MyWorkAuth
    [Arguments]  ${UserData}    ${FullName_Auth}
    ${Name}      split string   ${FullName_Auth}
    ${FirstName_Auth_Actual}    strip string     ${Name}[1]
    ${LastName_Auth_Actual}    strip string     ${Name}[0]
    Verify as per User Access  ${UserData}  ${FirstName_Auth_Actual}  First Name
    Verify as per User Access  ${UserData}  ${LastName_Auth_Actual}  last Name


Protegrity My works Consultation validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    ${Consult_FirstName}    get text    //div[@class='k-grid-content']//tr[1]/td[4]
    ${Consult_LastName}    get text    //div[@class='k-grid-content']//tr[1]/td[5]
    Verify as per User Access  ${UserData}  ${Consult_FirstName}  First Name
    Verify as per User Access  ${UserData}  ${Consult_LastName}  last Name
    Capture Page Screenshot
    reload page


*** Variables ***

${Notes_FullName} =    //div[@class='member-banner']/div/div[1]
${Notes_MemberId} =    //div[@id='SubscriberIDwithDependantCode']


*** Keywords ***
Protegrity_View_Notes_Validation
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //div[@class='k-grid-content']//tr[1]/td[1]
    ${Notes_Member_Id}    get text    ${Notes_MemberId}
    ${FullName}    get text    ${Notes_FullName}
    ${Name}      split string   ${FullName}     ,
    ${Notes_LastName}    strip string     ${Name}[0]
    ${Notes_FirstName}    strip string     ${Name}[1]
    Verify as per User Access  ${UserData}  ${Notes_FirstName}  First Name
    Verify as per User Access  ${UserData}  ${Notes_LastName}  last Name
    Verify as per User Access  ${UserData}  ${Notes_Member_Id}  Member ID
    Capture Page Screenshot
    reload page

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


    Verify as per User Access  ${UserData}  ${MC_FirstName}  First Name
    Verify as per User Access  ${UserData}  ${MC_LastName}  last Name
    Verify as per User Access  ${UserData}  ${MC_Member_Id}  Member ID
    Capture Page Screenshot
    reload page

*** Variables ***
${MemCommEdit} =    //a[@id='edit-commRec']
${TableRow_CommRcd} =    //*[@id='MemberCentralCommunicationRecord']/div[2]/div[1]/table/tbody/tr[1]/td[1]
${CorrectionRsn} =    //select[@id='ReasonForCorrection']
${ViewCorrectionRsn} =    //div[@id='ReasonForCorrection']
*** Keywords ***
Protegrity Edit Communication Record
    [Arguments]    ${UserData}
    sleep    5 Seconds
    wait until page does not contain  //*[@id="loading-ajax"]
    click element    ${TableRow_CommRcd}
    page should contain element    ${MemCommEdit}
    click link    ${MemCommEdit}
    wait until page contains    Edit Communication Record
    ${PhoneEditCR_Actual}      get value    (//input[contains(@id,'ContactNumber')])[1]
    Verify as per User Access  ${UserData}  ${PhoneEditCR_Actual}  Phone
    Capture Page Screenshot




#Protegrity View AuthLetter
#    [Arguments]  ${UserData}
#    set selenium speed    1s
#    sleep    3s
#    click element    //a[@href='/cgx/Authorization/AuthorizationLetter']
#    page should contain element    //h3[contains(text(),'Authorization - Letters')]
#    click element    //div[@id='AuthorizationLetters-gridContent']//div[@class='k-grid-content']//tr/td[4]
#    ${Address}      get text    ${FullAddress}
#    ${Add}      split string   ${Address}   ,
#    ${StreetAddress_AuthLetter}    strip string     ${Add}[0]
#    ${ZipCodeAuth_AuthLetter}     strip string     ${Add}[4]
#
#    Verify as per User Access  ${ZipCodeAuth_AuthLetter}    ${UserData.ZipCode}
#    Verify as per User Access  ${StreetAddress_AuthLetter}    ${UserData.StreetAddress}
#    Capture Page Screenshot
#    reload page

Protegrity View Quality Review
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Quality Review
    click element    //div[@id='QualityReviewGrid-gridContent']//tr/td[2]
    page should contain element    //h3[contains(text(),'View Quality Review')]
    scroll element into view    //label[contains(@for,'TeamMemberPhoneNumber')]/following::div[1]
    ${Phone}      get text    //label[contains(@for,'TeamMemberPhoneNumber')]/following::div[1]
    Verify as per User Access  ${UserData}    ${Phone}  Phone
    Capture Page Screenshot
    reload page

Protegrity View Authorization
    [Arguments]  ${UserData}
    set selenium speed    1s
    ${Email_Auth_Actual}      get text    //label[contains(text(),'Contact Email')]/following::div[1]
    ${ContactPhone_Auth_Actual}      get text    //label[contains(text(),'Extension')]/preceding::div[1]
    click element    //img[contains(@src,'grid_more_icon_web.png')]
    ${FullName_MemInfo}      get text    //*[@id="MemberNameDisplay"]//following::span[1]
    ${Name}      split string   ${FullName_MemInfo}     ,
    ${FirstName_Auth_Actual}    strip string     ${Name}[1]
    ${LastName_Auth_Actual}    strip string     ${Name}[0]

    ${Address}      get text    //*[@id="BuissnessRulesAddress"]//following::span[1]
    ${Add}      split string   ${Address}     ,
    ${StreetAddress_Auth_Actual}    strip string     ${Add}[0]
    ${ZipCodeAuth_Actual}    strip string     ${Add}[4]

#    Verify as per User Access  ${Email_Auth_Actual}
    Verify as per User Access  ${UserData}  ${FirstName_Auth_Actual}  First Name
    Verify as per User Access  ${UserData}  ${LastName_Auth_Actual}  last Name
    Verify as per User Access  ${UserData}  ${ZipCodeAuth_Actual}  ZIP Code
    Verify as per User Access  ${UserData}  ${StreetAddress_Auth_Actual}  Street Adress
    Verify as per User Access  ${UserData}  ${ContactPhone_Auth_Actual}  Phone
 #   Verify as per User Access  ${Medicare ID_Auth_Actual}  ${UserData.Medicare ID}
    Capture Page Screenshot
    reload page



#Protegrity View Quality Review
#    [Arguments]  ${UserData}
#    set selenium speed    1s
#    click link    Quality Review
#    click element    //div[@id='QualityReviewGrid-gridContent']//tr/td[2]
#    page should contain element    //h3[contains(text(),'View Quality Review')]
#    click element    //a[@id='qualityReview-edit-btn']
#    ${Phone}      get value    //input[@id='TeamMemberPhoneNumber']
#    Verify as per User Access    ${Phone}
#    Capture Page Screenshot
#    reload page

Protegrity Edit Discharge Plan
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Discharge Plan
    click element    //a[@id='dischargePlan-edit-btn']
    sleep    30s
    scroll element into view    //h4[contains(text(),'DC Planner if different from UR')]
    ${Phone}      get value    (//input[contains(@id,'PlannerPhoneNumber')])[2]
    ${Extension}      get value    //label[text()='Extension']/following::input[contains(@id,'PlannerExtension')]
    Verify as per User Access  ${UserData}    ${Phone}  Phone
    Verify as per User Access  ${UserData}    ${Extension}  Extension
    scroll element into view    (//input[contains(@id,'PlannerPhoneNumber')])[2]
    Capture Page Screenshot
    reload page

Protegrity Create Discharge Plan
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Discharge Plan
    scroll element into view    //input[@id='PlannerPhoneNumber']
    ${Phone}      get value    //input[@id='PlannerPhoneNumber']
    ${Extension}      get value    //input[@id='PlannerExtension']
    Verify as per User Access  ${UserData}    ${Phone}  Phone
    Verify as per User Access  ${UserData}    ${Extension}  Extension
    Capture Page Screenshot
    reload page


Protegrity Discharge Plan
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Discharge Plan
    scroll element into view    //h4[contains(text(),'DC Planner if different from UR')]
    sleep    2s
    ${Phone}      get text    //label[contains(text(),'Phone')]/following::div[1]
    ${Extension}      get text    //label[contains(text(),'Extension')]/following::div[1]
    Verify as per User Access  ${UserData}    ${Phone}  Phone
    Verify as per User Access  ${UserData}    ${Extension}  Extension
    scroll element into view    //label[contains(text(),'Extension')]/following::div[1]
    Capture Page Screenshot
    reload page

Protegrity Edit Quality Review
    [Arguments]  ${UserData}
    set selenium speed    1s
    click link    Quality Review
    click element    //div[@id='QualityReviewGrid-gridContent']//tr/td[2]
    page should contain element    //h3[contains(text(),'View Quality Review')]
    click element    //a[@id='qualityReview-edit-btn']
    sleep    5s
    wait until element is visible    (//input[contains(@id,'TeamMemberPhoneNumber')])[2]    30s
    ${Phone}      get value    (//input[contains(@id,'TeamMemberPhoneNumber')])[2]
    Verify as per User Access  ${UserData}    ${Phone}  Phone
    scroll element into view    (//input[contains(@id,'TeamMemberPhoneNumber')])[2]
    Capture Page Screenshot
    reload page


*** Variables ***
#################View Clinical Consult  #####################
#${Email} =   //div[@id='DisplayContactEmail']
${Contact_Email_CC1} =    //div[contains(@id,'ContactEmail')]
#${CaseHeader} =    //h3[contains(text(),'LTSS Cases')]
${Contact_Phone_CC1} =    //div[contains(@id,'DisplayContactNumber')]
${Contact_Email_G&A} =    //div[@id='ContactEmail']
${Contact_Phone_G&A} =    //div[@id='ContactNumber']

${Contact_Email_CC_Edit} =    (//input[contains(@id,'ContactEmail')])[2]
${Contact_Phone_CC_Edit} =    (//input[contains(@id,'ConsultationContactNumber')])[2]
${Edit_Btn_CC} =    //a[@id='ClinicalConsult-edit-btn']


*** Keywords ***

View_Clinical_Consult_Protegrity
    [Arguments]  ${UserData}
    set selenium speed    1s
    sleep    5s
    click element   //div[@id='MemberCentralClinicalRoutes-gridContent']//tbody/tr[1]
    ${EmailViewClinicalConsult_Actual}      get text    ${Contact_Email_CC1}
    ${PhoneViewClinicalConsult_Actual}      get text    ${Contact_Phone_CC1}
    Verify as per User Access  ${UserData}  ${EmailViewClinicalConsult_Actual}  Email
    Verify as per User Access  ${UserData}  ${PhoneViewClinicalConsult_Actual}  Phone
    scroll element into view    ${Contact_Phone_CC1}
    Capture Page Screenshot

View_G&A_Consult_Protegrity
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element   //table/tbody/tr/td[contains(text(),'G&A Consultation')]
    ${EmailViewG&AConsult_Actual}      get text    ${Contact_Email_G&A}
    ${PhoneViewG&AConsult_Actual}      get text    ${Contact_Phone_G&A}
    Verify as per User Access  ${UserData}  ${EmailViewG&AConsult_Actual}  Email
    Verify as per User Access  ${UserData}  ${PhoneViewG&AConsult_Actual}  Phone
    Capture Page Screenshot


Protegrity Edit Clinical Consultation
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element   //table/tbody/tr/td[contains(text(),'Clinical Consultation')]
    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
    click element    ${Edit_Btn_CC}
    wait until page does not contain  //*[@id="loading-ajax"]    45 seconds
#    click element    //input[@id='DueDateTime']
    sleep    30s
    press keys    None    PgDn
    press keys    None    PgDn
    #scroll element into view    ${Contact_Email_CC_Edit}
    sleep    2s
    ${EmailEditCC_Actual}      get value    ${Contact_Email_CC_Edit}
    ${PhoneEditCC_Actual}      get value    ${Contact_Phone_CC_Edit}
    Verify as per User Access  ${UserData}  ${EmailEditCC_Actual}  Email
    Verify as per User Access  ${UserData}  ${PhoneEditCC_Actual}  Phone
    scroll element into view    ${Contact_Phone_CC_Edit}
    Capture Page Screenshot


Verify Member Banner screen
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //a[@id='expand-member-information']
    ${DateOfBirth}    get text    //div[@id='member-information']/div/div[3]
    @{DOB}      split string   ${DateOfBirth}     ,
    ${DOB_Actual}    strip string     ${DOB}[0]
    ${Phone}    get text    //div[@id='member-information']//span[@class='phone-number']
    ${Address}    get text    //div[@id='memberMailResAddress']
    @{Add}      split string   ${Address}     ,
    ${StreetAddress}    strip string     ${Add}[0]
    ${Size} =     get length    ${Add}
    ${ZipCode}    strip string     ${Add}[3]
    ${MedicaidId}    get text    //span[@id='Medicaid Id']
    Verify as per User Access  ${UserData}  ${Phone}  Phone
    Verify as per User Access  ${UserData}  ${ZipCode}  ZIP Code
    Verify as per User Access  ${UserData}  ${MedicaidId}  Medicare Id
    Verify as per User Access  ${UserData}  ${StreetAddress}  Street Adress
    #Verify as per User Access  ${UserData}  ${DOB_Actual}  DOB
    ProtegrityPage.validate no masking    ${DOB_Actual}
    Capture Page Screenshot




##############################################################################################################################33333333

Verify as per User Access
    [Arguments]    ${UserData}  ${value}  ${field}
#    log    ${access}
    run keyword if  '${UserData.Access_Type}' == 'No Masking'  Validate No Masking    ${value}
    ...    ELSE IF  '${UserData.Access_Type}' == 'Full Masking'    Validate Full Masking    ${value}
    ...    ELSE IF  '${UserData.Access_Type}' == 'Partial Masking'    Validate Partial Masking    ${value}  ${field}
    ...    ELSE IF  '${UserData.Access_Type}' == 'OffshoreUser'    Validate OffshoreUser  Masking    ${value}

Validate No Masking
    [Arguments]    ${UserData}
    ${status} =  run keyword and return status   should not be true    "*" in """${UserData}"""
    set local variable    ${status}
    ${status} =    convert to string    ${status}
    should be equal as strings    ${Status}    True

Validate Full Masking
     [Arguments]    ${UserData}
     @{CharString} =     split string to characters   ${UserData}
     log   ${CharString}
     ${SizeOfCharString} =     get length    ${CharString}
     log    ${SizeOfCharString}
     #${Status} =    set variable    False
     FOR   ${i}    IN RANGE    0    ${SizeOfCharString}
        ${Status} =   set variable if  '${CharString}[${i}]' != '*'  True
     END
     log     ${Status}
     should not be equal as strings    ${Status}     True     String Contains

Validate Partial Masking
     [Arguments]    ${value}  ${field}
     run keyword if  '${field}' == 'ZIP Code'  Validate ZIP Code    ${value}
    ...    ELSE IF  '${field}' == 'Street Adress'    Validate Street Adress    ${value}
    ...    ELSE IF  '${field}' == 'PFirst Name'    Validate First Name    ${value}
    ...    ELSE IF  '${field}' == 'last Name'    Validate last Name    ${value}
    ...    ELSE IF  '${field}' == 'Member ID'    Validate Member ID    ${value}
    ...    ELSE IF  '${field}' == 'Email'    Validate Email    ${value}
    ...    ELSE IF  '${field}' == 'Extension'    Validate Extension    ${value}
    ...    ELSE IF  '${field}' == 'Phone'    Validate Phone    ${value}
    ...    ELSE IF  '${field}' == 'SSN'    Validate SSN    ${value}
    ...    ELSE IF  '${field}' == 'Medicare Id'    Validate Medicare Id    ${value}
    ...    ELSE IF  '${field}' == 'DOB'    Validate No Masking    ${value}

Validate OffshoreUser Masking
    [Arguments]    ${UserData}
    ${length}=    get length    ${UserData}
    ${length}=    convert to string    ${length}
    should be equal as strings  ${Length}    0






Extract SubStrings from String for last occurance
   [Arguments]  ${String}    ${NOOFChar}
   #${lastCount} =    Indexnumber for last occurence  ${String}
   #${lastCount} =    evaluate    ${lastCount}+1
   ${LenghtofString} =     get length    ${String}
   #${EndCount} =    evaluate    ${EndCount}+1
   ${lastCount} =    evaluate    ${LenghtofString}-${NOOFChar}
   ${MaskingString} =  get substring    ${String}     ${lastCount}   ${LenghtofString}
   ${NoNMaskingString} =  get substring   ${String}    0    ${lastCount}
   @{StringList} =    create list   ${NoNMaskingString}    ${MaskingString}
   [Return]   ${StringList}

Extract SubStrings from String for first occurance
   [Arguments]  ${String}     ${Startcout}   ${EndCount}
   #${Startcount} =    Indexnumber for first occurence    ${String}
   #${EndCount} =     get length    ${String}
   ${nonMaskingString} =  get substring    ${String}     ${Startcout}   ${EndCount}
   ${EndCount1} =     get length    ${String}
   ${MaskingString} =  get substring   ${String}    ${EndCount}    ${EndCount1}
   @{StringList} =    create list   ${nonMaskingString}    ${MaskingString}
   [Return]   ${StringList}

#Validate No Masking
#    [Arguments]    ${UserData}
#    ${status} =  run keyword and return status   should not be true    "*" in """${UserData}"""
#    set local variable    ${status}
#    ${status} =    convert to string    ${status}
#    should be equal as strings    ${Status}    True


Validate Masking
     [Arguments]    ${UserData}
     @{CharString} =     split string to characters   ${UserData}
     log   ${CharString}
     ${SizeOfCharString} =     get length    ${CharString}
     log    ${SizeOfCharString}
     #${Status} =    set variable    False
     FOR   ${i}    IN RANGE    0    ${SizeOfCharString}
        ${Status} =   set variable if  '${CharString}[${i}]' != '*'  True
     END
     log     ${Status}
     should not be equal as strings    ${Status}     True     String Contains *






##########################################################################################################################
Validate ZIP Code
     [Arguments]    ${ZipCodeString}
     ${ZipCode} =    Extract SubStrings from String for last occurance    ${ZipCodeString}     2
     log   ${ZipCode}
     Validate No Masking  ${ZipCode}[1]
     Validate Masking   ${ZipCode}[0]

Validate Street Adress
     [Arguments]    ${StreetAdress}
     @{StreetAdressList} =    split string    ${StreetAdress}     ,
     ${SubStreetAdressList} =    Extract SubStrings from String for first occurance    ${StreetAdressList}[0]     0     4
     log   ${SubStreetAdressList}
     Validate No Masking  ${SubStreetAdressList}[0]
     Validate Masking   ${SubStreetAdressList}[1]
     validate no masking   ${StreetAdressList}[1]
     validate no masking   ${StreetAdressList}[2]
     ${SubStreetAdressList2} =    Extract SubStrings from String for last occurance    ${StreetAdressList}[3]      2
     log   ${SubStreetAdressList2}
     Validate No Masking  ${SubStreetAdressList2}[1]
     Validate Masking   ${SubStreetAdressList2}[0]


Validate First Name
     [Arguments]    ${FirstName}
     ${FirstNamelist} =    Extract SubStrings from String for first occurance    ${FirstName}     0      4
     log   ${FirstNamelist}
     Validate No Masking  ${FirstNamelist}[0]
     Validate Masking   ${FirstNamelist}[1]

Validate last Name
     [Arguments]    ${lastName}
     ${lastNamelist} =    Extract SubStrings from String for first occurance    ${lastName}     0      4
     log   ${lastNamelist}
     Validate No Masking  ${lastNamelist}[0]
     Validate Masking   ${lastNamelist}[1]

Validate Member ID
     [Arguments]     ${UserData}
     ${List}=    Extract SubStrings from String for first occurance     ${UserData}     0     4
     Validate No Masking    ${List}[0]
     Validate Masking       ${List}[1]

Validate Email
     [Arguments]     ${UserData}
     ${List}=    Extract SubStrings from String for first occurance     ${UserData}     0     4
     Validate No Masking    ${List}[0]
     Validate Masking       ${List}[1]

Validate Extension
    [Arguments]     ${UserData}
    ${List1}=    Extract SubStrings from String for last occurance       ${UserData}    2
    Validate No Masking    ${List1}[1]
    Validate Masking      ${List1}[0]

Validate Phone
    [Arguments]     ${UserData}
    ${List1}=    Extract SubStrings from String for last occurance       ${UserData}    4
    Validate No Masking    ${List1}[1]
    Validate Masking      ${List1}[0]

Validate SSN
     [Arguments]    ${SSNString}
     ${SSN} =    Extract SubStrings from String for last occurance    ${SSNString}     4
     log   ${SSN}
     Validate No Masking  ${SSN}[1]
     Validate Full Masking   ${SSN}[0]

Validate Medicare Id
     [Arguments]    ${MedicareIdString}
     ${MedicareId} =    Extract SubStrings from String for first occurance    ${MedicareIdString}     0      4
     log   ${FirstNamelist}
     Validate No Masking  ${MedicareId}[0]
     Validate Masking   ${MedicareId}[1]







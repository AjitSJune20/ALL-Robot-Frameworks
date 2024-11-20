*** Settings ***
Resource  ../PageObjects/ProtegrityPage.robot
Resource  ../Definitions/HumanaGui.robot

*** Keywords ***
######      IMP ######
Verify Fields on IMP Banner
    [Arguments]    ${UserData}
    Search For Member     ${UserData}
    Select The Member
    Protegrity IMP Banner      ${UserData}

######EditAuth#####
Verify Fields on Edit Authrization Screen
    [Arguments]     ${UserData}
    set selenium implicit wait    10sec
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.SubscriberId1}
    click element    //a[@id='btnSearch']
    Navigate Authorization Edit Page      ${UserData}

### Create Letter
Verify Fields on Create Auth letter Screen
    [Arguments]     ${UserData}
    set selenium implicit wait    10sec
    Search For Member      ${UserData}
    Select The Member
    Navigate create letter page      ${UserData}

### MC->Tasks
TC_1998524_MC Task Screen Validation
    [Arguments]   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    View Task Screen Mask    ${UserData}

### MC->Tasks Additional
TC_1998539_MC Task Screen Validation
    [Arguments]   ${UserData}
    Search For Member   ${UserData}
    Select The Member
#    click element        //a[@id='noPoliciesConfirmButton']
    sleep     20sec
    Navigate to Tasks
    View Task Change Ownership Screen Mask    ${UserData}
    Set Follow Up Date Screen Mask    ${UserData}
    Grid Task Screen Mask    ${UserData}
    Member Level Task History Screen Mask    ${UserData}

### Member Search Grid
TC_1995523_Member Search Grid Screen Validation
    [Arguments]   ${UserData}
    Search For Member   ${UserData}
    Member Search Grid Screen Mask    ${UserData}

### Authorization/View CDR
TC_1998655 - DDM (CM) - Authorization/ViewCDR
	[Arguments]   ${UserData}
    View CDR Screen Mask    ${UserData}

Member Information Screen Validation
    [Arguments]    ${UserData}
    Search For Member    ${UserData}
    select the member
    Fields Validation in Member Info Screen    ${UserData}

Auth Attachment Screen Validation
    [Arguments]    ${UserData}
#    Auth Search Modified    ${UserData.AuthID}
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.SubscriberId1}
    click element    //a[@id='btnSearch']
    Navigate to Auth Attachment Screen
    View Attachment Screen Validation    ${UserData}

MyWork View CP CM Case Screen Validation
    [Arguments]    ${UserData}
    Navigate to MyWork CPCM Case
    MyWork CP CM Case Grid    ${UserData}
    MyWork CP Cm Case View Screen    ${UserData}


MyWork TasK Screen Validation
    [Arguments]    ${UserData}
    Navigate to MyWork Tasks
    MyWork Task Grid    ${UserData}
    MyWork View Task Screen Validation    ${UserData}
    MyWork Edit Task Screen Validation    ${UserData}

View MyWorkReferral Validation
    [Arguments]    ${UserData}
    Navigate to MyWork Referrals
#    sleep    180s
    MYWork Referral Grid Validation    ${UserData}
    MyWork View Referral Screen Validation    ${UserData}


View Clinical Consultations Validation
    [Arguments]    ${UserData}
    Navigate to Clinical Consultation
    MYWork Referral Grid Validation    ${UserData}
    MyWork View Referral Screen Validation    ${UserData}

Verify Fields on View Alternate Info
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
#    click element        //a[@id='noPoliciesConfirmButton']
#    wait until page does not contain  //*[@id="loading-ajax"]    35 seconds
    Navigate to Alternate Info
#    wait until page does not contain  //*[@id="loading-ajax"]    35 seconds
    set selenium implicit wait    10s
    View_Alternate_Info_Protegrity    ${UserData}

Verify Fields on Add Alternate Info
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    wait until page does not contain  //*[@id="loading-ajax"]    15 seconds
    Navigate to Alternate Info
    sleep    15s            #//div[@id='loading-ajax']
    set selenium implicit wait    10s
    Protegrity_Add_Alternate_Info    ${UserData}

Verify Fields on View MyWorkAuthorization
    [Arguments]  ${UserData}
    set selenium speed    1s
    Navigate to MyWork Authorizations
    Protegrity My worksAuthorization Validation    ${UserData}

Verify Fields on My works Consultation
    [Arguments]  ${UserData}
    set selenium speed    1s
    Navigate to MyWork Consultations
    Protegrity My works Consultation validation    ${UserData}

Verify Fields on View Notes
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    set selenium speed    1s
    Navigate to Notes
    Protegrity_View_Notes_Validation    ${UserData}

Verify Fields on View Member Consultation
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    set selenium speed    1s
    Navigate to Member Consultation
    Protegrity Member Consultations validation    ${UserData}

Verify Fields on Edit Comm Record
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    sleep    5s
    Navigate to Communication Record
    set selenium implicit wait    3s
    Protegrity Edit Communication Record    ${UserData}

Verify Fields on View Quality Review
    [Arguments]  ${UserData}
    set selenium speed    1s
#    Navigate to Authorizations
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.SubscriberId1}
    click element    //a[@id='btnSearch']
    ProtegrityPage.Protegrity View Quality Review    ${UserData}

Verify Fields on Edit Quality Review
    [Arguments]  ${UserData}
    set selenium speed    1s
#    Navigate to Authorizations
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.SubscriberId1}
    click element    //a[@id='btnSearch']
    ProtegrityPage.Protegrity Edit Quality Review    ${UserData}

Verify Fields on View Authorization
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.SubscriberId1}
    click element    //a[@id='btnSearch']
    ProtegrityPage.Protegrity View Authorization    ${UserData}

Verify Fields on Edit Discharge Plan
    [Arguments]  ${UserData}
    set selenium speed    1s
#    Navigate to Authorizations
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.SubscriberId1}
    click element    //a[@id='btnSearch']
    ProtegrityPage.Protegrity Edit Discharge Plan    ${UserData}


Verify Fields on View Clinical Consult
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    wait until page does not contain  //*[@id="loading-ajax"]    5 seconds
    Navigate to Clinical Consultation
    set selenium implicit wait    3s
    ProtegrityPage.View_Clinical_Consult_Protegrity    ${UserData}

Verify Fields on Discharge Plan
    [Arguments]  ${UserData}
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.SubscriberId1}
    click element    //a[@id='btnSearch']
    Protegrity Discharge Plan    ${UserData}

Verify Fields on Edit Clinical Consultation
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    wait until page does not contain  //*[@id="loading-ajax"]    5 seconds
    Navigate to Clinical Consultation
    set selenium implicit wait    3s
    ProtegrityPage.Protegrity Edit Clinical Consultation    ${UserData}

Member Banner screen
    [Arguments]  ${UserData}
    set selenium implicit wait    10sec
    Search For Member      ${UserData}
    Select The Member
    sleep    20s
    Verify Member Banner screen      ${UserData}

MemberCentral Communication Record Screen Validation
    [Arguments]    ${UserData}
    SearchPage.Member Search    ${UserData}
    Select The Member
    Navigate to Communication Record
    View Communication record Screen    ${UserData}
    Edit Communication Record screen Validation    ${UserData}
    Compare Communication Record    ${UserData}
    Comm record Historical Screen   ${UserData}








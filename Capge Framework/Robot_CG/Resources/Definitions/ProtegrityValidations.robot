*** Settings ***
Resource  ../PageObjects/SearchPage.robot
Resource  ../PageObjects/Alternateinfo.robot
Resource  ../PageObjects/CpCmCase.robot
Resource  ../PageObjects/FLAssessmentPR.robot
Resource  ../PageObjects/Authorization.robot
Resource  ../PageObjects/ManageQueue.robot
Resource  ../PageObjects/MyWorkAuthorization.robot
Resource  ../PageObjects/MyWorkConsultation.robot
Resource  ../PageObjects/MemberConsultation.robot
Resource  ../PageObjects/Clinical Review.robot
Resource  ../PageObjects/Notes.robot
Resource  ../PageObjects/ProtegrityHP.robot
Resource  ../PageObjects/ProtigrityPOMNavya.robot
Resource  ../Definitions/HumanaGui.robot
Resource  ../PageObjects/Navigation.robot
Resource  ../PageObjects/CommunicationRecord.robot
Resource  ../PageObjects/ClinicalConsultation.robot


*** Keywords ***






Verify Fields on View Alternate Info
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    wait until page does not contain  //*[@id="loading-ajax"]    5 seconds
    Navigate to Alternate Info
    sleep    15s            #//div[@id='loading-ajax']
    set selenium implicit wait    10s
    View_Alternate_Info_Protegrity    ${UserData}

Verify Fields on View Notes
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    set selenium speed    1s
    Navigate to Notes
    Protegrity_View_Notes_Validation    ${UserData}

Verify Fields on My works Consultation
    [Arguments]  ${UserData}
    set selenium speed    1s
    Navigate to MyWork Consultations
    Protegrity My works Consultation validation    ${UserData}


Verify Fields on View MyWorkAuthorization
    [Arguments]  ${UserData}
    set selenium speed    1s
    Navigate to MyWork Authorizations
    Protegrity My worksAuthorization Validation    ${UserData}

Verify Fields on View Member Consultation
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    set selenium speed    1s
    Navigate to Member Consultation
    Protegrity Member Consultations validation    ${UserData}

Verify Fields on View AuthLetter
    [Arguments]  ${UserData}
    set selenium speed    1s
    #Navigate to Authorizations
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.AuthId}
    click element    //a[@id='btnSearch']
    Protegrity View AuthLetter    ${UserData}

Verify Fields on View Quality Review
    [Arguments]  ${UserData}
    set selenium speed    1s
#    Navigate to Authorizations
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.AuthId}
    click element    //a[@id='btnSearch']
    Protegrity View Quality Review    ${UserData}

Verify Fields on View Authorization
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.AuthId}
    click element    //a[@id='btnSearch']
    Protegrity View Authorization    ${UserData}


Verify Fields on Add Alternate Info
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    wait until page does not contain  //*[@id="loading-ajax"]    5 seconds
    Navigate to Alternate Info
    sleep    15s            #//div[@id='loading-ajax']
    set selenium implicit wait    10s
    Protegrity_Add_Alternate_Info    ${UserData}


Verify Fields on View Manage Queue
    [Arguments]  ${UserData}
    Navigate to MyWork Manage Queues
    set selenium implicit wait    3s
    Protegrity View Manage Queue    ${UserData}

TC_1998524_MC Task Screen Validation
    [Arguments]   ${UserData}
    Search For Member   ${UserData}
    Select The Member
    View Task Screen Mask    ${UserData}

TC_1998539_MC Task Screen Validation
    [Arguments]   ${UserData}
    View Task Change Ownership Screen Mask
    Set Follow Up Date Screen Mask
    Grid Task Screen Mask
    Member Level Task History Screen Mask

TC_1995523_Member Search Grid Screen Validation
    [Arguments]   ${UserData}
    Member Search Grid Screen Mask    ${UserData}

View MyWorkReferral Validation
    [Arguments]    ${UserData}
    Navigate to MyWork Referrals
    MYWork Referral Grid Validation    ${UserData}
    MyWork View Referral Screen Validation    ${UserData}


Member Information Screen Validation
    [Arguments]    ${UserData}
    Search For Member    ${UserData}
    select the member
    Fields Validation in Member Info Screen    ${UserData}

Auth Attachment Screen Validation
    [Arguments]    ${UserData}
    Auth Search Modified    ${UserData.AuthID}
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


MemberCentral Communication Record Screen Validation
    [Arguments]    ${UserData}
    Member Search    ${UserData}
    Select The Member
    Navigate to Communication Record
    View Communication record Screen    ${UserData}
    Edit Communication Record screen Validation    ${UserData}
    Compare Communication Record    ${UserData}





Verify Fields on Edit Comm Record
    [Arguments]  ${UserData}
    Navigate to Communication Record
    set selenium implicit wait    3s
    Protegrity Edit Communication Record    ${UserData}


Verify Fields on Edit Clinical Consultation
    [Arguments]  ${UserData}
    Search For Member   ${UserData}
    Select The Member
    wait until page does not contain  //*[@id="loading-ajax"]    5 seconds
    Navigate to Clinical Consultation
    set selenium implicit wait    3s
    Protegrity Edit Clinical Consultation    ${UserData}


Verify Fields on Edit Quality Review
    [Arguments]  ${UserData}
    set selenium speed    1s
#    Navigate to Authorizations
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.AuthId}
    click element    //a[@id='btnSearch']
    Protegrity Edit Quality Review    ${UserData}

Verify Fields on Edit Discharge Plan
    [Arguments]  ${UserData}
    set selenium speed    1s
#    Navigate to Authorizations
    click element    //img[@alt='Search']
    click link    Record
    input text    //input[@id='authIdField']    ${UserData.AuthId}
    click element    //a[@id='btnSearch']
    Protegrity Edit Discharge Plan    ${UserData}







#    #***********************No Masking**************************
#    Validate No Masking    ${Alternateinfo.ZipCode_Alt_Info_Actual}
#    Validate No Masking    ${Alternateinfo.Email_Alt_Info_Actual}
#    Validate No Masking    ${Alternateinfo.StreetAdd_Alt_Info_Actual}


#Verify PartialFirst Access on Fields
#    [Arguments]  ${UserData}
#    set selenium implicit wait  5 Seconds
#    Member Search  ${UserData}
#
#Verify PartialLast Access on Fields
#    [Arguments]  ${UserData}
#    set selenium implicit wait  5 Seconds
#    Member Search  ${UserData}

#Verify FullRestricted Access on Fields
#    [Arguments]  ${UserData}
#    set selenium implicit wait  5 Seconds
#    Member Search  ${UserData}
#
#Verify No Access on Fields
#    [Arguments]  ${UserData}
#    set selenium speed    1s
#    ${Result}= Page Should Contain Element  ${Xpath}
#    Run Keyword Unless  '${RESULT}'=='FAIL'  Keyword args*
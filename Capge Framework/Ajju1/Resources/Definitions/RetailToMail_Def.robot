# To execute RTM application : robot -i TC01 -d results Resources/Definitions/RetailToMailDef.robot
*** Settings ***
Library    SeleniumLibrary
#Resource  ../PageObjects/RetailToMail.robot
Resource  ../../Data/TestData.robot
Resource  ../PageObjects/RetailToMail_PO.robot


#Test Teardown   Delete Unnecessary Screenshots

*** Test Cases ***
HSS_HomePage
    [Template]  HomePage
    [Tags]  TC01
    ${M1}
    ${M2}
#    ${M3}
#    ${M4}
#    ${M5}

*** Keyword ***
HomePage
    [Arguments]  ${UserData}
    log to console  ${UserData.MemberID} ${UserData.DrugName}
    Begin Web Test
    Load HSS Landing Page
    VerifyLanding_Page
    Click_RxConnectPro_Link
    Verify_RxConnectMemberID
    Enter_MemberID  ${UserData}
    Capture ScreenShot  ${UserData}     ${RxConnect_MemberID}
    Verify_RTM_HomePage     ${UserData}
    Click on RTM Link
    Verify_RTM_Form_Header
    Fill_Associate_View_Member_Information_Form
    Select Checkbox and Click on Add a Presciption
    Enter the Drug Details and Click On Calculate Button     ${UserData}
    Capture ScreenShot  ${UserData}     ${Btn_Calculate}
    Retrive Drug Cost to Application and Store in Excel    ${UserData}


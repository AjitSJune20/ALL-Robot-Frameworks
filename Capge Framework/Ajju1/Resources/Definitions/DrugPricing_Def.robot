# To execute DrugPricing Application : robot -d results Resources/Definitions/DrugPricingDef.robot

*** Settings ***
Documentation  DrugPricing Validation Script
Resource  ../PageObjects/DrugPricing_PO.robot
Library  ../../CustomLibs/DataCreation.py
Resource  ../../CustomLibs/Config.robot
Resource  ../../Data/TestData.robot
Resource  ../../CommonFunctionLibrary/LandingPage.robot

*** Keywords ***
DrugPricing
    [Arguments]  ${UserData}
    log to console  ${UserData.MemberID} ${UserData.DrugName}
    Load HSS Landing Page
    Click RxConnectPro Link
    Enter MemberID  ${UserData}
    Enter DrugName   ${UserData}
    Select Drug Dose   ${UserData}
    Enter DrugQuantity  ${UserData}
    Select Drug Frequency   ${UserData}
    Click On Search Button
    Retrive Table Data  ${UserData}
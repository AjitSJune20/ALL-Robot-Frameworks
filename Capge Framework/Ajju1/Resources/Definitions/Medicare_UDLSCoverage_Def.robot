#How to Execute :  robot -i TC01 -d results Resources/Definitions/Medicare_UDLSCoverage_Def.robot
*** Settings ***
Documentation  This script is used for Validating Medicare UDLSCoverage
Library    SeleniumLibrary
Library  ../../CustomLibs/DataCreation.py
Resource  ../../CustomLibs/Config.robot
Resource  ../../Data/TestData.robot
Resource  ../../CommonFunctionLibrary/LandingPage.robot
Resource  ../PageObjects/Medicare_UDLSCoverage_PO.robot

##Prerequisite
##Test Setup     register keyword to run on failure      Capture ScreenShot on Coverage Page
#Suite Setup     Begin Web Test      #it launchees browser without URL and maximize it
#Suite Teardown    End Web Test      #It Closes the browses
#Test Teardown   Delete Unnecessary Screenshots
#*** Test Cases ***
#TC_MedicareUDLSCoverage
#    [Template]    MedicareUDLSCoverage
#    [Tags]  TC01
#     ${UDLS_M1}
#     ${UDLS_M2}
#     ${UDLS_M3}
#     ${UDLS_M4}
*** Keyword ***
MedicareUDLSCoverage
    [Arguments]  ${UserData}
    log to console  \n${UserData.IN_ZipCode} ${UserData.IN_PlanName}
    log to console  ${UserData.DrugName} ${UserData.LabelName}
    Load MedicareUDLSCovegare Page
    Enter ZipCode   ${UserData}
    Click Search for Plans
    OptionalStep-Select CityName RadioButton
    Capture ScreenShot  ${UserData}    ${Search for Plans}
    select plan name   ${UserData}
    Click On Search DrugList
    Click on No I'd rather Enter My Prescriptions Manually
    Enter DrugName  ${UserData}
    select drug name from list  ${UserData}
    Capture ScreenShot  ${UserData}    ${DrugName}
    OptionalStep-Select DrugName RadioButton    ${UserData}
    select dose name  ${UserData}
    click on addtolist
    click on checkcoverage
    Capture All Displayed Coverage and Add that to Report     ${UserData}  #Capturing all coverage,Verify Cverage,Store Result
    Capture ScreenShot  ${UserData}    ${All_Coverage}                      #Parameter2: Xpath of Screenshot Page
    Verify Coverage Match  ${UserData}                                      # Verify that given coverage is matched
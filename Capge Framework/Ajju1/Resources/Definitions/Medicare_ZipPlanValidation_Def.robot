#How to Execute :  robot -i TC01 -d results Resources/Definitions/Medicare_ZipPlanValidation_Def.robot
*** Settings ***
Documentation  This script is used for  Medicare ZipPlan Validation
Library    SeleniumLibrary
Library  ../../CustomLibs/DataCreation.py
Resource  ../../CustomLibs/Config.robot
Resource  ../../Data/TestData.robot
Resource  ../../CommonFunctionLibrary/LandingPage.robot
Resource  ../PageObjects/Medicare_ZipPlanValidation_PO.robot

##Prerequisite
##Test Setup     register keyword to run on failure      Capture ScreenShot on Coverage Page
#Suite Setup     Begin Web Test      #it launchees browser without URL and maximize it
#Suite Teardown    End Web Test      #It Closes the browses
#Test Teardown   Delete Unnecessary Screenshots
#*** Test Cases ***
#TC_MedicareUDLSCoverage
#    [Template]    MedicareZipPlanValidation
#    [Tags]  TC01
#    ${ZipPlan_M1}
#    ${ZipPlan_M2}
#    ${ZipPlan_M3}
#    ${ZipPlan_M4}
*** Keyword ***
MedicareZipPlanValidation
    [Arguments]  ${UserData}
    log to console  \n${UserData.IN_ZipCode} ${UserData.IN_PlanName}
    Load MedicareUDLSCovegare Page
    Enter ZipCode   ${UserData}
    Click Search for Plans
    OptionalStep-Select CityName RadioButton
    select plan name   ${UserData}
    Capture ScreenShot-ZipPlanName  ${UserData}    #${Xpath_ElementView_Screenshot_Screen}
#    Capture All Displayed Coverage and Add that to Report     ${UserData}  #Capturing all coverage,Verify Cverage,Store Result
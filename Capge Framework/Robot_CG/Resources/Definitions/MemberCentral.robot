*** Settings ***
Library  SeleniumLibrary
Library  ../../CustomLibs/DataCreation.py
Resource  ../../Data/Config.robot
Resource  ../PageObjects/LandingPage.robot
Resource  ../PageObjects/SearchPage.robot
Resource  ../PageObjects/Navigation.robot
Resource  ../Definitions/HumanaGui.robot
Resource  ../PageObjects/Notes.robot
Resource  ../PageObjects/CommunicationRecord.robot


*** Keywords ***
User Create MC Communication Record
    [Arguments]    ${UserData}
    Search For Member    ${UserData}
    select the member
    Navigate to Communication Record
    #Create MC Communication Record    ${UserData}

User Create Cancel MC Communication Record
     [Arguments]    ${UserData}
     Cancel MC Communication Record    ${UserData}

User Edit MC Communication Record
    [Arguments]    ${UserData}
     Edit MC Communication Record

User Cancel Edit MC Communication Record
    Edit Cancel MC Communication Record

User Create Notes
    [Arguments]    ${UserData}
    Search For Member    ${UserData}
    select the member
    Navigate to Notes
    Create Notes    ${UserData}
    View Notes    ${UserData}

Member Central Provider Search
    [Arguments]    ${UserData}
    Search For Member    ${UserData}
    Select The Member
    Navigate to Provider Search
    Search for Provider    ${UserData}

User Edit Notes
    [Arguments]    ${UserData}
    Edit Notes    ${UserData}



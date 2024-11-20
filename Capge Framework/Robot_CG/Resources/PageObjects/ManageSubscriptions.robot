*** Settings ***
Library  SeleniumLibrary
Library    String
Resource  ../../Data/TestData.robot
Library  DateTime
Resource  ../PageObjects/Intervention.robot



*** Variables ***
${SelectlIntervention}=  //select[@id='ddlIntervention']
${SelectlSubscription}=  //select[@id='ddlSubscription']
${SubscriptionHeader}=  //table[@id='AsignedSubsc-data-table']//th[text()='Subscription']
${InterventionHeader}=  //table[@id='AsignedSubsc-data-table']//th[text()='Intervention']
${VendorHeaderManageSub}=     //table[@id='AsignedSubsc-data-table']//th[text()='Vendor']
${LastUpdateOnHeader}=     //table[@id='AsignedSubsc-data-table']//th[text()='Last Update On']
${LastUpdateByHeader}=     //table[@id='AsignedSubsc-data-table']//th[text()='Last Update By']
${btnAddRemove}=  //*[@id="btnAddRemove"]


*** Keywords ***
Navigate To Manage Subscriptions Page and Verify
     [Arguments]    ${UserData}
    set selenium implicit wait  10 Seconds
    click link    Manage Intervention
    click link    Manage Subscriptions
    select from list by value       ${SelectlIntervention}     ${UserData.Search}
     page should contain element     ${SelectlSubscription}
     page should contain element     ${SubscriptionHeader}
     page should contain element     ${InterventionHeader}
     page should contain element     ${VendorHeaderManageSub}
     page should contain element     ${LastUpdateOnHeader}
     page should contain element     ${LastUpdateByHeader}
     page should contain element     ${btnAddRemove}
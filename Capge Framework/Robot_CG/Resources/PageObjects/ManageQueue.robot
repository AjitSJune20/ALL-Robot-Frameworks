*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  ../../CustomLibs/DataCreation.py

*** Variables ***
${ManageQueue} =    //a[@href="/cgx/MyWork/MyWorkManageQueue/Index"]
${SearchQueue} =    //a[@id="button-managequeue-searchqueue"]
${QueueName} =    //input[@id="QueueNameSearch"]
${FindBtn} =    //a[contains(text(),'Find')]
${AddSelected} =    //a[@id='btn-add-selected']
${AddQueue} =   //a[@id='add-queues-btn']
${FName} =    //input[@id='FirstName']
${LName} =    //input[@id='LastName']
${AddUserBtn} =    //a[@id='LastNameAddbtn']
${AssociateBtn} =    //a[@id='associate_btnsave']
${MyQueueList} =    //a[@id='btnQueueDropdown']
${SelectedQueue} =    //div[@id="QueueSelectedGrid-gridContent"]
${AssociateQueue} =    //div[@id="DirectUserSelectedGrid"]
${SHEET_NAME} =    QueuesResults
${INDEX_NAME} =    QueueName

*** Keywords ***
Navigate to Manage Queue
    [Arguments]    ${UserData}
     click link    My Work
     click link    Manage Queues
     click element    ${SearchQueue}
     input text    ${QueueName}    ${UserData.QueueName}
     click element  ${FindBtn}

Search for New Member Queue
     input text    ${QueueName}    New Member
     sleep    1 Seconds
     set focus to element    ${FindBtn}
     click element  ${FindBtn}

Validate the Queue Table
     [Arguments]    ${UserData}
     wait until page contains element    //td[starts-with(text(),'${UserData.QueueName}')]/following::td[1]
     ${OwnerName} =  GET TEXT    //td[starts-with(text(),'${UserData.QueueName}')]/following::td[1]
     should be equal as strings  ${OwnerName}   ${UserData.OwnerName}
     ${OwnerID} =  GET TEXT    //td[starts-with(text(),'${UserData.QueueName}')]/following::td[2]
     should be equal as strings  ${OwnerID}    ${UserData.OwnerID}
     ${CoOwnerName}=  get text    //td[starts-with(text(),'${UserData.QueueName}')]/following::td[3]
     should be equal as strings  ${CoOwnerName}   ${UserData.CoOwnerName}
     ${CoOwnerID}=  get text    //td[starts-with(text(),'${UserData.QueueName}')]/following::td[4]
     should be equal as strings  ${CoOwnerID}   ${UserData.CoOwnerID}


User Update The Status
   [Arguments]     ${QueueStatus}    ${UserData}
   set to dictionary  ${UserData}  Status   ${QueueStatus}
   ${HEADER} =    get dictionary keys    ${UserData}    sort_keys=False
   ${VALUE} =    get dictionary values    ${UserData}    sort_keys=False
   write_to_file   ${HEADER}   ${VALUE}
   format_output_data
   write_to_excel    ${SHEET_NAME}    QueueName
   format_excel    ${SHEET_NAME}

Associate the Queue
    [Arguments]     ${UserData}
    sleep    2 seconds
    click element    //td[starts-with(text(),'${UserData.QueueName}')]//preceding::td[1]

My Manage Queue Page
    [Arguments]    ${UserData}
    set selenium implicit wait    5 seconds
    sleep    2 seconds
    scroll element into view    ${AddSelected}
    click element    ${AddSelected}
    sleep    1 Seconds
    click element    ${AddQueue}
    sleep    1 seconds
    wait until page contains element    ${FName}
    input text    ${FName}    ${UserData.FName}
    input text    ${LName}    ${UserData.LName}
    sleep    1 seconds
    click element    ${AddUserBtn}
    sleep    1 Second
    click element    ${AssociateBtn}

Validate in the LTTS Case
    [Arguments]     ${UserData}

    sleep    2 Seconds
    click link    My Work
    click link    LTSS Cases
    wait until element is visible    ${MyQueueList}
    click element    ${MyQueueList}
    ${AQueue} =    run keyword and return status    element should be visible    //a[contains(text(),'${UserData.QueueName}')]
    Capture Page Screenshot



Protegrity View Manage Queue
    [Arguments]  ${UserData}
    set selenium speed    1s
    click element    ${SearchQueue}
    input text    ${QueueName}    LTSS
    click element  ${FindBtn}
    sleep    5s
    click element    //div/label[@for='QueueSearchGridselectAll']
    sleep    5s
    click element    ${AddSelected}
    click element    ${AddQueue}

    ${FullName}    get text    //table//tbody/tr[1]/td[2]
    ${Name}      split string   ${FullName}    ${SPACE}
    ${MQ_FirstName}    strip string     ${Name}[0]
    ${MQ_LastName}    strip string     ${Name}[1]

    should be equal as strings  ${MQ_FirstName}  ${UserData.FirstName}
    should be equal as strings  ${MQ_LastName}  ${UserData.LastName}
    reload page







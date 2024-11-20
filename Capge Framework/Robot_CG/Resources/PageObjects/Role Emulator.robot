*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Data/TestData.robot


*** Variables ***

${RoleEmulator}=  //ul[@class='dropdown']//a[contains(text(),'Role Emulator')]
${RoleBtn}=  //span[@class='select2-selection select2-selection--single' and @aria-labelledby='select2-Roles-container']
${RoleEdit}=  //span[@class='select2-search select2-search--dropdown']/input[@class='select2-search__field']
${FilterGroup}=  //span[@class='select2-selection select2-selection--single' and @aria-labelledby='select2-FilterGroup-container']
${GroupInput}=  //span[@class="select2-search select2-search--dropdown"]/input[@class="select2-search__field"]
##${ConfirmBtn}=  //a[@id="message-alert-yes-button"]
${RoleSummaryBtn}=  //a[@id="roleAddBtn"]
${BusinessUnit}=  //ul[@id='BusinessFunction']
${ApplyBtn}=  //*[@id="btnRoleApply" and @class="button button-green"]
${RestBtn}=  //*[@id="btnRoleReset"]
${ConfirmBtn}=  //li/a[@id="message-alert-yes-button" and @class="button button-green"]
${CurrentRole}=  //span[@class='humana-font right emulated-user-role']
${RoleRevertYes}=  //a[@id="user-role-revert-message-alert-yes-button"]
${RoleRevertNo}=  //a[@id="user-role-revert-message-alert-no-button"]
${RoleConfirm}=  //a[@id="role-revert-confirm-message-alert-ok-button"]
${Loading} =    //*[@id="loading-ajax"]


*** Keywords ***
Click on the Admin Tab
    set selenium implicit wait    5 Seconds
    sleep    2 Seconds
    click link  Admin

Click on the Role Emulator
    set selenium implicit wait    5 Seconds
    click element  ${RoleEmulator}
    page should contain element    ${RoleBtn}

Select the Roles
    [Arguments]  ${UserData}
    set selenium implicit wait  10 seconds
    ${PageLoading} =    run keyword and return status  element should be visible    ${Loading}    None
    RUN KEYWORD IF    ${PageLoading}    Page Loading Wait
    click element  ${RoleBtn}
    click element  //li[contains(text(),'${UserData.Role}')]


Select the Filter Group
    [Arguments]  ${UserData}
    set selenium implicit wait  10 seconds
    page should contain element  ${FilterGroup}
    click element  ${FilterGroup}
    click element  //option[contains(text(),'${UserData.FilterGroup}')]

Business Unit Validation
    [Arguments]  ${UserData}
    set selenium implicit wait  5 seconds
    ${Skip} =    run keyword and return status  should not be equal as strings  ${UserData.Role}  Default Role
    RUN KEYWORD IF    ${Skip}    Run the Bussiness Condtion    ${UserData}

Run the Bussiness Condtion
    [Arguments]  ${UserData}
    set selenium implicit wait  5 seconds
    ${PageLoading} =    run keyword and return status  element should be visible    ${Loading}    None
    RUN KEYWORD IF    ${PageLoading}    Page Loading Wait
    click element  ${RoleSummaryBtn}
    page should contain element  //*[@id="select2-BusinessFunctionsFilter-container"]
    sleep  2 seconds
    ${test}=  Get text  //ul[@id='BusinessFunction']
    ${test}=  Replace String Using Regexp  ${test}  \n  ${SPACE}
    should be equal as strings  ${test}  ${UserData.Condition}
    page should contain element  ${ApplyBtn}

Page Loading Wait
    wait until page does not contain    ${Loading}

Apply User Role
    set selenium implicit wait  20 seconds
    wait until element is visible    ${RoleSummaryBtn}
    click element  ${RoleSummaryBtn}
    click element  ${ApplyBtn}
    sleep    3 Seconds
    click element  ${ConfirmBtn}

*** Variables ***
${EixtingRole} =    //span[@class='humana-font right emulated-user-role']
${Confirm} =    //a[@id='user-role-revert-message-alert-yes-button']
${Okbtn} =    //a[@id='role-revert-confirm-message-alert-ok-button']
*** Keywords ***

Revert the Role
    set selenium implicit wait    5 Seconds
    click element    ${EixtingRole}
    wait until page contains element    ${Confirm}
    sleep    1 Seconds
    click element   ${Confirm}
    sleep    2 Seconds
    click element    ${Okbtn}
    sleep    2 Second





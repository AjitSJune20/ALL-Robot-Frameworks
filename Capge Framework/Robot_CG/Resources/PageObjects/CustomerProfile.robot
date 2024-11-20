*** Settings ***
Library  SeleniumLibrary
Library    String
Resource  ../../Data/TestData.robot
Library  DateTime


*** Variables ***
${GroupName}=  //input[@id='GroupName']
${GroupNumber}=  //input[@id='GroupNumber']
${GroupEnterpriseNo}=  //input[@id='GroupEnterpriseNo']
${GroupLinkNumber}=  //input[@id='GroupLinkNumber']
${GroupLinkName}=     //input[@id='GroupLinkName']
${MedicareContractNbr}=     //input[@id='MedicareContractNbr']
${GroupPreEffe}=       //input[@id='GroupPreEffe']
${GroupCustID}=  //input[@id='GroupCustID']
${GroupEffDate}=  //input[@id='GroupEffDate']
${GroupTermDate}=  //input[@id='GroupTermDate']
${GroupSellingMarket}=  //select[@id='GroupSellingMarket']
${SVCMarket}=  //select[@name='SVCMarket']
${Coalation}=  //select[@name='Coalation']
${GroupRenewDate}=     //input[@id='GroupRenewDate']
${ExpRenewalDate}=  //input[@id='ExpRenewalDate']
${PlanBenefitPackageID}=  //input[@id='PlanBenefitPackageID']
${GroupBusinessSegment}=  //select[@id='GroupBusinessSegment']
${GroupStatus}=  //select[@name='GroupStatus']
${FinProd}=  //select[@name='FinProd']
${CustomFullyIn}=  //select[@name='CustomFullyIn']
${GroupPlatform}=  //select[@name='GroupPlatform']
${NationalAcc}=  //select[@name='NationalAcc']
${StateOfIssue}=  //select[@name='StateOfIssue']
${SearchCustProfile}=  //input[@value='Search']
${GroupSearchTraingle1}=  //*[@id="ui-id-1"]
${btnReset}=  //input[@id='btnReset']
${btnDetails}=  //button[text()='Details!']
${EnterpriseNoHeader}=  //table[@id='ent-data-table']//th[text()='Enterprise No']
${GroupNameHeader}=  //table[@id='ent-data-table']//th[text()='Group Name']
${DetailsHeader}=  //table[@id='ent-data-table']//th[text()='Details']
${ShowingEntriesCustProfile}=  //*[@id="ent-data-table_info"]
${SearchBtnCustProfile}=  //input[@type='search']
${GroupHeaderCustProfile}=  //table[@id='grp-data-table']//th[text()='Group#']
${NameHeader}=  //table[@id='grp-data-table']//th[text()='Name']
${PlatformHeader}=  //table[@id='grp-data-table']//th[text()='Platform']
${GroupTypeHeader}=  //table[@id='grp-data-table']//th[text()='GroupType']
${BusinessSegmentHeader}=  //table[@id='grp-data-table']//th[text()='Business Segment']
${MembershipCountHeader}=  //table[@id='grp-data-table']//th[text()='MembershipCount']
${EffDateHeaderCustProfile}=  //table[@id='grp-data-table']//th[text()='EffDate']
${StatusHeaderCustProfile}=  //table[@id='grp-data-table']//th[text()='Status']
${TermDateHeader}=  //table[@id='grp-data-table']//th[text()='TermDate']
${ProductTypeHeader}=  //table[@id='grp-data-table']//th[text()='Product Type']
${GrpDetailsHeader}=  //table[@id='grp-data-table']//th[text()='Details']
${AddModifyProgramHeader}=  //table[@id='grp-data-table']//th[text()='Add/Modify Program']
${BtnAddModifyProgram}=  //button[text()='Add/Modify Program!']
${EnterpriseNo}=  //input[@id='EnterpriseNo']
${GroupType}=  //input[@id='GroupType']
${GroupStatusMultiPogramEntry}=  //input[@id='GroupStatus']
${GroupBusinessSegmentMultiPogramEntry}=  //input[@id='GroupBusinessSegment']
${PackageID}=  //input[@id='PackageID']
${GroupPlatformMultiPogramEntry}=  //input[@id='GroupPlatform']
${GroupMembershipCount}=  //input[@id='GroupMembershipCount']
${PlanOptionID}=  //input[@id='PlanOptionID']
${SellingMarket}=  //input[@id='SellingMarket']
${MajorLOB}=  //input[@id='MajorLOB']
${DivisionNo}=  //input[@id='DivisionNo']
${SVCMarketMultiPogramEntry}=  //input[@id='SVCMarket']
${FinProdMultiPogramEntry}=  //input[@id='FinProd']
${StateOfIssueMultiPogramEntry}=  //input[@id='StateOfIssue']
${RowExist}=    //table[@id='ent-data-table']/tbody/tr
${Previous}=    //a[text()='Previous']
${Next}=    //a[text()='Next']


*** Keywords ***
Navigate To CustomerGroupSearch Page and Verify
     [Arguments]    ${UserData}
    set selenium implicit wait  10 Seconds
    click link    Customer Profile
    click link    Customer Group Search
    wait until page contains element    ${GroupName}
    input text       ${GroupName}     ${UserData.GroupName}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    input text       ${GroupNumber}     ${UserData.GroupNumber}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element     ${GroupSearchTraingle1}
    click element     ${btnReset}
    input text       ${GroupEnterpriseNo}     ${UserData.EnterpriseNo}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element     ${GroupSearchTraingle1}
    click element     ${btnReset}
    input text       ${GroupLinkNumber}     ${UserData.LinkNo}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    input text       ${GroupLinkName}     ${UserData.LinkName}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    select from list by value        ${GroupSellingMarket}     ${UserData.SellingMarket}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element     ${GroupSearchTraingle1}
    click element     ${btnReset}
    select from list by value        ${SVCMarket}     ${UserData.SVCMarket}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element     ${GroupSearchTraingle1}
    click element     ${btnReset}
    page should contain element     ${MedicareContractNbr}
    page should contain element     ${GroupPreEffe}
    page should contain element     ${GroupCustID}
    input text       ${GroupEffDate}     ${UserData.EffectiveDate}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    Execute Javascript    window.scrollTo(0,30);
    Scroll Element Into View    ${GroupSearchTraingle1}
    Wait Until Element is visible    ${GroupSearchTraingle1}     timeout=5s
    click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    input text       ${GroupRenewDate}     ${UserData.RenewalDate}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
     input text       ${GroupTermDate}     ${UserData.TermDate}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    select from list by value        ${Coalation}     ${UserData.Coalition}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    select from list by index     ${GroupBusinessSegment}       3
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    select from list by value        ${GroupStatus}     ${UserData.Status}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    select from list by index     ${FinProd}       1
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
   select from list by value        ${CustomFullyIn}     ${UserData.CustomeFullyIn}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
   select from list by value        ${GroupPlatform}     ${UserData.Platform}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
   select from list by value        ${NationalAcc}     ${UserData.NationalAcc}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}
    select from list by index     ${StateOfIssue}       10
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
    double click element    ${GroupSearchTraingle1}
    click element     ${btnReset}


Search Group No And Verify
     [Arguments]    ${UserData}
    set selenium implicit wait  10 Seconds
    input text       ${GroupNumber}     ${UserData.GroupNumber}
    click element     ${SearchCustProfile}
    page should contain element     ${RowExist}
     page should contain element     ${EnterpriseNoHeader}
     page should contain element     ${GroupNameHeader}
     page should contain element     ${DetailsHeader}
    page should contain element     ${Previous}
    page should contain element     ${Next}
    page should contain element     ${ShowingEntriesCustProfile}
    click button    ${btnDetails}
    page should contain element     ${GroupHeaderCustProfile}
     page should contain element     ${NameHeader}
     page should contain element     ${PlatformHeader}
     page should contain element     ${GroupTypeHeader}
     page should contain element     ${BusinessSegmentHeader}
     page should contain element     ${MembershipCountHeader}
     page should contain element     ${StatusHeaderCustProfile}
     page should contain element     ${EffDateHeaderCustProfile}
     page should contain element     ${TermDateHeader}
     page should contain element     ${ProductTypeHeader}
     page should contain element     ${GrpDetailsHeader}
     page should contain element     ${AddModifyProgramHeader}
     click button     ${BtnAddModifyProgram}
     page should contain element     ${EnterpriseNo}
     page should contain element     ${GroupType}
     page should contain element     ${GroupStatusMultiPogramEntry}
     page should contain element     ${GroupNumber}
     page should contain element     ${GroupName}
     page should contain element     ${GroupEffDate}
     page should contain element     ${GroupTermDate}
     page should contain element     ${GroupLinkName}
     page should contain element     ${GroupLinkNumber}
     page should contain element     ${DivisionNo}
     page should contain element     ${GroupBusinessSegmentMultiPogramEntry}
     page should contain element     ${GroupRenewDate}
     page should contain element     ${PackageID}
     page should contain element     ${GroupPlatformMultiPogramEntry}
     page should contain element     ${GroupMembershipCount}
     page should contain element     ${PlanOptionID}
     page should contain element     ${SellingMarket}
     page should contain element     ${MajorLOB}
     page should contain element     ${SVCMarketMultiPogramEntry}
     page should contain element     ${FinProdMultiPogramEntry}
     page should contain element     ${StateOfIssueMultiPogramEntry}

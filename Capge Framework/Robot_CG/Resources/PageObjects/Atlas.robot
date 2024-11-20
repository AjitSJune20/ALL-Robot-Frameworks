*** Settings ***
Library  SeleniumLibrary
Library    String
Resource  ../../Data/TestData.robot
Library  DateTime

*** Variables ***
${VendorsSearch}=  //input[@id='txtVendorSearch']
${SearchBtn}=  //input[@value='Search']
${showAllBtn}=  //input[@value='Show All']
${AddVendorBtn}=  //span[@class='glyphicon glyphicon-plus']
${ShowEntriesDropdown}=  //select[@name='vendortable_length']
${VendorCodeTableHeader}=  //table[@id='vendortable']//th[text()='Vendor Code']
${VendorNameTableHeader}=  //table[@id='vendortable']//th[text()='Vendor Name']
${VendorShortNameTableHeader}=  //table[@id='vendortable']//th[text()='Vendor Short Name']
${EffectiveDateTableHeader}=  //table[@id='vendortable']//th[text()='Effective Date']
${EndDateTableHeader}=  //table[@id='vendortable']//th[text()='End Date']
${EditTableHeader}=  //table[@id='vendortable']//th[text()='Edit']
${ShowingEntries}=  //*[@id='vendortable_info']
${PreviousBtn}=  //a[text()='Previous']
${NextBtn}=  //a[text()='Next']
${AFMDLink}=  //a[contains(@href,'/AtlasUIConfig/VendorConfig/VendorDetails?VendorId=139')]
${VendorCode}=  //input[@id='VendorCode']
${VendorName}=  //input[@id='VendorName']
${VendorShortName}=  //input[@id='VendorShortName']
${VendorEffectiveDate}=  //input[@id='VendorEffectiveDate']
${VendorEndDate}=  //input[@id='VendorEndDate']
${VendorChannelID}=  //select[@id='VendorChannelID']
${VendorShortNote}=  //*[@id='VendorShortNote']
${VendorEndDate}=  //input[@id='VendorEndDate']
${ContactTypeHeader}=  //table[@id='tblContacts']//td[@aria-label='Contact Type: activate to sort column descending']
${ContactNameHeader}=  //table[@id='tblContacts']//td[@aria-label='Contact Name: activate to sort column ascending']
${ContactIDHeader}=  //table[@id='tblContacts']//td[@aria-label='Contact ID: activate to sort column ascending']
${ContactPhoneHeader}=  //table[@id='tblContacts']//td[@aria-label='Contact Phone: activate to sort column ascending']
${ContactExtHeader}=  //table[@id='tblContacts']//td[@aria-label='Contact Ext: activate to sort column ascending']
${ContactEmailHeader}=  //table[@id='tblContacts']//td[@aria-label='Contact Email: activate to sort column ascending']
${StatusHeader}=  //table[@id='tblContacts']//td[@aria-label='Status: activate to sort column ascending']
${ContactShortNoteHeader}=  //table[@id='tblContacts']//td[@aria-label='Contact Short Note: activate to sort column ascending']
${VendorAddressExpand}=  //span[@class='ui-accordion-header-icon ui-icon ui-icon-triangle-1-e']
${AddressTypeHeader}=  //table[@id='tblAddress']//th[text()='Address Type']
${Address1Header}=  //table[@id='tblAddress']//th[text()='Address 1']
${Address2Header}=  //table[@id='tblAddress']//th[text()='Address 2']
${Address3Header}=  //table[@id='tblAddress']//th[text()='Address 3']
${CityHeader}=  //table[@id='tblAddress']//th[text()='City']
${StateCodeHeader}=  //table[@id='tblAddress']//th[text()='State Code']
${ZipCodeHeader}=  //table[@id='tblAddress']//th[text()='Zip Code']
${BackBtn}=  //button[text()=' Back']
${VendorCode}=  //input[@id='VendorCode']
${VendorName}=  //input[@id='VendorName']
${VendorShortName}=  //input[@id='VendorShortName']
${VendorEffectiveDate}=  //input[@id='VendorEffectiveDate']
${VendorEndDate}=  //input[@id='VendorEndDate']
${VendorChannelID}=  //select[@id='VendorChannelID']

${AddVendor}=  //input[@value='Save']
${SuccessMsg}=  //span[text()='Vendor has been stored Successfully.']
${UpdateVendor}=  //input[@value='Update Vendor']
${SuccessUpdateMsg}=  //span[text()='Vendor has been updated Successfully.']


*** Keywords ***
Navigate To Vendors
    set selenium implicit wait  10 Seconds
    click link    Vendors
    click link    Vendor List

VerifyPage
        page should contain textfield  ${VendorsSearch}
        page should contain element    ${SearchBtn}
        page should contain element    ${showAllBtn}
        page should contain element    ${AddVendorBtn}
        select from list by value  ${ShowEntriesDropdown}    10
     select from list by value  ${ShowEntriesDropdown}    25
     select from list by value  ${ShowEntriesDropdown}    50
     select from list by value  ${ShowEntriesDropdown}    100
     page should contain element    ${VendorCodeTableHeader}
     page should contain element    ${VendorNameTableHeader}
     page should contain element    ${VendorShortNameTableHeader}
     page should contain element    ${EffectiveDateTableHeader}
     page should contain element    ${EndDateTableHeader}
     page should contain element    ${EditTableHeader}
     page should contain element    ${ShowingEntries}
     page should contain element    ${PreviousBtn}
     page should contain element    ${NextBtn}
     page should contain element    ${AFMDLink}

SearchVendor
    [Arguments]    ${UserData}
    set selenium implicit wait  10 Seconds
    input text    ${VendorsSearch}      ${UserData.VendorName}
    click button    ${SearchBtn}
    click link    ${AFMDLink}

VerifyVendorDetails
        set selenium implicit wait  10 Seconds
     page should contain element    ${VendorCode}
      page should contain element    ${VendorName}
      page should contain element    ${VendorShortName}
      page should contain element    ${VendorEffectiveDate}
      page should contain element    ${VendorEndDate}
      page should contain element    ${VendorChannelID}
      page should contain element    ${VendorShortNote}
      page should contain element    ${VendorEndDate}

VerifyVendorGrids
        set selenium implicit wait  10 Seconds
        page should contain element    ${ContactTypeHeader}
        page should contain element    ${ContactNameHeader}
        page should contain element    ${ContactIDHeader}
        page should contain element    ${ContactPhoneHeader}
        page should contain element    ${ContactExtHeader}
        page should contain element    ${ContactEmailHeader}
        page should contain element    ${StatusHeader}
        page should contain element    ${ContactShortNoteHeader}
        page should contain element    ${VendorAddressExpand}
        page should contain element    ${AddressTypeHeader}
        page should contain element    ${Address1Header}
        page should contain element    ${Address2Header}
        page should contain element    ${Address3Header}
        page should contain element    ${CityHeader}
        page should contain element    ${StateCodeHeader}
        page should contain element    ${ZipCodeHeader}

Navigate To Add Vendors
    set selenium implicit wait  10 Seconds
    click link    Vendors
    click link    Add Vendor

Add Vendor
     [Arguments]    ${UserData}
    set selenium implicit wait  20 Seconds
    input text    ${VendorCode}         ${UserData.VendorCode}
    input text    ${VendorName}         ${UserData.VendorName}
    input text    ${VendorShortName}    ${UserData.VendorShortName}
     select from list by value    ${VendorChannelID}         ${UserData.ChannelType}
     ${Today} =      get current date    result_format=%m/%d/%y
      page should contain element    ${VendorEffectiveDate}
     click element    ${VendorEffectiveDate}
    input text   ${VendorEffectiveDate}        ${Today}
    click element    ${AddVendor}
     page should contain element    ${VendorEffectiveDate}
     page should contain element    ${SuccessMsg}
     click button    //html/body/div[2]/div[2]/div[2]/button
#     click button       ${BackBtn}
     input text    ${VendorsSearch}      ${UserData.VendorName}
     click button    ${SearchBtn}
     ${SearchedVendorName}    Set Variable    ${UserData.VendorName}
     page should contain element     //*[@id="vendortable"]/tbody/tr/td[1]/a[text()='${SearchedVendorName}']
     wait until page contains element     //button[@class='btn btn-default' and @type='button']
     click button     //button[@class='btn btn-default' and @type='button']
     input text    ${VendorCode}         ${UserData.UpdatedVendorCode}
     click button    ${UpdateVendor}
     page should contain element    ${SuccessUpdateMsg}
     click button       ${BackBtn}
     input text    ${VendorsSearch}      ${UserData.VendorName}
     click button    ${SearchBtn}
     click button     //button[@class='btn btn-default' and @type='button']
     page should contain element      //input[@id='VendorCode' and @value='${UserData.UpdatedVendorCode}']
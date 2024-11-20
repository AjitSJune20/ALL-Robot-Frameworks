*** Settings ***
Library  SeleniumLibrary
Library    String
Resource  ../../Data/TestData.robot
Library  DateTime




*** Variables ***
${SubscriberConfiguration}=  //a[text()='Subscriber Configuration']
${NotificationSearch}=  //a[text()='Notification Search']
${AddEditClinicalNotification}=  //a[text()='Add/Edit Clinical Notification']
${NewNotificationConfig}=  //*[contains(text(),' New Notification Config')]
${ConfigureApps}=     //button[@class='btn btn-default'][2]
${PeerReview}=     //button[@class='btn btn-default'][3]
${BackBtnOnNotificationPage}=       //input[@value='Back']
${ExitBtnOnPeerReviewPage}=  //input[@value='Exit']
${BackBtnOnConfigureApps}=  //button[@class='btn btn-default'][3]
${Exit}=  //button[@class='btn btn-default'][4]
${GroupRenewDate}=  //input[@id='GroupRenewDate']
${NotificationType}=  //select[@id='NotificationType']
${NotificationCategory}=  //select[@id='NotificationCategory']
${ApplicationName}=  //select[@id='ApplicationName']
${PeerBy}=  //select[@id='PeerBy']
${ConfigBy}=  //select[@id='ConfigBy']
${NotifTitle}=  //input[@id='NotifTitle']
${Keyword}=  //input[@id='Keyword']
${AsofDate}=  //input[@id='AsofDate']


*** Keywords ***
Navigate To Notification Page and Verify
    set selenium implicit wait  10 Seconds
    click link    Subscriber Configuration
    page should contain element    ${AddEditClinicalNotification}
    click link    Notification Search
    click element    ${NewNotificationConfig}
    click element    ${BackBtnOnNotificationPage}
    click element    ${ConfigureApps}
    click element    ${BackBtnOnConfigureApps}
    click element    ${PeerReview}
    click element    ${ExitBtnOnPeerReviewPage}
     page should contain element     ${NotificationType}
     page should contain element     ${NotificationCategory}
     page should contain element     ${ApplicationName}
     page should contain element     ${PeerBy}
     page should contain element     ${ConfigBy}
     page should contain element     ${NotifTitle}
     page should contain element     ${Keyword}
     page should contain element     ${AsofDate}
     click element     ${Exit}
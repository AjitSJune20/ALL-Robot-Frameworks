*** Settings ***
Documentation  This script is used to validate Atlas
Library  OperatingSystem
Resource  Common2.robot
Resource  ../Data/TestData.robot
Resource  ../Resources/Definitions/Atlas.robot

# Prerequsite
Test Setup  Begin Web Test Atlas
Test Teardown  End Web Test

*** Test Cases ***
#Atlas       #   1_Atlas Configuration - Vendors  Validate Vendor List Screen
#            #  2_Vendor List Screen- EDIT Fucntionality
#    [Tags]    Vendor
#    [Template]    Vendor list Page
#    ${TC_Atlas1}
Atlas1          #       3_Atlas Configuration - Vendors   Validate Add Vendor Screen
    [Tags]    Vendor
    [Template]    Add Vendor Page
    ${TC_Atlas2}
#Atlas2      #       4_Atlas Configuration - Model Configuration -  Validate Predictive Model Configuration Screen
#
#     [Tags]    Predictive
#    [Template]    Predictive Model Page
#    ${TC_Atlas3}
#Atlas3      #       5_Atlas - Manage Interventions  Intervention List Screen - New Interventions came into Manage Intervension
#            #  8_Atlas - Interventions  Add Intervention Screen
#     [Tags]    AddIntervention
#    [Template]    Add Intervention Page
#    ${TC_Atlas4}
#Atlas4      #  6_Atlas - Interventions Intervention List Screen navigates without error
#
#     [Tags]    InterventionList
#    [Template]    Intervention Listing Page
#    ${TC_Atlas5}
#Atlas5      #   7_Atlas - Interventions  Intervention Group Screen
#
#    [Tags]    InterventionGroup
#    [Template]    Intervention Group Page
#    ${TC_Atlas6}
#Atlas6      #   9_Atlas - Interventions  Manage Subscriptions Screen
#
#    [Tags]    ManageIntervention
#    [Template]    Manage Intervention Page
#    ${TC_Atlas7}
#Atlas7      #   12_Atlas - Subscriber Configuration - Notificiation Search
#
#    [Tags]    NotificationSearch
#    [Template]    NotificationSearch Page
#    ${TC_Atlas8}
#Atlas8      #   13_Atlas Subscriber Configuration - ADD-EDIT Clinical Notification
#
#    [Tags]    AddclinicalNotification
#    [Template]    AddEditClinicalNotification Page
#    ${TC_Atlas9}
#Atlas9      #   11_Atlas - Customer Profile  Multiple entry screen Test at Group Level for Add-Modify Programs
#            #   10_Atlas - Customer Profile  Search Capabilities Customer Group Search Screen
#    [Tags]    CustomerGroupSearch
#    [Template]    CustomerGroupSearch Page
#    ${TC_Atlas10}

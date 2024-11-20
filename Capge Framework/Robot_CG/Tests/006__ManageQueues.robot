*** Settings ***
Documentation  This script is used to select/Validate the Roles
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
Suite Teardown    End Web Test


# Note:
# Command to run all the test under tests
##  robot -d results tests
# Command to run all the test under tests/006__ManageQueues.robot
## robot -d results tests/006__ManageQueues.robot
# Command to run test based on Tags
##  robot -d results -i Sanity tests/006__ManageQueues.robot
# Command to run test on the different environment
## robot -d results -v instance:offcycleqa  tests/006__managequeues.robot

*** Test Cases ***
Navigation to Page
    [Tags]    Sanity
    User Navigate to Manage Queue Page


User Verifies the Veter Queues
    [Tags]    Sanity
    [Template]    Validate the Queues
      ${TC_Q037}
      ${TC_Q038}
      ${TC_Q039}
      ${TC_Q040}
      ${TC_Q041}
      ${TC_Q042}
      ${TC_Q043}
      ${TC_Q044}
      ${TC_Q045}
      ${TC_Q046}
      ${TC_Q047}
      ${TC_Q048}
      ${TC_Q049}
      ${TC_Q050}
      ${TC_Q051}
      ${TC_Q052}
      ${TC_Q053}
      ${TC_Q054}
      ${TC_Q055}
      ${TC_Q056}
      ${TC_Q057}
      ${TC_Q058}
      ${TC_Q059}
      ${TC_Q060}
      ${TC_Q061}
      ${TC_Q062}
      ${TC_Q063}
      ${TC_Q064}
      ${TC_Q065}
      ${TC_Q066}
      ${TC_Q067}
      ${TC_Q068}
      ${TC_Q069}
      ${TC_Q070}
      ${TC_Q071}
      ${TC_Q072}

Search New Member Queue
    User Search New Member Queue

User Verifies the New Member Queues
    [Tags]    Sanity
    [Template]    Validate the Queues

      ${TC_Q001}
      ${TC_Q002}
      ${TC_Q003}
      ${TC_Q004}
      ${TC_Q005}
      ${TC_Q006}
      ${TC_Q007}
      ${TC_Q008}
      ${TC_Q009}
      ${TC_Q010}
      ${TC_Q011}
      ${TC_Q012}
      ${TC_Q013}
      ${TC_Q014}
      ${TC_Q015}
      ${TC_Q016}
      ${TC_Q017}
      ${TC_Q018}
      ${TC_Q019}
      ${TC_Q020}
      ${TC_Q021}
      ${TC_Q022}
      ${TC_Q023}
      ${TC_Q024}
      ${TC_Q025}
      ${TC_Q026}
      ${TC_Q027}
      ${TC_Q028}
      ${TC_Q029}
      ${TC_Q030}
      ${TC_Q031}
      ${TC_Q032}
      ${TC_Q033}
      ${TC_Q034}
      ${TC_Q035}
      ${TC_Q036}

User Associate the Queues
   [Template]    User Associate the Queue
   ${TC_Q004}
   ${TC_Q013}
   ${TC_Q014}
   ${TC_Q018}
   ${TC_Q032}
User Associate the Manage Queue
    [Arguments]     ${UserData}
    Manage Queue Page     ${UserData}

User Validate Associated Queues

  [Template]   Validate the Associated Queue
   ${TC_Q004}
   ${TC_Q013}
   ${TC_Q014}
   ${TC_Q018}
   ${TC_Q032}

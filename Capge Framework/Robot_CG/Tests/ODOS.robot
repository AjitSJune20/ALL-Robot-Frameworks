*** Settings ***
Documentation  This script is used to ODOS
Library  OperatingSystem
Resource  ../Resources/Definitions/Common.robot
Resource  ../Data/TestData.robot
Resource  ../Resources/Definitions/ODOS.robot

# Prerequsite
#Test Setup  Begin Web Test
#Test Teardown  End Web Test
##robot -d results -i ODOSInRosalind Tests/ODOS.robot

*** Test Cases ***
ODOS
    [Tags]    ODOSInRosalind
    [Template]      Integrated link to ODOS in Rosalind
       ${TC_ODOS1}
ODOS1
    [Tags]    ODOSInHCAT
     [Template]    Integrated link to ODOS in hCAT
    ${TC_ODOS2}
ODOS2
   [Tags]    ODOSInCGX
    [Template]   Integrated link to ODOS in CGX
    ${TC_ODOS3}
ODOS3
    [Tags]    ODOSTOHCAT
    [Template]    Integrated link from ODOS to hCAT
    ${TC_ODOS4}
ODOS4
    [Tags]    ODOSToCGX
    [Template]    Integrated link from ODOS to CGX
    ${TC_ODOS5}
ODOS5
    [Tags]    ODOSUI
    [Template]    High Level Regression UI Checks
    ${TC_ODOS6}







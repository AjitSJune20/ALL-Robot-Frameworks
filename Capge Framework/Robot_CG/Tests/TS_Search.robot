*** Settings ***
Documentation  This script is used to validate member details
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/SearchOperations.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown    End Web Test

#   robot -d results tests/TS_Search.robot


*** Test Cases ***

4495586_CGX - MC - Search - Auth - Valid - Clear
    MC - Search - Auth - Valid - Clear    ${TC_Search01}

4495588_CGX - MC - Search - Auth - Valid - Max Length
    MC - Search - Auth - Valid - Max Length    ${TC_Search02}


4495592_CGX - MC - Search - Auth - Invalid - Invalid Data
    MC - Search - Auth - Invalid - Invalid Data    ${TC_Search03}

4495593_CGX - MC - Search - Auth - Invalid - Required Fields
    MC - Search - Auth - Invalid - Required Fields    ${TC_Search04}

4495590_CGX - MC - Search - Auth - valid - Auth Details Page
    MC - Search - Auth - valid - Auth Details Page    ${TC_Search05}


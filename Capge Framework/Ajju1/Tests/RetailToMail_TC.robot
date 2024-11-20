*** Settings ***
Documentation  This script is used for Validating Retail ot Mail Pricing
Resource  ../Resources/Definitions/RetailToMail_Def.robot

#How to Execute :  robot -d results -i TC_01 Tests/D_TC.robot

*** Test Cases ***
TC_Drug Pricing
    [Template]    HomePage
    [Tags]    TC01
    ${M1}
#    ${M2}
#    ${M3}
#    ${M4}
#    ${M5}






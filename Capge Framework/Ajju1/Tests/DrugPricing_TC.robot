#How to Execute :  robot -d results -i TC_DP Tests/DrugPricing_TC.robot
#How to Execute :  robot -i TC_DP -d results Tests/DrugPricing_TC.robot

*** Settings ***
Documentation  Drug Pricing Validation Script
Resource  ../Resources/Definitions/DrugPricing_Def.robot
Library    pabot.PabotLib

#Prerequisite
#Test Setup     register keyword to run on failure      Capture ScreenShot on Coverage Page
Suite Setup     Begin Web Test      #it launchees browser without URL and maximize it
Suite Teardown    End Web Test      #It Closes the browses
Test Teardown   Delete Unnecessary Screenshots
*** Test Cases ***
TC_DrugPricing
    [Template]   DrugPricing
    [Tags]  TC_DP
    ${M_DP1}
#    ${M_DP2}
#    ${M_DP3}
#    ${M_DP4}
#    ${M_DP5}
#    ${M_DP6}
#    ${M_DP7}
#    ${M_DP8}
#    ${M_DP9}
#    ${M_DP10}
#    ${M_DP11}
#    ${M_DP12}
#    ${M_DP13}
#    ${M_DP14}
#    ${M_DP15}
#    ${M_DP16}
#    ${M_DP17}
#    ${M_DP18}
#    ${M_DP19}
#    ${M_DP20}
#    ${M_DP21}
#    ${M_DP22}
#    ${M_DP23}
#    ${M_DP24}
#    ${M_DP25}
#    ${M_DP26}
#    ${M_DP27}
#    ${M_DP28}
#    ${M_DP29}
#    ${M_DP30}
#    ${M_DP31}
#    ${M_DP32}
#    ${M_DP33}
#    ${M_DP34}
#    ${M_DP35}
#    ${M_DP36}
#    ${M_DP37}
#    ${M_DP38}
#    ${M_DP39}
#    ${M_DP40}
#    ${M_DP41}
#    ${M_DP42}
#    ${M_DP43}
#    ${M_DP44}
#    ${M_DP45}
#    ${M_DP46}
#    ${M_DP47}
#    ${M_DP48}
#    ${M_DP49}
#    ${M_DP50}
#    ${M_DP51}
#    ${M_DP52}
#    ${M_DP53}
#    ${M_DP54}
#    ${M_DP55}
#    ${M_DP56}
#    ${M_DP57}
#    ${M_DP58}
#    ${M_DP59}
#    ${M_DP60}
#    ${M_DP61}
#    ${M_DP62}
#    ${M_DP63}
#    ${M_DP64}
#    ${M_DP65}
#    ${M_DP66}
#    ${M_DP67}
#    ${M_DP68}
#    ${M_DP69}
#    ${M_DP70}
#    ${M_DP71}
#    ${M_DP72}
#    ${M_DP73}
#    ${M_DP74}
#    ${M_DP75}
#    ${M_DP76}
#    ${M_DP77}
#    ${C_DP78}
#    ${C_DP79}
#    ${C_DP80}
#    ${C_DP81}
#    ${C_DP82}
#    ${C_DP83}
#    ${C_DP84}
#    ${C_DP85}
#    ${C_DP86}
#    ${C_DP87}
#    ${C_DP88}
#    ${C_DP89}
#    ${C_DP90}
#    ${C_DP91}
#    ${C_DP92}
#    ${C_DP93}
#    ${C_DP94}
#    ${C_DP95}
#    ${C_DP96}
#    ${C_DP97}
#    ${C_DP98}
#    ${C_DP99}
#    ${C_DP100}
#    ${C_DP101}
#    ${C_DP102}
#    ${C_DP103}
#    ${C_DP104}
#    ${C_DP105}
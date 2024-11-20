#How to Execute :  robot -d results -i TC_UDLS Tests/Medicare_UDLSCoverage_TC.robot
#How to Execute :  robot -i TC_UDLS -d results Tests/Medicare_UDLSCoverage_TC.robot
*** Settings ***
Documentation  This script is used for Validating Medicare UDLSCoverage
Resource  ../Resources/Definitions/Medicare_UDLSCoverage_Def.robot
Library    pabot.PabotLib

#Prerequisite
#Test Setup     register keyword to run on failure      Capture ScreenShot on Coverage Page
Suite Setup     Begin Web Test      #it launchees browser without URL and maximize it
Suite Teardown    End Web Test      #It Closes the browses
Test Teardown   Delete Unnecessary Screenshots
*** Test Cases ***
TC_MedicareUDLSCoverage
    [Template]    MedicareUDLSCoverage
    [Tags]  TC_UDLS

 	${UDLS_M1}
	${UDLS_M2}
#	${UDLS_M3}
#	${UDLS_M4}
#	${UDLS_M5}
#	${UDLS_M6}
#	${UDLS_M7}
#	${UDLS_M8}
#	${UDLS_M9}
#	${UDLS_M10}
#	${UDLS_M11}
#	${UDLS_M12}
#	${UDLS_M13}
#	${UDLS_M14}
#	${UDLS_M15}
#	${UDLS_M16}
#	${UDLS_M17}
#	${UDLS_M18}
#	${UDLS_M19}
#	${UDLS_M20}
#	${UDLS_M21}
#	${UDLS_M22}
#	${UDLS_M23}
#	${UDLS_M24}
#	${UDLS_M25}
#	${UDLS_M26}
#	${UDLS_M27}
#	${UDLS_M28}
#	${UDLS_M29}
#	${UDLS_M30}
#	${UDLS_M31}
#	${UDLS_M32}
#	${UDLS_M33}
#	${UDLS_M34}
#	${UDLS_M35}
#	${UDLS_M36}
#	${UDLS_M37}
#	${UDLS_M38}
#	${UDLS_M39}
#	${UDLS_M40}
#	${UDLS_M41}
#	${UDLS_M42}
#	${UDLS_M43}
#	${UDLS_M44}
#	${UDLS_M45}
#	${UDLS_M46}
#	${UDLS_M47}
#	${UDLS_M48}
#	${UDLS_M49}
#	${UDLS_M50}
#	${UDLS_M51}
#	${UDLS_M52}
#	${UDLS_M53}
#	${UDLS_M54}
#	${UDLS_M55}
#	${UDLS_M56}
#	${UDLS_M57}
#	${UDLS_M58}
#	${UDLS_M59}
#	${UDLS_M60}
#	${UDLS_M61}
#	${UDLS_M62}
#	${UDLS_M63}
#	${UDLS_M64}
#	${UDLS_M65}
#	${UDLS_M66}
#	${UDLS_M67}
#	${UDLS_M68}
#	${UDLS_M69}
#	${UDLS_M70}
#	${UDLS_M71}
#	${UDLS_M72}
#	${UDLS_M73}
#	${UDLS_M74}
#	${UDLS_M75}
#	${UDLS_M76}
#	${UDLS_M77}
#	${UDLS_M78}
#	${UDLS_M79}
#	${UDLS_M80}
#	${UDLS_M81}
#	${UDLS_M82}
#	${UDLS_M83}
#	${UDLS_M84}
#	${UDLS_M85}
#	${UDLS_M86}
#	${UDLS_M87}
#	${UDLS_M88}
#	${UDLS_M89}
#	${UDLS_M90}
#	${UDLS_M91}
#	${UDLS_M92}
#	${UDLS_M93}
#	${UDLS_M94}
#	${UDLS_M95}
#	${UDLS_M96}
#	${UDLS_M97}
#	${UDLS_M98}
#	${UDLS_M99}
#	${UDLS_M100}
#	${UDLS_M101}
#	${UDLS_M102}
#	${UDLS_M103}
#	${UDLS_M104}
#	${UDLS_M105}
#	${UDLS_M106}
#	${UDLS_M107}
#	${UDLS_M108}
#	${UDLS_M109}
#	${UDLS_M110}
#	${UDLS_M111}
#	${UDLS_M112}
#	${UDLS_M113}
#	${UDLS_M114}
#	${UDLS_M115}
#	${UDLS_M116}
#	${UDLS_M117}
#	${UDLS_M118}
#	${UDLS_M119}
#	${UDLS_M120}
#	${UDLS_M121}
#	${UDLS_M122}
#	${UDLS_M123}
#	${UDLS_M124}
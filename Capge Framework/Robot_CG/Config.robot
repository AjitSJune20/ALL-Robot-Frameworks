*** Settings ***


*** Variables ***
${ENVIRONMENT} =    qa                          #prod
${BROWSER} =    chrome     #chrome
#${BROWSER} =  edge     #chrome
&{URL}  qa=https://qa-hi.humana.com/hss/landing   prod=https://hi.humana.com/hss/landing
${INSTANCE} =    offcycleqa        #qa2
#${FILE_PATH} =    C:\\CGX_RobotFramework_Amol_Backup\\Data
${FILE_PATH} =    ${execdir}\\Data
${PDFFILE_PATH} =    \\\\LOUISILON02S\\USERDAT01\\AHS8367\\Downloads
${PDF_PATH_Document} =    \\\\\LOUISILON02S\\USERDAT01\\AHS8367\\Documents
${AVAENV} =    qa
&{AVAURL}    qa=https://qa-apps.availity.com/availity/web/public.elegant.login?goto=https%3A%2F%2Fqa-apps.availity.com%2Fweb%2Fonboarding%2Fauth-step-up%2F%23%2F%3Ffrom%3Dlogin%26goto%3Dhttps%253A%252F%252Fqa-apps.availity.com%252Fpublic%252Fapps%252Fhome%252F%2523%2521%252F    Pro=
${INSTANCE_Atlas} =    UAT       #Added/Changed  :  Sanket : 06/25/2021  : Atlas

#Note:
# *************** PRODUCTION RUN *************************
# >>>>    robot -d results -v environment:prod  tests/006__managequeues.robot

# *************** QA Instances RUN Commands*************************
# >>>>    robot -d results -v instance:qa2  tests/006__managequeues.robot
# >>>>    robot -d results -v instance:offcycleqa  tests/006__managequeues.robot

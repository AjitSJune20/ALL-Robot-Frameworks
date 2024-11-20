*** Settings ***
Documentation  This script is used to validate member details
Library  OperatingSystem
Library    SeleniumLibrary
Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/MemberCentral.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/CoreRegression.robot
Resource  ../Resources/Definitions/MedicalListOperations.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown   End Web Test


#Notes....
# Command to run all the test under tests/00012_CorePPVTemp.robot
## robot -d results tests/00012_CorePPVTemp.robot

# Command to run all the test under tests/00012_CorePPVTemp.robot
## robot -d results tests/00012_CorePPVTemp.robot

# Command to run test based on Tags
##  robot -d results -i AuthCR tests/00012_CorePPVTemp.robot

# Command to Run in Prod
##    robot -d results -v environment:prod -i CoreTemp1 tests/00012_CorePPVTemp.robot



*** Test Cases ***
Member Central - Create CPCM Case
    [Tags]    CoreTemp
    User Create Cases    ${TC_CorePPV01}

Member Central - Edit CPCM Case
    [Tags]     CorePPV    CaseEdit    CoreTemp
    User Edit CPCM Case     ${TC_CorePPV01}

Member Central - Create Notes
    [Tags]    CoreTemp
    User Create Notes    ${TC_CorePPV01}


Member Central - Edit Notes
    [Tags]    CoreTemp
    User Edit Notes    ${TC_CorePPV01}


Member Central - Create Communicaton Record
    [Tags]    CoreTemp    CoreUAT
    User Create MC Communication Record   ${TC_CorePPV01}

Member Central - CoreUAT Communication Record Validation
    [Tags]    Core UAT
    User Create Cancel MC Communication Record   ${TC_CorePPV01}


Member Central - Edit Communicaton Record
    [Tags]    CoreTemp
    User Edit MC Communication Record   ${TC_CorePPV01}

Member Central - Edit Cancel Communicaton Record
    [Tags]    Core UAT
    User Cancel Edit MC Communication Record

Member Central IP Auth Core Validation
    [Tags]    Core
        Core Regression IP Auth Validation     ${TC_SmokeIP}

Auth-Attachment
    [Tags]    Attach
    Create BHIP Auth Attachment     ${TC_SmokeBHIP}

Member Central-BHOP Auth Creation
    [Tags]    CoreBHOPAuth    CoreTemp1
    Navigate To Role
    Applying the Role   ${TC_CorePPV02}
    Search For Member   ${TC_CorePPV02}
    Select The Member
    Create Authorization for PPV Temp2     ${TC_SmokeBHOP}

Auth - BHOP Clinical Review
    [Tags]    AuthCR    CoreTemp1
    Auth - BHOP Create Clinical Review       ${TC_CorePPV02}

Auth - Discharge Plan
    [Tags]    AuthDP    CoreTemp1
    Auth - Create Discharge Plan    ${TC_CorePPV02}

Auth - Create Communication Record
    [Tags]    CoreTemp1    AuthComm
       Auth - Communication Record    ${TC_CorePPV02}

Auth - Create Consultations
    [Tags]    AuthCon    CoreTemp1
    Auth - Create Consultations    ${TC_CorePPV02}


4411999_CGX - Medical List - Allergies - Add - Valid - Save
    [Tags]    CoreTemp
    Medical List - Allergies - Add - Valid - Save    ${TC_MLL001}
4412080_CGX - Medical List - Allergies - Edit- Edit
    [Tags]    CoreTemp
    Medical List - Allergies - Edit- Edit    ${TC_MLL002}
4412127_CGX - Medical List - Allergies - Edit- Inactive- Valid
    [Tags]    CoreTemp
    Medical List - Allergies - Edit- Inactive- Valid    ${TC_MLL003}


5033770_CGX - Medical LIst - Vaccinations - Add - Valid - Save
    [Tags]    CoreTemp
    Medical LIst - Vaccinations - Add - Valid - Save    ${TC_MLL004}
4412826_CGX - Medical List - Vaccinations - Edit- Edit
    [Tags]    CoreTemp
    Medical List - Vaccinations - Edit- Edit    ${TC_MLL005}
4412827_CGX - Medical List - Vaccinations - Edit- Inactive- Valid
    [Tags]    CoreTemp
    Medical List - Vaccinations - Edit- Inactive- Valid    ${TC_MLL006}


4412159_CGX - Medical LIst - Medications - Add - Valid - Save
    [Tags]    CoreTemp
    Medical LIst - Medications - Add - Valid - Save    ${TC_MLL007}
4412703_CGX - Medical List - Medications - Edit- Edit
    [Tags]    CoreTemp
    Medical List - Medications - Edit- Edit    ${TC_MLL008}
4412725_CGX - Medical List - Medications - Edit- Inactive- Valid
    [Tags]    CoreTemp
    Medical List - Medications - Edit- Inactive- Valid    ${TC_MLL009}

4412837_CGX - Medical List - Medications - Edit- Inactivate - Invalid - 'Required Field'
    [Tags]    CoreTemp
    Medical List - Medications - Edit- Inactive- Valid - 'Required Field'    ${TC_MLL009}

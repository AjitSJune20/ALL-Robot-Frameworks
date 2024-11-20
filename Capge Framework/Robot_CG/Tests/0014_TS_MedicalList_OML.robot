*** Settings ***
Documentation  This script is used to Create Authorization
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/MedicalListOMLOperation.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
Suite Teardown    End Web Test

## robot -d results tests/0014_TS_MedicalList_OML.robot

*** Test Cases ***

#*******************************Medications****************************************************
5033771_CGX - Medica5033758_CGX - Medical List - OML - Medications - Add- Valid- Save
    [Tags]    MedicalListOMLProd
    Medical List OML- Medications - Add - Valid - Save    ${TC_MLOMLMedRecord}

CGX - Medical List - OML - Medications - Save And Add- Valid- Save
    [Tags]    MedicalListOMLProd
    Medical List OML- Medications - Save And Add- Valid- Save    ${TC_MLOML021}

5033771_CGX - Medical List - Medications - OML - Edit- Save
    [Tags]    MedicalListOMLProd
    Medical List OML- Medications - Edit- Edit    ${TC_MLOML022}

5033772_CGX - Medical List - Medications - OML- Inactivate - Valid - Submit
    [Tags]    MedicalListOMLProd
    Medical List OML- Medications - Edit- Inactive- Valid    ${TC_MLOML023}

CGX - Medical List - OML - Medications - Save And Add- Valid- Save
    [Tags]    MedicalListOMLProd
    Medical List OML- Medications - Save And Add- Valid- Save    ${TC_MLOML024}

931817_MF1_FR3_Verify whether Successfully inactivated medication(s) have been moved to the Past Medications screen
    [Tags]    MedicalListOMLProd
    MF1_FR3_Verify whether Successfully inactivated medication(s) have been moved to the Past Medications screen    ${TC_MLOML026}

931858_MF1_FR4_Verify whether Successfully Reactivated medication(s) have been moved to the Current Medications screen
    [Tags]    MedicalListOMLProd
    MF1_FR4_Verify whether Successfully Reactivated medication(s) have been moved to the Current Medications screen    ${TC_MLOML030}

931817_MF1_FR3_Verify whether Successfully Verified medication(s) are marked as Verified
    [Tags]    MedicalListOMLProd
    MF1_FR3_Verify whether Successfully Verified medication(s) are marked as Verified    ${TC_MLOML029}

931817_MF1_FR3_Verify Inactivate functionality from Grid Medication
    [Tags]    MedicalListOMLProd
    MF1_FR3_Verify Inactivate functionality from Grid Medication    ${TC_MLOML027}

931858_MF1_FR4_Verify Reactivate functionality from Grid Medication screen
    [Tags]    MedicalListOMLProd
    MF1_FR4_Verify Reactivate functionality from Grid Medication screen    ${TC_MLOML031}

931812_MF1_FR2_Verify alert/error thrown by CGX for already available Medication while creating a Medication
    [Tags]    MedicalListOMLUAT
    MF1_FR2_Verify alert/error thrown by CGX for already available Medication while creating a Medication    ${TC_MLOML025}

931817_MF1_FR3_ Verify No Known Medications functionality from Current Medications screen
    [Tags]    MedicalListOMLUATDNE
    MF1_FR3_ Verify No Known Medications functionality from Current Medications screen    ${TC_MLOML028}

CGX - Medical List - OML - Medications_Verify Field Level Error messages are thrown by CGX
    [Tags]    MedicalListOMLUAT
    Medical List - OML - Medications_Verify Field Level Error messages are thrown by CGX    ${TC_MLOML032}

CGX - Medical List - OML - Medications_ Verify Grid functionality on Current Medications screen
    [Tags]    MedicalListOMLUAT
    Medical List OML Medications Verify Grid functionality on Current Medications screen    ${TC_MLOML034}

5033772_CGX - Medical List - Medications - OML- Inactivate - Valid - Submit
    [Tags]    MedicalListOMLProd
    Medical List OML- Medications - Edit- Inactive- Valid    ${TC_MLOMLMedRecord}

5033772_CGX - Medical List - Medications - OML- Inactivate - Valid - Submit
    [Tags]    MedicalListOMLProd
    Medical List OML- Medications - Edit- Inactive- Valid    ${TC_MLOML021}

CGX - Medical List - OML - Medications_ Verify No Known Medications History functionality from Current Medications screen
    [Tags]    MedicalListOMLUATDNE
    Medical List - OML - Medications_ Verify No Known Medications History functionality from Current Medications screen    ${TC_MLOML033}

#*******************************Allergies****************************************************

5033760_CGX - Medical LIst - Allergies - OML - Add - Valid - Save
    [Tags]    MedicalListOMLProd
    Medical List OML- Allergies - Add - Valid - Save    ${TC_MLOMLAllergyRcd}

5033760_CGX - Medical LIst - Allergies - OML - Add - Valid - Save
    [Tags]    MedicalListOMLProd
    Medical List OML- Allergies - Add - Valid - Save    ${TC_MLOML001}

5033765_CGX - Medical List - OML - Allergies - Edit- Edit
    [Tags]    MedicalListOMLProd
    Medical List OML- Allergies - Edit- Edit    ${TC_MLOML002}

5033767_CGX - Medical List - Allergies - OML - Edit- Inactive- Valid
    [Tags]    MedicalListOMLProd
    Medical List OML- Allergies - Edit- Inactive- Valid    ${TC_MLOML003}

5033758_CGX - Medical List - OML - Allergies - Save And Add- Valid- Save
    [Tags]    MedicalListOMLProd
    Medical List - OML - Allergies - Save And Add- Valid- Save    ${TC_MLOML004}    SaveAndAdd

941803_MF2_FR3_Verify whether Successfully inactivated Allergy(s) have been moved to the Past Allergies screen
    [Tags]    MedicalListOMLProd
    MF2_FR3_Verify whether Successfully inactivated Allergy(s) have been moved to the Past Allergies screen    ${TC_MLOML006}

941902_MF2_FR4_Verify Reactivate functionality from View Allergy screen
    [Tags]    MedicalListOMLProd
    MF2_FR4_Verify Reactivate functionality from View Allergy screen    ${TC_MLOML011}

941803_MF2_FR3_Verify Inactivate functionality from Grid
    [Tags]    MedicalListOMLProd
    MF2_FR3_Verify Inactivate functionality from Grid   ${TC_MLOML007}

941902_MF2_FR4_Verify whether Successfully Reactivated Allergy(s) have been moved to the Current Allergies screen
    [Tags]    MedicalListOMLProd
    MF2_FR4_Verify whether Successfully Reactivated Allergy(s) have been moved to the Current Allergies screen    ${TC_MLOML010}

941735_MF2_FR2_Verify alert/error thrown by CGX for already available Allergy while creating a Allergy
    [Tags]    MedicalListOMLUAT
    MF2_FR2_Verify alert/error thrown by CGX for already available Allergy while creating a Allergy    ${TC_MLOML005}

CGX - Medical List - OML - Allergies - Reaction dropdown values
    [Tags]    MedicalListOMLUAT
    Medical List - OML - Allergies - Reaction dropdown values    ${TC_MLOML009}

CGX - Medical List - OML - Allergies_Verify Field Level Error messages are thrown by CGX
    [Tags]    MedicalListOMLUAT
    Medical List - OML - Allergies_Verify Field Level Error messages are thrown by CGX    ${TC_MLOML012}

941803_MF2_FR3_ Verify No Known Allergies functionality from Current Allergies screen
    [Tags]    MedicalListOMLUATDNE
    MF2_FR3_ Verify No Known Allergies functionality from Current Allergies screen    ${TC_MLOML008}

CGX - Medical List - OML - Allergies_ Verify Grid functionality on Current Allergies screen
    [Tags]    MedicalListOMLUAT
    Medical List - OML - Allergies_ Verify Grid functionality on Current Allergies screen    ${TC_MLOML014}

Inactivate All Allergies
    [Tags]    MedicalListOMLProd
    OML - Allergies_ Inactivate Multiple Records    ${TC_MLOML007}

CGX - Medical List - OML - Allergies_ Verify No Known Allergy History functionality from Current Allergies screen
    [Tags]   MedicalListOMLUAT
    Medical List - OML - Allergies_ Verify No Known Allergy History functionality from Current Allergies screen    ${TC_MLOML013}


#*******************************Vaccinations****************************************************
4433277_CGX 2.0 B-616147 OML - Create Vaccination
    [Tags]    MedicalListOMLProd
    Medical List OML- Create Vaccination    ${TC_MLOMLVaccRecord}

4433277_CGX 2.0 B-616147 OML - Create Vaccination
    [Tags]    MedicalListOMLProd
    Medical List OML- Create Vaccination    ${TC_MLOML015}

5033773_CGX - Medical List - OML - Vaccinations - Edit
    [Tags]    MedicalListOMLProd
    Medical List OML- Vaccinations - Edit- Edit    ${TC_MLOML016}

5033775_CGX - Medical List - Vaccinations - OML - Inactive - Valid – Save
    [Tags]    MedicalListOMLProd
    Medical List OML- Vaccinations - Edit- Inactive- Valid    ${TC_MLOML017}

CGX - Medical List - Vaccinations -OML Save And Add
    [Tags]    MedicalListOMLProd
    ML OML Vaccinations Add Valid Save And Add    ${TC_MLOML015}   SaveAndAdd

945585_MF3_FR3_Verify Inactivate functionality available for Current Vaccinations displayed on Grid
    [Tags]    MedicalListOMLProd
    MF3_FR3_Verify Inactivate functionality available for Current Vaccinations displayed on Grid    ${TC_MLOML019}

945606_MF3_FR4_Verify Reactivate functionality available for Past Vaccinations displayed on Grid
    [Tags]    MedicalListOMLProd
    MF3_FR4_Verify Reactivate functionality available for Past Vaccinations displayed on Grid    ${TC_MLOML020}

945585_MF3_FR3_Verify Inactivate functionality available for Current Vaccinations displayed on Grid
    [Tags]    MedicalListOMLProd
    MF3_FR3_Verify Inactivate functionality available for Current Vaccinations displayed on Grid    ${TC_MLOML019}

4433519_CGX 2.0 B-649962 OML - View Past (Inactive) Vaccination - Reactivate
    [Tags]    MedicalListOMLProd
    Medical List OML- View Past (Inactive) Vaccination - Reactivate    ${TC_MLOML020}

4433282_CGX 2.0 B-616151 OML - Vaccinations screen field changes-Edit
    [Tags]    MedicalListOMLUAT
    Medical List OML- Vaccinations screen field changes-Edit    ${TC_MLOML019}

945527_MF3_FR2_Verify alert/error thrown by CGX for already available Vaccination while creating a Vaccination
    [Tags]    MedicalListOMLUAT
    MF3_FR2_Verify alert/error thrown by CGX for already available Vaccination while creating a Vaccination   ${TC_MLOML015}

CGX - Medical List - OML - Vaccinations- Name dropdown values
    [Tags]    MedicalListOMLUAT
    Medical List - OML - Vaccinations- Name dropdown values    ${TC_MLOML020}

CGX - Medical List - OML - Vaccinations - Date Unknown
    [Tags]    MedicalListOMLUAT
    Medical List - OML - Vaccinations - Date Unknown    ${TC_MLOML020}

CGX - Medical List - OML - Vaccination_Verify Field Level Error messages are thrown by CGX
    [Tags]    MedicalListOMLUAT
    Medical List - OML - Vaccination_Verify Field Level Error messages are thrown by CGX    ${TC_MLOML020}

4431700_CGX 2.0 B-616140 OML - Current Vaccinations Grid
    [Tags]    MedicalListOMLUAT
    Medical List OML- Current Vaccinations Grid    ${TC_MLOML018}

Inactivate All Vaccinations
    [Tags]    MedicalListOMLProd
    OML - Vaccination_ Inactivate Multiple Records    ${TC_MLOML017}

7_945585_MF3_FR3_ Verify No Known Vaccinations functionality from Current Vaccinations screen
    [Tags]    MedicalListOMLUAT
    MF3_FR3_ Verify No Known Vaccinations functionality from Current Vaccinations screen   ${TC_MLOML017}
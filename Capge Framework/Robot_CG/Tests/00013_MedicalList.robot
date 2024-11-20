*** Settings ***
Documentation  This script is used to Create Update and Inativate Medical List operations.
Library  OperatingSystem
Library    SeleniumLibrary
Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/HumanaGui.robot
Resource  ../Resources/Definitions/MedicalListOperations.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
Suite Teardown    End Web Test

# Command to run all the test under tests/00013_MedicalList.robot
## robot -d results tests/00013_MedicalList.robot


*** Test Cases ***
4411999_CGX - Medical List - Allergies - Add - Valid - Save
    [Tags]    CoreTemp
    Medical List - Allergies - Add - Valid - Save    ${TC_ML001}



4412080_CGX - Medical List - Allergies - Edit- Edit
    [Tags]    CoreTemp
    Medical List - Allergies - Edit- Edit    ${TC_ML002}
4412127_CGX - Medical List - Allergies - Edit- Inactive- Valid
    [Tags]    CoreTemp
    Medical List - Allergies - Edit- Inactive- Valid    ${TC_ML003}


5033770_CGX - Medical LIst - Vaccinations - Add - Valid - Save
    [Tags]    CoreTemp
    Medical LIst - Vaccinations - Add - Valid - Save    ${TC_ML004}
4412826_CGX - Medical List - Vaccinations - Edit- Edit
    [Tags]    CoreTemp
    Medical List - Vaccinations - Edit- Edit    ${TC_ML005}
4412827_CGX - Medical List - Vaccinations - Edit- Inactive- Valid
    [Tags]    CoreTemp
    Medical List - Vaccinations - Edit- Inactive- Valid    ${TC_ML006}


4412159_CGX - Medical LIst - Medications - Add - Valid - Save
    [Tags]    CoreTemp
    Medical LIst - Medications - Add - Valid - Save    ${TC_ML007}
4412703_CGX - Medical List - Medications - Edit- Edit
    [Tags]    CoreTemp
    Medical List - Medications - Edit- Edit    ${TC_ML008}
4412725_CGX - Medical List - Medications - Edit- Inactive- Valid
    [Tags]    CoreTemp
    Medical List - Medications - Edit- Inactive- Valid    ${TC_ML009}

4412837_CGX - Medical List - Medications - Edit- Inactivate - Invalid - 'Required Field'
    [Tags]    CoreTemp
    Medical List - Medications - Edit- Inactive- Valid - 'Required Field'    ${TC_ML010}

***************************************************************************************************************************


4412048_CGX - Medical LIst - Allergies - Add - Valid - Save and Add
    [Tags]    CoreUAT
    4412048_CGX_Medical_LIst_Allergies_Add_Valid_Save_and_Add    ${TC_ML010}

4412050_CGX - Medical LIst - Allergies - Add - Valid - 'Cancel'
    [Tags]    CoreUAT
    4412050_CGX_Medical_LIst_Allergies_Add_Valid_Cancel    ${TC_ML011}

4412051_CGX - Medical LIst - Allergies - Add - Valid - 'Max Length'
    [Tags]    CoreUAT
    4412051_CGX_Medical_LIst_Allergies_Add_Valid_Max Length    ${TC_ML012}

4412054_CGX - Medical LIst - Allergies - Add - Valid - 'NKA'
    [Tags]    CoreUAT
    4412054_CGX_Medical_LIst_Allergies_Add_Valid_NKA    ${TC_ML013}

4412056_CGX - Medical LIst - Allergies - Add - Valid - 'NKA'
    [Tags]    CoreUAT
    4412056_CGX_Medical_LIst_Allergies_Add_Valid_NKA    ${TC_ML014}

4412079_CGX - Medical List - Allergies - Add - Invalid - 'Invalid Data'
    [Tags]    CoreUAT
    4412079_CGX_Medical_LIst_Allergies_Add_Invalid_Invalid_Data    ${TC_ML015}

4412152_CGX - Medical List - Allergies - Edit- Inactive- Invalid
    [Tags]    CoreUAT
    4412152_CGX_Medical_LIst_Allergies_Edit_Inactive_Invalid    ${TC_ML016}

4412153_CGX - Medical List - Allergies - Edit- Inactive- 'Max Fields'
    [Tags]    CoreUAT
    4412153_CGX_Medical_LIst_Allergies_Edit_Inactive_Max Fields    ${TC_ML017}

4412154_CGX - Medical List - Allergies - Edit- Inactive- 'Cancel'
    [Tags]    CoreUAT
    4412154_CGX_Medical_LIst_Allergies_Edit_Inactive_Cancel    ${TC_ML018}

4412155_CGX - Medical List - Allergies - Edit- Inactive- 'Required Field'
    [Tags]    CoreUAT
    4412155_CGX_Medical_LIst_Allergies_Edit_Inactive_Required Field    ${TC_ML019}

4412156_CGX - Medical List - Allergies - Reorder
    [Tags]    CoreUAT
    4412156_CGX_Medical_LIst_Allergies_Reorder    ${TC_ML020}

4412157_CGX - Medical List - Allergies - View - Active
    [Tags]    CoreUAT
    4412157_CGX_Medical_LIst_Allergies_View_Active    ${TC_ML021}

4412158_CGX - Medical List - Allergies - View - Inactive
    [Tags]    CoreUAT
    4412158_CGX_Medical_LIst_Allergies_View_Inactive    ${TC_ML022}

4412835_CGX - Medical List - Allergies - Add - Invalid - 'Required Fields'
    [Tags]    CoreUAT
    4412835_CGX_Medical_LIst_Allergies_Add_Invalid_Required Fields    ${TC_ML023}




4412209_CGX - Medical List - Medications - Add- Valid- 'Save Add'
    [Tags]    CoreUAT
    4412209_CGX_Medical_LIst_Medications_Add_Valid_Save Add    ${TC_ML024}

4412211_CGX - Medical List - Medications - Add- Valid- Cancel
    [Tags]    CoreUAT
    4412211_CGX_Medical_LIst_Medications_Add_Valid_Cancel    ${TC_ML025}

4412699_CGX - Medical List - Medications - Add- Valid- Max Length
    [Tags]    CoreUAT
    4412699_CGX_Medical_LIst_Medications_Add_Valid_Max Length    ${TC_ML026}

4412700_CGX - Medical List - Medications - Add- Invalid - Invalid Data
    [Tags]    CoreUAT
    4412700_CGX_Medical_LIst_Medications_Add_Invalid_Invalid Data    ${TC_ML027}

4412701_CGX - Medical List - Medications - Add- Invalid - Required Fields
    [Tags]    CoreUAT
    4412701_CGX_Medical_LIst_Medications_Add_Invalid_Required Fields    ${TC_ML028}

4412736_CGX - Medical List - Medications - Edit- Inactivate - Valid - 'Max Length'
    [Tags]    CoreUAT
    4412736_CGX_Medical_LIst_Medications_Edit_Inactivate_Valid_Max Length    ${TC_ML029}

4412738_CGX - Medical List - Medications - Edit- Inactivate - Valid - 'Cancel'
    [Tags]    CoreUAT
    4412738_CGX_Medical_LIst_Medications_Edit_Inactivate_Valid_Cancel    ${TC_ML030}

4412740_CGX - Medical List - Medications - Edit- Inactivate - Invalid - 'Invalid Data'
    [Tags]    CoreUAT
    4412740_CGX_Medical_LIst_Medications_Edit_Inactivate_Invalid_Invalid Data    ${TC_ML031}

4412742_CGX - Medical List - Medications - Reorder
    [Tags]    CoreUAT
    4412742_CGX_Medical_LIst_Medications_Reorder    ${TC_ML032}

4412743_CGX - Medical List - Medications - View - Active
    [Tags]    CoreUAT
    4412743_CGX_Medical_LIst_Medications_View_Active    ${TC_ML033}

4412745_CGX - Medical List - Medications - View - Inactive
    [Tags]    CoreUAT
    4412745_CGX_Medical_LIst_Medications_View_Inactive    ${TC_ML034}

4412836_CGX - Medical List - Medications - Add- Valid- No Current Medications
    [Tags]    CoreUAT
    4412836_CGX_Medical_LIst_Medications_Add_Valid_No Current Medications    ${TC_ML035}




4412746_CGX - Medical List - Vaccinations - Add - Valid - Save
    [Tags]    CoreUAT
    4412746_CGX_Medical_LIst_Vaccinations_Add_Valid_Save    ${TC_ML037}

5033774_CGX - Medical List - Vaccinations - Edit - Inactive - Valid – Save
    [Tags]    CoreUAT
    5033774_CGX_Medical_LIst_Vaccinations_Edit_Inactive_Valid_Save    ${TC_ML036}

4412760_CGX - Medical List - Vaccinations - Add - Valid - Save Add
    [Tags]    CoreUAT
    4412760_CGX_Medical_LIst_Vaccinations_Add_Valid_Save Add    ${TC_ML038}

4412817_CGX - Medical List - Vaccinations - Add - Valid – Cancel
    [Tags]    CoreUAT
    4412817_CGX_Medical_LIst_Vaccinations_Add_Valid_Cancel    ${TC_ML039}

4412818_CGX - Medical List - Vaccinations - Add - Valid - Max Length
    [Tags]    CoreUAT
    4412818_CGX_Medical_LIst_Vaccinations_Add_Valid_Max Length    ${TC_ML040}

4412822_CGX - Medical List - Vaccinations - Add - Valid - Vaccination Date Unknown
    [Tags]    CoreUAT
    4412822_CGX_Medical_LIst_Vaccinations_Add_Valid_Vaccination Date Unknown    ${TC_ML041}

4412824_CGX - Medical List - Vaccinations - Add - Invalid - Invalid Data
    [Tags]    CoreUAT
    4412824_CGX_Medical_LIst_Vaccinations_Add_Invalid_Invalid Data    ${TC_ML042}

4412825_CGX - Medical List - Vaccinations - Add - Invalid - 'Required Field'
    [Tags]    CoreUAT
    4412825_CGX_Medical_LIst_Vaccinations_Add_Invalid_Required Field    ${TC_ML043}

4412828_CGX - Medical List - Vaccinations - Edit - Inactive - Valid – Cancel
    [Tags]    CoreUAT
    4412828_CGX_Medical_LIst_Vaccinations_Edit_Inactive_Valid_Cancel    ${TC_ML044}

4412829_CGX - Medical List - Vaccinations - Edit - Inactive - Valid – Max Length
    [Tags]    CoreUAT
    4412829_CGX_Medical_LIst_Vaccinations_Edit_Inactive_Valid_Max Length    ${TC_ML045}

4412830_CGX - Medical List - Vaccinations - Edit - Inactive - Invalid – Invalid Data
    [Tags]    CoreUAT
    4412830_CGX_Medical_LIst_Vaccinations_Edit_Inactive_Invalid_Invalid Data    ${TC_ML046}

4412831_CGX - Medical List - Vaccinations - Edit - Inactive - Invalid – Required Field
    [Tags]    CoreUAT
    4412831_CGX_Medical_LIst_Vaccinations_Edit_Inactive_Invalid_Required Field    ${TC_ML047}

4412832_CGX - Medical List - Vaccinations - Reorder
    [Tags]    CoreUAT
    4412832_CGX_Medical_LIst_Vaccinations_Reorder    ${TC_ML048}

4412833_CGX - Medical List - Vaccinations - View – Active
    [Tags]    CoreUAT
    4412833_CGX_Medical_LIst_Vaccinations_View_Active    ${TC_ML049}

4412834_CGX - Medical List - Vaccinations - View – Inactive
    [Tags]    CoreUAT
    4412834_CGX_Medical_LIst_Vaccinations_View_Inactive    ${TC_ML050}

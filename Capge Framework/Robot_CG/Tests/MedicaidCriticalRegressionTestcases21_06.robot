*** Settings ***
Documentation  This script is used to validate CGX KY Medicaid Moms First Referral after submitting the IP Auth
Library  OperatingSystem

Resource  ../Resources/Definitions/Common.robot
Resource  ../Resources/Definitions/MedicaidCriticalRegressionTestcases21_06Defi.robot
Resource  ../Data/TestData.robot

# Prerequsite
Suite Setup    Begin Web Test
#Suite Teardown    End Web Test


# Command to run all the test under tests/001_humanascript.robot
##robot -d results  -i KyMedicaidCMMedicalreferral tests/MedicaidCriticalRegressionTestcases21_06.robot
##robot -d results  -i KyMedicaidMomsFirstreferral tests/MedicaidCriticalRegressionTestcases21_06.robot
##robot -d results  -i FlTaskValidationatCPCPcaselevel tests/MedicaidCriticalRegressionTestcases21_06.robot
##robot -d results  -i KyMedicaidCMBHreferral tests/MedicaidCriticalRegressionTestcases21_06.robot
##robot -d results  -i KyTaskaftersubmittingKyMedicaidHealthAss tests/MedicaidCriticalRegressionTestcases21_06.robot
##robot -d results  -i KYMedicaidCMReferral tests/MedicaidCriticalRegressionTestcases21_06.robot
##robot -d results  -i Task tests/MedicaidCriticalRegressionTestcases21_06.robot
##robot -d results  -i Referral tests/MedicaidCriticalRegressionTestcases21_06.robot
*** Test Cases ***
Validating CGX KY MEdicaid Moms First Referral After Submitting IP Auth
    #[Tags]    Referral
    [Tags]    KyMedicaidMomsFirstreferral
    [Template]    Creating Ip AUth and Validating CGX KY Medicaid Moms First Referral
    ${TC_IPAuthandValidateCGXMomsReferral}

HRA Medical Condition to "KY: Medicaid CM-Medical Referral validation After Submitting Ky Medicaid Assessment
    #[Tags]    Referral
    [Tags]     KyMedicaidCMMedicalreferral
    [Template]    KY Medical CM Medical Referral Validation
    ${TC_MedicaidKYHealthRisk_FLMCD}

Validating Task for FL
      #[Tags]    Task
      [Tags]    FlTaskValidationatCPCPcaselevel
      [Template]    Validating task for Fl after submitting CPCM case
      #${TC_TaskVerfication_FLMCD}
      ${TC_TaskVerfication_FLLTSS}
      #${TC_TaskVerfication_FLMMA}

Validating KY Medicaid CM-BH referral after submitting BHIP Auth
      #[Tags]    Referral
      [Tags]    KyMedicaidCMBHreferral
      [Template]    Creating BHIP Auth and Validating Ky Medicaid CM BH Referral
      ${TC_BHIPAuthandValidateKyMedicaidCMBHReferral}

Validating Ky Task after submitting Ky Medicaid Health Assessment
      #[Tags]    Task
     [Tags]    KyTaskaftersubmittingKyMedicaidHealthAss
     [Template]    Creating Ky Medicaid Health Risk Assessment under cp cm case and validating task
     ${TC_MedicaidKYHealthRisk_KyTaskValidation}


Validating Ky Medicaid CM Medical referral
    #[Tags]    Referral
    [Tags]    KYMedicaidCMReferral
    [Template]    Validating Ky Medicaid CM Medical referral after submitting Ky Health Risk Assessment
    ${TC_KY_MedicaidCMMedicalreferralValidation}





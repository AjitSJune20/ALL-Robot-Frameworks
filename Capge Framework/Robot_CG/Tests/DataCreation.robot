*** Settings ***
Resource  ../Resources/Definitions/DataManager.robot
Resource  ../Data/Config.robot

# Note:
# Command to run all the test under tests
##  robot -d results tests
# Command to run all the test under tests/DataCreation.robot
## robot -d results  tests/DataCreation.robot



*** Test Cases ***
Sample Test

    Get Data and Format    ${FILE_PATH}


*** Settings ***
Library     SeleniumLibrary
Library     Collections
# robot -d results Data/list1.robot
*** Variables ***
@{l1}   1   2   3   4
${sum}=     0

*** Test Cases ***
Test1
        FOR    ${i}    IN    @{l1}
            ${sum}   Evaluate    ${i} + ${sum}
        END
         Log To Console    ${sum}


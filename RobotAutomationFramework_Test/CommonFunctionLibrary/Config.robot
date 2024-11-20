*** Settings ***

*** Variables ***
${ENVIRONMENT}      qa
${BROWSER}      chrome
&{URL}      qa=https://www.google.com       prod=https://demoqa.com/text-box
${FILEPATH}     ${EXECDIR}\\Data
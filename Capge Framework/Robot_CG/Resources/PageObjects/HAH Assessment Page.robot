*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Data/TestData.robot


*** Variables ***
${Q1} =    //label[@id='Current Heart or Cardiac problems:']/following::a[text()='High blood pressure']
${Q2} =    //label[@id='Past Heart or Cardiac problems:']/following::a[text()='High cholesterol']
${Q3} =    //label[@id='Current Diabetes or Other Endocrine problems:']/following::a[text()='Diabetes']
${Q4} =    //label[@id='Past Diabetes or Other Endocrine problems:']/following::a[text()='Thyroid']
${Q5} =    //label[@id='Current Bone, Muscle or Joint problems:']/following::a[text()='Arthritis']
${Q6} =    //label[@id='Past Bone, Muscle or Joint problems:']/following::a[text()='Osteoporosis']
${Q7} =    //label[@id='Current Lung, Respiratory or Breathing problems:']/following::a[text()='COPD']
${Q8} =    //label[@id='Past Lung, Respiratory or Breathing problems:']/following::a[text()='Asthma']
${Q9} =    //label[@id='Current Neurologic problems:']/following::a[text()='Neuropathy']
${Q10} =    //label[@id='Past Neurologic problems:']/following::a[text()='Stroke']
${Q11} =    //label[@id='Current Kidney, Renal or Bladder Problems:']/following::a[text()='Dialysis']
${Q12} =    //label[@id='Past Kidney, Renal or Bladder Problems:']/following::a[text()='End Stage Renal Disease (ESRD)']
${Q13} =    //label[@id='Current Hematologic/Blood Problems:']/following::a[text()='Anemia']
${Q14} =    //label[@id='Past Hematologic/Blood Problems:']/following::a[text()='Hemophilia']
${Q15} =    //label[@id='Current Digestive problems:']/following::a[text()='GERD']
${Q16} =    //label[@id='Past Digestive problems:']/following::a[text()='Stomach Ulcers']
${Q17} =    //label[@id='Current Eyes, Ears, Nose, Throat problems:']/following::a[text()='Diabetic Retinopathy']
${Q18} =    //label[@id='Past Eyes, Ears, Nose, Throat problems:']/following::a[text()='Blind']
${Q191} =    //label[@id='Current Skin problems:']/following::a[text()='Skin Breakdown'][1]
${Q201} =    //label[@id='Past Skin problems:']/following::a[text()='Wounds']
${Q211} =    //label[@id='Current Cancer problems:']/following::a[text()='Breast']
${Q221} =    //label[@id='Past Cancer Problems:']/following::a[text()='Lung']
${Q231} =    //label[@id='Current Behavioral Health problems:']/following::a[text()='Anxiety']
${Q241} =    //label[@id='Past Behavioral Health problems:']/following::a[text()='Depression']
${Q251} =    //label[@id='Does the member have an Advance Directive?']/following::select[1]
${Q261} =    //label[@id='Does the member have issues communicating and/or understanding instructions?']/following::select[1]
${Q271} =    //label[@id='Does the member have problems with vision?']/following::select[1]
${Q281} =    //label[@id='Does the member have problems with hearing?']/following::select[1]
${Q291} =    //label[@id='Does the member have problems with speech?']/following::select[1]
${Q301} =    //label[@id='Medications and allergies reviewed and/or updated in Medication List with the member?']/following::select[1]
${Q311} =    //label[@id='Does the member need help with bathing, dressing and/or hygiene?']/following::select[1]
${Q321} =    //label[@id='Does the member need help with eating?']/following::select[1]
${Q331} =    //label[@id='Does the member need help with toileting?']/following::select[1]
${Q341} =    //label[@id='Does the member use assistive device for ambulation?']/following::select[1]
${Q351} =    //label[@id='In the past 6 months have you fallen?']/following::select[1]
${Q361} =    //label[@id='Is the member bed bound?']/following::select[1]
${Q371} =    //label[@id='Is member homeless?']/following::select[1]
${Q381} =    //label[@id='Does member feel safe at home?']/following::select[1]
${Q391} =    //label[@id='Does the member work/attend school?']/following::select[1]
${Q401} =    //label[@id='What is the member']/following::textarea[1]
${Q411} =    //label[@id='Are there known cultural/religious barriers which may impact the member']/following::select[1]
${Q421} =    //label[contains(text(),"What is member's primary language?")]/following::select[1]
${Q43} =     //label[text()='43.']/following::select[1]
${Q441} =    //label[text()='44.']/following::select[1]
${Q451} =    //label[text()='45.']/following::select[1]
${Q461} =    //label[text()='46.']/following::select[1]
${Q471} =    //label[text()='47.']/following::select[1]
${Q481} =    //label[text()='48.']/following::select[1]
${Q491} =    //label[text()='49.']/following::select[1]
${Q501} =    //label[text()='50.']/following::textarea[1]
${Q511} =    //label[text()='51.']/following::select[1]
${Q521} =    //label[text()='52.']/following::select[1]
${Q531} =    //label[text()='53.']/following::textarea[1]
${Q541} =    //label[text()='54.']/following::textarea[1]
${Q551} =    //label[text()='55.']/following::select[1]
${Q561} =    //label[text()='56.']/following::select[1]
${Q571} =    //label[text()='57.']/following::select[1]
${Q581} =    //div[@class='assessmentSequenceNumber']/label[contains(text(),'58.')]/following::a[1]
${Q591} =    //label[text()='59.']/following::select[1]
${Q601} =    //label[text()='60.']/following::select[1]
${Q611} =    //label[text()='61.']/following::select[1]
${Q621} =    //label[text()='62.']/following::select[1]
${Q631} =    //label[text()='63.']/following::select[1]
${Q641} =    //label[text()='64.']/following::select[1]
${Q651} =    //label[text()='65.']/following::select[1]
${Q661} =    //label[text()='66.']/following::select[1]
${Q671} =    //label[text()='67.']/following::select[1]
${Q681} =    //label[text()='68.']/following::select[1]
${Q691} =    //label[text()='69.']/following::select[1]
${submit_Button} =    //a[@id='button-submit-assessment']



*** Keywords ***

Submit HAH CPCM Assessment
    [Arguments]  ${UserData}
    set selenium speed    0.5s
    select from list by label    //select[@id='Department']    Humana Cares
    Sleep   5s
    click element    //u[contains(text(),'SNP General Assessment 14.0')]
    wait until element is visible    ${Q1}    20 Seconds
    sleep    2s
    click element    ${Q1}
    sleep    2s
    select from list by label    //label[@id='Current Heart or Cardiac problems:']/following::select[1]    No
    click element    ${Q2}
    click element    ${Q3}
    sleep    2s
    select from list by label    //label[@id='Current Diabetes or Other Endocrine problems:']/following::select[1]    No
    scroll element into view    ${Q4}
    click element    ${Q4}
    click element    ${Q5}
    sleep    2s
    select from list by label    ${Q5}/following::select[1]    No
    scroll element into view    ${Q6}
    click element    ${Q6}
    click element    ${Q7}
    sleep    2s
    select from list by label    ${Q7}/following::select[1]    No
    scroll element into view    ${Q8}
    click element    ${Q8}
    scroll element into view    ${Q9}
    click element    ${Q9}
    sleep    2s
    select from list by label    ${Q9}/following::select[1]    No
    scroll element into view    ${Q10}
    click element    ${Q10}
    scroll element into view    ${Q11}
    click element    ${Q11}
    sleep    2s
    select from list by label    ${Q11}/following::select[1]    No
    scroll element into view    ${Q12}
    click element    ${Q12}
    scroll element into view    ${Q13}
    click element    ${Q13}
    sleep    2s
    select from list by label    ${Q13}/following::select[1]    No
    scroll element into view    ${Q14}
    click element    ${Q14}
    scroll element into view    ${Q15}
    click element    ${Q15}
    sleep    2s
    select from list by label    ${Q15}/following::select[1]    No
    scroll element into view    ${Q16}
    click element    ${Q16}
    scroll element into view    ${Q17}
    click element    ${Q17}
    sleep    2s
    select from list by label    ${Q17}/following::select[1]    No
    scroll element into view    ${Q18}
    click element    ${Q18}
    sleep    5s
    scroll element into view    ${Q191}
    click element    ${Q191}
    sleep    2s
    select from list by label    ${Q191}/following::select[1]    No
    scroll element into view    ${Q201}
    click element    ${Q201}
    scroll element into view    ${Q211}
    click element    ${Q211}
    sleep    2s
    select from list by label    ${Q211}/following::select[1]    No
    scroll element into view    ${Q221}
    click element    ${Q221}
    scroll element into view    ${Q231}
    click element    ${Q231}
    sleep    2s
    select from list by label    ${Q231}/following::select[1]    No
    scroll element into view    ${Q241}
    click element    ${Q241}
    scroll element into view    ${Q251}
    select from list by label    ${Q251}    Yes
    click element    //label[text()='25.']/following::a[text()='Living will']
    select from list by label    ${Q261}    No
    select from list by label    ${Q271}    No
    select from list by label    ${Q281}    No
    select from list by label    ${Q291}    No
    select from list by label    ${Q301}    No
    select from list by label    ${Q311}    No
    select from list by label    ${Q321}    No
    select from list by label    ${Q331}    No
    select from list by label    ${Q341}    No
    select from list by label    ${Q351}    No
    select from list by label    ${Q361}    No
    select from list by label    ${Q371}    No
    select from list by label    ${Q381}    No
    select from list by label    ${Q391}    No
    input text    ${Q401}    TEST
    select from list by label    ${Q411}    No
    select from list by label    ${Q421}    English
    select from list by label    ${Q43}    No
    select from list by label    ${Q441}    No
    select from list by label    ${Q451}    No
    select from list by label    ${Q461}    No
    select from list by label    ${Q471}    No
    select from list by label    ${Q481}    Yes
    select from list by label    ${Q491}    No
    input text    ${Q501}    2
    select from list by label    ${Q511}    No
    select from list by label    ${Q521}    No
    input text    ${Q531}    140
    input text    ${Q541}    69
    select from list by label    ${Q551}    No
    select from list by label    ${Q561}    No
    select from list by label    ${Q571}    No
    click element    ${Q581}
    select from list by label    ${Q591}    No
    select from list by label    ${Q601}    No
    select from list by label    ${Q611}    Member
    select from list by label    ${Q621}    No
    select from list by label    ${Q631}    No
    select from list by label    ${Q641}    No
    select from list by label    ${Q651}    No
    select from list by label    ${Q661}    Never
    select from list by label    ${Q671}    No
    select from list by label    ${Q681}    No
    select from list by label    ${Q691}    No

    click element    ${submit_Button}



FL LTSS Disaster Preparedness Assessment
    [Arguments]  ${UserData}
    set selenium speed    0.5s
    select from list by label    //label[@id='Current Living Situation:']/following::select[1]    Nursing Home
    Sleep   5s
    select from list by label   //label[@id='Disaster plan:']/following::select[1]    Remain at home
    input text    //label[contains(@id,'Who is your local contact')]/following::textarea[1]    TEST1
    input text    //label[contains(@id,'Who is your local contact')]/following::textarea[2]    TEST2
    click element    //label[@id='Are you registered with a special needs shelter?']/following::label[contains(text(),'Yes')]
    click element    //label[@id='Skilled Care']/following::a[1]
    click element    //label[@id='Medication assistance']/following::a[1]
    click element    //label[@id='Equipment Needed']/following::a[1]
    input text    //label[@id='Should my plans change, I will notify my CC/CM, by calling']/following::textarea[1]    TEST3
    click element    //label[@for='10945_Que_13613_259893']

    click element    //a[@id='button-cancel-assessment']
    sleep    3s
    click element    //a[@id='button-cancel-changes-yes']
    sleep    3s
    page should contain element    //a[@id='btnTakeAssessment']
    page should contain element    //h6[contains(text(),'No Records Found')]
*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary

*** Variables ***
${Message}        \

${Username}       \
${Password}       \

*** Test Cases ***
TC_01
    Open Excel Document    C:/Windows/System32/Sample/testData/login.xlsx    login.xlsx
    ${Username}    Read Excel Cell    2    1    login
    ${Password}    Read Excel Cell    2    2    login
    Log To Console    ${Username}
    Log To Console    ${Password}
    Open Browser    https://accounts.google.com/signin    chrome
    Maximize Browser Window
    sleep    1
    Input Text    xpath: //input[@id='identifierId']    ${Username}
    Click Element    xpath: //div[@id='identifierNext']\n
    sleep    1
    Input Text    xpath: //input[@name='Passwd']\n    ${Password}
    Click Element    xpath: //div[@id='identifierNext']\n
    sleep    1
    Close Browser

TC_02
    Open Browser    https://accounts.google.com/signin    chrome
    Maximize Browser Window
    sleep    1
    Input Text    xpath: //input[@id='identifierId']    ${EMPTY}
    Click Element    xpath: //div[@id='identifierNext']
    ${Message}    Get Text    xpath: //div[@class='o6cuMc Jj6Lae']
    Log To Console    ${Message}
    Should Be Equal As Strings    ${Message}    Enter an email or phone number
    sleep    1
    Close Browser

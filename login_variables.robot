*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
*** Variables ***
${URL}         https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
*** Test Cases ***
Login Success
    Open Browser    ${URL}    chrome
    Input Text      id:user-name    ${USERNAME}
    Input Password  id:password     ${PASSWORD}
    Click Button    id:login-button
    Wait Until Page Contains    Products    10s   # ไม่ควรใช้ Page Should Contain เพราะจะทำให้ test fail ทันทีถ้าไม่เจอข้อความ
    Pause Execution    Click OK to continue testing

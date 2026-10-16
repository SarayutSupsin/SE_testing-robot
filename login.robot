*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
*** Test Cases ***
Login With Valid Credentials
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Wait Until Page Contains    Products    10s
    #Close Browser
    Sleep    10s
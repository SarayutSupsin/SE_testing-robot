*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}           https://www.saucedemo.com/
${BROWSER}       chrome
${USERNAME}      standard_user
${PASSWORD}      secret_sauce
*** Test Cases ***
Buy One Product Successfully
    # 🎯 แก้ไขบรรทัดเปิด Browser ให้เพิ่มการปิดระบบเช็ครหัสผ่านรั่วไหล (Password Leak Detection)
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-features=PasswordLeakDetection
    Open Browser    ${URL}    ${BROWSER}    options=${options}

    #Open Browser    ${URL}    ${BROWSER}
    # Login
    Input Text        id:user-name    ${USERNAME}
    Input Password    id:password     ${PASSWORD}
    Click Button      id:login-button
    # Verify login success
    wait until Page Contains    Products   10s
    # Add 1 product to cart
    Click Button    id:add-to-cart-sauce-labs-backpack
    # Verify cart badge
    element should contain    class:shopping_cart_badge    1
    # Open cart
    Click Element    class:shopping_cart_link
    # Verify product in cart
    Page Should Contain    Sauce Labs Backpack
    # Checkout
    Click Button    id:checkout
    # Enter customer information
    Input Text    id:first-name    Testname
    Input Text    id:last-name     Testsurname
    Input Text    id:postal-code   90110
    Click Button    id:continue
    # Verify checkout overview
    wait until Page Contains    Checkout: Overview    10s
    Page Should Contain    Sauce Labs Backpack
    # Complete order
    Click Button    id:finish
    # Verify order success
    wait until Page Contains    Thank you for your order!    10s
    Sleep    5s
    Close Browser

# Robot Framework - SeleniumLibrary

โปรเจกต์ทดสอบเว็บไซต์อัตโนมัติ (Web Automation Testing) ด้วย Robot Framework และ SeleniumLibrary โดยใช้ VS Code ในการเขียนและจัดการ Test Case

## 1. เครื่องมือที่ใช้

- **Python** — ใช้ติดตั้งและรัน Robot Framework
- **Robot Framework** — ใช้เขียนและดำเนินการ Test Case
- **SeleniumLibrary** — ใช้ควบคุมเว็บเบราว์เซอร์ผ่าน Selenium
- **Google Chrome** — เว็บเบราว์เซอร์ที่ใช้ทดสอบ
- **Visual Studio Code** — โปรแกรมสำหรับเขียนและแก้ไขไฟล์ทดสอบ

### VS Code Extensions

- **RobotCode** — ช่วยเขียน ตรวจสอบ และรันไฟล์ Robot Framework
- **Python (Microsoft)** — ช่วยเลือก Python Interpreter และจัดการสภาพแวดล้อม Python

## 2. การติดตั้ง

### 2.1 สร้างโฟลเดอร์โปรเจกต์

เปิด Terminal ใน VS Code แล้วรันคำสั่ง

```cmd
mkdir SE-robot69
cd SE-robot69
```

### 2.2 สร้าง Virtual Environment

```cmd
python -m venv .venv
.venv\Scripts\activate.bat
```

Virtual Environment ใช้แยกไลบรารีของโปรเจกต์ออกจาก Python ส่วนอื่นในเครื่อง

### 2.3 ติดตั้ง Libraries

```cmd
python -m pip install --upgrade pip
python -m pip install robotframework
python -m pip install robotframework-seleniumlibrary
```

ตรวจสอบการติดตั้ง

```cmd
robot --version
```

> หมายเหตุ: ต้องติดตั้ง Google Chrome ก่อนใช้งาน SeleniumLibrary โดย Selenium Manager สามารถช่วยจัดการ WebDriver ให้โดยอัตโนมัติในกรณีที่รองรับ

## 3. โครงสร้างโปรเจกต์

```text
SE-robot69/
├── .venv/
├── login_passwrong.robot
├── output.xml
├── log.html
└── report.html
```

- `.venv/` — สภาพแวดล้อม Python ของโปรเจกต์
- `login_passwrong.robot` — ไฟล์ Test Case
- `output.xml` — ผลการทดสอบในรูปแบบ XML
- `log.html` — รายละเอียดการทำงานของ Test Case
- `report.html` — รายงานสรุปผลการทดสอบ

ไฟล์รายงานจะถูกสร้างขึ้นหลังจากรัน Test Case สำเร็จในระดับการทำงานของ Robot Framework

## 4. ตัวอย่าง Test Case: Login With Invalid Password

สร้างไฟล์ `login_passwrong.robot`

```robot
*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

*** Test Cases ***
Login With Invalid Password
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    standard_user
    Input Password    id:password    wrong_password
    Click Button    id:login-button
    Page Should Contain    Username and password do not match
    Pause Execution    Click OK to continue testing
    Close Browser
```

### อธิบายการทำงาน

1. เปิดเว็บไซต์ SauceDemo ด้วย Google Chrome
2. กรอก Username เป็น `standard_user`
3. กรอก Password ที่ไม่ถูกต้อง
4. คลิกปุ่ม Login
5. ตรวจสอบว่าหน้าเว็บแสดงข้อความ `Username and password do not match`
6. หยุดรอให้ผู้ทดสอบกด OK ในกล่องโต้ตอบ
7. ปิดเบราว์เซอร์

Test Case นี้ใช้ตรวจสอบว่าเว็บไซต์แจ้งข้อผิดพลาดเมื่อผู้ใช้กรอกรหัสผ่านไม่ถูกต้อง

## 5. วิธีรัน Test Case

เปิด Terminal ใน VS Code แล้วตรวจสอบว่าอยู่ในโฟลเดอร์โปรเจกต์ และเปิดใช้งาน Virtual Environment แล้ว

รันคำสั่ง

```cmd
robot login_passwrong.robot
```

**ข้อควรระวัง:** ไม่ควรใช้ `python login_passwrong.robot` เพราะไฟล์ `.robot` ต้องรันด้วย Robot Framework ไม่ใช่ Python โดยตรง

หากต้องการเก็บรายงานไว้ในโฟลเดอร์ `results`

```cmd
robot --outputdir results login_passwrong.robot
```

## 6. การดูผลการทดสอบ

หลังจากรัน Test Case แล้ว Robot Framework จะสร้างไฟล์รายงาน HTML และ XML

หากใช้คำสั่งที่เก็บผลไว้ใน `results` สามารถเปิดรายงานด้วยคำสั่ง

```cmd
start results\report.html
```

หรือเปิด `log.html` เพื่อดูรายละเอียดการทำงานของแต่ละ Keyword

- **PASS** — Test Case ผ่านเงื่อนไขที่กำหนด
- **FAIL** — Test Case ไม่ผ่านเงื่อนไข หรือเกิดข้อผิดพลาดระหว่างการทำงาน

## 7. คำสั่งที่ใช้บ่อย

| คำสั่ง | หน้าที่ |
|---|---|
| `robot --version` | ตรวจสอบเวอร์ชัน Robot Framework |
| `robot login_passwrong.robot` | รัน Test Case |
| `robot --outputdir results login_passwrong.robot` | รันและเก็บรายงานในโฟลเดอร์ `results` |
| `start report.html` | เปิดรายงานผล |
| `start log.html` | เปิดรายละเอียดการทำงาน |

## 8. เอกสารอ้างอิง

- Robot Framework: https://robotframework.org/
- SeleniumLibrary: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
- RobotCode: https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode
- Python Extension: https://marketplace.visualstudio.com/items?itemName=ms-python.python


## 9. คำสั่งที่ใช้เขียน Test Case (Keywords)

Robot Framework ใช้ Keyword ในการสั่งงาน โดย Keyword ของ SeleniumLibrary ใช้ควบคุมเว็บเบราว์เซอร์ เช่น เปิดเว็บไซต์ กรอกข้อมูล คลิกปุ่ม และตรวจสอบผลลัพธ์

### 9.1 การเปิดและปิดเว็บไซต์

| Keyword | หน้าที่ | ตัวอย่าง |
|---|---|---|
| `Open Browser` | เปิดเบราว์เซอร์และเว็บไซต์ | `Open Browser    https://www.saucedemo.com/    chrome` |
| `Go To` | เปลี่ยนไปยัง URL ที่กำหนด | `Go To    https://www.saucedemo.com/` |
| `Reload Page` | โหลดหน้าเว็บใหม่ | `Reload Page` |
| `Close Browser` | ปิดเบราว์เซอร์ที่เปิดอยู่ | `Close Browser` |
| `Close All Browsers` | ปิดเบราว์เซอร์ทั้งหมดที่เปิดด้วย SeleniumLibrary | `Close All Browsers` |
| `Title Should Be` | ตรวจสอบชื่อหน้าเว็บ | `Title Should Be    Swag Labs` |
| `Location Should Be` | ตรวจสอบ URL ปัจจุบัน | `Location Should Be    https://www.saucedemo.com/` |

### 9.2 การกรอกข้อมูลและคลิก

| Keyword | หน้าที่ | ตัวอย่าง |
|---|---|---|
| `Input Text` | กรอกข้อความลงในช่อง | `Input Text    id:user-name    standard_user` |
| `Input Password` | กรอกรหัสผ่าน | `Input Password    id:password    secret_sauce` |
| `Clear Element Text` | ล้างข้อความในช่องกรอก | `Clear Element Text    id:user-name` |
| `Click Button` | คลิกปุ่ม | `Click Button    id:login-button` |
| `Click Element` | คลิก Element ทั่วไป | `Click Element    id:react-burger-menu-btn` |
| `Select From List By Label` | เลือกตัวเลือกจาก Dropdown ตามข้อความ | `Select From List By Label    id:country    Thailand` |
| `Select Checkbox` | เลือก Checkbox | `Select Checkbox    id:accept` |
| `Unselect Checkbox` | ยกเลิก Checkbox | `Unselect Checkbox    id:accept` |

> หมายเหตุ: Keyword สำหรับ Dropdown และ Checkbox ต้องใช้กับ Element ที่รองรับคำสั่งนั้น หากเป็นเว็บที่สร้าง UI แบบพิเศษ อาจต้องใช้ Keyword อื่นแทน

### 9.3 การตรวจสอบผลลัพธ์ (Assertions)

| Keyword | หน้าที่ | ตัวอย่าง |
|---|---|---|
| `Page Should Contain` | ตรวจสอบว่าหน้ามีข้อความที่ระบุ | `Page Should Contain    Products` |
| `Page Should Not Contain` | ตรวจสอบว่าหน้าไม่มีข้อความที่ระบุ | `Page Should Not Contain    Error` |
| `Element Should Be Visible` | ตรวจสอบว่า Element แสดงอยู่ | `Element Should Be Visible    id:login-button` |
| `Element Should Be Enabled` | ตรวจสอบว่า Element สามารถใช้งานได้ | `Element Should Be Enabled    id:login-button` |
| `Element Should Be Disabled` | ตรวจสอบว่า Element ถูกปิดใช้งาน | `Element Should Be Disabled    id:checkout` |
| `Element Should Contain` | ตรวจสอบว่า Element มีข้อความที่ระบุ | `Element Should Contain    css:.error-message-container    Username and password do not match` |
| `Textfield Value Should Be` | ตรวจสอบค่าของช่องกรอกข้อความ | `Textfield Value Should Be    id:user-name    standard_user` |
| `Checkbox Should Be Selected` | ตรวจสอบว่า Checkbox ถูกเลือก | `Checkbox Should Be Selected    id:accept` |

### 9.4 การรอให้หน้าเว็บพร้อม (Wait)

ใช้รอให้ Element หรือข้อความปรากฏก่อนดำเนินการขั้นตอนถัดไป ช่วยลดปัญหาจากหน้าเว็บที่โหลดไม่ทัน

| Keyword | หน้าที่ | ตัวอย่าง |
|---|---|---|
| `Wait Until Element Is Visible` | รอจนกว่า Element จะแสดง | `Wait Until Element Is Visible    id:login-button    timeout=10s` |
| `Wait Until Element Is Enabled` | รอจนกว่า Element จะใช้งานได้ | `Wait Until Element Is Enabled    id:login-button    timeout=10s` |
| `Wait Until Page Contains` | รอจนกว่าหน้าจะมีข้อความ | `Wait Until Page Contains    Products    timeout=10s` |
| `Wait Until Location Contains` | รอจนกว่า URL จะมีข้อความที่กำหนด | `Wait Until Location Contains    inventory.html    timeout=10s` |
| `Sleep` | หยุดรอตามเวลาที่กำหนด | `Sleep    2s` |

ควรใช้ Keyword กลุ่ม `Wait Until ...` เมื่อรอผลจากหน้าเว็บ แทนการใช้ `Sleep` เป็นประจำ เพราะการรอแบบมีเงื่อนไขจะทำงานต่อเมื่อสิ่งที่ต้องการพร้อมแล้ว

### 9.5 การจัดการ Dropdown, Checkbox และ Radio Button

| Keyword | หน้าที่ | ตัวอย่าง |
|---|---|---|
| `Select From List By Value` | เลือก Dropdown ตามค่า `value` | `Select From List By Value    id:country    TH` |
| `Select From List By Index` | เลือก Dropdown ตามลำดับ เริ่มจาก 0 | `Select From List By Index    id:country    1` |
| `Radio Button Should Be Set To` | ตรวจสอบค่า Radio Button ที่เลือก | `Radio Button Should Be Set To    gender    male` |
| `Select Radio Button` | เลือก Radio Button | `Select Radio Button    gender    male` |

Keyword กลุ่มนี้ต้องใช้กับ HTML Element ที่เข้ากันได้กับคำสั่งของ SeleniumLibrary

### 9.6 การจัดการ Alert และ Dialog

| Keyword | หน้าที่ | ตัวอย่าง |
|---|---|---|
| `Handle Alert` | จัดการ JavaScript Alert | `Handle Alert    ACCEPT` |
| `Alert Should Be Present` | ตรวจสอบว่า Alert แสดงอยู่ | `Alert Should Be Present    Are you sure?` |
| `Choose Ok On Next Confirmation` | กำหนดให้กดยืนยัน OK ใน Confirmation ถัดไป | `Choose Ok On Next Confirmation` |
| `Choose Cancel On Next Confirmation` | กำหนดให้กดยกเลิกใน Confirmation ถัดไป | `Choose Cancel On Next Confirmation` |

JavaScript Alert/Confirmation ไม่เหมือนกับ Dialog ของ Robot Framework โดย `Pause Execution` จาก Library `Dialogs` จะหยุดการทดสอบเพื่อรอผู้ใช้ดำเนินการต่อ

### 9.7 การจัดการ Test Case และตัวแปร

| รูปแบบ | หน้าที่ | ตัวอย่าง |
|---|---|---|
| `${variable}` | ตัวแปรค่าเดียว | `${username}=    Set Variable    standard_user` |
| `Set Test Variable` | กำหนดตัวแปรที่ใช้ได้ใน Test Case ปัจจุบัน | `Set Test Variable    ${USER}    standard_user` |
| `Log` | แสดงข้อความใน Log | `Log    Starting login test` |
| `Log To Console` | แสดงข้อความใน Terminal | `Log To Console    Login test started` |
| `Should Be Equal` | ตรวจสอบว่าค่าสองค่าตรงกัน | `Should Be Equal    ${actual}    ${expected}` |
| `Should Contain` | ตรวจสอบว่าข้อความหนึ่งอยู่ในอีกข้อความหนึ่ง | `Should Contain    ${message}    Error` |
| `Fail` | กำหนดให้ Test Case ไม่ผ่าน | `Fail    Unexpected result` |
| `No Operation` | ไม่มีการดำเนินการ ใช้เป็น Keyword ว่าง | `No Operation` |

ตัวอย่างการใช้ตัวแปร:

```robot
*** Test Cases ***
Login Test
    ${username}=    Set Variable    standard_user
    Input Text    id:user-name    ${username}
```

### 9.8 Locator ที่ใช้ระบุ Element

Locator คือวิธีบอก Selenium ว่าต้องการทำงานกับ Element ใดบนหน้าเว็บ

| Locator | ตัวอย่าง | ความหมาย |
|---|---|---|
| `id` | `id:login-button` | ระบุด้วย ID |
| `name` | `name:username` | ระบุด้วย Attribute `name` |
| `css` | `css:.error-message` | ระบุด้วย CSS Selector |
| `xpath` | `xpath://button[@type='submit']` | ระบุด้วย XPath |
| `class` | `class:btn-primary` | ระบุด้วย Class |
| `tag` | `tag:button` | ระบุด้วยชื่อ HTML Tag |
| `link` | `link:Logout` | ระบุลิงก์จากข้อความที่แสดง |

ควรเลือกใช้ `id` ที่ไม่ซ้ำกันก่อน หากไม่มีจึงพิจารณาใช้ CSS Selector หรือ XPath ตามโครงสร้างของหน้าเว็บ

### 9.9 ตัวอย่างการนำ Keywords มาใช้ร่วมกัน

ตัวอย่าง Test Case สำหรับเข้าสู่ระบบด้วยข้อมูลที่ถูกต้องบน SauceDemo

```robot
*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login With Valid Credentials
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Wait Until Page Contains    Products    timeout=10s
    Page Should Contain    Products
    Close Browser
```

Test Case นี้จะเปิดเว็บไซต์ กรอกข้อมูลเข้าสู่ระบบ คลิก Login และตรวจสอบว่าหน้า Products ปรากฏขึ้น ก่อนปิดเบราว์เซอร์

**ข้อควรจำ:** Keywords ใน README นี้มาจากหลายส่วน ได้แก่ SeleniumLibrary, BuiltIn และ Dialogs จึงต้องมี Library ที่เกี่ยวข้องใน `*** Settings ***` และควรตรวจสอบชื่อ Keyword กับเอกสารของ Library เวอร์ชันที่ติดตั้งก่อนใช้งานจริง


# Robot Framework: Automated Test Case Recording

## 1. วัตถุประสงค์

ใช้เครื่องมือ Recorder เพื่อบันทึกการใช้งานเว็บไซต์ และสร้างโค้ด Test Case สำหรับ Robot Framework โดยเรียกใช้งานผ่าน Terminal

## 2. ติดตั้งเครื่องมือ

เปิด Terminal ในโฟลเดอร์โปรเจกต์ แล้วรันคำสั่งทีละบรรทัด

```bash
python -m pip install robotframework-browser-recorder
python -m pip install robotframework-browser
rfbrowser init
```

## 3. เปิดเว็บไซต์และเริ่มบันทึก

รันคำสั่งเพื่อเปิดเว็บไซต์ผ่าน Recorder

```bash
rfbrowser-record --url https://www.saucedemo.com/
```

จากนั้นทดลองใช้งานเว็บไซต์ตาม Test Case ที่ต้องการ เช่น กรอกข้อมูลเข้าสู่ระบบและกดปุ่ม Login

## 4. ตรวจสอบไฟล์ Test Case

หลังบันทึกเสร็จ ให้ตรวจสอบไฟล์ `.robot` ที่เครื่องมือสร้างขึ้น แล้วเปิดไฟล์เพื่อตรวจสอบหรือแก้ไขขั้นตอนการทดสอบ

## 5. รัน Test Case

ใช้คำสั่งต่อไปนี้เพื่อเริ่มทดสอบ

```bash
robot recorded_test.robot
```

Robot Framework จะแสดงผลการทดสอบใน Terminal และสร้างไฟล์รายงาน เช่น `log.html` และ `report.html`

## หมายเหตุ

- ไฟล์ `.robot` สามารถเปิดแก้ไขด้วย VS Code ได้
- ตัวอย่างคำสั่งข้างต้นใช้ `Browser Library` ซึ่งต่างจาก `SeleniumLibrary` ที่ใช้ในไฟล์ `login_passwrong.robot`
- ชื่อคำสั่งเปิด Recorder และชื่อไฟล์ผลลัพธ์ต้องตรวจสอบให้ตรงกับเครื่องมือเวอร์ชันที่ติดตั้ง หากคำสั่ง `rfbrowser-record` ใช้งานไม่ได้ อย่าเพิ่งสมมติว่าการติดตั้งสำเร็จ ให้ตรวจสอบคู่มือของแพ็กเกจก่อน

# Robot Framework — Test Case Writing Guide

## 1. โครงสร้างไฟล์ `.robot`

```robot
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.saucedemo.com/
${USERNAME}   standard_user
${PASSWORD}   secret_sauce

*** Test Cases ***
Login Success
    Open Browser    ${URL}    chrome
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Location Should Contain    inventory.html
    Close Browser
```

- `*** Settings ***` กำหนด Library และการตั้งค่าที่ใช้
- `*** Variables ***` ประกาศตัวแปรเพื่อนำกลับมาใช้ซ้ำ
- `*** Test Cases ***` กำหนด Test Case และขั้นตอนทดสอบ
- `*** Keywords ***` สร้าง Keyword ของเราเองเพื่อนำขั้นตอนที่ใช้ซ้ำมาเรียกใช้

## 2. คำสั่งสำหรับเปิดและควบคุม Browser

| Keyword | ใช้ทำอะไร | ตัวอย่าง |
|---|---|---|
| `Open Browser` | เปิดเว็บเบราว์เซอร์ | `Open Browser    ${URL}    chrome` |
| `Close Browser` | ปิดเบราว์เซอร์ | `Close Browser` |
| `Close All Browsers` | ปิดเบราว์เซอร์ทั้งหมดที่เปิดผ่าน Library | `Close All Browsers` |
| `Go To` | เปิด URL ที่ระบุ | `Go To    ${URL}` |
| `Reload Page` | โหลดหน้าเว็บใหม่ | `Reload Page` |
| `Get Location` | อ่าน URL ปัจจุบัน | `${url}=    Get Location` |

## 3. คำสั่งสำหรับกรอกข้อมูลและคลิก

| Keyword | ใช้ทำอะไร | ตัวอย่าง |
|---|---|---|
| `Input Text` | กรอกข้อความในช่อง Input | `Input Text    id=username    testuser` |
| `Input Password` | กรอกรหัสผ่าน | `Input Password    id=password    123456` |
| `Click Button` | คลิกปุ่ม | `Click Button    id=login-button` |
| `Click Element` | คลิก Element ทั่วไป | `Click Element    id=menu` |
| `Select From List By Label` | เลือกตัวเลือกใน Dropdown ด้วยข้อความ | `Select From List By Label    id=country    Thailand` |
| `Choose File` | เลือกไฟล์สำหรับอัปโหลด | `Choose File    id=file-upload    ${CURDIR}/test.png` |
| `Clear Element Text` | ลบข้อความในช่องกรอกข้อมูล | `Clear Element Text    id=username` |
| `Press Keys` | กดปุ่มบนคีย์บอร์ด | `Press Keys    id=username    ENTER` |

## 4. คำสั่งสำหรับค้นหาและตรวจสอบ Element

| Keyword | ใช้ทำอะไร | ตัวอย่าง |
|---|---|---|
| `Element Should Be Visible` | ตรวจสอบว่า Element แสดงอยู่ | `Element Should Be Visible    id=login-button` |
| `Element Should Be Enabled` | ตรวจสอบว่า Element ใช้งานได้ | `Element Should Be Enabled    id=login-button` |
| `Element Should Be Disabled` | ตรวจสอบว่า Element ถูกปิดใช้งาน | `Element Should Be Disabled    id=login-button` |
| `Element Should Contain` | ตรวจสอบว่า Element มีข้อความที่กำหนด | `Element Should Contain    id=message    Success` |
| `Element Text Should Be` | ตรวจสอบว่าข้อความตรงกันทั้งหมด | `Element Text Should Be    id=message    Login successful` |
| `Page Should Contain` | ตรวจสอบว่าหน้ามีข้อความที่กำหนด | `Page Should Contain    Products` |
| `Page Should Not Contain` | ตรวจสอบว่าหน้าไม่มีข้อความที่กำหนด | `Page Should Not Contain    Error` |
| `Page Should Contain Element` | ตรวจสอบว่าหน้ามี Element ที่กำหนด | `Page Should Contain Element    id=inventory_container` |
| `Location Should Contain` | ตรวจสอบว่า URL มีข้อความที่กำหนด | `Location Should Contain    inventory.html` |
| `Title Should Be` | ตรวจสอบชื่อหน้าเว็บ | `Title Should Be    Swag Labs` |

## 5. วิธีระบุ Element (Locator)

Locator ใช้ระบุว่า Keyword ต้องทำงานกับ Element ใดบนหน้าเว็บ

| Locator | ความหมาย | ตัวอย่าง |
|---|---|---|
| `id=` | ค้นหาจาก ID | `id=username` |
| `name=` | ค้นหาจาก Name | `name=password` |
| `css=` | ค้นหาด้วย CSS Selector | `css=.login-button` |
| `xpath=` | ค้นหาด้วย XPath | `xpath=//button[@type="submit"]` |
| `class=` | ค้นหาจาก Class | `class=login-button` |
| `link=` | ค้นหาจากข้อความลิงก์ | `link=Products` |

ตัวอย่างการใช้งาน:

```robot
Input Text    id=user-name    standard_user
Click Button    id=login-button
Element Should Be Visible    css=[data-test="error"]
```

## 6. คำสั่งสำหรับรอให้เว็บไซต์ทำงานเสร็จ

| Keyword | ใช้ทำอะไร | ตัวอย่าง |
|---|---|---|
| `Sleep` | หยุดรอตามเวลาที่กำหนด | `Sleep    2s` |
| `Wait Until Element Is Visible` | รอจน Element ปรากฏ | `Wait Until Element Is Visible    id=login-button    10s` |
| `Wait Until Element Is Enabled` | รอจน Element ใช้งานได้ | `Wait Until Element Is Enabled    id=login-button    10s` |
| `Wait Until Page Contains` | รอจนหน้ามีข้อความที่กำหนด | `Wait Until Page Contains    Products    10s` |
| `Wait Until Location Contains` | รอจน URL มีข้อความที่กำหนด | `Wait Until Location Contains    inventory.html    10s` |

ควรใช้คำสั่ง `Wait Until ...` เมื่อจำเป็นต้องรอให้เว็บไซต์โหลดหรือแสดงผล แทนการใช้ `Sleep` เป็นเวลาตายตัวในทุกขั้นตอน

## 7. คำสั่งสำหรับตัวแปรและการทำซ้ำ

| คำสั่ง | ใช้ทำอะไร | ตัวอย่าง |
|---|---|---|
| `${variable}` | ตัวแปรทั่วไป | `${USERNAME}=    Set Variable    standard_user` |
| `@{list}` | ตัวแปรแบบรายการ | `@{USERS}=    Create List    user1    user2` |
| `Set Variable` | กำหนดค่าให้ตัวแปร | `${name}=    Set Variable    Ait` |
| `Log` | แสดงข้อความใน Log | `Log    Starting login test` |
| `IF / ELSE / END` | กำหนดเงื่อนไข | `IF    '${status}' == 'PASS'` |
| `FOR / END` | วนทำงานหลายรอบ | `FOR    ${user}    IN    @{USERS}` |
| `Should Be Equal` | ตรวจสอบว่าค่าสองค่าตรงกัน | `Should Be Equal    ${actual}    ${expected}` |
| `Should Contain` | ตรวจสอบว่าข้อความหนึ่งอยู่ในอีกข้อความ | `Should Contain    ${message}    Success` |

ตัวอย่างการใช้ IF:

```robot
*** Test Cases ***
Check Login Message
    ${status}=    Set Variable    PASS
    IF    '${status}' == 'PASS'
        Log    Test passed
    ELSE
        Log    Test failed
    END
```

ตัวอย่างการใช้ FOR:

```robot
*** Test Cases ***
Test Multiple Users
    @{USERS}=    Create List    user1    user2    user3
    FOR    ${user}    IN    @{USERS}
        Log    Testing user: ${user}
    END
```

## 8. การสร้าง Keyword ของตัวเอง

ใช้ `*** Keywords ***` เพื่อรวมขั้นตอนที่ใช้ซ้ำให้เรียกใช้งานง่ายขึ้น

```robot
*** Keywords ***
Login To Website
    Input Text    id=user-name    standard_user
    Input Text    id=password    secret_sauce
    Click Button    id=login-button
```

จากนั้นเรียกใช้ใน Test Case ได้ดังนี้

```robot
*** Test Cases ***
Login Success
    Open Browser    https://www.saucedemo.com/    chrome
    Login To Website
    Location Should Contain    inventory.html
    Close Browser
```

## 9. หลักการเขียน Test Case ที่ดี

1. ตั้งชื่อ Test Case ให้สื่อว่ากำลังทดสอบอะไร
2. เตรียมข้อมูลและสถานะเริ่มต้นให้เหมาะสม
3. เขียนขั้นตอนการทดสอบตามลำดับ
4. ตรวจสอบผลลัพธ์ด้วย Assertion หรือ Keyword ที่ใช้ยืนยันผล
5. ปิด Browser และจัดการทรัพยากรเมื่อทดสอบเสร็จ
6. แยก Keyword ที่ใช้ซ้ำออกมาไว้ใน `*** Keywords ***` เพื่อลดโค้ดซ้ำ

**หมายเหตุ:** Keyword ในเอกสารนี้เป็นตัวอย่างสำหรับ `SeleniumLibrary` และ Robot Framework โดยบาง Keyword อาจมาจาก Standard Library ของ Robot Framework ไม่ใช่ SeleniumLibrary โดยตรง

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Kiểm tra đăng nhập hợp lệ
    [Documentation]     Kiểm tra việc đăng nhập với thông tin hợp lệ
    [Tags]              UI
    Open Browser       http://localhost:5173/    firefox
    Maximize Browser Window
    Input Text         //input[@id='username']   admin_balan@getnada.com
    Input Password     //input[@id='password']     Ari123456#
    Click Button       //button[@id='idSubmit']
    Element Text Should Be   id=swal2-html-container    Đăng nhập thành công
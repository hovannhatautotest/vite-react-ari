*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${host}     http://stag.balance.ari.com.vn/#/auth/login
${inputUsername}    css=input#email
${inputPassword}    css=input#password
${loginButton}  css=button#submit-btn
${validation}  css=div.ant-form-item-explain-error
${message}  css=div#swal2-html-container
${Dashboard}        css=div#name-application

*** Keywords ***
User go to login page
    open browser  ${host}   chrome
    maximize browser window
    wait until element is visible  ${inputusername}

Enter "text" in "Tên đăng nhập" with
    [Arguments]         ${username}
     input text         ${inputusername}        ${username}

Enter "text" in "Mật khẩu" with
    [Arguments]         ${password}
     input text         ${inputpassword}        ${password}

Click on "Đăng nhập" button
    click button  ${loginbutton}

Verify validation text
    [Arguments]         ${textValidation}
    wait until element is visible  ${validation}
    element text should be      ${validation}          ${textValidation}

Verify Error message
    [Arguments]         ${textMessage}
    wait until element is visible  ${message}
    element text should be      ${message}          ${textMessage}

Verify Login succesfully with Dashboard
    [Arguments]         ${textDashboard}
    wait until element is visible  ${Dashboard}
    element text should be      ${Dashboard}          ${textDashboard}
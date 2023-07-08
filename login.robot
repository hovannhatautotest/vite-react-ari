*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${host}     http://localhost:5173/vn/auth/login
*** Test Cases ***
OpenWebsite
    open browser  ${host}     chrome
    maximize browser window
*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

DN-07 Verify that validation text in "Email" field when enter invalid email format and greater than 6 characters long
    [Tags]          @smoketest         @regression
    Go to page create data
    When Enter "email" in "Email" with "text_user"
    And Enter "text" in "Họ và tên" with "_RANDOM_"
    Then Required message "Email" field displayed under "Xin vui lòng nhập địa chỉ email hợp lệ!"
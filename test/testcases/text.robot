*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***
CRU-04 Verify that validation text when create new user with all fields empty & "Lưu lại" button
    [Tags]    @smoketest         @regression
    Go to page create user with the "Staff" role
    When Click "Lưu lại" button
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
    And Required message "Email" displayed under "Xin vui lòng nhập email" field
    And Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
    And Required message "Nhập lại mật khẩu" displayed under "Xin vui lòng nhập nhập lại mật khẩu" field
    And Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field
    And Required message "Ngày sinh" displayed under "Xin vui lòng chọn ngày sinh" field
    And Required message "Vị trí" displayed under "Xin vui lòng chọn vị trí" field
    And Required message "Ngày đầu đi làm" displayed under "Xin vui lòng chọn ngày đầu đi làm" field
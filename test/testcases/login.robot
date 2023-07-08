*** Settings ***
Resource  ../keywords/common.robot

*** Test Cases ***
#----------------------VALIDATION TEXT-------------------------------------------
DN-01 Verify that Đăng nhập unsuccessfully with blank "Tên đăng nhập" and "Mật khẩu" field
  [Tags]                @smoketest              @regression
  User go to login page
  Click on "Đăng nhập" button
  Verify validation text   This is a required field!
  [Teardown]  Close browser

DN-02 Verify that Đăng nhập unsuccessfully because no enter Email
  [Tags]                @smoketest              @regression
  User go to login page
  Enter "text" in "Mật khẩu" with         Ari123456#
  Click on "Đăng nhập" button
  Verify validation text   This is a required field!
  [Teardown]  close browser

DN-03 Verify that Đăng nhập unsuccessfully because no enter Password
  [Tags]                @smoketest              @regression
  User go to login page
  Enter "text" in "Tên đăng nhập" with  text_user@gmail.com
  Click on "Đăng nhập" button
  Verify validation text   This is a required field!
  [Teardown]  close browser

DN-04 Verify that Đăng nhập unsuccessfully with invalid Email format
  [Tags]                @smoketest              @regression
  User go to login page
  Enter "text" in "Tên đăng nhập" with      text_user
  Enter "text" in "Mật khẩu" with         Ari123456#
  Click on "Đăng nhập" button
  Verify validation text   Please enter a valid email address!
  [Teardown]  close browser

#-------------------------------ERROR MESSAGE-----------------------------------------------------
DN-05 Verify that Đăng nhập unsuccessfully with incorrect "Tên đăng nhập"
  [Tags]                @smoketest              @regression
  User go to login page
  Enter "text" in "Tên đăng nhập" with      text_user@gmail.com
  Enter "text" in "Mật khẩu" with         Ari123456#
  Click on "Đăng nhập" button
  Verify Error message    Tài khoản chưa được tạo hoặc chưa được kích hoạt.
  [Teardown]  close browser

DN-06 Verify that Đăng nhập unsuccessfully with incorrect "Mật khẩu"
  [Tags]                @smoketest              @regression
  User go to login page
  Enter "text" in "Tên đăng nhập" with      admin_balan@getnada.com
  Enter "text" in "Mật khẩu" with         text_password
  Click on "Đăng nhập" button
  Verify Error message    Tài khoản hoặc mật khẩu không đúng, vui lòng thử lại
  [Teardown]  close browser

#  -----------------------------LOGIN SUCCESSFULLY------------------------------------------------
DN-06 Verify that Đăng nhập successfully with valid Email and Mật khẩu
  [Tags]                @smoketest              @regression
  User go to login page
  Enter "text" in "Tên đăng nhập" with      admin_balan@getnada.com
  Enter "text" in "Mật khẩu" with           Ari123456#
  Click on "Đăng nhập" button
  Verify Login succesfully with Dashboard    BALANCE
  [Teardown]  close browser
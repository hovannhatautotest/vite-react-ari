*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***

# ---------------------VERIFY VALIDATION TEXT-------------------------------------------------------
LGE-01 Validation text with "Username" field
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Enter "text" in "Password" with "_RANDOM_"
    And Click "Log In" button
    Then Required message "Username" displayed under "Please enter username" field

LGE-02 Validation text with "Password" field
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Enter "email" in "Username" with "_RANDOM_"
    And Click "Log In" button
    Then Required message "Password" displayed under "Please enter password" field

LGE-03 Validation text with "Username" field and "Password" field
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Click "Log In" button
    Then Required message "Username" displayed under "Please enter username" field
    And Required message "Password" displayed under "Please enter password" field

LGE-04 Validation text with "Username" field when enter invalid email format
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Enter "text" in "Username" with "_RANDOM_"
    When Enter "text" in "Password" with "_RANDOM_"
    And Click "Log In" button
    Then Required message "Username" displayed under "Please enter a valid email address!" field

# ---------------------ERROR MESSAGE------------------------------------------------------------
LGE-05 Verify that Log In unsuccessfully because enter incorrect Email
    Change language with "Tiếng Anh"
    When Enter "email" in "Username" with "_RANDOM_"
    And Enter "text" in "Password" with "Password1!"
    And Click "Log In" button
    Then User look message "User _@Username@_ not found!" popup

LGE-06 Verify that Log In unsuccessfully because enter incorrect password
    [Tags]    @smoketest    @regression
     Change language with "Tiếng Anh"
    When Enter "email" in "Username" with "admin@admin.com"
    And Enter "text" in "Password" with "_RANDOM_"
    And Click "Log In" button
    Then User look message "Invalid credentials for user _@Username@_" popup

LGE-07 Verify that Log In unsuccessfully because enter incorrect username and password
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Enter "email" in "Username" with "_RANDOM_"
    And Enter "number" in "Password" with "_RANDOM_"
    And Click "Log In" button
    Then User look message "User _@Username@_ not found!" popup

LGE-08 Verify that Log In unsuccessfully because enter password less than 6 characters
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Enter "email" in "Username" with "_RANDOM_"
    And Enter "text" in "Password" with "Nhat"
    And Click "Log In" button
    Then User look message "password must be longer than or equal to 6 characters" popup

# ----------------------------------LOGIN SUCCESSFULLY-------------------------------------------------------------
LGE-09 Verify that Log In successfully accout Admin with valid Email and Mật khẩu
    [Tags]    @smoketest    @regression
    Login to admin version english
    Then User look dashboard "Admin"
    And User look title "List Dayoff"
    And User look menu "User"
    And User look menu "Day Off"
    And User look menu "Setting"

LGE-10 Verify that Log In successfully account Manager with valid Email and Mật khẩu
    [Tags]    @smoketest    @regression
    Login to Manager version english
    Then User look dashboard "Admin"
    And User look title "List Dayoff"
    And User look menu "User"
    And User look menu "Day Off"
    And User look menu "Setting"

LGE-11 Verify that Log In successfully account Staff with valid Email and Mật khẩu
    [Tags]    @smoketest    @regression
    Login to Staff version english
    And User look dashboard "Admin"
    Then User look title "List Dayoff"
    And User look menu "Day Off"
    And User look menu "Setting"

LGE-12 Verifi that successfully login when using the Enter key
    [Tags]    @smoketest    @regression
    When Change language with "Tiếng Anh"
    And Enter "email" in "Username" with "manager@gmail.com"
    And Enter "text" in "Password" with "Tester@123"
    And Enter at "Password" field to Login
    Then User look message "Success" popup
    And User look dashboard "Admin"
    And User look title "List Dayoff"
    And User look menu "User"
    And User look menu "Day Off"
    And User look menu "Setting"

# ----------------------------------NAVIGATE FORGOT PASSWORD-------------------------------------------------------------
LGE-13 Verify that CAN navigate to the "Forgot Password" page from the link on the Log In page
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Click "Forgot Password" link
    Then User look title form Forgot Password "Forgot Password"

LGE-14 Verify that validation text of "Email" field display when "Email" field empty
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Click "Forgot Password" link
    And Click "Send" button
    Then Required message "Email" displayed under "Please enter email" field

LGE-15 Verify that validation text of "Email" field display when "Email" field invalid email format and less than 6 characters
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Click "Forgot Password" link
    And Enter "text" in "Email" with "abcd"
    And Click "Send" button
    Then Required message "Email" field displayed under "Please enter a valid email address!"
    And Required message "Email" field displayed under "Please enter at least 6 characters!"

LGE-16 Verify that validation text of "Email" field display when "Email" field invalid email format and greater than 6 characters
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Click "Forgot Password" link
    And Enter "text" in "Email" with "_RANDOM_"
    And Click "Send" button
    Then Required message "Email" displayed under "Please enter a valid email address!" field

LGE-17 Verify that the forgot password can be cancel using the "Huỷ bỏ" button
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Click "Forgot Password" link
    And Click "Cancel" button
    Then "Forgot Password" form disappears

# ----------------------------------DISPLAY PASSWORD-------------------------------------------------------------
LGE-18: Verify displays the password
    [Tags]    @smoketest    @regression
    Change language with "Tiếng Anh"
    When Enter "email" in "Username" with "_RANDOM_"
    And Enter "text" in "Password" with "_RANDOM_"
    And Click "Eye" icon to display password
    Then User look "Password" field with type "text"

# # ----------------------------------RELOAD PAGE-------------------------------------------------------------
# LGE-19: Verify refresh page
#     [Tags]    @smoketest    @regression
#     Change language with "Tiếng Anh"
#     When Enter "email" in "Username" with "_RANDOM_"
#     And Enter "text" in "Password" with "_RANDOM_"
#     And Reload Page
#     Then User look "Username" field empty
#     And User look "Password" field empty
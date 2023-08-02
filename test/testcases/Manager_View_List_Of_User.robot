*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

VLOU-01 Verify that user can view the list of Staff successfully
    Login to Manager
    And Click "Người Dùng" menu
    And Click list Role with "Staff"
    Then Show list of "users"

VLOU-02 Verify that user can view the list of Manager successfully
    Login to Manager
    And Click "Người Dùng" menu
    And Click list Role with "Manager"
    Then Show list of "users"

VLOU-03 Verify that user can view the list of Supper Manager successfully
    Login to Manager
    And Click "Người Dùng" menu
    And Click list Role with "Supper Admin"
    Then Show list of "users"

VLOU-04 Verify that Manager can search successfully when entering correct keyword to search box with "Họ và tên"
    Login to Manager
    And Click "Người Dùng" menu
    And Search "text" in "Tìm kiếm" with "${username_valid}"
    Then Show list of "users"

VLOU-05 Verify that Manager can search successfully when entering correct keyword to search box with "Email"
    Login to Manager
    And Click "Người Dùng" menu
    And Search "email" in "Tìm kiếm" with "${email_valid}"
    Then Show list of "users"

VLOU-06 Verify that Manager can search successfully when entering correct keyword to search box with "Phone"
    Login to Manager
    And Click "Người Dùng" menu
    And Search "phone" in "Tìm kiếm" with "${phone_number_valid}"
    Then Show list of "users"

VLOU-07 Verify that Manager can search unsuccessfully when entering incorrect keyword to search box with "Họ và tên"
    Login to Manager
    And Click "Người Dùng" menu
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

VLOU-08 Verify that Manager can search unsuccessfully when entering incorrect keyword to search box with "Email"
    Login to Manager
    And Click "Người Dùng" menu
    And Search "email" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

VLOU-09 Verify that Manager can search unsuccessfully when entering incorrect keyword to search box with "Phone number"
    Login to Manager
    And Click "Người Dùng" menu
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

# VLOU-10 Verify that Next page and Previous page
#     Login to Manager
#     And Click "Người Dùng" menu
#     And Click ">" to "next" page
#     Log To Console    Danh sách user trang 2
#     Then Show list of "users"
#     And Click "<" to "prev" page
#     Log To Console    Danh sách user trang 1
#     Then Show list of "users" 
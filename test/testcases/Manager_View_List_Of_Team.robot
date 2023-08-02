*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

VLOT-17 Verify that user can view the list of teams successfully
    Login to Manager
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    Then Show list of "teams"

VLOT-18 Verify that Manager can search successfully when entering correct keyword to search box with "Tên nhóm"
    Login to Manager
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    And Search "text" in "Tìm kiếm" with "Nhân viên ARI"
    Then Show list of "teams"

VLOT-19 Verify that Manager can search unsuccessfully when entering incorrect keyword to search box
    Login to Manager
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No team are shown

# VLOT-20 Verify that Next page and Previous page
#     Login to Manager
#     When Click "Thiết lập" menu
#     And Click "Nhóm" sub menu to "vn/team"
#     And Click ">" to "next" page
#     Log To Console    Danh sách team trang 2
#     Then Show list of "teams"
#     And Click "<" to "prev" page
#     Log To Console    Danh sách team trang 1
#     Then Show list of "teams" 
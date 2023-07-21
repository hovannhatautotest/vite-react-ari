*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

# ---------------------NAVIGATE CREATE USER PAGE-------------------------------------------------------
CRT-01 Verify that it is possible to navigate to the page for creating a new team
    [Tags]    @smoketest    @regression
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    And Click "Tạo mới" button
    Then User look title "Thêm mới nhóm"

# ---------------------VALIDATION TEXT-------------------------------------------------
CRT-02 Verify that create team unsuccessfull because blank all field
    [Tags]    @smoketest    @regression
    When Go to page create team
    And Click "Lưu lại" button
    Then Required message "Tên Nhóm" displayed under "Xin vui lòng nhập tên nhóm" field
    And Required message "Quản lý" displayed under "Xin vui lòng chọn quản lý" field

CRT-03 Verify that create team unsuccessfull because blank all field
    [Tags]    @smoketest    @regression
    When Go to page create team
    And Click "Lưu và tạo mới" button
    Then Required message "Tên Nhóm" displayed under "Xin vui lòng nhập tên nhóm" field
    And Required message "Quản lý" displayed under "Xin vui lòng chọn quản lý" field

CRT-04 Verify that create team unsuccessfull because no enter "Tên Nhóm" field
    [Tags]    @smoketest    @regression
    When Go to page create team
    And Click select "Quản lý" with "Hồ Văn Nhật"
    And Click "Lưu lại" button
    Then Required message "Tên Nhóm" displayed under "Xin vui lòng nhập tên nhóm" field

CRT-05 Verify that create team unsuccessfull because no enter "Quản lý" field
    [Tags]    @smoketest    @regression
    When Go to page create team
    And Enter "text" in "Tên Nhóm" with "_RANDOM_"
    And Click "Lưu lại" button
    Then Required message "Quản lý" displayed under "Xin vui lòng chọn quản lý" field

# ---------------------------ERROR MESSAGE----------------------------------------
CRT-06 Verify that create team unsuccessfull because team is already taken    # TEST CASE FAILED 
    [Tags]    @smoketest    @regression
    When Go to page create team
    And Enter "text" in "Tên Nhóm" with "Nhân viên ARI"
    And Enter "text" in textarea "user.Description" with "_RANDOM_"
    And Click select "Quản lý" with "Hồ Văn Nhật"
    And Click "Lưu lại" button
    Then User look message "Tên Nhóm đã được sử dụng" popup
    And Click "Huỷ bỏ" button
    When Click on the "Xóa" button in the "Tên Nhóm" table line
    Then User look message "Xóa thành công" popup

# ---------------------------CREATE TEAM SUCCESSFULLY---------------------------------------
CRT-07 Verify that creating a team successfully with the sanme manager with "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to page create team
    And Enter "text" in "Tên Nhóm" with "_RANDOM_"
    And Enter "text" in textarea "user.Description" with "_RANDOM_"
    And Click select "Quản lý" with "Hồ Văn Nhật"
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Nhóm"
    When Click on the "Xóa" button in the "Tên Nhóm" table line
    Then User look message "Xóa thành công" popup

CRT-08 Verify that creating a team successfully with the same manager with "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to page create team
    And Enter "text" in "Tên Nhóm" with "_RANDOM_"
    And Enter "text" in textarea "user.Description" with "_RANDOM_"
    And Click select "Quản lý" with "Hồ Văn Nhật"
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Thêm mới nhóm"
    And Click "Huỷ bỏ" button
    When Click on the "Xóa" button in the "Tên Nhóm" table line
    Then User look message "Xóa thành công" popup

##=======================VIEW LIST OF TEAM====================================##
CRT-09 Verify that user can view the list of teams successfully
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    Then Show list of teams

CRT-10 Verify that Admin can search successfully when entering correct keyword to search box with "Tên nhóm"
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    And Search "text" in "Tìm kiếm" with "Nhóm 1"
    Then Show list of teams

CRT-11 Verify that Admin can search unsuccessfully when entering incorrect keyword to search box
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No team are shown

##=======================VERIFY EDIT TEAM================================##
CRT-12 Verify that user can edit team's name successfully
    Go to page edit team
    And Enter "text" in "Tên Nhóm" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup

CRT-13 Verify that Team edit successfully when change manager has team
    Go to page edit team
    And Click select "Quản lý" with "Lê Tiến Đạt"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup

CRT-14 Verify that Team edit successfully when change manager has no team
    Go to page edit team
    And Click select "Quản lý" with "Hoàng Diệu"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup

##========================ERROR MESSAGE WHEN EDIT TEAM=====================================##
CRT-15 Verify that user can edit team's name successfully        #TEST CASE FAILED
    Go to page edit team
    And Enter "text" in "Tên Nhóm" with "Nhóm 3"
    And Click "Lưu lại" button
    Then User look message "Tên nhóm đã được sử dụng" popup
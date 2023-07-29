*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

## ---------------------NAVIGATE EDIT USER PAGE-------------------------------------------------------
EDU-01 Verify that it is possible to navigate to the page for edit user with the Staff role
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    Then User look title "Chỉnh sửa người dùng Staff"
    And User look title "Chỉnh sửa người dùng Staff"

EDU-02 Verify that it is possible to navigate to the page for edit user with the Manager role
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Manager" role
    Then User look title "Chỉnh sửa người dùng Manager"
    And User look title "Chỉnh sửa người dùng Manager"

EDU-03 Verify that it is possible to navigate to the page for edit user with the Supper Admin role
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Supper Admin" role
    Then User look title "Chỉnh sửa người dùng Supper Admin"
    And User look title "Chỉnh sửa người dùng Supper Admin"

## ---------------------VALIDATION TEXT-------------------------------------------------
EDU-04 Verify that validation text in "Họ và tên" field When blank "Họ và tên" field
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    And Enter "email" in "Email" with "${EMPTY}"
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field

EDU-05 Verify that validation text in "Email" field When blank "Email" field
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "email" in "Email" with "${EMPTY}"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Email" displayed under "Xin vui lòng nhập email" field

EDU-06 Verify that validation text in "Email" field when enter invalid email format and less than 6 characters long
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "email" in "Email" with "text"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Email" field displayed under "Xin vui lòng nhập địa chỉ email hợp lệ!"
    And Required message "Email" field displayed under "Xin vui lòng nhập tối thiểu 6 ký tự!"

EDU-07 Verify that validation text in "Email" field when enter invalid email format and greater than 6 characters long
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "text" in "Email" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Email" field displayed under "Xin vui lòng nhập địa chỉ email hợp lệ!"

EDU-08 Verify that validation text in "Số điện thoại" field When blank "Số điện thoại" field
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "phone" in "Số điện thoại" with "${EMPTY}"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field

EDU-09 Verify that validation text in "Số điện thoại" field When enter invalid phone number format
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

EDU-10 Verify that validation text in "Số điện thoại" field When enter phone number greater than 12 characters
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "number" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa phải có 12 ký tự số!" field

EDU-11 Verify that validation text in "Ngày sinh" field when blank "Ngày sinh" field
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Delete information "Ngày sinh"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Ngày sinh" displayed under "Xin vui lòng chọn ngày sinh" field

EDU-12 Verify that validation text in "Vị tri" field when blank "Vị trí" field
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Delele select "Vị trí" field
    Then Required message "Vị trí" displayed under "Xin vui lòng chọn vị trí" field

EDU-13 Verify that validation text in "Ngày đầu đi làm" field When blank "Ngày đầu đi làm" field
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Delete information "Ngày đầu đi làm"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Ngày đầu đi làm" displayed under "Xin vui lòng chọn ngày đầu đi làm" field

EDU-14 Verify that validation text in "Ngày nghỉ" field When blank "Ngày nghỉ" field
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Click "Lưu lại" button
    Then Required message "Ngày nghỉ" displayed under "Xin vui lòng nhập ngày nghỉ" field

EDU-15 Verify that the validation text in the "Ngày nghỉ" field when enter the number of leave date is greater than 16 days
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "leave date invalid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then Required message "Ngày nghỉ" displayed under "user.Leave date cannot exceed" field

# ##--------------------------------ERROR MESSAGE WHEN EDIT USER------------------------------------------
# EDU-16 Verify that error message display when edit user with Email is already taken & "Lưu lại" button
#     [Tags]    @smoketest    @regression
#     # TEST CASE FAILED
#     Go to page edit user with the "Staff" role
#     And Enter "email" in "Email" with "19t1051013@husc.edu.vn"
#     And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
#     And Click "Lưu lại" button
#     Then User look message "Email đã được sử dụng" popup

# EDU-17 Verify that error message display when edit user with Email is already taken & "Lưu và tạo mới" button
#     [Tags]    @smoketest    @regression
#     # TEST CASE FAILED
#     Go to page edit user with the "Staff" role
#     And Enter "email" in "Email" with "19t1051013@husc.edu.vn"
#     And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
#     And Click "Lưu và tạo mới" button
#     Then User look message "Email đã được sử dụng" popup

EDU-18 Verify that error message display when edit user with team has been deleted & "Lưu lại" button
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Manager" role
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Internal server error" popup

EDU-19 Verify that error message display when edit user with team has been deleted & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Manager" role
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Internal server error" popup

EDU-20 Verify that the error message displayed when editing a user with an existing Manager still has other leave requests that need approval & "Lưu lại" button
    [Tags]    @smoketest    @regression
    Login to admin
    And Click "Người Dùng" menu
    And Click list Role with "Staff"
    And Select the user with "Còn những yêu cầu nghỉ cần duyệt" to edit
    And Click select Quản lý with "Hồ Văn Nhật"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Còn những yêu cầu nghỉ cần duyệt" popup

EDU-21 Verify that the error message displayed when editing a user with an existing Manager still has other leave requests that need approval & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    Login to admin
    And Click "Người Dùng" menu
    And Click list Role with "Staff"
    And Select the user with "Còn những yêu cầu nghỉ cần duyệt" to edit
    And Click select Quản lý with "Hồ Văn Nhật"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Còn những yêu cầu nghỉ cần duyệt" popup

# #--------------------------------EDIT USER SUCCESSFULLY------------------------------------------
EDU-22 Verify that account edit successfully when change name
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "text" in "Họ và tên" with "_RANDOM_"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Người dùng"

EDU-23 Verify that account edit successfully when change Email
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Người dùng"

EDU-24 Verify that account edit successfully when change Phone Number
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Người dùng"

EDU-25 Verify that account edit successfully when change Date Of Birth
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter date in "Ngày sinh" with "_RANDOM_"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Người dùng"

EDU-26 Verify that account edit successfully when change Position
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Click select "Vị trí" with "Developer"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Người dùng"

EDU-27 Verify that account edit successfully when change Start Date
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter date in "Ngày đầu đi làm" with "_RANDOM"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Người dùng"

EDU-28 Verify that account edit successfully & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    Go to page edit user with the "Staff" role
    And Enter "text" in "Họ và tên" with "_RANDOM_"
    And Enter "leave date valid" in "Ngày nghỉ" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách nghỉ phép"


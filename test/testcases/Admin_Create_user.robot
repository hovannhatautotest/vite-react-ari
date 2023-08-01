*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

# # ---------------------NAVIGATE CREATE USER PAGE-------------------------------------------------------
CRU-01 Verify that the page can be navigated to create a new user with the Staff role
    [Tags]    @smoketest    @regression
    Login to Admin
    And Click "Người Dùng" menu
    And Click list Role with "Staff"
    And Click "Tạo mới" button
    Then User look title "Tạo mới người dùng Staff"
    And User look title "Tạo mới người dùng Staff"

CRU-02 Verify that the page can be navigated to create a new user with the Manager role
    [Tags]    @smoketest    @regression
    Login to Admin
    And Click "Người Dùng" menu
    And Click list Role with "Manager"
    And Click "Tạo mới" button
    Then User look title "Tạo mới người dùng Manager"
    And User look title "Tạo mới người dùng Manager"

CRU-03 Verify that the page can be navigated to create a new user with the Supper Admin role
    [Tags]    @smoketest    @regression
    Login to Admin
    And Click "Người Dùng" menu
    And Click list Role with "Supper Admin"
    And Click "Tạo mới" button
    Then User look title "Tạo mới người dùng Supper Admin"
    And User look title "Tạo mới người dùng Supper Admin"

# # ---------------------VALIDATION TEXT-------------------------------------------------
CRU-04 Verify that validation text when blank all fields & "Lưu lại" button
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

CRU-05 Verify that validation text when blank all fields & "Lưu và tạo mới" button
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Click "Lưu và tạo mới" button
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
    And Required message "Email" displayed under "Xin vui lòng nhập email" field
    And Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
    And Required message "Nhập lại mật khẩu" displayed under "Xin vui lòng nhập nhập lại mật khẩu" field
    And Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field
    And Required message "Ngày sinh" displayed under "Xin vui lòng chọn ngày sinh" field
    And Required message "Vị trí" displayed under "Xin vui lòng chọn vị trí" field
    And Required message "Ngày đầu đi làm" displayed under "Xin vui lòng chọn ngày đầu đi làm" field

CRU-06 Verify that validation text of "Họ và tên" field display when blank "Họ và tên" field
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Họ và tên" with "${EMPTY}"
    And Enter "email" in "Email" with "${EMPTY}"
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
    
CRU-07 Verify that validation text of "Email" field display when blank "Email" field
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "email" in "Email" with "${EMPTY}"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Email" displayed under "Xin vui lòng nhập email" field

CRU-08 Verify that validation text in "Email" field when enter invalid email format and less than 6 characters long
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Email" with "text"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Email" field displayed under "Xin vui lòng nhập địa chỉ email hợp lệ!"
    And Required message "Email" field displayed under "Xin vui lòng nhập tối thiểu 6 ký tự!"

CRU-09 Verify that validation text in "Email" field when enter invalid email format and greater than 6 characters long
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Email" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Email" field displayed under "Xin vui lòng nhập địa chỉ email hợp lệ!"

CRU-10 Verify that validation text in "Mật khẩu" field when blank "Mật khẩu" field
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Mật khẩu" with "${EMPTY}"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
    
CRU-11 Verify that validation text in "Mật khẩu" field When enter password less than 6 characters
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Mật khẩu" with "12345"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Mật khẩu" field displayed under "Xin vui lòng nhập tối thiểu 6 ký tự!"
    And Required message "Mật khẩu" field displayed under "Xin vui lòng nhập tối thiểu 6 ký tự số!"

CRU-12 Verify that validation text in "Mật khẩu" field When enter password not enough security
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Mật khẩu" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt" field

CRU-13 Verify that validation text in "Nhập lại mật khẩu" field when blank "Nhập lại mật khẩu" field
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Nhập lại mật khẩu" with "${EMPTY}"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Nhập lại mật khẩu" displayed under "Xin vui lòng nhập nhập lại mật khẩu" field

CRU-14 Verify that validation text in "Nhập lại mật khẩu" field when enter retype_password less than 8 characters
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Nhập lại mật khẩu" with "Nhat123"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Nhập lại mật khẩu" field displayed under "Hai mật khẩu bạn nhập không nhất quán!"
    And Required message "Nhập lại mật khẩu" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số!"

CRU-15 Verify that validation text in "Nhập lại mật khẩu" field when enter retype_password greater than 8 characters
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Nhập lại mật khẩu" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Nhập lại mật khẩu" field displayed under "Hai mật khẩu bạn nhập không nhất quán!"
    And Required message "Nhập lại mật khẩu" field displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt"

CRU-16 Verify that validation text in "Nhập lại mật khẩu" field when enter retype_password does not match
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Mật khẩu" with "Nhat@01101999"
    When Enter "text" in "Nhập lại mật khẩu" with "Hovannhat@01101999"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Nhập lại mật khẩu" displayed under "Hai mật khẩu bạn nhập không nhất quán!" field

CRU-17 Verify that validation text in "Số điện thoại" field when blank "Số điện thoại" field
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "phone" in "Số điện thoại" with "${EMPTY}"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field

CRU-18 Verify that validation text in "Số điện thoại" field When enter invalid phone number format
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

CRU-19 Verify that validation text in "Số điện thoại" field When enter phone number greater than 12 characters
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter "number" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa phải có 12 ký tự số!" field

CRU-20 Verify that validation text in "Ngày sinh" field when blank "Ngày sinh" field
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter date in "Ngày sinh" with "${EMPTY}"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Ngày sinh" displayed under "Xin vui lòng chọn ngày sinh" field

CRU-21 Verify that validation text in "Vị trí" field when blank "Vị trí" field
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Click select "Vị trí" with "Tester"
    And Delele select "Vị trí" field
    Then Required message "Vị trí" displayed under "Xin vui lòng chọn vị trí" field

CRU-22 Verify that validation text in "Ngày đầu đi làm" field when blank "Ngày đầu đi làm" field
    [Tags]          @smoketest         @regression
    Go to page create user with the "Staff" role
    When Enter date in "Ngày đầu đi làm" with "${EMPTY}"
    And Enter "text" in "Họ và tên" with "${EMPTY}"
    Then Required message "Ngày đầu đi làm" displayed under "Xin vui lòng chọn ngày đầu đi làm" field

##--------------------------------------ERROR MESSAGE--------------------------------------------------------
CRU-23 Verify that Create user unsuccessfully because email is already taken & "lưu lại" button
    Go to page create user with the "Staff" role
    When Enter "text" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "staff@gmail.com"
    And Enter "text" in "Mật khẩu" with "Nhat@01101999"
    And Enter "text" in "Nhập lại mật khẩu" with "Nhat@01101999"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter date in "Ngày sinh" with "_RANDOM_"
    And Click select "Vị trí" with "Tester"
    And Enter date in "Ngày đầu đi làm" with "_RANDOM_"
    And Enter "words" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Email đã được sử dụng" popup

CRU-24 Verify that Create user unsuccessfully because email is already taken & "lưu và tạo mới" button
    Go to page create user with the "Staff" role
    When Enter "text" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "staff@gmail.com"
    And Enter "text" in "Mật khẩu" with "Nhat@01101999"
    And Enter "text" in "Nhập lại mật khẩu" with "Nhat@01101999"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter date in "Ngày sinh" with "_RANDOM_"
    And Click select "Vị trí" with "Tester"
    And Enter date in "Ngày đầu đi làm" with "_RANDOM_"
    And Enter "words" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Email đã được sử dụng" popup

##--------------------------------------VERIFY CREATE USER SUCCESSFULLY---------------------------
CRU-25 Verify that Create user successfully when select "Vai trò" with "Staff" & "Lưu lại" button
    Go to page create user with the "Staff" role
    When Enter invalid information to create user
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Người dùng"
    When Click on the "Xóa" button in the "Email" table line
    Then User look message "Xóa thành công" popup

CRU-26 Verify that Create user successfully when select "Vai trò" with "Staff" & "Lưu và tạo mới" button
    Go to page create user with the "Staff" role
    When Enter invalid information to create user
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Tạo mới người dùng Staff"
    And User look all field empty when create user
    When Click "Huỷ bỏ" button
    When Click on the "Xóa" button in the "Email" table line
    Then User look message "Xóa thành công" popup

CRU-27 Verify that Create user successfully when select "Vai trò" with "Manager" & "Lưu lại" button
    Go to page create user with the "Manager" role
    When Enter invalid information to create user
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Người dùng"
    When Click on the "Xóa" button in the "Email" table line
    Then User look message "Xóa thành công" popup

CRU-28 Verify that Create user successfully when select "Vai trò" with "Manager" & "Lưu và tạo mới" button
    Go to page create user with the "Manager" role
    When Enter invalid information to create user
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Tạo mới người dùng Manager"
    And User look all field empty when create user
    When Click "Huỷ bỏ" button
    When Click on the "Xóa" button in the "Email" table line
    Then User look message "Xóa thành công" popup

CRU-29 Verify that Create user successfully when select "Vai trò" with "Supper Admin" & "Lưu lại" button
    Go to page create user with the "Supper Admin" role
    When Enter invalid information to create user
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Người dùng"
    When Click on the "Xóa" button in the "Email" table line
    Then User look message "Xóa thành công" popup

CRU-30 Verify that Create user successfully when select "Vai trò" with "Supper Admin" & "Lưu và tạo mới" button
    Go to page create user with the "Supper Admin" role
    When Enter invalid information to create user
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Tạo mới người dùng Supper Admin"
    And User look all field empty when create user
    When Click "Huỷ bỏ" button
    When Click on the "Xóa" button in the "Email" table line
    Then User look message "Xóa thành công" popup

## -------------------DISPLAY PASSWORD AND RETYPE PASSWORD--------------------------------------------------------------
CRU-31 Verify that can see "Mật khẩu" và "Nhập lại mật khẩu" field are displayed as characters
    Go to page create user with the "Staff" role
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Enter "text" in "Nhập lại mật khẩu" with "_RANDOM_"
    And Click "Eye" icon to show "Mật khẩu" field and "Nhập lại mật khẩu" field
    Then User look "Mật khẩu" field with type "text"
    And User look "Nhập lại mật khẩu" field with type "text"

## ------------------------------------------------------ERROR MESSGAE WHEN DELETE USER-------------------------------------------------------
CRU-32 Verify that Delete user unsuccessfully because user has submitted a request for leave that needs to be approved
    Login to admin
    And Click "Người Dùng" menu
    And Click "Xóa" user has submitted a request for leave that needs to be approved
    Then User look message "Còn những yêu cầu nghỉ cần duyệt" popup

CRU-33 Verify that Delete user unsuccessfully because user still managing other people
    Login to admin
    And Click "Người Dùng" menu
    And Click "Xóa" user still managing other people
    Then User look message "common.user.Still managing other people" popup

###-----------------------------------------RELOAD PAGE---------------------------------------------------##
# CRU-34 Verify entered data not showing when Refresh with F5 key
#     Go to page create user with the "Staff" role
#     When Enter invalid information to create user
#     And Click select "Vai trò" with "Supper Admin"
#     And Reload Page
#     Then User look all field empty when create user

#-------------------------------------VIEW LIST OF USER--------------------------------------------------------------------------------------
CRU-35 Verify that user can view the list of Staff successfully
    Login to admin
    And Click "Người Dùng" menu
    And Click list Role with "Staff"
    Then Show list of "users"

CRU-36 Verify that user can view the list of Manager successfully
    Login to admin
    And Click "Người Dùng" menu
    And Click list Role with "Manager"
    Then Show list of "users"

CRU-37 Verify that user can view the list of Supper Admin successfully
    Login to admin
    And Click "Người Dùng" menu
    And Click list Role with "Supper Admin"
    Then Show list of "users"

CRU-38 Verify that Admin can search successfully when entering correct keyword to search box with "Họ và tên"
    Login to admin
    And Click "Người Dùng" menu
    And Search "text" in "Tìm kiếm" with "${username_valid}"
    Then Show list of "users"

CRU-39 Verify that Admin can search successfully when entering correct keyword to search box with "Email"
    Login to admin
    And Click "Người Dùng" menu
    And Search "email" in "Tìm kiếm" with "${email_valid}"
    Then Show list of "users"

CRU-40 Verify that Admin can search successfully when entering correct keyword to search box with "Phone"
    Login to admin
    And Click "Người Dùng" menu
    And Search "phone" in "Tìm kiếm" with "${phone_number_valid}"
    Then Show list of "users"

CRU-41 Verify that Admin can search unsuccessfully when entering incorrect keyword to search box with "Họ và tên"
    Login to admin
    And Click "Người Dùng" menu
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU-42 Verify that Admin can search unsuccessfully when entering incorrect keyword to search box with "Email"
    Login to admin
    And Click "Người Dùng" menu
    And Search "email" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU-43 Verify that Admin can search unsuccessfully when entering incorrect keyword to search box with "Phone number"
    Login to admin
    And Click "Người Dùng" menu
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

# CRU-44 Verify that Next page and Previous page
#     Login to admin
#     And Click "Người Dùng" menu
#     And Click ">" to "next" page
#     Log To Console    Danh sách user trang 2
#     Then Show list of "users"
#     And Click "<" to "prev" page
#     Log To Console    Danh sách user trang 1
#     Then Show list of "users" 
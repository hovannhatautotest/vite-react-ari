*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

# # ============================================NAVIGATE CREATE USER PAGE=====================================================
CRU_01 Verify that the page can be navigated to create a new user with the Staff role
    [Tags]    @smoketest    @regression
    Login to Admin
    And Click "Quản lý người dùng" menu
    And Click "Thêm quản trị viên" button
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Thêm người dùng"

# # =====================================================VALIDATION TEXT=====================================================
CRU_02 Verify that validation text when blank all fields & "Lưu lại" button
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Click "Lưu" button
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
    And Required message "Email" displayed under "Xin vui lòng nhập email" field
    And Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field

CRU_03 Verify that validation text of "Họ và tên" field display when create new user with "Họ và tên" field empty
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Họ và tên" with ""
    And Enter "email" in "Email" with ""
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field

CRU_04 Verify that validation text of "Họ và tên" field display when enter invalid "Họ và tên" field
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "number" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with ""
    Then Required message "Họ và tên" displayed under "Xin vui lòng chỉ nhập chữ!" field

CRU_05 Verify that validation text of "Email" field display when create new user with "Email" field empty
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Email" with ""
    And Enter "text" in "Họ và tên" with ""
    Then Required message "Email" displayed under "Xin vui lòng nhập email" field

CRU_06 Verify that the Email field's validation text is displayed when create new user with invalid email format and less than 6 characters long.
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Email" with "12345"
    And Enter "text" in "Họ và tên" with ""
    Then Required message "Email" field displayed under "Vui lòng nhập địa chỉ email hợp lệ!"
    And Required message "Email" field displayed under "Xin vui lòng nhập tối thiểu 6 kí tự!"

CRU_07 Verify that the Email field's validation text is displayed when create new user with invalid email format and less than 6 characters long.
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Email" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with ""
    Then Required message "Email" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

CRU_08 Verify that validation text of "Số điện thoại" field display when create new user with "Số điện thoại" field empty
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Số điện thoại" with ""
    And Enter "text" in "Họ và tên" with ""
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field

CRU_09 Verify that validation text of "Số điện thoại" field display when create new user with "Số điện thoại" field invalid format
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with ""
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

CRU_10 Verify that validation text of "Số điện thoại" field display when create new user with "Số điện thoại" field more than 12 numbers characters
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "phone_invalid" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in "Họ và tên" with ""
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa 12 kí tự số!" field

# ##=====================================================ERROR MESSAGE=====================================================
CRU_11 Verify that error message display when create new user with Email has already been registered.
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "admin_balan@getnada.com"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Email đã được đăng ký trước đó." popup

CRU_12 Verify that error message display when create new user with The phone number has already been registered.
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "0941225407"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

# ##=====================================================CREATE USER SUCCESSFULLY=====================================================
CRU_13 Verify that create new user is successful when Enter valid information
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Tạo người dùng mới thành công." popup
    And User look title "Quản Lý Người Dùng"

# ###-----------------------------------------RELOAD PAGE---------------------------------------------------##
CRU_14 Verify entered data not showing when Refresh with F5 key
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Reload
    Then User look "Họ và tên" field empty
    And User look "Email" field empty
    And User look "Số điện thoại" field empty
    And User look textarea "Ghi chú" field empty

# #-------------------------------------VIEW LIST OF USER--------------------------------------------------------------------------------------
CRU_15 Verify that the list of all users can be viewed successfully
    When Login to admin
    And Click "Quản lý người dùng" menu
    Then Show list of "users"

CRU_16 Verify that Admin can search user successfully when entering valid keyword to search box with "Mã người dùng"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "text" in "Tìm kiếm" with "${SEARCH_NAME_CODE}"
    Then Show list of "users"

CRU_17 Verify that Admin can search user successfully when entering valid keyword to search box with "Họ và tên"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "text" in "Tìm kiếm" with "${SEARCH_FULLNAME}"
    Then Show list of "users"

CRU_18 Verify that Admin can search user successfully when entering valid keyword to search box with "Email"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "email" in "Tìm kiếm" with "${SEARCH_EMAIL}"
    Then Show list of "users"

CRU_19 Verify that Admin can search user successfully when entering valid keyword to search box with "Số điện thoại"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "phone" in "Tìm kiếm" with "${SEARCH_PHONE}"
    Then Show list of "users"

CRU_20 Verify that Admin can search user successfully when entering valid keyword to search box with "Vai trò"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "text" in "Tìm kiếm" with "${SEARCH_ROLE}"
    Then Show list of "users"

CRU_21 Verify that Admin can search user unsuccessfully when entering invalid keyword to search box with "Mã người dùng"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "name code" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU_22 Verify that Admin can search user unsuccessfully when entering invalid keyword to search box with "Họ và tên"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "fullname" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU_23 Verify that Admin can search user unsuccessfully when entering invalid keyword to search box with "Email"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "email" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU_24 Verify that Admin can search user unsuccessfully when entering invalid keyword to search box with "Số điện thoại"
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU_25 Verify that Next page and Previous page, Next 10 page and Previous 10 page
    Login to admin
    And Click "Quản lý người dùng" menu
    And Click ">" to "next" page
    Then Show list of "users"
    And Click "<" to "prev" page
    Then Show list of "users"
    And Click ">>" to "next_10" page
    Then Show list of "users"
    And Click "<<" to "prev_10" page
    Then Show list of "users"
*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

# # ============================================NAVIGATE CREATE USER PAGE=====================================================
EDU_01 Verify that the page can be navigated to page Edit user
    [Tags]    @smoketest    @regression
    Login to Admin
    And Click "Quản lý người dùng" menu
    And Select User need to edit
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Chỉnh sửa người dùng"  

# # =====================================================VALIDATION TEXT=====================================================
# EDU_02 Verify that validation text of "Họ và tên" field display when edit user with "Họ và tên" field empty
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "text" in "Họ và tên" with ""
#     And Enter "phone" in "Số điện thoại" with ""
#     Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field

# EDU_03 Verify that validation text of "Họ và tên" field display when enter invalid "Họ và tên" field
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "number" in "Họ và tên" with "_RANDOM_"
#     And Enter "phone" in "Số điện thoại" with ""
#     Then Required message "Họ và tên" displayed under "Xin vui lòng chỉ nhập chữ!" field

# EDU_04 Verify that validation text of "Số điện thoại" field display when edit user with "Số điện thoại" field empty
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "text" in "Số điện thoại" with ""
#     And Enter "text" in "Họ và tên" with ""
#     Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field

# EDU_05 Verify that validation text of "Số điện thoại" field display when enter invalid format phone number "Số điện thoại" field
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "text" in "Số điện thoại" with "_RANDOM_"
#     And Enter "text" in "Họ và tên" with ""
#     Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

# EDU_06 Verify that validation text of "Số điện thoại" field display when enter "Số điện thoại" field more than 12 numbers characters
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "phone_invalid" in "Số điện thoại" with "_RANDOM_"
#     And Enter "text" in "Họ và tên" with ""
#     Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa 12 kí tự số!" field

# EDU_07 Verify that validation text of "Ghi chú" field when entering greater than 500 characters
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
#     And Enter "text" in "Họ và tên" with ""
#     Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

# # ##=====================================================ERROR MESSAGE=====================================================
# EDU_12 Verify that error message display when edit user with The phone number has already been registered.
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "fullname" in "Họ và tên" with "_RANDOM_"
#     And Enter "email" in "Email" with "_RANDOM_"
#     And Enter "phone" in "Số điện thoại" with "0941225407"
#     And Click "Lưu" button
#     Then User look message "Số điện thoại đã được đăng ký trước đó." popup

*** Keywords ***
Select User need to edit
    ${element}    Get Elements    //*[contains(@class, "ant-table-row")]
    ${count}=    Get Length    ${element}
    ${index}=    Evaluate    ${count}-${count}
    Click         ${element}[${index}]    left    2   

Go to page edit user
    Login to Admin
    And Click "Quản lý người dùng" menu
    And Select User need to edit


# # ##=====================================================CREATE USER SUCCESSFULLY=====================================================
# EDU_13 Verify that edit user is successful when Enter valid information
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "fullname" in "Họ và tên" with "_RANDOM_"
#     And Enter "email" in "Email" with "_RANDOM_"
#     And Enter "phone" in "Số điện thoại" with "_RANDOM_"
#     And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
#     And Click "Lưu" button
#     Then User look message "Tạo người dùng mới thành công." popup
#     And User look title "Quản Lý Người Dùng"

# # ###-----------------------------------------RELOAD PAGE---------------------------------------------------##
# EDU_14 Verify entered data not showing when Refresh with F5 key
#     [Tags]    @smoketest         @regression
#     When Go to page edit user
#     And Enter "fullname" in "Họ và tên" with "_RANDOM_"
#     And Enter "email" in "Email" with "_RANDOM_"
#     And Enter "phone" in "Số điện thoại" with "_RANDOM_"
#     And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
#     And Reload
#     Then User look "Họ và tên" field empty
#     And User look "Email" field empty
#     And User look "Số điện thoại" field empty
#     And User look textarea "Ghi chú" field empty

# # #-------------------------------------VIEW LIST OF USER--------------------------------------------------------------------------------------
# EDU_15 Verify that the list of all users can be viewed successfully
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     Then Show list of "users"

# EDU_16 Verify that Admin can search user successfully when entering valid keyword to search box with "Mã người dùng"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "text" in "Tìm kiếm" with "${SEARCH_NAME_CODE}"
#     Then Show list of "users"

# EDU_17 Verify that Admin can search user successfully when entering valid keyword to search box with "Họ và tên"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "text" in "Tìm kiếm" with "${SEARCH_FULLNAME}"
#     Then Show list of "users"

# EDU_18 Verify that Admin can search user successfully when entering valid keyword to search box with "Email"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "email" in "Tìm kiếm" with "${SEARCH_EMAIL}"
#     Then Show list of "users"

# EDU_19 Verify that Admin can search user successfully when entering valid keyword to search box with "Số điện thoại"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "phone" in "Tìm kiếm" with "${SEARCH_PHONE}"
#     Then Show list of "users"

# EDU_20 Verify that Admin can search user successfully when entering valid keyword to search box with "Vai trò"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "text" in "Tìm kiếm" with "${SEARCH_ROLE}"
#     Then Show list of "users"

# EDU_21 Verify that Admin can search user unsuccessfully when entering invalid keyword to search box with "Mã người dùng"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "name code" in "Tìm kiếm" with "_RANDOM_"
#     Then No users are shown

# EDU_22 Verify that Admin can search user unsuccessfully when entering invalid keyword to search box with "Họ và tên"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "fullname" in "Tìm kiếm" with "_RANDOM_"
#     Then No users are shown

# EDU_23 Verify that Admin can search user unsuccessfully when entering invalid keyword to search box with "Email"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "email" in "Tìm kiếm" with "_RANDOM_"
#     Then No users are shown

# EDU_24 Verify that Admin can search user unsuccessfully when entering invalid keyword to search box with "Số điện thoại"
#     When Login to admin
#     And Click "Quản lý người dùng" menu
#     And Search "phone" in "Tìm kiếm" with "_RANDOM_"
#     Then No users are shown

# EDU_25 Verify that Next page and Previous page, Next 10 page and Previous 10 page
#     Login to admin
#     And Click "Quản lý người dùng" menu
#     And Click ">" to "next" page
#     Then Show list of "users"
#     And Click "<" to "prev" page
#     Then Show list of "users"
#     And Click ">>" to "next_10" page
#     Then Show list of "users"
#     And Click "<<" to "prev_10" page
#     Then Show list of "users"
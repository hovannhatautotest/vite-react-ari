*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

# # ============================================NAVIGATE CREATE USER PAGE=====================================================
EDU_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa người dùng
    [Tags]    @smoketest    @regression
    Login to Admin
    And Click "Quản lý người dùng" menu
    And Select User need to edit
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Chỉnh sửa người dùng"  

# # =====================================================VALIDATION TEXT=====================================================
EDU_02: Kiểm tra Validation text tại trường Họ và tên khi bỏ trong Họ và tên
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "text" in "Họ và tên" with ""
    And Click in "Số điện thoại" field
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập tên người dùng" field

EDU_03: Kiểm tra Validation text tại trường Họ và tên khi nhập sai định dạng Họ và tên
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "number" in "Họ và tên" with "_RANDOM_"
    And Click in "Số điện thoại" field
    Then Required message "Họ và tên" displayed under "Xin vui lòng chỉ nhập chữ" field

EDU_04: Kiểm tra Validation text tại trường Số điện thoại khi không nhập Số điện thoại
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "text" in "Số điện thoại" with ""
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại người dùng" field

EDU_05: Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "text" in "Số điện thoại" with "abcdef"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

EDU_06: Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

EDU_07: Kiểm tra Validation text tại trường Số điện thoại khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "phone_7" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

EDU_08: Kiểm tra Validation text tại trường Số điện thoại khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "phone_invalid" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

EDU_09: Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "text" in "Số điện thoại" with "Hồ Văn Nhật"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

EDU_10: Kiểm tra Validation text tại trường Ghi chú khi nhập quá 500 kí tự
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

# ##=====================================================ERROR MESSAGE=====================================================
EDU_11: Kiểm tra error message khi chỉnh sửa người dùng với Số điện thoại đã tồn tại trên hệ thống
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "phone" in "Số điện thoại" with "0941225407"
    And Click "Lưu" button
    Then User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup

##=====================================================EDIT USER SUCCESSFULLY=====================================================
EDU_12: Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Họ và tên"
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Lưu người dùng thành công" popup
    And User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"

EDU_13 Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Số điện thoại"
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Lưu người dùng thành công" popup
    And User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"

EDU_14: Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Ghi chú"
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Lưu người dùng thành công" popup
    And User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"

EDU_15: Kiểm tra có thể điều hướng đến trang danh sách người dùng từ trang chỉnh sửa người dùng
    [Tags]    @smoketest         @regression
    When Go to page edit user
    And Click "Trở về" button
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"


*** Keywords ***
Select User need to edit
    ${element}    Set Variable   //td[contains(text(),'fateh62@example.net')]
    Click         ${element}        left        2 

Go to page edit user
    Login to Admin
    And Click "Quản lý người dùng" menu
    And Select User need to edit
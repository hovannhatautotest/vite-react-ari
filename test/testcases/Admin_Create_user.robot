*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

# # ============================================NAVIGATE CREATE USER PAGE=====================================================
CRU_01: Kiểm tra có thể điều hướng đến trang tạo mới người dùng
    [Tags]    @smoketest    @regression
    Login to Admin
    And Click "Quản lý người dùng" menu
    And Click "Thêm quản trị viên" button
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Thêm người dùng"

# =====================================================VALIDATION TEXT=====================================================
CRU_02: Kiểm tra Validation text khi không nhập thông tin nào cả
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Click "Lưu" button
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập tên người dùng" field
    And Required message "Email" displayed under "Xin vui lòng nhập email người dùng" field
    And Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại người dùng" field

CRU_03: Kiểm tra Validation text tại trường "Họ và tên" khi bỏ trống Họ và tên
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Họ và tên" with ""
    And Click in "Email" field
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập tên người dùng" field

CRU_04: Kiểm tra Validation text tại trường "Họ và tên" khi nhập sai định dạng Họ và tên
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "number" in "Họ và tên" with "_RANDOM_"
    And Click in "Email" field
    Then Required message "Họ và tên" displayed under "Xin vui lòng chỉ nhập chữ" field

CRU_05: Kiểm tra Validation text tại trường "Email" khi không nhập email
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Email" with ""
    And Click in "Họ và tên" field
    Then Required message "Email" displayed under "Xin vui lòng nhập email người dùng" field

CRU_06: Kiểm tra Validation text tại trường "Email" khi nhập sai định dạng email
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Email" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Email" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

CRU_07: Kiểm tra Validation text tại trường "Số điện thoại" khi không nhập Số điện thoại
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Số điện thoại" with ""
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại người dùng" field

CRU_08: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Số điện thoại" with "abcdef"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

CRU_09: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

CRU_10: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "phone_7" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

CRU_11: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "phone_invalid" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

CRU_12: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "text" in "Số điện thoại" with "Hồ Văn Nhật"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

CRU_13: Kiểm tra Validation text tại trường "Ghi chú" khi nhập quá 500 kí tự
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=====================================================ERROR MESSAGE=====================================================
CRU_14: Kiểm tra error message khi tạo mới người dùng có "Email" đã tồn tại trên hệ thống
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "admin_balan@getnada.com"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Email đã được đăng ký trước đó." popup

CRU_15: Kiểm tra error message khi tạo mới người dùng có "Số điện thoại" đã tồn tại trên hệ thống
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "0941225407"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

# ##=====================================================CREATE USER SUCCESSFULLY=====================================================
CRU_16: Kiểm tra tạo mới dùng người dùng thành công
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Thêm quản trị viên thành công" popup
    And User look title "Quản Lý Người Dùng"

CRU_17: Kiểm tra có thể điều hướng đến trang danh sách người dùng từ trang Tạo mới người dùng
    [Tags]    @smoketest         @regression
    When Go to page create user
    And Click "Trở về" button
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"
###-----------------------------------------RELOAD PAGE---------------------------------------------------##
CRU_18: Kiểm tra thông tin nhập sẽ bị xóa sau khi reload trang web
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

#-------------------------------------VIEW LIST OF USER--------------------------------------------------------------------------------------
CRU_19: Kiểm tra hiển thị thành công danh sách người dùng đã tạo
    When Login to admin
    And Click "Quản lý người dùng" menu
    Then Show list of "users"

CRU_20: Kiểm tra việc tìm kiếm thành công khi nhập "Mã người dùng" hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "text" in "Tìm kiếm" with "${SEARCH_NAME_CODE}"
    Then Show list of "users"

CRU_21: Kiểm tra việc tìm kiếm thành công khi nhập "Họ và tên" hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "text" in "Tìm kiếm" with "${SEARCH_FULLNAME}"
    Then Show list of "users"

CRU_22: Kiểm tra việc tìm kiếm thành công khi nhập "Email" hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "email" in "Tìm kiếm" with "${SEARCH_EMAIL}"
    Then Show list of "users"

CRU_23: Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "phone" in "Tìm kiếm" with "${SEARCH_PHONE}"
    Then Show list of "users"

CRU_24: Kiểm tra việc tìm kiếm thành công khi nhập "Vai trò" hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "text" in "Tìm kiếm" with "${SEARCH_ROLE}"
    Then Show list of "users"

CRU_25: Kiểm tra việc tìm kiếm không thành công khi nhập "Mã người dùng" không hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "name code" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU_26: Kiểm tra việc tìm kiếm không thành công khi nhập "Họ và tên" không hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "fullname" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU_27: Kiểm tra việc tìm kiếm không thành công khi nhập "Email" không hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "email" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU_28: Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    When Login to admin
    And Click "Quản lý người dùng" menu
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

CRU_29: Kiểm tra có thể xem danh sách trang kế tiếp, trước trước, 10 trang kế tiếp, 10 trang trước
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
*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***

# # ---------------------VERIFY VALIDATION TEXT-------------------------------------------------------
LG_01: Kiểm tra đăng nhập không thành công khi bỏ trống Tên đăng nhập
    [Tags]    @smoketest    @regression
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Required message "Tên đăng nhập" displayed under "This is a required field!" field

LG_02: Kiểm tra đăng nhập không thành công khi bỏ trống Mật khẩu
    [Tags]    @smoketest    @regression
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Required message "Mật khẩu" displayed under "This is a required field!" field

LG_03: Kiểm tra đăng nhập không thành công khi bỏ trống cả Tên đăng nhập và Mật khẩu
    [Tags]    @smoketest    @regression
    When Click "Đăng Nhập" button
    Then Required message "Tên đăng nhập" displayed under "This is a required field!" field
    And Required message "Mật khẩu" displayed under "This is a required field!" field

LG_04: Kiểm tra đăng nhập không thành công khi Tên đăng nhập sai định dạng email
    [Tags]    @smoketest    @regression
    When Enter "text" in "Tên đăng nhập" with "_RANDOM_"
    When Enter "text" in "Mật khẩu" with ""
    Then Required message "Tên đăng nhập" displayed under "Please enter a valid email address!" field

# ---------------------ERROR MESSAGE------------------------------------------------------------
LG_05: Kiểm tra đăng nhập không thành công khi nhập sai Tên đăng nhập
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "Ari123456#"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

LG_06: Kiểm tra đăng nhập không thành công khi nhập sai Mật khẩu
    [Tags]    @smoketest    @regression
    When Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản hoặc mật khẩu không đúng, vui lòng thử lại" popup

LG_07: Kiểm tra đăng nhập không thành công khi nhập sai cả Tên đăng nhập và Mật khẩu
    [Tags]    @smoketest    @regression
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

# #----------------------------------LOGIN SUCCESSFULLY-------------------------------------------------------------
LG_08: Kiểm tra đăng nhập thành công tài khoản Admin
    [Tags]    @smoketest    @regression
    When Login to Admin
    Then User look title "Tra Cứu Dữ Liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    And User look menu "Quản lý kho"
    And User look menu "Quản lý kết nối"
    And User look menu "Quản lý người dùng"
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý nhà cung cấp"
    And User look menu "Quản lý cửa hàng"
    And User look menu "Quản lý doanh thu"
    And User look menu "Cấu hình chung"

LG_09: Kiểm tra đăng nhập thành công tài khoản Store
    [Tags]    @smoketest    @regression
    When Login to Store
    Then User look title "Tra Cứu Dữ Liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    And User look menu "Đặt hàng"
    And User look menu "Quản lý kho"
    And User look menu "Báo cáo"
    And User look menu "Quản lý kết nối"
    And User look menu "Quản lý người dùng"
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý NCC"
    And User look menu "Quản lý cửa hàng"

LG_10: Kiểm tra đăng nhập thành công tài khoản Supplier
    [Tags]    @smoketest    @regression
    When Login to Supplier
    And User look dashboard "BALANCE"
    Then User look title "Tra Cứu Dữ Liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    And User look menu "Quản lý đơn hàng"
    And User look menu "Quản lý trả hàng"
    And User look menu "Quản lý khuyến mãi"
    And User look menu "Quản lý kết nối"
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý nhà cung cấp"

LG_11: Kiểm tra đăng nhập thành công bằng phím Enter
    [Tags]    @smoketest    @regression
    Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
    Enter "text" in "Mật khẩu" with "Ari123456#"
    Enter at "Mật khẩu" field to Login
    User look title "Tra Cứu Dữ Liệu"

##----------------------------------NAVIGATE FORGOT PASSWORD-------------------------------------------------------------
LG_12: Kiểm tra chuyển hướng đến trang Quên mật khẩu
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    Then User look title "titles.Forgot Password"
    And User look contains title is "Quên Mật Khẩu"

##=================================VALIDATION TEXT FORGOT PASSWORD========================================================
LG_13: Kiểm tra quên mật khẩu không thành công khi không nhập email
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Click "Lấy mã OTP" button
    Then Required message "routes.auth.reset-password.Recovery Email" displayed under "This is a required field!" field

LG_14: Kiểm tra quên mật khẩu không thành công khi nhập sai định dạng email
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "text" in "routes.auth.reset-password.Recovery Email" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then Required message "routes.auth.reset-password.Recovery Email" displayed under "Please enter a valid email address!" field

LG_15: Kiểm tra gửi mã OTP không thành công khi không nhập Mã OTP
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "email" in "routes.auth.reset-password.Recovery Email" with "nhatsonfc49@gmail.com"
    And Click "Lấy mã OTP" button
    # Then User look message "Quên mật khẩu thành công." popup
    When Click "Gửi OTP" button
    Then Required message "Mã OTP" displayed under "This is a required field!" field

##========================================ERROR MESSAGE FORGOT PASSWORD PAGE=========================================================
LG_16: Kiểm tra quên mật khẩu không thành công khi nhập email không tồn tại trên hệ thống
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "email" in "routes.auth.reset-password.Recovery Email" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then User look message "Địa chỉ email không tồn tại, vui lòng thử địa chỉ email khác." popup

LG_17: Kiểm tra quên mật khẩu không thành công khi nhập sai mã OTP
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "email" in "routes.auth.reset-password.Recovery Email" with "nhatsonfc49@gmail.com"
    And Click "Lấy mã OTP" button
    # Then User look message "Quên mật khẩu thành công." popup
    And Enter "otp" in "Mã OTP" with "_RANDOM_"
    And Click "Gửi OTP" button
    Then User look message "Mã OTP sai hoặc hết thời hạn sử dụng." popup

##====================================================================================================================================
LG_18: Kiểm tra quay trở lại trang đăng nhập từ trang Quên mật khẩu
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Click "Quay trở lại Đăng nhập" link
    Then User look title "Login"

# # ========================================DISPLAY PASSWORD=========================================================
LG_19: Kiểm tra có thể hiển thị mật khẩu dưới dạng text
    [Tags]    @smoketest    @regression
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Eye" icon to display password
    Then User look "Mật khẩu" field with type "text"

# # -===============================================RELOAD PAGE=====================================================
LG_20: Kiểm tra thông tin nhập sẽ bị xóa sau khi reload trang web
    [Tags]    @smoketest    @regression
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Reload Page
    Then User look "Tên đăng nhập" field empty
    And User look "Mật khẩu" field empty

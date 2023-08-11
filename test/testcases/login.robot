*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***

# # ---------------------VERIFY VALIDATION TEXT-------------------------------------------------------
# LG_01: Kiểm tra đăng nhập không thành công khi không nhập Tên đăng nhập
#     [Tags]    @smoketest    @regression
#     When Enter "text" in "Mật khẩu" with "_RANDOM_"
#     And Click "Đăng Nhập" button
#     Then Required message "Tên đăng nhập" displayed under "This is a required field!" field

# LG_02: Kiểm tra đăng nhập không thành công khi không nhập Mật khẩu
#     [Tags]    @smoketest    @regression
#     When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
#     And Click "Đăng Nhập" button
#     Then Required message "Mật khẩu" displayed under "This is a required field!" field

# LG_03: Kiểm tra đăng nhập không thành công khi không nhập Tên đăng nhập và Mật khẩu
#     [Tags]    @smoketest    @regression
#     When Click "Đăng Nhập" button
#     Then Required message "Tên đăng nhập" displayed under "This is a required field!" field
#     And Required message "Mật khẩu" displayed under "This is a required field!" field

# LG_04: Kiểm tra đăng nhập không thành công khi Tên đăng nhập sai định dạng email
#     [Tags]    @smoketest    @regression
#     When Enter "text" in "Tên đăng nhập" with "_RANDOM_"
#     When Enter "text" in "Mật khẩu" with ""
#     Then Required message "Tên đăng nhập" displayed under "Please enter a valid email address!" field

# # ---------------------ERROR MESSAGE------------------------------------------------------------
# LG_05: Kiểm tra đăng nhập không thành công khi nhập sai Tên đăng nhập
#     When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
#     And Enter "text" in "Mật khẩu" with "Ari123456#"
#     And Click "Đăng Nhập" button
#     Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

# LG_06: Kiểm tra đăng nhập không thành công khi nhập sai Mật khẩu
#     [Tags]    @smoketest    @regression
#     When Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
#     And Enter "text" in "Mật khẩu" with "_RANDOM_"
#     And Click "Đăng Nhập" button
#     Then User look message "Tài khoản hoặc mật khẩu không đúng, vui lòng thử lại" popup

# LG_07: Kiểm tra đăng nhập không thành công khi nhập sai Tên đăng nhập và Mật khẩu
#     [Tags]    @smoketest    @regression
#     When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
#     And Enter "text" in "Mật khẩu" with "_RANDOM_"
#     And Click "Đăng Nhập" button
#     Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

# ----------------------------------LOGIN SUCCESSFULLY-------------------------------------------------------------
# LG_08: Kiểm tra đăng nhập thành công tài khoản Admin
#     [Tags]    @smoketest    @regression
#     When Login to Admin
#     Then User look title "Tra Cứu Dữ Liệu"
#     And User look dashboard "BALANCE"
#     And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
#     And User look menu "Quản lý kho"
#     And User look menu "Quản lý kết nối"
#     And User look menu "Quản lý người dùng"
#     And User look menu "Quản lý hàng hóa"
#     And User look menu "Quản lý nhà cung cấp"
#     And User look menu "Quản lý cửa hàng"
#     And User look menu "Quản lý doanh thu"
#     And User look menu "Cấu hình chung"

# LG_09: Kiểm tra đăng nhập thành công tài khoản Store
#     [Tags]    @smoketest    @regression
#     When Login to Store
#     Then User look title "Tra Cứu Dữ Liệu"
#     And User look dashboard "BALANCE"
#     And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
#     And User look menu "Đặt hàng"
#     And User look menu "Quản lý kho"
#     And User look menu "Báo cáo"
#     And User look menu "Quản lý kết nối"
#     And User look menu "Quản lý người dùng"
#     And User look menu "Quản lý hàng hóa"
#     And User look menu "Quản lý NCC"
#     And User look menu "Quản lý cửa hàng"

# LG_10: Kiểm tra đăng nhập thành công tài khoản Supplier
#     [Tags]    @smoketest    @regression
#     When Login to Supplier
#     And User look dashboard "BALANCE"
#     Then User look title "Tra Cứu Dữ Liệu"
#     And User look dashboard "BALANCE"
#     And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
#     And User look menu "Quản lý đơn hàng"
#     And User look menu "Quản lý trả hàng"
#     And User look menu "Quản lý khuyến mãi"
#     And User look menu "Quản lý kết nối"
#     And User look menu "Quản lý hàng hóa"
#     And User look menu "Quản lý nhà cung cấp"

# LG_11: Kiểm tra đăng nhập thành công khi dùng phím Enter
#     [Tags]    @smoketest    @regression
#     Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
#     Enter "text" in "Mật khẩu" with "Ari123456#"
#     Enter at "Mật khẩu" field to Login
#     User look title "Tra Cứu Dữ Liệu"

# ----------------------------------NAVIGATE FORGOT PASSWORD-------------------------------------------------------------
LG_12: Verify that CAN navigate to the "Forgot Password" page from the link on the Log In page
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    Then User look title "titles.Forgot Password"
    And User look contains title is "Quên Mật Khẩu"

# ##=================================VALIDATION TEXT FORGOT PASSWORD========================================================
# LG_13: Verify that validation text of "Email" field display when "Email" field empty
#     [Tags]    @smoketest    @regression
#     When Click "Quên mật khẩu?" link
#     And Click "Lấy Mã OTP" button
#     Then Required message "Email khôi phục" displayed under "Xin vui lòng nhập email khôi phục" field

# LG_14: Verify that validation text of "Email" field display when "Email" field invalid email format
#     [Tags]    @smoketest    @regression
#     When Click "Quên mật khẩu?" link
#     And Enter "text" in "Email khôi phục" with "_RANDOM_"
#     And Click "Lấy Mã OTP" button
#     Then Required message "Email khôi phục" displayed under "Please enter a valid email address!" field

# LG_15: Verify that validation text of "Mã OTP" field display when "Mã OTP" field empty
#     [Tags]    @smoketest    @regression
#     When Click "Quên mật khẩu?" link
#     And Enter "email" in "Email khôi phục" with "nhatsonfc49@gmail.com"
#     And Click "Lấy Mã OTP" button
#     Then User look message "Quên mật khẩu thành công." popup
#     When Click "Gửi mã OTP" button
#     Then Required message "Mã OTP" displayed under "Xin vui lòng nhập mã otp" field

# LG_16: Verify that validation text of "Mã OTP" field display when Enter "Mã OTP" field less than 6 character
#     [Tags]    @smoketest    @regression
#     When Click "Quên mật khẩu?" link
#     And Enter "email" in "Email khôi phục" with "nhatsonfc49@gmail.com"
#     And Click "Lấy Mã OTP" button
#     Then User look message "Quên mật khẩu thành công." popup
#     When Enter "text" in "Mã OTP" with "abcd"
#     When Click "Gửi mã OTP" button
#     Then Required message "Mã OTP" displayed under "Xin vui lòng nhập tối thiểu 6 kí tự!" field

# LG_17: Verify that validation text of "Mã OTP" field display when Enter "Mã OTP" field greater than 6 character
#     [Tags]    @smoketest    @regression
#     When Click "Quên mật khẩu?" link
#     And Enter "email" in "Email khôi phục" with "nhatsonfc49@gmail.com"
#     And Click "Lấy Mã OTP" button
#     Then User look message "Quên mật khẩu thành công." popup
#     When Enter "text" in "Mã OTP" with "_RANDOM_"
#     When Click "Gửi mã OTP" button
#     Then Required message "Mã OTP" displayed under "Xin vui lòng nhập tối đa 6 kí tự!" field

# ##========================================ERROR MESSAGE FORGOT PASSWORD PAGE=========================================================
# LG_18: Verify that the error message displayed when entering the field "Email khôi phục" email does not exist on the system
#     [Tags]    @smoketest    @regression
#     When Click "Quên mật khẩu?" link
#     And Enter "email" in "Email khôi phục" with "_RANDOM_"
#     And Click "Lấy Mã OTP" button
#     Then User look message "Địa chỉ email không tồn tại, vui lòng thử địa chỉ email khác." popup

# LG_19: Verify that the error message displayed when entering incorrect "Mã OTP" field
#     [Tags]    @smoketest    @regression
#     When Click "Quên mật khẩu?" link
#     And Enter "email" in "Email khôi phục" with "nhatsonfc49@gmail.com"
#     And Click "Lấy Mã OTP" button
#     Then User look message "Quên mật khẩu thành công." popup
#     And Enter "otp" in "Mã OTP" with "_RANDOM_"
#     And Click "Gửi mã OTP" button
#     Then User look message "Mã OTP sai hoặc hết thời hạn sử dụng." popup

# ##====================================================================================================================================
# LG_20: Verify that it is possible to return to the login page when clicking the "Quay trở lại Đăng nhập" link
#     [Tags]    @smoketest    @regression
#     When Click "Quên mật khẩu?" link
#     And Click "Quay trở lại đăng nhập" link
#     Then User look title "Đăng Nhập"

# # ========================================DISPLAY PASSWORD=========================================================
# LG_21: Verify displays the password
#     [Tags]    @smoketest    @regression
#     When Enter "text" in "Mật khẩu" with "_RANDOM_"
#     And Click "Eye" icon to display password
#     Then User look "Mật khẩu" field with type "text"

# # -===============================================RELOAD PAGE=====================================================
# LG_22: Verify refresh page
#     [Tags]    @smoketest    @regression
#     When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
#     And Enter "text" in "Mật khẩu" with "_RANDOM_"
#     And Reload Page
#     Then User look "Tên đăng nhập" field empty
#     And User look "Mật khẩu" field empty 
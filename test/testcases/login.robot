*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***

# ---------------------VERIFY VALIDATION TEXT-------------------------------------------------------
LG_01: Verify that validation text of "Tên đăng nhập" field display when logging in with "Tên đăng nhập" field empty
    [Tags]    @smoketest    @regression
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng nhập" button
    Then Required message "Tên đăng nhập" displayed under "Đây là trường bắt buộc!" field

LG_02: Verify that validation text of "Mật khẩu" field display when logging in with "Mật khẩu" field empty
    [Tags]    @smoketest    @regression
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Click "Đăng nhập" button
    Then Required message "Mật khẩu" displayed under "Đây là trường bắt buộc!" field

LG_03: Validation text with "Tên đăng nhập" field and "Mật khẩu" field
    [Tags]    @smoketest    @regression
    When Click "Đăng nhập" button
    Then Required message "Tên đăng nhập" displayed under "Đây là trường bắt buộc!" field
    And Required message "Mật khẩu" displayed under "Đây là trường bắt buộc!" field

LG_04: Validation text with "Tên đăng nhập" field when enter invalid email format
    [Tags]    @smoketest    @regression
    When Enter "text" in "Tên đăng nhập" with "_RANDOM_"
    When Enter "text" in "Mật khẩu" with "${EMPTY}"
    Then Required message "Tên đăng nhập" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

# ---------------------ERROR MESSAGE------------------------------------------------------------
LG_05: Verify that Login unsuccessfully because enter incorrect "Tên đăng nhập" field
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "Ari123456#"
    And Click "Đăng nhập" button
    Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

LG_06: Verify that Login unsuccessfully because enter incorrect "Mật khẩu" field
    [Tags]    @smoketest    @regression
    When Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng nhập" button
    Then User look message "Tài khoản hoặc mật khẩu không đúng, vui lòng thử lại" popup

LG_07: Verify that Login unsuccessfully because enter incorrect "Tên đăng nhập" field and "Mật khẩu" field
    [Tags]    @smoketest    @regression
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng nhập" button
    Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

# # ----------------------------------LOGIN SUCCESSFULLY-------------------------------------------------------------
LG_08: Verify that Login successfully accout Admin when enter correct "Tên đăng nhập" field and "Mật khẩu" field
    [Tags]    @smoketest    @regression
    When Login to Admin
    Then User look title "Tra cứu dữ liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    # And User look menu "Quản lý kho"
    # And User look menu "Quản lý kết nối"
    # And User look menu "Quản lý người dùng"
    # And User look menu "Quản lý hàng hóa"
    # And User look menu "Quản lý nhà cung cấp"
    # And User look menu "Quản lý cửa hàng"
    # And User look menu "Quản lý doanh thu"
    # And User look menu "Cấu hình chung"
    #-----------------------------------------
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý người dùng"
    And User look menu "Quản lý nhà cung cấp"
    And User look menu "Quản lý cửa hàng"
    And User look menu "Quản lý doanh thu"

LG_09: Verify that Login successfully accout Store when enter correct "Tên đăng nhập" field and "Mật khẩu" field
    [Tags]    @smoketest    @regression
    When Login to Store
    Then User look title "Tra cứu dữ liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    # And User look menu "Đặt hàng"
    # And User look menu "Quản lý kho"
    # And User look menu "Báo cáo"
    # And User look menu "Quản lý kết nối"
    # And User look menu "Quản lý người dùng"
    # And User look menu "Quản lý hàng hóa"
    # And User look menu "Quản lý NCC"
    # And User look menu "Quản lý cửa hàng"
    #-----------------------------------------
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý người dùng"
    And User look menu "Quản lý nhà cung cấp"
    And User look menu "Quản lý cửa hàng"
    And User look menu "Quản lý doanh thu"

LG_10: Verify that Login successfully accout Supplier when enter correct "Tên đăng nhập" field and "Mật khẩu" field
    [Tags]    @smoketest    @regression
    When Login to Supplier
    And User look dashboard "BALANCE"
    Then User look title "Tra cứu dữ liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    # And User look menu "Quản lý đơn hàng"
    # And User look menu "Quản lý trả hàng"
    # And User look menu "Quản lý khuyến mãi"
    # And User look menu "Quản lý kết nối"
    # And User look menu "Quản lý hàng hóa"
    # And User look menu "Quản lý nhà cung cấp"
    #-----------------------------------------
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý người dùng"
    And User look menu "Quản lý nhà cung cấp"
    And User look menu "Quản lý cửa hàng"
    And User look menu "Quản lý doanh thu"

LG_11: Verify that successfully login when using the Enter key
    [Tags]    @smoketest    @regression
    Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
    Enter "text" in "Mật khẩu" with "Ari123456#"
    Enter at "Mật khẩu" field to Login
    User look message "Đăng nhập thành công" popup

# ----------------------------------NAVIGATE FORGOT PASSWORD-------------------------------------------------------------
LG_12: Verify that CAN navigate to the "Forgot Password" page from the link on the Log In page
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    Then User look title "Quên Mật Khẩu"
    And User look contains title is "Quên Mật Khẩu"

##=================================VALIDATION TEXT FORGOT PASSWORD========================================================
LG_13: Verify that validation text of "Email" field display when "Email" field empty
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Click "Lấy Mã OTP" button
    Then Required message "Email khôi phục" displayed under "Xin vui lòng nhập email khôi phục" field

LG_14: Verify that validation text of "Email" field display when "Email" field invalid email format
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "text" in "Email khôi phục" with "_RANDOM_"
    And Click "Lấy Mã OTP" button
    Then Required message "Email khôi phục" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

LG_15: Verify that validation text of "Mã OTP" field display when "Mã OTP" field empty
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "email" in "Email khôi phục" with "nhatsonfc49@gmail.com"
    And Click "Lấy Mã OTP" button
    Then User look message "Quên mật khẩu thành công." popup
    When Click "Gửi mã OTP" button
    Then Required message "Mã OTP" displayed under "Xin vui lòng nhập mã otp" field

LG_16: Verify that validation text of "Mã OTP" field display when Enter "Mã OTP" field less than 6 character
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "email" in "Email khôi phục" with "nhatsonfc49@gmail.com"
    And Click "Lấy Mã OTP" button
    Then User look message "Quên mật khẩu thành công." popup
    When Enter "text" in "Mã OTP" with "abcd"
    When Click "Gửi mã OTP" button
    Then Required message "Mã OTP" displayed under "Xin vui lòng nhập tối thiểu 6 kí tự!" field

LG_17: Verify that validation text of "Mã OTP" field display when Enter "Mã OTP" field greater than 6 character
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "email" in "Email khôi phục" with "nhatsonfc49@gmail.com"
    And Click "Lấy Mã OTP" button
    Then User look message "Quên mật khẩu thành công." popup
    When Enter "text" in "Mã OTP" with "_RANDOM_"
    When Click "Gửi mã OTP" button
    Then Required message "Mã OTP" displayed under "Xin vui lòng nhập tối đa 6 kí tự!" field

##========================================ERROR MESSAGE FORGOT PASSWORD PAGE=========================================================
LG_18: Verify that the error message displayed when entering the field "Email khôi phục" email does not exist on the system
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "email" in "Email khôi phục" with "_RANDOM_"
    And Click "Lấy Mã OTP" button
    Then User look message "Địa chỉ email không tồn tại, vui lòng thử địa chỉ email khác." popup

LG_19: Verify that the error message displayed when entering incorrect "Mã OTP" field
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Enter "email" in "Email khôi phục" with "nhatsonfc49@gmail.com"
    And Click "Lấy Mã OTP" button
    Then User look message "Quên mật khẩu thành công." popup
    And Enter "otp" in "Mã OTP" with "_RANDOM_"
    And Click "Gửi mã OTP" button
    Then User look message "Mã OTP sai hoặc hết thời hạn sử dụng." popup

##====================================================================================================================================
LG_20: Verify that it is possible to return to the login page when clicking the "Quay trở lại Đăng nhập" link
    [Tags]    @smoketest    @regression
    When Click "Quên mật khẩu?" link
    And Click "Quay trở lại đăng nhập" link
    Then User look title "Đăng Nhập"

# ========================================DISPLAY PASSWORD=========================================================
LG_21: Verify displays the password
    [Tags]    @smoketest    @regression
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Eye" icon to display password
    Then User look "Mật khẩu" field with type "text"

# -===============================================RELOAD PAGE=====================================================
LG_22: Verify refresh page
    [Tags]    @smoketest    @regression
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Reload Page
    Then User look "Tên đăng nhập" field empty
    And User look "Mật khẩu" field empty 
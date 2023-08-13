*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***
##===============ĐIỀU HƯỚNG ĐẾN TRANG THÔNG TIN CÁ NHÂN
PRO_01: Kiểm tra có thể điều hướng đến trang thông tin cá nhân
  When Login to Admin
  And Click Avatar
  And Click Profile with "Thông tin cá nhân"
  Then User look title "Thông Tin Cá Nhân"
  And User look contains title is "Thông tin cá nhân"

###==============================VALIDATION TEXT TAB THÔNG TIN CÁ NHÂN=================================
PRO_02: Kiểm tra Validation text khi bỏ trống trường "Họ và tên".
  When Go to profile page
  And Enter "text" in "Họ và tên" with ""
  And Click in "Email" field
  Then Required message "Họ và tên" displayed under "Xin vui lòng nhập tên người dùng" field

PRO_03: Kiểm tra Validation text trường "Họ và tên" khi nhập họ và tên không hợp lệ
  When Go to profile page
  And Enter "text" in "Họ và tên" with "_RANDOM_"
  And Click in "Email" field
  Then Required message "Họ và tên" displayed under "Xin vui lòng chỉ nhập chữ" field

PRO_04: Kiểm tra Validation text trường "Email" khi không nhập Email
  When Go to profile page
  And Enter "email" in "Email" with ""
  And Click in "Họ và tên" field
  Then Required message "Email" displayed under "Xin vui lòng nhập email" field

PRO_05: Kiểm tra Validation text trường "Email" khi nhập sai định dạng Email
  When Go to profile page
  And Enter "text" in "Email" with "_RANDOM_"
  And Click in "Họ và tên" field
  Then Required message "Email" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

PRO_06: Kiểm tra Validation text trường "Số điện thoại" khi không nhập Số điện thoại
  When Go to profile page
  And Enter "phone" in "Số điện thoại" with ""
  And Click in "Họ và tên" field
  Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại người dùng" field

PRO_07: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "text" in "Số điện thoại" with "abcdef"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

PRO_08: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

PRO_09: Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "phone_7" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

PRO_10: Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "phone_invalid" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

PRO_11: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "text" in "Số điện thoại" with "Hồ Văn Nhật"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

PRO_12: Kiểm tra Validation text trường "Ghi chú" khi nhập quá 500 kí tự
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

###==============================VALIDATION TEXT TAB ĐỔI MẬT KHẨU=================================
PRO_13: Kiểm tra Validation text khi không nhập thông tin cả
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Click "Đổi mật khẩu" button
    Then Required message "Mật khẩu hiện tại" displayed under "Đây là trường bắt buộc!" field
    And Required message "Mật khẩu mới" displayed under "Đây là trường bắt buộc!" field
    And Required message "Xác nhận mật khẩu" displayed under "Đây là trường bắt buộc!" field

PRO_14: Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới nhỏ hơn 8 ký tự
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "phone_7" in "Mật khẩu mới" with "_RANDOM_"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Mật khẩu mới" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên" field

PRO_15: Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới chứa khoảng trắng
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Mật khẩu mới" with "_RANDOM_"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Mật khẩu mới" displayed under "Mật khẩu không được có khoảng trắng" field

PRO_16: Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới không đủ độ bảo mật
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Mật khẩu mới" with "hovannhat"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Mật khẩu mới" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt" field

PRO_17: Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu chứa khoảng trắng
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Xác nhận mật khẩu" displayed under "Mật khẩu không được có khoảng trắng" field

PRO_18: Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không đủ độ bảo mật
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Xác nhận mật khẩu" with "hovannhat"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Xác nhận mật khẩu" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt" field

PRO_19: Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không chính xác
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Mật khẩu mới" with "Nhat@01101999"
    And Enter "text" in "Xác nhận mật khẩu" with "Hovannhat@01101999"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Xác nhận mật khẩu" displayed under "Xác nhận mật khẩu không chính xác" field

##============================================ERROR MESSAGE TAB THÔNG TIN CÁ NHÂN===================================================================
PRO_20: Kiểm tra Error Message khi chỉnh sửa thông tin cá nhân với email đã tồn tại trên hệ thống
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "email" in "Email" with "fateh62@example.net"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup

PRO_21: Kiểm tra Error Message khi chỉnh sửa thông tin cá nhân với số điện thoại đã tồn tại trên hệ thống
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "0941225407"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup

##=============================ERROR MESSAGE TAB ĐỔI MẬT KHẨU==========================================
PRO_22: Kiểm tra Error Message thay đổi mật khẩu khi nhập mật khẩu hiện tại không đúng
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Mật khẩu hiện tại" with "_RANDOM_"
    And Enter "text" in "Mật khẩu mới" with "Nhat@01101999"
    And Enter "text" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then User look message "Mật khẩu nhập không đúng." popup

PRO_23: Kiểm tra Error Message thay đổi mật khẩu khi nhập mật khẩu hiện tại và mật khẩu mới trùng nhau
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Mật khẩu hiện tại" with "Nhat@01101999"
    And Enter "text" in "Mật khẩu mới" with "Nhat@01101999"
    And Enter "text" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then User look message "Mật khẩu trùng với mật khẩu hiện tại." popup

##===================================UPDATE PROFILE SUCCESSFULLY===============================================
PRO_24: Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Họ và tên"
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "text" in "Họ và tên" with "HOANG BEN"
    And Click "Lưu" button
    Then User look message "" popup

PRO_25: Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Email"
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "email" in "Email" with "chstag11111@getnada.com"
    And Click "Lưu" button
    Then User look message "" popup

PRO_26: Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Số điện thoại"
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "phone" in "Số điện thoại" with "341693387336"
    And Click "Lưu" button
    Then User look message "" popup

PRO_27: Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Ghi chú"
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "text" in textarea "Ghi chú" with "Nulla excepturi cum itaque rem."
    And Click "Lưu" button
    Then User look message "" popup

PRO_28: Kiểm tra có thể hủy thao tác thành công khi thay đổi thông tin cá nhân
    [Tags]    @smoketest         @regression
    When Go to profile page
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Hủy thao tác" button
    Then User look in "Họ và tên" with "HOANG BEN"
    And User look in "Email" with "chstag11111@getnada.com"
    And User look in "Số điện thoại" with "341693387336"
    And User look in textarea "Ghi chú" with "Nulla excepturi cum itaque rem."

##==============================CHANGE PASSWORD SUCCESSFULLY=========================================
PRO_29: Kiểm tra Successfully Message khi thay đổi mật khẩu
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Mật khẩu hiện tại" with "Ari123456#"
    And Enter "text" in "Mật khẩu mới" with "Nhat@01101999"
    And Enter "text" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then User look message "Đổi mật khẩu thành công!" popup
    And Enter "text" in "Mật khẩu hiện tại" with "Nhat@01101999"
    And Enter "text" in "Mật khẩu mới" with "Ari123456#"
    And Enter "text" in "Xác nhận mật khẩu" with "Ari123456#"
    And Click "Đổi mật khẩu" button
    Then User look message "Đổi mật khẩu thành công!" popup

PRO_30: Kiểm tra có thể hủy thao tác thành công khi thay đổi mật khẩu
    [Tags]    @smoketest         @regression
    When Go to change password page
    And Enter "text" in "Mật khẩu hiện tại" with "Ari123456#"
    And Enter "text" in "Mật khẩu mới" with "Nhat@01101999"
    And Enter "text" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Hủy thao tác" button
    Then User look in "Mật khẩu hiện tại" with ""
    And User look in "Mật khẩu mới" with ""
    And User look in "Xác nhận mật khẩu" with ""

*** Keywords ***
Click Avatar
  Click   //section[@id='dropdown-profile']

Click Profile with "${name}"
  Click     //li[contains(text(), '${name}')]

Go to profile page
  When Login to Store
  And Click Avatar
  And Click Profile with "Thông tin cá nhân"

Go to change password page
  When Login to Store
  And Click Avatar
  And Click Profile with "Đổi mật khẩu"

User look in "${name}" with "${text}"
  ${element}=               Get Element Form Item By Name     ${name}                       //input[contains(@class, "ant-input")]
  Element Text Should Be    ${element}    ${text}

User look in textarea "${name}" with "${text}"
  ${element}=               Get Element Form Item By Name     ${name}                       //textarea
  Element Text Should Be    ${element}    ${text}

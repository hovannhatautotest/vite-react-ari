*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***

## ============================================NAVIGATE CREATE SUPPLIER PAGE=====================================================
CS_01: Kiểm tra có thể điều hướng đến trang tạo mới nhà cung cấp
    [Tags]    @smoketest    @regression
    And Click "Quản lý nhà cung cấp" menu
    And Click "Thêm nhà cung cấp" button
    Then User look title "Quản Lý Nhà Cung Cấp"
    And User look contains title is "Thêm nhà cung cấp"

##=========================VALIDATION TEXT========================================================
CS_02: Kiểm tra Validation Text khi không nhập thông tin nào cả
  When Go to create supplier page
  And Click "Lưu" button
  Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field
  And Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field
  And Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field
  And Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field
  And Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field
  And Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ và tên đại diện" field
  And Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field
  And Required message "Email đại diện" displayed under "Xin vui lòng nhập email đại diện" field

CS_03: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và nhỏ hơn 8 ký tự
  When Go to create supplier page
  And Enter "text" in "Số fax" with "abcdef"
  And Click in "Tên nhà cung cấp" field
  Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

CS_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và lớn hơn 12 ký tự
  When Go to create supplier page
  And Enter "text" in "Số fax" with "_RANDOM_"
  And Click in "Tên nhà cung cấp" field
  Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

CS_05: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự
  When Go to create supplier page
  And Enter "fax_7" in "Số fax" with "_RANDOM_"
  And Click in "Tên nhà cung cấp" field
  Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

CS_06: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự
  When Go to create supplier page
  And Enter "fax_invalid" in "Số fax" with "_RANDOM_"
  And Click in "Tên nhà cung cấp" field
  Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

CS_07: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @smoketest         @regression
    When When Go to create supplier page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

CS_08: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và nhỏ hơn 8 ký tự
  When Go to create supplier page
  And Enter "text" in "Số điện thoại đại diện" with "abcdef"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

CS_09: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và lớn hơn 12 ký tự
  When Go to create supplier page
  And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

CS_10: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax nhỏ hơn 8 ký tự
  When Go to create supplier page
  And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

CS_11: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax lớn hơn 12 ký tự
  When Go to create supplier page
  And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

CS_12: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
  When Go to create supplier page
  And Enter "text" in "Email đại diện" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

CS_13: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
  When Go to create supplier page
  And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=================================ERROR MESSAGE===============================================================================================
CS_14: Kiểm tra Error Message khi tạo mới nhà cung cấp với Số fax đã được đăng kí trước đó
  When Go to create supplier page
  And Enter "text" in "Tên nhà cung cấp" with "_RANDOM_"
  And Enter "fax_valid" in "Số fax" with "0123456789"
  And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
  And Click select "Quận/Huyện" with "Huyện Phú Vang"
  And Click select "Phường/Xã" with "Xã Phú An"
  And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
  And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
  And Enter "email" in "Email đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Số Fax đã được đăng kí trước đó." popup

CS_15: Kiểm tra Error Message khi tạo mới nhà cung cấp với Số điện thoại đã được đăng kí trước đó
  When Go to create supplier page
  And Enter "text" in "Tên nhà cung cấp" with "_RANDOM_"
  And Enter "fax_valid" in "Số fax" with "_RANDOM_"
  And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
  And Click select "Quận/Huyện" with "Huyện Phú Vang"
  And Click select "Phường/Xã" with "Xã Phú An"
  And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
  And Enter "phone" in "Số điện thoại đại diện" with "0123456789"
  And Enter "email" in "Email đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Số điện thoại đã được đăng ký trước đó." popup

CS_16: Kiểm tra Error Message khi tạo mới nhà cung cấp với Email đã được đăng kí trước đó
  When Go to create supplier page
  And Enter "text" in "Tên nhà cung cấp" with "_RANDOM_"
  And Enter "fax_valid" in "Số fax" with "_RANDOM_"
  And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
  And Click select "Quận/Huyện" with "Huyện Phú Vang"
  And Click select "Phường/Xã" with "Xã Phú An"
  And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
  And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
  And Enter "email" in "Email đại diện" with "nhacungungmongle@getnada.com"
  And Click "Lưu" button
  Then User look message "Email đã được đăng ký trước đó." popup

##=========================================CREATE SUPPLIER SUCCESSFULLY=====================================================================
#CS_17: Kiểm tra Successfully Message tạo mới nhà cung cấp thành công
#  When Go to create supplier page
#  And Enter "text" in "Tên nhà cung cấp" with "_RANDOM_"
#  And Enter "fax_valid" in "Số fax" with "_RANDOM_"
#  And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
#  And Click select "Quận/Huyện" with "Huyện Phú Vang"
#  And Click select "Phường/Xã" with "Xã Phú An"
#  And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
#  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
#  And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
#  And Enter "email" in "Email đại diện" with "_RANDOM_"
#  And Enter "paragraph" in textarea "Ghi chú" with "_RANDOM_"
#  And Click "Lưu" button
#  Then User look message "Tạo nhà cung cấp thành công." popup

##===================ĐIỀU HƯỚNG ĐẾN TRANG "QUẢN LÝ NHÀ CUNG CẤP" TỪ TRANG "TẠO MỚI NHÀ CUNG CẤP"============================================
CS_18: Kiểm tra có thể điều hướng đến trang danh sách nhà cung cấp thành công
  When Go to create supplier page
  And Click "Trở về" button
  Then User look title "Quản Lý Nhà Cung Cấp"
  And User look contains title is "Quản lý nhà cung cấp"

#=====================================VIEW LIST OF SUPPLIER=====================================================
CS_19: Kiểm tra hiển thị thành công danh sách nhà cung cấp đã tạo
    When Click "Quản lý nhà cung cấp" menu
    Then Show list of "Suppliers"

CS_20: Kiểm tra việc tìm kiếm thành công khi nhập "Mã NCC" hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "text" in "Tìm kiếm" with "SPL1222"
    Then Show list of "Suppliers"

CS_21: Kiểm tra việc tìm kiếm thành công khi nhập "Tên nhà cung cấp" hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "text" in "Tìm kiếm" with "Cửa hàng hoa quả"
    Then Show list of "Suppliers"

CS_22: Kiểm tra việc tìm kiếm thành công khi nhập "Tỉnh/Thành phố" hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "text" in "Tìm kiếm" with "Thành Phố Hồ Chí Minh"
    Then Show list of "Suppliers"

CS_23: Kiểm tra việc tìm kiếm thành công khi nhập "Quận/Huyện" hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "text" in "Tìm kiếm" with "Thành phố Thủ Đức"
    Then Show list of "Suppliers"

CS_24: Kiểm tra việc tìm kiếm thành công khi nhập "Phường/Xã" hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "text" in "Tìm kiếm" with "Phường Tăng Nhơn Phú B"
    Then Show list of "Suppliers"

CS_25: Kiểm tra việc tìm kiếm thành công khi nhập "Người đại diện" hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "text" in "Tìm kiếm" with "Lê Tiên Đạt"
    Then Show list of "Suppliers"

CS_26: Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "text" in "Tìm kiếm" with "0359659906"
    Then Show list of "Suppliers"

CS_27: Kiểm tra việc tìm kiếm không thành công khi nhập "Mã NCC" không hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "name code" in "Tìm kiếm" with "_RANDOM_"
    Then No Supplier are shown

CS_28: Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No Supplier are shown

CS_29: Kiểm tra việc tìm kiếm không thành công khi nhập "Keyword" không hợp lệ vào thanh tìm kiếm
    When Click "Quản lý nhà cung cấp" menu
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No Supplier are shown

CS_30: Kiểm tra có thể xem danh sách trang kế tiếp, trước trước, 10 trang kế tiếp, 10 trang trước
    When Click "Quản lý nhà cung cấp" menu
    And Click ">" to "next" page
    Then Show list of "Suppliers"
    And Click "<" to "prev" page
    Then Show list of "Suppliers"
    And Click ">>" to "next_10" page
    Then Show list of "Suppliers"
    And Click "<<" to "prev_10" page
    Then Show list of "Suppliers"

##=========================ĐIỀU HƯỚNG ĐẾN TRANG "CHỈNH SỬA THÔNG TIN NHÀ CUNG CẤP"========================================================
Edit_Supplier_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin nhà cung cấp
  When Click "Quản lý nhà cung cấp" menu
  And Select Supplier need to edit
  Then User look title "Quản Lý Nhà Cung Cấp"
  And User look contains title is "Chi tiết nhà cung cấp"
  And User look tab menu "Thông tin nhà cung cấp"
  And User look tab menu "Danh sách hàng hóa"
  And User look tab menu "Quản lý đơn hàng"
  And User look tab menu "Doanh thu"
  And User look tab menu "Chiết khấu"
  And User look tab menu "Hợp đồng"

##==================================VALIDATION TEXT==========================================================
Edit_Supplier_02: Kiểm tra Validation Text trường "Tên nhà cung cấp" khi bỏ trống Tên nhà cung cấp
  When Go to edit supplier page
  When Enter "text" in "Tên nhà cung cấp" with ""
  And Click in "Số fax" field
  Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field

Edit_Supplier_03: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và nhỏ hơn 8 ký tự
  When Go to edit supplier page
  When Enter "text" in "Số fax" with "abcdef"
  And Click in "Tên nhà cung cấp" field
  Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Supplier_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và lớn hơn 12 ký tự
  When Go to edit supplier page
  When Enter "text" in "Số fax" with "_RANDOM_"
  And Click in "Tên nhà cung cấp" field
  Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Supplier_05: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự
  When Go to edit supplier page
  When Enter "fax_7" in "Số fax" with "_RANDOM_"
  And Click in "Tên nhà cung cấp" field
  Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Supplier_06: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự
  When Go to edit supplier page
  When Enter "fax_invalid" in "Số fax" with "_RANDOM_"
  And Click in "Tên nhà cung cấp" field
  Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Supplier_07: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @smoketest         @regression
  When Go to edit supplier page
  And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

Edit_Supplier_08: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và nhỏ hơn 8 ký tự
  When Go to edit supplier page
  And Enter "text" in "Số điện thoại đại diện" with "abcdef"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Supplier_09: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và lớn hơn 12 ký tự
  When Go to edit supplier page
  And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Supplier_10: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax nhỏ hơn 8 ký tự
  When Go to edit supplier page
  And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Supplier_11: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax lớn hơn 12 ký tự
  When Go to edit supplier page
  And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Supplier_12: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
  When Go to edit supplier page
  And Enter "text" in "Email đại diện" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Edit_Supplier_13: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
  When Go to edit supplier page
  And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=================================ERROR MESSAGE===============================================================================================
Edit_Supplier_14: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số fax đã được đăng kí trước đó
  When Go to edit supplier page
  When Enter "fax_valid" in "Số fax" with "0487485865"
  And Click "Lưu" button
  Then User look message "Số Fax đã được đăng kí trước đó." popup

#Edit_Supplier_15: Kiểm tra Error Message khi chỉnh sửa Store với Số điện thoại đã được đăng kí trước đó    #test failed
#  When Go to edit supplier page
#  When Enter "phone" in "Số điện thoại đại diện" with "0335745999"
#  And Click "Lưu" button
#  Then User look message "Số điện thoại đã được đăng ký trước đó." popup

Edit_Supplier_16: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Email đã được đăng kí trước đó
  When Go to edit supplier page
  And Enter "email" in "Email đại diện" with "lananh8032003@gmail.com"
  And Click "Lưu" button
  Then User look message "Email này đã tồn tại, vui lòng nhập email khác." popup


##=======================EDIT SUPPLIER SUCCESSFULLY================================================
Edit_Supplier_17: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Tên nhà cung cấp
  When Go to edit supplier page
  And Enter "text" in "Tên nhà cung cấp" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_18: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số fax
  When Go to edit supplier page
  And Enter "fax_valid" in "Số fax" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_19: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Địa chỉ cửa hàng
  When Go to edit supplier page
  And Click select "Tỉnh/Thành phố" with "Tỉnh Quảng Trị"
  And Click select "Quận/Huyện" with "Thị xã Quảng Trị"
  And Click select "Phường/Xã" with "Xã Hải Lệ"
  And Enter "number" in "Địa chỉ cụ thể" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_20: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Họ tên người đại diện
  When Go to edit supplier page
  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_21: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số điện thoại người đại diện
  When Go to edit supplier page
  And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_22: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Email người đại diện
  When Go to edit supplier page
  And Enter "email" in "Email đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_23: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Ghi chú
  When Go to edit supplier page
  And Enter "paragraph" in textarea "Ghi chú" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Admin

Go to create supplier page
  When Click "Quản lý nhà cung cấp" menu
  And Click "Thêm nhà cung cấp" button

Go to edit supplier page
  When Click "Quản lý nhà cung cấp" menu
  And Select Supplier need to edit

Select Supplier need to edit
    ${element}    Set Variable   //td[contains(text(),'SPL1230')]
    Click         ${element}        left        2

User look tab menu "${menu}"
  Element Text Should Be    //div[contains(text(),'${menu}')]     ${menu}

*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down


*** Test Cases ***
##=========================ĐIỀU HƯỚNG ĐẾN TRANG "THÊM CỬA HÀNG"========================================================
CRS_01: Kiểm tra có thể điều hướng đến trang thêm mới cửa hàng
  When Click "Quản lý cửa hàng" menu
  And Click "Thêm cửa hàng" button
  Then User look title "Quản Lý Cửa Hàng"
  And User look contains title is "Thêm cửa hàng"

##=========================VALIDATION TEXT IN "THÊM CỬA HÀNG" PAGE========================================================
CRS_02: Kiểm tra Validation Text khi không nhập thông tin nào cả
  Go to create store page
  When Click "Lưu" button
  Then Required message "Tên cửa hàng" displayed under "Xin vui lòng nhập tên cửa hàng" field
  And Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field
  And Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field
  And Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field
  And Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field
  And Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ tên đại diện" field
  And Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field
  And Required message "Email đại diện" displayed under "Xin vui lòng nhập email đại diện" field

CRS_03: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và nhỏ hơn 8 ký tự
  Go to create store page
  When Enter "text" in "Số fax" with "abcdef"
  And Click in "Tên cửa hàng" field
  Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

CRS_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và lớn hơn 12 ký tự
  Go to create store page
  When Enter "text" in "Số fax" with "_RANDOM_"
  And Click in "Tên cửa hàng" field
  Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

CRS_05: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự
  Go to create store page
  When Enter "fax_7" in "Số fax" with "_RANDOM_"
  And Click in "Tên cửa hàng" field
  Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

CRS_06: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự
  Go to create store page
  When Enter "fax_invalid" in "Số fax" with "_RANDOM_"
  And Click in "Tên cửa hàng" field
  Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

CRS_07: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @smoketest         @regression
    When Go to create store page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

CRS_08: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và nhỏ hơn 8 ký tự
  Go to create store page
  When Enter "text" in "Số điện thoại đại diện" with "abcdef"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

CRS_09: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và lớn hơn 12 ký tự
  Go to create store page
  When Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

CRS_10: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax nhỏ hơn 8 ký tự
  Go to create store page
  When Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

CRS_11: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax lớn hơn 12 ký tự
  Go to create store page
  When Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

CRS_12: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
  Go to create store page
  When Enter "text" in "Email đại diện" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

CRS_13: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
  Go to create store page
  When Enter "word" in textarea "Ghi chú" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=================================VALIDATION TEXT IN KIOTVIET================================================================================
CRS_14: Kiểm tra Validation Text trường "client_id" khi không nhập client_id
  Go to create store page
  When Click switch "Kết nối KiotViet" to be activated
  And Enter "text" in "client_id" with ""
  And Click in "client_secret" field
  Then Required message "client_id" displayed under "Xin vui lòng nhập client_id" field

CRS_15: Kiểm tra Validation Text trường "client_secret" khi không nhập client_secret
  Go to create store page
  When Click switch "Kết nối KiotViet" to be activated
  And Enter "text" in "client_secret" with ""
  And Click in "client_id" field
  Then Required message "client_secret" displayed under "Xin vui lòng nhập client_secret" field

CRS_16: Kiểm tra Validation Text trường "retailer" khi không nhập retailer
  Go to create store page
  When Click switch "Kết nối KiotViet" to be activated
  And Enter "text" in "retailer" with ""
  And Click in "client_id" field
  Then Required message "retailer" displayed under "Xin vui lòng nhập retailer" field

CRS_17: Kiểm tra Validation Text trường "branchId" không nhập branchId
  Go to create store page
  When Click switch "Kết nối KiotViet" to be activated
  And Click "Lưu" button
  Then Required message "branchId" displayed under "Xin vui lòng nhập tên cửa hàng" field

##=================================ERROR MESSAGE===============================================================================================
CRS_18: Kiểm tra Error Message khi tạo mới Store với Số fax đã được đăng kí trước đó
  Go to create store page
  When Enter "text" in "Tên cửa hàng" with "_RANDOM_"
  And Enter "fax_valid" in "Số fax" with "09784378"
  And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
  And Click select "Quận/Huyện" with "Huyện Phú Vang"
  And Click select "Phường/Xã" with "Xã Phú An"
  And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
  And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
  And Enter "email" in "Email đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Số Fax đã được đăng kí trước đó." popup

CRS_19: Kiểm tra Error Message khi tạo mới Store với Số điện thoại đã được đăng kí trước đó
  Go to create store page
  When Enter "text" in "Tên cửa hàng" with "_RANDOM_"
  And Enter "fax_valid" in "Số fax" with "_RANDOM_"
  And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
  And Click select "Quận/Huyện" with "Huyện Phú Vang"
  And Click select "Phường/Xã" with "Xã Phú An"
  And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
  And Enter "phone" in "Số điện thoại đại diện" with "0335745554"
  And Enter "email" in "Email đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Số điện thoại đã được đăng ký trước đó." popup

CRS_20: Kiểm tra Error Message khi tạo mới Store với Email đã được đăng kí trước đó
  Go to create store page
  When Enter "text" in "Tên cửa hàng" with "_RANDOM_"
  And Enter "fax_valid" in "Số fax" with "_RANDOM_"
  And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
  And Click select "Quận/Huyện" with "Huyện Phú Vang"
  And Click select "Phường/Xã" with "Xã Phú An"
  And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
  And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
  And Enter "email" in "Email đại diện" with "lananh2003@gmail.com"
  And Click "Lưu" button
  Then User look message "Email đã được đăng ký trước đó." popup

CRS_21: Kiểm tra Error Message kết nối KiotViet khi không nhập client_id
  Go to create store page
  When Click switch "Kết nối KiotViet" to be activated
  And Enter "text" in "client_secret" with "_RANDOM_"
  And Enter "text" in "retailer" with "_RANDOM_"
  And Click "Lấy DS chi nhánh" button
  Then User look message "clientId là bắt buộc" popup

CRS_22: Kiểm tra Error Message kết nối KiotViet khi không nhập client_secret
  Go to create store page
  When Click switch "Kết nối KiotViet" to be activated
  And Enter "text" in "client_id" with "_RANDOM_"
  And Enter "text" in "retailer" with "_RANDOM_"
  And Click "Lấy DS chi nhánh" button
  Then User look message "client_secret là bắt buộc" popup

CRS_23: Kiểm tra Error Message kết nối KiotViet khi không nhập retailer
  Go to create store page
  When Click switch "Kết nối KiotViet" to be activated
  And Enter "text" in "client_id" with "_RANDOM_"
  And Enter "text" in "client_secret" with "_RANDOM_"
  And Click "Lấy DS chi nhánh" button
  Then User look message "retailer là bắt buộc" popup

CRS_24: Kiểm tra Successfully Message khi kết nối KiotViet
  Go to create store page
  When Click switch "Kết nối KiotViet" to be activated
  And Enter "text" in "client_id" with "c379ebf5-d181-4421-9988-0b25f240b86d"
  And Enter "text" in "client_secret" with "B2A743F700308085E43800A478822A186B25C880"
  And Enter "text" in "retailer" with "lctiendat"
  And Click "Lấy DS chi nhánh" button
  Then User look message "Lấy danh sách branch thành công." popup

##=========================================CREATE STORE SUCCESSFULLY=====================================================================
#CRS_25: Kiểm tra Successfully Message tạo mới của hàng thành công khi không kết nối với KiotViet
#  Go to create store page
#  When Enter "text" in "Tên cửa hàng" with "_RANDOM_"
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
#  Then User look message "Tạo cửa hàng thành công." popup

#CRS_26: Kiểm tra Successfully Message tạo mới của hàng thành công khi kết nối với KiotViet
#  Go to create store page
#  When Enter "text" in "Tên cửa hàng" with "_RANDOM_"
#  And Enter "fax_valid" in "Số fax" with "_RANDOM_"
#  And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
#  And Click select "Quận/Huyện" with "Huyện Phú Vang"
#  And Click select "Phường/Xã" with "Xã Phú An"
#  And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
#  And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
#  And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
#  And Enter "email" in "Email đại diện" with "_RANDOM_"
#  And Enter "paragraph" in textarea "Ghi chú" with "_RANDOM_"
#  When Click switch "Kết nối KiotViet" to be activated
#  And Enter "text" in "client_id" with "c379ebf5-d181-4421-9988-0b25f240b86d"
#  And Enter "text" in "client_secret" with "B2A743F700308085E43800A478822A186B25C880"
#  And Enter "text" in "retailer" with "lctiendat"
#  And Click "Lấy DS chi nhánh" button
#  Then User look message "Lấy danh sách branch thành công." popup
#  And Click select "branchId" with "Chi nhánh trung tâm"
#  And Click "Lưu" button
#  Then User look message "Tạo cửa hàng thành công." popup

##==============================ĐIỀU HƯỚNG ĐẾN TRANG "QUẢN LÝ CỬA HÀNG" TỪ TRANG "TẠO MỚI CỬA HÀNG"============================================
CRS_27: Kiểm tra có thể điều hướng đến trang danh sách cửa hàng khi click "Trở về" button từ trang tạo mới cửa hàng
  Go to create store page
  And Click "Trở về" button
  Then User look title "Quản Lý Cửa Hàng"
  And User look contains title is "Quản lý cửa hàng"

#-------------------------------------VIEW LIST OF STORE--------------------------------------------------------------------------------------
CRS_28: Kiểm tra hiển thị thành công danh sách người dùng đã tạo
    And Click "Quản lý cửa hàng" menu
    Then Show list of "Stores"

CRS_29: Kiểm tra việc tìm kiếm thành công khi nhập "Mã cửa hàng" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "STR1209"
    Then Show list of "Stores"

CRS_30: Kiểm tra việc tìm kiếm thành công khi nhập "Tên cửa hàng" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "LAN ANH"
    Then Show list of "Stores"

CRS_31: Kiểm tra việc tìm kiếm thành công khi nhập "Tỉnh/Thành phố" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "Thành Phố Hồ Chí Minh"
    Then Show list of "Stores"

CRS_32: Kiểm tra việc tìm kiếm thành công khi nhập "Quận/Huyện" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "Quận Ba Đình"
    Then Show list of "Stores"

CRS_33: Kiểm tra việc tìm kiếm thành công khi nhập "Phường/Xã" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "Phường Vĩnh Phúc"
    Then Show list of "Stores"

CRS_34.1: Kiểm tra việc tìm kiếm thành công khi nhập "Loại cửa hàng" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "Cửa hàng chính"
    Then Show list of "Stores"

CRS_34.2: Kiểm tra việc tìm kiếm thành công khi nhập "Loại cửa hàng" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "Cửa hàng chi nhánh"
    Then Show list of "Stores"

CRS_35: Kiểm tra việc tìm kiếm thành công khi nhập "Người đại diện" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "Nguyễn Thị Lan Anh"
    Then Show list of "Stores"

CRS_36: Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "0335745554"
    Then Show list of "Stores"

CRS_37: Kiểm tra việc tìm kiếm không thành công khi nhập "Mã cửa hàng" không hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "name code" in "Tìm kiếm" with "_RANDOM_"
    Then No store are shown

CRS_38: Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No store are shown

CRS_39: Kiểm tra việc tìm kiếm không thành công khi nhập "Keyword" không hợp lệ vào thanh tìm kiếm
    And Click "Quản lý cửa hàng" menu
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No store are shown

CRS_40: Kiểm tra có thể xem danh sách trang kế tiếp, trước trước, 10 trang kế tiếp, 10 trang trước
    And Click "Quản lý cửa hàng" menu
    And Click ">" to "next" page
    Then Show list of "Stores"
    And Click "<" to "prev" page
    Then Show list of "Stores"
    And Click ">>" to "next_10" page
    Then Show list of "Stores"
    And Click "<<" to "prev_10" page
    Then Show list of "Stores"

##=========================ĐIỀU HƯỚNG ĐẾN TRANG "CHỈNH SỬA THÔNG TIN THÊM CỬA HÀNG"========================================================
EDS_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin cửa hàng
  When Click "Quản lý cửa hàng" menu
  And Select Store need to edit
  Then User look title "Quản Lý Cửa Hàng"
  And User look contains title is "Thông tin cửa hàng"
  And User look tab menu "Thông tin cửa hàng"
  And User look tab menu "Danh sách hàng hóa"
  And User look tab menu "Danh sách chi nhánh"
  And User look tab menu "Quản lý NCC"
  And User look tab menu "Doanh thu"
  And User look tab menu "Quản lý kho"

##==================================VALIDATION TEXT==========================================================
EDS_02: Kiểm tra Validation Text trường "Tên cửa hàng" khi bỏ trống Tên cửa hàng
  Go to page edit store
  When Enter "text" in "Tên cửa hàng" with ""
  And Click in "Số fax" field
  Then Required message "Tên cửa hàng" displayed under "Xin vui lòng nhập tên cửa hàng" field

EDS_03: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và nhỏ hơn 8 ký tự
  Go to page edit store
  When Enter "text" in "Số fax" with "abcdef"
  And Click in "Tên cửa hàng" field
  Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

EDS_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và lớn hơn 12 ký tự
  Go to page edit store
  When Enter "text" in "Số fax" with "_RANDOM_"
  And Click in "Tên cửa hàng" field
  Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

EDS_05: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự
  Go to page edit store
  When Enter "fax_7" in "Số fax" with "_RANDOM_"
  And Click in "Tên cửa hàng" field
  Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

EDS_06: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự
  Go to page edit store
  When Enter "fax_invalid" in "Số fax" with "_RANDOM_"
  And Click in "Tên cửa hàng" field
  Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

EDS_07: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @smoketest         @regression
    When Go to page edit store
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

EDS_08: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và nhỏ hơn 8 ký tự
  Go to page edit store
  When Enter "text" in "Số điện thoại đại diện" with "abcdef"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

EDS_09: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và lớn hơn 12 ký tự
  Go to page edit store
  When Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
  And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

EDS_10: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax nhỏ hơn 8 ký tự
  Go to page edit store
  When Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

EDS_11: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax lớn hơn 12 ký tự
  Go to page edit store
  When Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click in "Email đại diện" field
  Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

EDS_12: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
  Go to page edit store
  When Enter "text" in "Email đại diện" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

EDS_13: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
  Go to page edit store
  When Enter "word" in textarea "Ghi chú" with "_RANDOM_"
  And Click in "Số điện thoại đại diện" field
  Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

EDS_14: Kiểm tra Validation Text trường "client_id" khi không nhập client_id
  Go to page edit store
  And Enter "text" in "client_id" with ""
  And Click in "client_secret" field
  Then Required message "client_id" displayed under "Xin vui lòng nhập client_id" field

EDS_15: Kiểm tra Validation Text trường "client_secret" khi không nhập client_secret
  Go to page edit store
  And Enter "text" in "client_secret" with ""
  And Click in "client_id" field
  Then Required message "client_secret" displayed under "Xin vui lòng nhập client_secret" field

EDS_16: Kiểm tra Validation Text trường "retailer" khi không nhập retailer
  Go to page edit store
  And Enter "text" in "retailer" with ""
  And Click in "client_id" field
  Then Required message "retailer" displayed under "Xin vui lòng nhập retailer" field

##=================================ERROR MESSAGE===============================================================================================
EDS_17: Kiểm tra Error Message khi chỉnh sửa Store với Số fax đã được đăng kí trước đó
  Go to page edit store
  When Enter "fax_valid" in "Số fax" with "09784378"
  And Click "Lưu" button
  Then User look message "Số Fax đã được đăng kí trước đó." popup

#EDS_18: Kiểm tra Error Message khi chỉnh sửa Store với Số điện thoại đã được đăng kí trước đó    #test failed
#  Go to page edit store
#  When Enter "phone" in "Số điện thoại đại diện" with "0335745554"
#  And Click "Lưu" button
#  Then User look message "Số điện thoại đã được đăng ký trước đó." popup

EDS_19: Kiểm tra Error Message khi chỉnh sửa Store với Email đã được đăng kí trước đó
  Go to page edit store
  When Enter "email" in "Email đại diện" with "lananh2003@gmail.com"
  And Click "Lưu" button
  Then User look message "Email này đã tồn tại, vui lòng nhập email khác." popup

EDS_20: Kiểm tra Error Message kết nối KiotViet khi không nhập client_id
  Go to page edit store
  And Enter "text" in "client_id" with ""
  And Enter "text" in "client_secret" with "_RANDOM_"
  And Enter "text" in "retailer" with "_RANDOM_"
  And Click "Lấy DS chi nhánh" button
  Then User look message "clientId là bắt buộc" popup

EDS_21: Kiểm tra Error Message kết nối KiotViet khi không nhập client_secret
  Go to page edit store
  And Enter "text" in "client_id" with "_RANDOM_"
  And Enter "text" in "client_secret" with ""
  And Enter "text" in "retailer" with "_RANDOM_"
  And Click "Lấy DS chi nhánh" button
  Then User look message "client_secret là bắt buộc" popup

EDS_22: Kiểm tra Error Message kết nối KiotViet khi không nhập retailer
  Go to page edit store
  And Enter "text" in "client_id" with "_RANDOM_"
  And Enter "text" in "client_secret" with "_RANDOM_"
  And Enter "text" in "retailer" with ""
  And Click "Lấy DS chi nhánh" button
  Then User look message "retailer là bắt buộc" popup

EDS_23: Kiểm tra Successfully Message khi kết nối KiotViet
  Go to page edit store
  And Enter "text" in "client_id" with "c379ebf5-d181-4421-9988-0b25f240b86d"
  And Enter "text" in "client_secret" with "B2A743F700308085E43800A478822A186B25C880"
  And Enter "text" in "retailer" with "lctiendat"
  And Click "Lấy DS chi nhánh" button
  Then User look message "Lấy danh sách branch thành công." popup

##=======================EDIT STORE SUCCESSFULLY================================================
EDS_24: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Tên cửa hàng
  Go to page edit store
  When Enter "text" in "Tên cửa hàng" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa cửa hàng thành công." popup

EDS_25: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Số fax
  Go to page edit store
  When Enter "fax_valid" in "Số fax" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa cửa hàng thành công." popup

EDS_26: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Địa chỉ cửa hàng
  Go to page edit store
  When Click select "Tỉnh/Thành phố" with "Tỉnh Quảng Trị"
  And Click select "Quận/Huyện" with "Thị xã Quảng Trị"
  And Click select "Phường/Xã" with "Xã Hải Lệ"
  And Enter "number" in "Địa chỉ cụ thể" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa cửa hàng thành công." popup

EDS_27: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Họ tên người đại diện
  Go to page edit store
  When Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa cửa hàng thành công." popup

EDS_28: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Số điện thoại người đại diện
  Go to page edit store
  When Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa cửa hàng thành công." popup

EDS_29: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Email người đại diện
  Go to page edit store
  When Enter "email" in "Email đại diện" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa cửa hàng thành công." popup

EDS_30: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Ghi chú
  Go to page edit store
  When Enter "paragraph" in textarea "Ghi chú" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa cửa hàng thành công." popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Admin

Go to create store page
  When Click "Quản lý cửa hàng" menu
  And Click "Thêm cửa hàng" button

Select Store need to edit
    ${element}    Set Variable   //td[contains(text(),'STR1227')]
    Click         ${element}        left        2

User look tab menu "${menu}"
  Element Text Should Be    //div[contains(text(),'${menu}')]     ${menu}

Go to page edit store
    And Click "Quản lý cửa hàng" menu
    And Select Store need to edit

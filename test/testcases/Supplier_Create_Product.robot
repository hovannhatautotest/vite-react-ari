*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***
##===============================ĐIỀU HƯỚNG ĐẾN TRANG TẠO MỚI SẢN PHẨM============================================
#Create_Product_01: Kiểm tra có thể điều hướng đến trang tạo mới sản phẩm
#  When Click "Quản lý hàng hóa" menu
#  And Click "Sản phẩm" sub menu
#  And Click "Thêm sản phẩm" button
#  And Select category in "Danh mục chính" with "Thời trang nữ"
#  And Select category in "Danh mục cấp 1" with "Váy"
#  And Click "Tiếp theo" button
#  Then User look title "Quản Lý Hàng Hóa"
#  And User look contains title is "Thêm sản phẩm"

##============================VERIFY VALIDATION TEXT=================================================================
#Create_Product_02: Kiểm tra Validation Text khi không bỏ trống all field
#  When Go to crete product page
#  And Click "Lưu" button
#  Then Required message "Tên sản phẩm" displayed under "Đây là trường bắt buộc!" field
#  And Required message "Xuất xứ" displayed under "Đây là trường bắt buộc!" field
#  And Required message "Thuế nhập" displayed under "Đây là trường bắt buộc!" field
#  And Required message "Thuế bán" displayed under "Đây là trường bắt buộc!" field
#  And Required message "Đơn vị cơ bản" displayed under "Đây là trường bắt buộc!" field

#Create_Product_03: Kiểm tra Validation Text khi không bỏ trống trường "Tên sản phẩm"
#  When Go to crete product page
#  And Enter "text" in "Tên sản phẩm" with ""
#  And Click in "Thương hiệu" field
#  Then Required message "Tên sản phẩm" displayed under "Đây là trường bắt buộc!" field
#
#Create_Product_04: Kiểm tra Validation Text khi không bỏ trống trường "Xuất xứ"
#  When Go to crete product page
#  And Enter "text" in "Xuất xứ" with ""
#  And Click in "Thương hiệu" field
#  Then Required message "Xuất xứ" displayed under "Đây là trường bắt buộc!" field
#
#Create_Product_05: Kiểm tra Validation Text khi không bỏ trống trường "Thuế nhập"
#  When Go to crete product page
#  And Click select "Thuế nhập" with "Thuế môi trường - 10%"
#  And Delete text in "Thuế nhập"
#  Then Required message "Thuế nhập" displayed under "Đây là trường bắt buộc!" field
#
#Create_Product_06: Kiểm tra Validation Text khi không bỏ trống trường "Thuế bán"
#  When Go to crete product page
#  And Click select "Thuế bán" with "Thuế môi trường - 10%"
#  And Delete text in "Thuế bán"
#  Then Required message "Thuế bán" displayed under "Đây là trường bắt buộc!" field
#
#Create_Product_07: Kiểm tra Validation Text khi không bỏ trống trường "Đơn vị cơ bản"
#  When Go to crete product page
#  And Enter "text" in "Đơn vị cơ bản" with ""
#  And Click in "Thương hiệu" field
#  Then Required message "Đơn vị cơ bản" displayed under "Đây là trường bắt buộc!" field

#Create_Product_08: Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và lớn hơn 13 ký tự
#  When Go to crete product page
#  And Enter "text" in "Mã vạch" with "_RANDOM_"
#  And Click in "Thương hiệu" field
#  Then Required message "Mã vạch" field displayed under "Vui lòng nhập chỉ nhập số!"
#  And Required message "Mã vạch" field displayed under "Vui lòng nhập tối đa 13 ký tự."
#
#Create_Product_09: Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và nhỏ hơn 13 ký tự
#  When Go to crete product page
#  And Enter "fullname" in "Mã vạch" with "_RANDOM_"
#  And Click in "Thương hiệu" field
#  Then Required message "Mã vạch" displayed under "Vui lòng nhập chỉ nhập số!" field
#
#Create_Product_09: Kiểm tra Validation Text khi nhập "Mã vạch" lớn hơn 13 ký tự số
#  When Go to crete product page
#  And Enter "Barcode_invalid" in "Mã vạch" with "_RANDOM_"
#  And Click in "Thương hiệu" field
#  Then Required message "Mã vạch" displayed under "Vui lòng nhập tối đa 13 ký tự." field

#Create_Product_10: Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
#  When Go to crete product page
#  And Enter "2000 word" in textarea "Mô tả sản phẩm" with "_RANDOM_"
#  And Click in "Thương hiệu" field
#  Then Required message "Mô tả sản phẩm" displayed under "Chỉ được nhập tối đa 2000 ký tự!" field

##================================ERROR MESSAGE WITH "THÊM GIÁ" BUTTON================================================================##
#Create_Product_11: Kiểm tra error message khi không nhập thông tin bảng giá
#  When Go to crete product page
#  And Click "Thêm giá" button
#  Then User look message "Vui lòng nhập thông tin bảng giá" popup

#Create_Product_12: Kiểm tra error message khi nhập số lượng tối thiểu bằng 0
#  When Go to crete product page
#  And Enter "number" in "Số lượng tối thiểu" field with "0"
#  And Click "Thêm giá" button
#  Then User look message "Vui lòng nhập số lượng tối thiểu lớn hơn 0" popup

#Create_Product_13: Kiểm tra error message khi nhập số lượng tối thiểu nhỏ hơn số lượng tối thiểu vừa tạo
#  When Go to crete product page
#  And Enter "number" in "Số lượng tối thiểu" field with "10"
#  And Click "Thêm giá" button
#  And Enter "number" in "Thêm số lượng tối thiểu" field with "1"
#  And Click "Thêm giá" button
#  Then User look message "Số lượng tối thiểu phải lớn hơn số lượng vừa tạo" popup

##==============================ERROR MESSAGE WITH "LƯU" BUTTON==================================================
#Create_Product_14: Kiểm tra error message khi không tải ảnh sản phẩm lên
#  When Go to crete product page
#  And Enter default information
#  And Click "Lưu" button
#  Then User look message "Hình ảnh không được để trống." popup
#
#Create_Product_15: Kiểm tra error message khi không nhập chủng loại giá
#  When Go to crete product page
#  And Select file in "Tải ảnh lên từ thiết bị" with "vaychinh.jpg"          #D:\BALANCE\vite-react-balance\test\upload\vaychinh.jpg
#  And Enter default information
#  And Click "Lưu" button
#  Then User look message "Chủng loại giá là bắt buộc." popup
#
#Create_Product_16: Kiểm tra error message khi không nhập số lượng tối thiểu
#  When Go to crete product page
#  And Select file in "Tải ảnh lên từ thiết bị" with "vaychinh.jpg"
#  And Enter default information
#  And Enter "test name" in "Chủng loại giá" field with "_RANDOM_"
#  And Click "Lưu" button
#  Then User look message "Số lượng tối thiểu là bắt buộc." popup
#
#Create_Product_17: Kiểm tra error message khi không nhập giá bán
#  When Go to crete product page
#  And Select file in "Tải ảnh lên từ thiết bị" with "vaychinh.jpg"
#  And Enter default information
#  And Enter "test name" in "Chủng loại giá" field with "_RANDOM_"
#  And Enter "number" in "Số lượng tối thiểu" field with "_RANDOM_"
#  And Click "Lưu" button
#  Then User look message "Giá bán là bắt buộc." popup

#Create_Product_18: Kiểm tra error message tại phần Chiết khấu với Balance
#  When Go to crete product page
#  And Select file in "Tải ảnh lên từ thiết bị" with "vaychinh.jpg"
#  And Enter default information
#  Enter "Bảng giá dành cho cửa hàng"
#  # Không nhập chiết khấu cố định
#  And Click "Lưu" button
#  Then User look message "Chiết khấu cố định là bắt buộc." popup
#
#  # Không nhập Doanh thu chiết khấu theo %
#  And Click checked radio "Chiết khấu linh động"
#  And Click "Lưu" button
#  Then User look message "Doanh thu là bắt buộc." popup
#
#  # Không nhập Chiết khấu theo doanh thu (%)
#  And Enter "number" in "Doanh thu (VNĐ)" field with "_RANDOM_"
#  And Click "Lưu" button
#  Then User look message "Chiết khấu theo doanh thu (%) là bắt buộc." popup
#
#  # Không nhập Doanh thu chiết khấu theo số tiền
#  And Click checked radio "Chiết khấu theo số tiền"
#  And Click "Lưu" button
#  Then User look message "Doanh thu là bắt buộc." popup
#
#  # Không nhập Số tiền chiết khấu (VNĐ)
#  And Enter "number" in "Doanh thu (VNĐ)" field with "_RANDOM_"
#  And Click "Lưu" button
#  Then User look message "Số tiền chiết khấu (VNĐ) là bắt buộc." popup

##===================ĐIỀU HƯỚNG ĐẾN TRANG "QUẢN LÝ HÀNG HÓA" TỪ TRANG "TẠO MỚI SẢN PHẨM"============================================
#Create_Product_19: Kiểm tra có thể điều hướng đến trang quản lý sản phẩm thành công
#  When Go to crete product page
#  And Click "Trở về" button
#  And Click "Trở về" button
#  And Click "Trở về" button
#  Then User look title "Quản Lý Hàng Hóa"
#  And User look contains title is "Quản lý sản phẩm"

##================================CREATE PRODUCT SUCCESSFULLY==============================================
#Create_Product_20: Kiểm tra tạo mới sản phẩm với chiết khấu cố định thành công
#  When Go to crete product page
#  And Select file in "Tải ảnh lên từ thiết bị" with "vaychinh.jpg"
#  And Enter default information
#  And Enter "Bảng giá dành cho cửa hàng"
#  And Enter data "%" in "Chiết khấu cố định" with "_RANDOM_"
#  And Click "Lưu" button
#  Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
#  And Select product need to edit
#  And Click "Xóa sản phẩm" button
#  And Click "Đồng ý" button
#  Then User look message "Xóa sản phẩm thành công." popup

#Create_Product_21: Kiểm tra tạo mới sản phẩm với chiết khấu linh động - chiết khấu theo % thành công
#  When Go to crete product page
#  And Select file in "Tải ảnh lên từ thiết bị" with "vaychinh.jpg"
#  And Enter default information
#  And Enter "Bảng giá dành cho cửa hàng"
#  And Click checked radio "Chiết khấu linh động"
#  And Enter data "number" in "Chiết khấu theo %" with "_RANDOM_"
#  And Click "Lưu" button
#  Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
#  And Select product need to edit
#  And Click "Xóa sản phẩm" button
#  And Click "Đồng ý" button
#  Then User look message "Xóa sản phẩm thành công." popup

#Create_Product_22: Kiểm tra tạo mới sản phẩm với chiết khấu linh động - chiết khấu theo số tiền thành công
#  When Go to crete product page
#  And Select file in "Tải ảnh lên từ thiết bị" with "vaychinh.jpg"
#  And Enter default information
#  And Enter "Bảng giá dành cho cửa hàng"
#  And Click checked radio "Chiết khấu linh động"
#  And Click checked radio "Chiết khấu theo số tiền"
#  And Enter data "number" in "Chiết khấu theo số tiền" with "_RANDOM_"
#  And Click "Lưu" button
#  Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
#  And Select product need to edit
#  And Click "Xóa sản phẩm" button
#  And Click "Đồng ý" button
#  Then User look message "Xóa sản phẩm thành công." popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Supplier

Go to crete product page
  When Click "Quản lý hàng hóa" menu
  And Click "Sản phẩm" sub menu
  And Click "Thêm sản phẩm" button
  And Select category in "Danh mục chính" with "Thời trang nữ"
  And Select category in "Danh mục cấp 1" with "Váy"
  And Click "Tiếp theo" button

Select category in "${name}" with "${text}"
    ${elements}=               Get Elements        //input[@placeholder="Tìm kiếm"]
    IF  '${name}' == 'Danh mục chính'
        ${element}=     Set Variable    ${elements}[0]
    ELSE IF  '${name}' == 'Danh mục cấp 1'
        ${element}=     Set Variable    ${elements}[1]
    ELSE IF  '${name}' == 'Danh mục cấp 2'
        ${element}=     Set Variable    ${elements}[2]
    END
    Clear Text                ${element}
    Fill Text                 ${element}                        ${text}                       True
    ${cnt}=                   Get Length                        ${text}
    IF  ${cnt} > 0
        Set Global Variable     ${STATE["${name}"]}               ${text}
    END
    Wait Until Element Spin
    Sleep     ${SHOULD_TIMEOUT}
    ${element}=   Get Elements    //div[contains(text(),'${text}')]
    Click     ${element}[0]

Delete text in "${field}"
  Click    xpath=//span[contains(@class, "ant-select-clear")]

Enter "${type}" in "${name}" field with "${text}"
  ${text}=                  Get Random Text                   ${type}                       ${text}
  IF  '${name}' == 'Chủng loại giá'
    ${placeholder}=     Set Variable    Nhập loại giá
  ELSE IF  '${name}' != 'Chủng loại giá'
    ${placeholder}=     Set Variable    Nhập giá trị
  END
  ${element}=           Get Elements      //td//input[@placeholder="${placeholder}"]
  IF  '${name}' == 'Giá bán (VND)'
    Clear Text                ${element}[1]
    Fill Text                 ${element}[1]                        ${text}                       True
  ELSE IF  '${name}' == 'Thêm số lượng tối thiểu' or '${name}' == 'Doanh thu (VNĐ)'
    Clear Text                ${element}[2]
    Fill Text                 ${element}[2]                        ${text}                       True
  ELSE IF  '${name}' != 'Giá bán (VND)' and '${name}' != 'Thêm số lượng tối thiểu' and '${name}' != 'Doanh thu (VNĐ)'
    Clear Text                ${element}[0]
    Fill Text                 ${element}[0]                        ${text}                       True
  END
  ${cnt}=                   Get Length                        ${text}
  IF  ${cnt} > 0
    Set Global Variable     ${STATE["${name}"]}               ${text}
  END

Enter default information
  And Enter "test name" in "Tên sản phẩm" with "_RANDOM_"
  And Enter "test name" in "Thương hiệu" with "_RANDOM_"
  And Enter "test name" in "Xuất xứ" with "_RANDOM_"
  And Enter "Barcode_valid" in "Mã vạch" with "_RANDOM_"
  And Enter "number" in "Theo tháng" with "_RANDOM_"
  And Enter "number" in "Theo quý" with "_RANDOM_"
  And Enter "number" in "Theo năm" with "_RANDOM_"
  And Enter "text" in "Thị trường xuất khẩu" with "_RANDOM_"
  And Enter "paragraph" in textarea "Mô tả sản phẩm" with "_RANDOM_"
  And Click select "Thuế nhập" with "Thuế môi trường - 10%"
  And Click select "Thuế bán" with "Thuế môi trường - 10%"
  And Enter "test name" in "Đơn vị cơ bản" with "_RANDOM_"

Enter "Bảng giá dành cho cửa hàng"
  And Enter "test name" in "Chủng loại giá" field with "_RANDOM_"
  And Enter "number" in "Số lượng tối thiểu" field with "_RANDOM_"
  And Enter "number" in "Giá bán (VND)" field with "_RANDOM_"

Click checked radio "${name}"
  Click     //span[contains(text(),'${name}')]

Enter data "${type}" in "${name}" with "${text}"
  ${text}=                  Get Random Text                   ${type}                       ${text}
  IF  '${name}' == 'Chiết khấu cố định'
    ${element}=               Set Variable              //span/div/input[@placeholder="Nhập giá trị"]
    Clear Text                ${element}
    Fill Text                 ${element}                        ${text}                       True
  ELSE IF  '${name}' != 'Chiết khấu cố định'
    ${element}=               Get Elements              //input[@placeholder="Nhập giá trị"]
    Clear Text                ${element}[2]
    Fill Text                 ${element}[2]                        ${text}                       True
    Clear Text                ${element}[3]
    Fill Text                 ${element}[3]                        ${text}                       True
  END
  ${cnt}=                   Get Length                        ${text}
  IF  ${cnt} > 0
    Set Global Variable     ${STATE["${name}"]}               ${text}
  END

Select product need to edit
  ${element}=         Get Elements      //*[contains(@class, "ant-table-row")]
  Click     ${element}[0]     left    2


*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

## ---------------------NAVIGATE CREATE CODE PAGE-------------------------------------------------------
CRC-01 Verify that it is possible to navigate to the page for creating a new Code
    [Tags]    @smoketest    @regression
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    And Click "Thêm mới" button
    Then User look title form "Thêm mới mã Position"
    And User look title "Thêm mới mã Position"
    
##---------------------VALIDATION TEXT-------------------------------------------------
CRC-02 Verify that validation text when blank all fields with "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Click "Lưu lại" button
    Then Required message "Tên mã" displayed under "Xin vui lòng nhập tên mã" field
    And Required message "Mã" displayed under "Xin vui lòng nhập mã" field

CRC-03 Verify that validation text when blank all fields with "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Click "Lưu lại" button
    Then Required message "Tên mã" displayed under "Xin vui lòng nhập tên mã" field
    And Required message "Mã" displayed under "Xin vui lòng nhập mã" field

CRC-04 Verify that validation text of "Tên mã" field display when blank "Tên mã" field
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Enter "text" in "Tên mã" with ""
    And Enter "text" in "Mã" with ""
    Then Required message "Tên mã" displayed under "Xin vui lòng nhập tên mã" field

CRC-05 Verify that validation text of "Mã" field display when blank "Mã" field
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Enter "text" in "Mã" with ""
    And Enter "text" in "Tên mã" with ""
    Then Required message "Mã" displayed under "Xin vui lòng nhập mã" field

# ---------------------------ERROR MESSAGE----------------------------------------
CRC-06 Verify that error message display when enter "Mã" field is already taken with "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Enter "text" in "Mã" with "DEV"
    And Enter "text" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Internal server error" popup

CRC-07 Verify that error message display when enter "Mã" field is already taken with "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Enter "text" in "Mã" with "DEV"
    And Enter "text" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Internal server error" popup

# ---------------------------CREATE CODE SUCCESSFULLY---------------------------------------
CRC-08 Verify that create new Code is successful with "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Enter "text" in "Mã" with "_RANDOM_"
    And Enter "text" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Mã"
    When Click on the "Xóa" button in the "Tên mã" table line
    Then User look message "Xóa thành công" popup

CRC-09 Verify that create new Code is successful with "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Enter "text" in "Mã" with "_RANDOM_"
    And Enter "text" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Thêm mới mã Position"
    And User look all field empty when create code
    And Click "Huỷ bỏ" button
    When Click on the "Xóa" button in the "Tên mã" table line
    Then User look message "Xóa thành công" popup

CRC-10 Verify that create new Code is successful when blank description & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Enter "text" in "Mã" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Mã"
    When Click on the "Xóa" button in the "Tên mã" table line
    Then User look message "Xóa thành công" popup

CRC-11 Verify that create new Code is successful when blank description & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Enter "text" in "Mã" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Thêm mới mã Position"
    And User look all field empty when create code
    And Click "Huỷ bỏ" button
    When Click on the "Xóa" button in the "Tên mã" table line
    Then User look message "Xóa thành công" popup

# # ###-------------------RELOAD PAGE-----------------------------------------------------------------------------------------
# # # CRC-12 Verify entered data not showing when Refresh with F5 key
# # #     [Tags]    @smoketest    @regression
# # #     When Go to create code page
# # #     And Enter "text" in "Tên mã" with "_RANDOM_"
# # #     And Enter "text" in "Mã" with "_RANDOM_"
# # #     And Enter "text" in textarea "Mô tả" with "_RANDOM_"
# # #     And Reload Page
# # #     Then User look "Tên mã" field empty
# # #     And User look "Mã" field empty
# # #     And User look textarea "Mô tả" field empty

# # ##=======================VIEW LIST OF CODE====================================##
CRC-13 Verify that the list of Codes can be viewed successfully
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    Then Show list of "codes"

CRC-14 Verify that Admin can search an existing Code when entering correct keyword to search box
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    And Search "text" in "Tìm kiếm" with "DEV"
    Then Show list of "codes"

CRC-15 Verify that Admin can search an existing Code name when entering correct keyword to search box
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    And Search "text" in "Tìm kiếm" with "Business Analyst"
    Then Show list of "codes"

CRC-16 Verify that Admin can search an existing Code when entering incorrect keyword to search box
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No code are shown

CRC-17 Verify that Next page and Previous page
    Login to admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    And Click ">" to "next" page
    Log To Console    Danh sách code trang 2
    Then Show list of "codes"
    And Click "<" to "prev" page
    Log To Console    Danh sách code trang 1
    Then Show list of "codes" 

# ##=======================VERIFY EDIT CODE================================##
# # ---------------------NAVIGATE TO EIDT CODE PAGE-------------------------------------------------
EDC-01 Verify that it is possible to navigate to the page for Edit Code
    [Tags]    @smoketest    @regression
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    And Select Code need to edit
    Then User look title "Chỉnh sửa mã Position"
    And User look title form "Chỉnh sửa mã Position"

# # ---------------------VALIDATION TEXT-------------------------------------------------
EDC-02 Verify that edit code unsuccessfull because blank "Tên mã" field
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in "Tên mã" with ""
    And Enter "text" in "Mã" with ""
    Then Required message "Tên mã" displayed under "Xin vui lòng nhập tên mã" field

EDC-03 Verify that edit code unsuccessfull because blank "Mã" field
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in "Mã" with ""
    And Enter "text" in "Tên mã" with ""
    Then Required message "Mã" displayed under "Xin vui lòng nhập mã" field

##========================ERROR MESSAGE WHEN EDIT CODE=====================================##
EDC-04 Verify that error message display when edit Code with "Mã" is already taken with "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Enter "text" in "Mã" with "DEV"
    And Enter "text" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Internal server error" popup

EDC-05 Verify that error message display when edit Code with "Mã" is already taken with "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Enter "text" in "Mã" with "DEV"
    And Enter "text" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Internal server error" popup

EDC-06 Verify that the error message displayed when edit Code has "Mã" already used by the user with "Lưu lại" button    #Code được User sử dụng
    [Tags]    @smoketest    @regression
    When Go to page edit code
    And Enter "text" in "Mã" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Internal server error" popup

EDC-07 Verify that error message display when changing "Mã" field & "Lưu và tạo mới" button     #Code được User sử dụng
    [Tags]    @smoketest    @regression
    When Go to page edit code
    And Enter "text" in "Mã" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Internal server error" popup

# #========================EDIT CODE SUCCESSFULLY=====================================##
EDC-08 Verify that the code can be successfully edited when changing the "Tên mã" field & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Mã"

EDC-09 Verify that the code can be successfully edited when changing the "Tên mã" field & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in "Tên mã" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Thêm mới mã Position"
    And User look all field empty when edit code

EDC-10 Verify that the code can be successfully edited when changing the "Mã" field & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in "Mã" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Mã"

EDC-11 Verify that the code can be successfully edited when changing the "Mã" field & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in "Mã" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Thêm mới mã Position"
    And User look all field empty when edit code

EDC-12 Verify that the code can be successfully edited when changing "Mô tả" field & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách Mã"

EDC-13 Verify that the code can be successfully edited when changing "Mô tả" field & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to edit code page
    And Enter "text" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Thêm mới mã Position"
    And User look all field empty when edit code
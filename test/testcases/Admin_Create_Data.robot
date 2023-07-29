*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

# ---------------------Navigate to Create Data page-------------------------------------------------------
CRD-01 Verify that it is possible to navigate to the page for creating a new Data with Partner
    [Tags]    @smoketest    @regression
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click "Tạo mới" button
    Then User look title form "Tạo mới dữ liệu Partner"
    And User look title "Tạo mới dữ liệu Partner"

CRD-02 Verify that it is possible to navigate to the page for creating a new Data with Member
    [Tags]    @smoketest    @regression
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "Member"
    And Click "Tạo mới" button
    Then User look title form "Tạo mới dữ liệu Member"
    And User look title "Tạo mới dữ liệu Member"

CRD-03 Verify that it is possible to navigate to the page for creating a new Data with Value
    [Tags]    @smoketest    @regression
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "Value"
    And Click "Tạo mới" button
    Then User look title form "Tạo mới dữ liệu Value"
    And User look title "Tạo mới dữ liệu Value"

CRD-04 Verify that it is possible to navigate to the page for creating a new Data with Services
    [Tags]    @smoketest    @regression
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "Services"
    And Click "Tạo mới" button
    Then User look title form "Tạo mới dữ liệu Services"
    And User look title "Tạo mới dữ liệu Services"

CRD-05 Verify that it is possible to navigate to the page for creating a new Data with Mission
    [Tags]    @smoketest    @regression
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "Mission"
    And Click "Tạo mới" button
    Then User look title form "Tạo mới dữ liệu Mission"
    And User look title "Tạo mới dữ liệu Mission"

#---------------------VALIDATION TEXT-------------------------------------------------
CRD-06 Verify that validation text when create new Data with blank "Name" field
    [Tags]    @smoketest    @regression
    When Go to create data Partner page
    And Enter "text" in "Name" with ""
    And Enter "text" in "Order" with ""
    Then Required message "Name" displayed under "Xin vui lòng nhập name" field

CRD-07 Verify that validation text of "Order" field display when enter data invalid "Order" field
    [Tags]    @smoketest    @regression
    When Go to create data Partner page
    And Enter "text" in "Order" with "_RANDOM_"
    And Enter "text" in "Name" with ""
    Then Required message "Order" displayed under "Xin vui lòng chỉ nhập số" field

CRD-08 Verify that the "Order" field validation text is displayed when entering data in the "Order" field with invalid quantities
    [Tags]    @smoketest    @regression
    When Go to create data Partner page
    And Enter "number" in "Order" with "_RANDOM_"
    And Enter "text" in "Name" with ""
    Then Required message "Order" displayed under "Xin vui lòng chỉ nhập số" field

# ---------------------------ERROR MESSAGE----------------------------------------
CRD-09 Verify that error message display when create new Code with "Mã" is already taken with "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create data Partner page
    And Enter "order number" in "Order" with "_RANDOM_"
    And Enter "text" in "Name" with "Partner_01"
    And Enter "text" in textarea "Description" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Tên đã tồn tại" popup

CRD-10 Verify that error message display when create new Code with "Mã" is already taken with "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create data Partner page
    And Enter "order number" in "Order" with "_RANDOM_"
    And Enter "text" in "Name" with "Partner_01"
    And Enter "text" in textarea "Description" with "_RANDOM_"
    And Click "Lưu và tạo mới" button
    Then User look message "Tên đã tồn tại" popup

# ---------------------------CREATE SUCCESSFULLY----------------------------------------
CRD-11 Verify that create new Data with Partner is successful & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create data Partner page
    Enter information when create data
    Select language with "Vietnam"
    Enter information when create data
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Dữ liệu"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-12 Verify that create new Data with Partner is successful & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create data Partner page
    Enter information when create data
    Select language with "Vietnam"
    Enter information when create data
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách nghỉ phép"
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-13 Verify that create new Data with Member is successful & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create data Member page
    And Enter information when create data
    And Select language with "Vietnam"
    And Enter information when create data
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Dữ liệu"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-14 Verify that create new Data with Member is successful & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create data Member page
    And Enter information when create data
    And Select language with "Vietnam"
    And Enter information when create data
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách nghỉ phép"
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "Member"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-15 Verify that create new Data with Value is successful & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create data Value page
    And Enter information when create data
    And Select language with "Vietnam"
    And Enter information when create data
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Dữ liệu"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-16 Verify that create new Data with Value is successful & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create data Value page
    And Enter information when create data
    And Select language with "Vietnam"
    And Enter information when create data
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách nghỉ phép"
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "Value"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-17 Verify that create new Data with Services is successful & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create data Services page
    And Enter information when create data
    And Select language with "Vietnam"
    And Enter information when create data
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Dữ liệu"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-18 Verify that create new Data with Services is successful & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create data Services page
    And Enter information when create data
    And Select language with "Vietnam"
    And Enter information when create data
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách nghỉ phép"
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "Services"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-19 Verify that create new Data with Mission is successful & "Lưu lại" button
    [Tags]    @smoketest    @regression
    When Go to create data Mission page
    And Enter information when create data
    And Select language with "Vietnam"
    And Enter information when create data
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách Dữ liệu"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

CRD-20 Verify that create new Data with Mission is successful & "Lưu và tạo mới" button
    [Tags]    @smoketest    @regression
    When Go to create data Mission page
    And Enter information when create data
    And Select language with "Vietnam"
    And Enter information when create data
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    And User look title "Danh sách nghỉ phép"
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "Mission"
    When Click on the "Xóa" button in the "Order" table line
    Then User look message "Xóa thành công" popup

# -----------------------------Verify refresh page--------------------------------------
# CRD-21 Verify entered data not showing when Refresh with F5 key
#     [Tags]    @smoketest    @regression
#     When Go to create data Partner page
#     And Enter information when create data
#     And Select language with "Vietnam"
#     And Enter information when create data
#     And Reload Page
#     Then User look "Order" field empty
#     And User look "Name" field empty
#     And User look "Description" field empty

# -----------------------------View list of Data--------------------------------------
CRD-22 Verify that the list of Data Partner can be viewed successfully
    [Tags]    @smoketest    @regression
    When Go to list data Partner page
    Then Show list of "data"

CRD-23 Verify that the list of Data Member can be viewed successfully
    [Tags]    @smoketest    @regression
    When Go to list data Member page
    Then Show list of "data"

CRD-24 Verify that the list of Data Value can be viewed successfully
    [Tags]    @smoketest    @regression
    When Go to list data Value page
    Then Show list of "data"

CRD-25 Verify that the list of Data Services can be viewed successfully
    [Tags]    @smoketest    @regression
    When Go to list data Services page
    Then Show list of "data"

CRD-26 Verify that the list of Data Mission can be viewed successfully
    [Tags]    @smoketest    @regression
    When Go to list data Mission page
    Then Show list of "data"
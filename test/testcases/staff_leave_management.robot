*** Settings ***
Resource                ../keywords/common.robot
Test Setup              Setup
Test Teardown           Tear Down

*** Test Cases ***

# # ============================NAVIGAVE TO CREATE LEAVE DATE===========================================
# STA-01 Verify that it is possible to navigate to the page for create leave date
#     Login to Staff
#     When Click "Tạo mới" button
#     Then User look title "Tạo mới ngày nghỉ"

# # ============================VERIFY VALIDATION TEXT===========================================
# STA-02 Verify that Create Leave Management unsuccessfully because no select "Loại phép" 
#     Login to Staff
#     When Click "Tạo mới" button
#     And Click select "Thời gian" with "Cả ngày"
#     And Enter leave date in "Ngày bắt đầu" with "11-07-2023"
#     And Enter leave date in "Ngày kết thúc" with "14-07-2023"
#     And Enter "text" in textarea "Lý do" with "hello"
#     And Click "Lưu lại" button
#     Then Required message "Loại phép" displayed under "Xin vui lòng chọn loại phép" field

# STA-03 Verify that Create Leave Management unsuccessfully because no select "Thời gian" 
#     Login to Staff
#     When Click "Tạo mới" button
#     And Click select "Thời gian" with "Cả ngày"
#     And Delele select "Thời gian" field
#     Then Required message "Thời gian" displayed under "Xin vui lòng chọn thời gian" field

# STA-04 Verify that Create Leave Management unsuccessfully because no select "Ngày nghỉ"  
#     Login to Staff
#     When Click "Tạo mới" button
#     And Click select "Loại phép" with "Nghỉ phép có lương"
#     And Click select "Thời gian" with "Cả ngày"
#     And Enter "text" in textarea "Lý do" with "hello"
#     And Click "Lưu lại" button
#     Then Required message "Ngày nghỉ" displayed under "Xin vui lòng chọn ngày nghỉ" field

# STA-05 Verify that Create Leave Management unsuccessfully because no enter "Lý do" 
#     Login to Staff
#     When Click "Tạo mới" button
#     And Click select "Loại phép" with "Nghỉ phép có lương"
#     And Click select "Thời gian" with "Cả ngày"
#     And Enter leave date in "Ngày bắt đầu" with "11-07-2023"
#     And Enter leave date in "Ngày kết thúc" with "14-07-2023"
#     And Enter "text" in textarea "Lý do" with "${EMPTY}"
#     And Click "Lưu lại" button
#     Then Required message "Lý do" displayed under "Xin vui lòng nhập lý do" field

# STA-06 Verify that Create Leave Management unsuccessfully because empty all field
#     Login to Staff
#     When Click "Tạo mới" button
#     And Click "Lưu lại" button
#     Then Required message "Loại phép" displayed under "Xin vui lòng chọn loại phép" field
#     And Required message "Thời gian" displayed under "Xin vui lòng chọn thời gian" field
#     And Required message "Ngày nghỉ" displayed under "Xin vui lòng chọn ngày nghỉ" field
#     And Required message "Lý do" displayed under "Xin vui lòng nhập lý do" field

# # ============================CREATE LEAVE MANAGEMENT SUCCESSFULL===========================================
# STA-07 Verify that Create leave management successfully with "Làm remote" & "Lưu lại" button
#     Login to Staff
#     When Click "Tạo mới" button
#     And Click select "Loại phép" with "Làm remote"
#     And Click select "Thời gian" with "Cả ngày"
#     And Enter leave date in "Ngày bắt đầu" with "13-07-2023"
#     And Enter leave date in "Ngày kết thúc" with "14-07-2023"
#     And Enter "text" in textarea "Lý do" with "_RANDOM_"
#     And Select file in "Tải ảnh lên" with "image.jpg"
#     And Click "Lưu lại" button
#     Then User look message "Tạo thành công" popup
#     And User look title "Chi tiết ngày nghỉ"
#     Click "Quay lại" button
#     Click "Xóa" button

# STA-08 Verify that Create leave management successfully with "Làm remote" & "Lưu và tạo mới" button
#     Login to Staff
#     When Click "Tạo mới" button
#     ${leave_date_before}    Get_Leave_date with "Ngày phép còn lại"
#     And Click select "Loại phép" with "Làm remote"
#     And Click select "Thời gian" with "Cả ngày"
#     And Enter leave date in "Ngày bắt đầu" with "12-07-2023"
#     And Enter leave date in "Ngày kết thúc" with "12-07-2023"
#     And Enter "text" in textarea "Lý do" with "_RANDOM_"
#     And Select file in "Tải ảnh lên" with "image.jpg"
#     And Click "Lưu và tạo mới" button
#     Then User look message "Tạo thành công" popup
#     And User look all field should be empty
#     ${leave_date_after}    Get_Leave_date with "Ngày phép còn lại"
#     # Kiểm tra xem số lượng ngày nghỉ có thay đổi hay không
#     # ----------------------------------------------------------
#     Should Be Equal    ${leave_date_before}    ${leave_date_after}
#     # ----------------------------------------------------------
#     Click "Huỷ bỏ" button
#     Click "Xóa" button

# STA-09 Verify that Create leave management successfully with "Nghỉ phép không lương" & "Lưu lại" button
#     Login to Staff
#     When Click "Tạo mới" button
#     And Click select "Loại phép" with "Nghỉ phép không lương"
#     And Click select "Thời gian" with "Chiều"
#     And Enter leave date in "Ngày bắt đầu" with "12-07-2023"
#     And Enter leave date in "Ngày kết thúc" with "12-07-2023"
#     And Enter "text" in textarea "Lý do" with "_RANDOM_"
#     And Select file in "Tải ảnh lên" with "image.jpg"
#     And Click "Lưu lại" button
#     Then User look message "Tạo thành công" popup
#     And User look title "Chi tiết ngày nghỉ"
#     Click "Quay lại" button
#     Click "Xóa" button

# STA-10 Verify that Create leave management successfully with "Nghỉ phép không lương" & "Lưu và tạo mới" button
#     Login to Staff
#     When Click "Tạo mới" button
#     ${leave_date_before}    Get_Leave_date with "Ngày phép còn lại"
#     And Click select "Loại phép" with "Nghỉ phép không lương"
#     And Click select "Thời gian" with "Chiều"
#     And Enter leave date in "Ngày bắt đầu" with "12-07-2023"
#     And Enter leave date in "Ngày kết thúc" with "12-07-2023"
#     And Enter "text" in textarea "Lý do" with "_RANDOM_"
#     And Select file in "Tải ảnh lên" with "image.jpg"
#     And Click "Lưu và tạo mới" button
#     Then User look message "Tạo thành công" popup
#     And User look all field should be empty
#     ${leave_date_after}    Get_Leave_date with "Ngày phép còn lại"
#     # Kiểm tra xem số lượng ngày nghỉ có thay đổi hay không
#     # ----------------------------------------------------------
#     Should Be Equal    ${leave_date_before}    ${leave_date_after}
#     # ---------------------------------------------------------- 
#     Click "Huỷ bỏ" button
#     Click "Xóa" button

STA-11 Verify that Create leave management successfully with "Nghỉ phép có lương" & "Lưu lại" button
    Login to Staff
    When Click "Tạo mới" button
    And Click select "Loại phép" with "Nghỉ phép có lương"
    And Click select "Thời gian" with "Sáng"
    And Enter leave date in "Ngày bắt đầu" with "11-07-2023"
    And Enter leave date in "Ngày kết thúc" with "11-07-2023"
    And Enter "text" in textarea "Lý do" with "_RANDOM_"
    And Select file in "Tải ảnh lên" with "image.jpg"
    And Click "Lưu lại" button
    Then User look message "Tạo thành công" popup
    And User look title "Chi tiết ngày nghỉ"
    Click "Quay lại" button
    Click "Xóa" button

STA-12 Verify that Create leave management successfully with "Nghỉ phép có lương" & "Lưu và tạo mới" button
    Login to Staff
    When Click "Tạo mới" button
    ${leave_date_before}    Get_Leave_date with "Ngày phép còn lại"
    And Click select "Loại phép" with "Nghỉ phép có lương"
    And Click select "Thời gian" with "Sáng"
    And Enter leave date in "Ngày bắt đầu" with "12-07-2023"
    And Enter leave date in "Ngày kết thúc" with "12-07-2023"
    And Enter "text" in textarea "Lý do" with "_RANDOM_"
    And Select file in "Tải ảnh lên" with "image.jpg"
    And Click "Lưu và tạo mới" button
    Then User look message "Tạo thành công" popup
    ${leave_date_after}    Get_Leave_date with "Ngày phép còn lại"
    # Kiểm tra xem số lượng ngày nghỉ có thay đổi hay không
    # ----------------------------------------------------------
    Should Not Be Equal    ${leave_date_before}    ${leave_date_after}
    # ----------------------------------------------------------
    
# ============================ERROR MESSAGE===========================================
STA-13 Verify that error message display when create new leave management with the leave date has been registered
    Login to Staff
    When Click "Tạo mới" button
    And Click select "Loại phép" with "Nghỉ phép có lương"
    And Click select "Thời gian" with "Sáng"
    And Enter leave date in "Ngày bắt đầu" with "12-07-2023"
    And Enter leave date in "Ngày kết thúc" with "12-07-2023"
    And Enter "text" in textarea "Lý do" with "_RANDOM_"
    And Select file in "Tải ảnh lên" with "image.jpg"
    And Click "Lưu lại" button
    Then User look message "Ngày nghỉ đã được đăng ký" popup
    Click "Huỷ bỏ" button
    Click "Xóa" button

# # ## ============================VIEW LIST STAFF LEAVE MANAGEMENT===========================================
STA-14 Verify that staff can view the list of created leave date successfully
    Login to Staff
    Then Show list of "created" leave date

STA-15 Verify that staff can view the list of pending leave date successfully
    Login to Staff
    When Filter the list of holidays with the status of "Pending"
    Then Show list of "pending" leave date

STA-16 Verify that staff can view the list of approved leave date successfully
    Login to Staff
    When Filter the list of holidays with the status of "Approved"
    Then Show list of "approved" leave date

STA-17 Verify that staff can view the list of rejected leave date successfully
    Login to Staff
    When Filter the list of holidays with the status of "Rejected"
    Then Show list of "rejected" leave date
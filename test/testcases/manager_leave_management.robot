*** Settings ***
Resource                ../keywords/common.robot
Test Setup              Setup
Test Teardown           Tear Down

*** Test Cases ***

##=========================Manager view Leave Management====================================================
MLM_01 Check the ability to display the user's leave list table
    Login to Manager
    User look title "Danh sách nghỉ phép"
    Then Show list of "created" leave date

MLM_02 Verify can double click on a leave request pending approval to display the leave details when not managing that staff
    Login to Manager
    When Select the leave date status as Pending when not managing that staff
    Then User look title "Chi tiết ngày nghỉ"
    And User can view the details of the holiday Pending

MLM_03 Verify can double click on a leave request pending approval to display the leave details when managing that staff
    Login to Manager
    When Select the leave date status as Pending
    Then User look title "Chi tiết ngày nghỉ"
    And User can view the details of the holiday Pending
    And User look button "Duyệt"
    And User look button " Từ chối "

MLM_04 Check the ability to double-click on an approved leave list to display the details
    Login to Manager
    When Select the leave date status as Approved
    Then User look title "Chi tiết ngày nghỉ"
    And User can view the details of the holiday Approved

MLM_05 Check the ability to double-click on a rejected leave list to display the details
    Login to Manager
    When Select the leave date status as Rejected
    Then User look title "Chi tiết ngày nghỉ"
    And User can view the details of the holiday Rejected

MLM_06 Check the ability to filter the leave list by approval status with "Pending"
    Login to Manager
    When Filter the list of holidays with the status of "Pending"
    Then Show list of "pending" leave date

MLM-07 Check the ability to filter the leave list by approval status with "Approved"
    Login to Manager
    When Filter the list of holidays with the status of "Approved"
    Then Show list of "approved" leave date

MLM-08 Check the ability to filter the leave list by approval status with "Rejected"
    Login to Manager
    When Filter the list of holidays with the status of "Rejected"
    Then Show list of "rejected" leave date

MLM-09 Check the ability to fillter the leave list by leave date
    Login to Manager
    When Fillter the leave list by leave date with start date: 25/07/2023 and end date: 29/07/2023
    Then Show list of "created" leave date

MLM-10 Check the ability to fillter the leave list by approvated date
    Login to Manager
    When Fillter the leave list by approvated date with start date: 25/07/2023 and end date: 29/07/2023
    Then Show list of "created" leave date

##============================Validation text===========================================================
MLM_11 Verify Rejected unsuccessfully because blank "Lý do" field
    Login to Manager
    When Select the leave date status as Pending
    And Click " Từ chối " button
    And Click "Lưu lại" button
    Then Required message "Lý do từ chối" displayed under "Xin vui lòng nhập lý do từ chối" field

##============================Approve leave date====================================================
MLM_12 Verify that the approval can be successfully agreed upon clicking the "Duyệt" button
    Login to Manager
    When Select the leave date status as Pending
    And Click "Duyệt" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Danh sách nghỉ phép"

MLM_13 Verify that the Reject can be successfully dening upon clicking the "Từ chối" button
    Login to Manager
    When Select the leave date status as Pending
    And Click " Từ chối " button
    And Enter "text" in textarea "Lý do từ chối" with "_RANDOM_"
    And Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    And User look title "Chi tiết ngày nghỉ"
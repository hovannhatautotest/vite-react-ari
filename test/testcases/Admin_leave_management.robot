*** Settings ***
Resource                ../keywords/common.robot
Test Setup              Setup
Test Teardown           Tear Down

*** Test Cases ***

ALM_01 Check the ability to display the user's leave list table
    Login to admin
    User look title "Danh sách nghỉ phép"
    Then Show list of "created" leave date

ALM_02 Check the ability to double-click on a leave request that is pending approval to display the details
    Login to admin
    Select leave management pending approval
    Then User look title "Chi tiết ngày nghỉ"
    And User can view the details of the holiday Pending

ALM_03 Check the ability to double-click on an approved leave list to display the details
    Login to admin
    Select an approved leave management
    Then User look title "Chi tiết ngày nghỉ"
    And User can view the details of the holiday Approvated

ALM_04 Check the ability to double-click on a rejected leave list to display the details
    Login to admin
    Select a leave management that is rejected approval
    Then User look title "Chi tiết ngày nghỉ"
    And User can view the details of the holiday Rejected

ALM_05 Check the ability to filter the leave list by approval status with "Pending"
    Login to admin
    When Filter the list of holidays with the status of "Pending"
    Then Show list of "pending" leave date

ALM-06 Check the ability to filter the leave list by approval status with "Approved"
    Login to admin
    When Filter the list of holidays with the status of "Approved"
    Then Show list of "approved" leave date

ALM-07 Check the ability to filter the leave list by approval status with "Rejected"
    Login to admin
    When Filter the list of holidays with the status of "Rejected"
    Then Show list of "rejected" leave date

ALM-08 Check the ability to fillter the leave list by leave date
    Login to admin
    When Fillter the leave list by leave date with start date: 05/06/2023 and end date: 24/07/2023
    Then Show list of "created" leave date

ALM-09 Check the ability to fillter the leave list by approvated date
    Login to admin
    When Fillter the leave list by approvated date with start date: 05/06/2023 and end date: 24/07/2023
    Then Show list of "created" leave date
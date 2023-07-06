Feature: LOGIN FEATURE

    Background:
        When Login to admin

    # Rule: Navigate to Create user page
    #     Scenario: SI-01: Verify that it is possible to navigate to the page for creating a new user using the "Tạo mới" button in the "Người Dùng" menu.
    #         When Click "Người Dùng" menu
    #         And Click "Tạo mới" sub menu to "/vn/user/add"
    #         Then User look title "Tạo mới người dùng"

    #     Scenario: SI-02: Verify that it is possible to navigate to the page for creating a new user using the "Tạo mới" button in the "Danh sách" menu.
    #         When Click "Người Dùng" menu
    #         And Click "Danh sách" sub menu to "/vn/user/list"
    #         And Click "Tạo mới" button
    #         Then User look title "Tạo mới người dùng"

    Rule: Verify validation text
        # Scenario Outline: SI-03, 04: Verify that validation text when create new user with all fields empty & "Lưu lại" button
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Click "<button>" button
        #     Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
        #     And Required message "Email" displayed under "Xin vui lòng nhập email" field
        #     And Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
        #     And Required message "Nhập lại mật khẩu" displayed under "Xin vui lòng nhập nhập lại mật khẩu" field
        #     And Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field
        #     And Required message "Ngày sinh" displayed under "Xin vui lòng chọn ngày sinh" field
        #     And Required message "Vị trí" displayed under "Xin vui lòng chọn vị trí" field
        #     And Required message "Ngày đầu đi làm" displayed under "Xin vui lòng chọn ngày đầu đi làm" field
        #     And Required message "Vai trò" displayed under "Xin vui lòng chọn vai trò" field
        #     Examples:
        #         | button         |
        #         | Lưu lại        |
        #         | Lưu và tạo mới |

        # Scenario: SI-05: Verify that validation text of "Họ và tên" field display when create new user with "Họ và tên" field empty
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Enter "text" in "Họ và tên" with ""
        #     And Enter "text" in "Email" with "hovannhat@gmail.com"
        #     Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field

        # Scenario Outline: SI-06, 07, 08: Verify that validation text of "Email" field
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Enter "email" in "Email" with "<data>"
        #     And Enter "text" in "Mật khẩu" with "hovannhat@gmail.com"
        #     Then Required message "Email" displayed under "<message>" field
        #     Examples:
        #         | data           | message                                                                     |
        #         |                | Xin vui lòng nhập email                                                     |
        #         | text           | Xin vui lòng nhập địa chỉ email hợp lệ!Xin vui lòng nhập tối thiểu 6 ký tự! |
        #         | text@.com.mail | Xin vui lòng nhập địa chỉ email hợp lệ!                                     |

        # Scenario Outline: SI-09, 10, 11: Verify that validation text of "Mật khẩu" field
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Enter "text" in "Mật khẩu" with "<data>"
        #     And Enter "text" in "Nhập lại mật khẩu" with ""
        #     Then Required message "Mật khẩu" displayed under "<message>" field
        #     Examples:
        #         | data      | message                                                                                               |
        #         |           | Xin vui lòng nhập mật khẩu                                                                            |
        #         | 12345     | Xin vui lòng nhập tối thiểu 6 ký tự!Xin vui lòng nhập tối thiểu 6 ký tự số!                           |
        #         | text_user | Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt |

        # Scenario Outline: SI-12, 13, 14, 15: Verify that validation text of "Nhập lại mật khẩu" field
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Enter "text" in "Nhập lại mật khẩu" with "<data>"
        #     And Enter "phone" in "Số điện thoại" with ""
        #     Then Required message "Nhập lại mật khẩu" displayed under "<message>" field
        #     Examples:
        #         | data         | message                                                                                                                                     |
        #         |              | Xin vui lòng nhập nhập lại mật khẩu                                                                                                         |
        #         | 12345        | Hai mật khẩu bạn nhập không nhất quán!Xin vui lòng nhập tối thiểu 8 ký tự số!                                                               |
        #         | text_user    | Hai mật khẩu bạn nhập không nhất quán!Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt |
        #         | Nhat@0110199 | Hai mật khẩu bạn nhập không nhất quán!                                                                                                      |

        # Scenario Outline: SI-16, 17, 18, 19: Verify that validation text of "Số điện thoại" field
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Enter "text" in "Số điện thoại" with "<data>"
        #     And Enter date in "Ngày sinh" with ""
        #     Then Required message "Số điện thoại" displayed under "<message>" field
        #     Examples:
        #         | data           | message                                       |
        #         |                | Xin vui lòng nhập số điện thoại               |
        #         | abcde          | Xin vui lòng chỉ nhập số                      |
        #         | 12345          | Xin vui lòng nhập tối thiểu 8 ký tự số!       |
        #         | 01234567891011 | Xin vui lòng nhập tối đa phải có 12 ký tự số! |

        # Scenario: SI-20: Verify that validation text of "Ngày sinh" field
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Enter date in "Ngày sinh" with ""
        #     And Click select "Vị trí" with "Tester"
        #     Then Required message "Ngày sinh" displayed under "Xin vui lòng chọn ngày sinh" field

        # Scenario: SI-21: Verify that validation text of "Vị trí" field
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Click select "Vị trí" with "Tester"
        #     And Clear "Vị trí"
        #     Then Required message "Vị trí" displayed under "Xin vui lòng chọn vị trí" field

        # Scenario: SI-22: Verify that validation text of "Ngày đầu đi làm" field
        #     When Click "Người Dùng" menu
        #     And Click "Tạo mới" sub menu to "/vn/user/add"
        #     And Enter date in "Ngày đầu đi làm" with ""
        #     And Click select "Vai trò" with " "
        #     Then Required message "Ngày đầu đi làm" displayed under "Xin vui lòng chọn ngày đầu đi làm" field

        Scenario: SI-23: Verify that validation text of "Vai trò" field
            When Click "Người Dùng" menu
            And Click "Tạo mới" sub menu to "/vn/user/add"
            And Click select "Vai trò" with "Staff"
            And Clear "Vai trò"
            Then Required message "Vai trò" displayed under "Xin vui lòng chọn vai trò" field
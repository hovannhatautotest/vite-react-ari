    # ---------------------NAVIGATE CREATE USER PAGE-------------------------------------------------------
    Scenario:-01 Verify that it is possible to navigate to the page for creating a new user using the "Tạo mới" button in the "Người Dùng" menu.
        [Tags]    @smoketest    @regression
        And Click "Người Dùng" menu
        And Click "Tạo mới" sub menu to "/vn/user/add"
        Then User look title "Tạo mới người dùng"

    Scenario:-02 Verify that it is possible to navigate to the page for creating a new user using the "Tạo mới" button in the "Danh sách" menu.
        [Tags]    @smoketest    @regression
        And Click "Người Dùng" menu
        And Click "Danh sách" submenu in "Người Dùng" menu
        And Click "Tạo mới" button
        Then User look title "Tạo mới người dùng"

    ##------------------------VALIDATION TEXT---------------------------------------------------------

    Scenario:-03 Verify that validation text when create new user with all fields empty & "Lưu lại" button
        [Tags]          @smoketest         @regression
        Go to page create data
        When Click "Lưu lại" button
        Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
        And Required message "Email" displayed under "Xin vui lòng nhập email" field
        And Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
        And Required message "Nhập lại mật khẩu" displayed under "Xin vui lòng nhập nhập lại mật khẩu" field
        And Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field
        And Required message "Ngày sinh" displayed under "Xin vui lòng chọn ngày sinh" field
        And Required message "Vị trí" displayed under "Xin vui lòng chọn vị trí" field
        And Required message "Ngày đầu đi làm" displayed under "Xin vui lòng chọn ngày đầu đi làm" field
        And Required message "Vai trò" displayed under "Xin vui lòng chọn vai trò" field

    Scenario:-04 Verify that validation text when create new user with all fields empty & "Lưu và tạo mới" button
        [Tags]          @smoketest         @regression
        Go to page create data
        When Click "Lưu và tạo mới" button
        Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
        And Required message "Email" displayed under "Xin vui lòng nhập email" field
        And Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
        And Required message "Nhập lại mật khẩu" displayed under "Xin vui lòng nhập nhập lại mật khẩu" field
        And Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field
        And Required message "Ngày sinh" displayed under "Xin vui lòng chọn ngày sinh" field
        And Required message "Vị trí" displayed under "Xin vui lòng chọn vị trí" field
        And Required message "Ngày đầu đi làm" displayed under "Xin vui lòng chọn ngày đầu đi làm" field
        And Required message "Vai trò" displayed under "Xin vui lòng chọn vai trò" field

    Scenario: 05 Verify that validation text in "Họ và tên" field
        [Tags]          @smoketest         @regression
        Go to page create data
        When Enter "text" in "Họ và tên" with "${EMPTY}"
        And Enter "email" in "Email" with "_RANDOM_"
        Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field

    Scenario: 06 Verify that validation text in "Email" field when enter invalid email format and less than 6 characters long
        [Tags]          @smoketest         @regression
        Go to page create data
        When Enter "email" in "Email" with "text"
        And Enter "text" in "Họ và tên" with "_RANDOM_"
        Then Required message "Email" field displayed under "Xin vui lòng nhập địa chỉ email hợp lệ!"
        And Required message "Email" field displayed under "Xin vui lòng nhập tối thiểu 6 ký tự!"
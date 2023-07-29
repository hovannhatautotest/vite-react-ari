*** Settings ***
Library             Browser
Library             FakerLibrary        locale=en_IN
Library             String
Library            OperatingSystem
Library            BuiltIn

*** Variables ***

${BROWSER}          chromium
${HEADLESS}         ${False}
${BROWSER_TIMEOUT}  60 seconds
${SHOULD_TIMEOUT}   0.1 seconds

${URL_DEFAULT}      http://v2.ari.com.vn/
${STATE}            Evaluate  json.loads('''{}''')  json

${username_valid}    Hoàng Diệu
${email_valid}    staff@gmail.com
${phone_number_valid}    0941225407    

${class_rejected}    w-5 h-5 fill-red-500
${class_approved}    w-5 h-5 fill-green-500

*** Keywords ***

Login to admin
  Enter "email" in "Tên đăng nhập" with "hovannhat@admin.com"
  Enter "text" in "Mật khẩu" with "Nhat@01101999"
  Click "Đăng nhập" button
  User look message "Thành công" popup

Login to Manager
  Enter "email" in "Tên đăng nhập" with "manager@gmail.com"
  Enter "text" in "Mật khẩu" with "Tester@123"
  Click "Đăng nhập" button
  User look message "Thành công" popup

Login to Staff
  Enter "email" in "Tên đăng nhập" with "staff@gmail.com"
  Enter "text" in "Mật khẩu" with "Tester@123"
  Click "Đăng nhập" button
  User look message "Thành công" popup

Login to admin version english
  When Change language with "Tiếng Anh"
  And Enter "email" in "Username" with "hovannhat@admin.com"
  And Enter "text" in "Password" with "Nhat@01101999"
  And Click "Log In" button
  User look message "Success" popup

Login to Manager version english
  When Change language with "Tiếng Anh"
  And Enter "email" in "Username" with "manager@gmail.com"
  And Enter "text" in "Password" with "Tester@123"
  And Click "Log In" button
  User look message "Success" popup

Login to Staff version english
  When Change language with "Tiếng Anh"
  And Enter "email" in "Username" with "staff@gmail.com"
  And Enter "text" in "Password" with "Tester@123"
  And Click "Log In" button
  User look message "Success" popup

Go to page create user with the "${role}" role
  Login to admin
  When Click "Người Dùng" menu
  And Click list Role with "${role}"
  And Click "Tạo mới" button
  Wait Until Element Spin

Go to page edit user with the "${role}" role
    Login to admin
    And Click "Người Dùng" menu
    And Click list Role with "${role}"
    And Select the user with "valid" to edit
    Wait Until Element Spin    

Go to page create team
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    And Click "Tạo mới" button
    Wait Until Element Spin

Go to page edit team
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "vn/team"
    Select the team with "invalid" to edit
    Wait Until Element Spin

Go to profile page
    Login to admin
    Hover to avatar
    Click "Thông tin cá nhân" to profile
    Wait Until Element Spin
    Wait Until Element Spin

Go to create code page
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    And Click "Thêm mới" button
    Sleep    2

Go to edit code page
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Mã" sub menu
    And Select the code with "invalid" to edit
    Sleep    2

Go to create data ${type} page
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "${type}"
    And Click "Tạo mới" button
    Sleep    2

Go to edit data page
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Select the Data with "invalid" to edit
    Sleep    2

Go to list data ${name} page
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Dữ liệu" sub menu
    And Click list Data_Type with "${name}"

Enter invalid information to create user
  When Enter "text" in "Họ và tên" with "_RANDOM_"
  And Enter "email" in "Email" with "_RANDOM_"
  And Enter "text" in "Mật khẩu" with "Nhat@01101999"
  And Enter "text" in "Nhập lại mật khẩu" with "Nhat@01101999"
  And Enter "phone" in "Số điện thoại" with "_RANDOM_"
  And Enter date in "Ngày sinh" with "_RANDOM_"
  And Click select "Vị trí" with "Tester"
  And Enter date in "Ngày đầu đi làm" with "_RANDOM_"
  And Enter "words" in textarea "Mô tả" with "_RANDOM_"

#### Setup e Teardown
Setup
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  
Tear Down
  Close Browser               ALL

# Chờ đến khi phần tử được hiển thị trên giao diện người dùng
Wait Until Element Is Visible    
  [Arguments]               ${locator}  ${message}=${EMPTY}   ${timeout}=${BROWSER_TIMEOUT}
  Wait For Elements State   ${locator}  visible               ${timeout}                    ${message}

# Chờ đến khi phần tử không còn tồn tại trên giao diện người dùng.
Wait Until Element Is Not Exist
  [Arguments]               ${locator}  ${message}=${EMPTY}   ${timeout}=${BROWSER_TIMEOUT}
  Wait For Elements State   ${locator}  detached              ${timeout}                    ${message}

#Kiểm tra xem phần tử có tồn tại trên giao diện người dùng hay không. 
Element Should Be Exist
  [Arguments]               ${locator}  ${message}=${EMPTY}   ${timeout}=${SHOULD_TIMEOUT}
  Wait For Elements State   ${locator}  attached              ${timeout}                    ${message}

# Kiểm tra xem phần tử có hiển thị trên giao diện người dùng hay không.
Element Should Be Visible
  [Arguments]               ${locator}  ${message}=${EMPTY}   ${timeout}=${SHOULD_TIMEOUT}
  Wait For Elements State   ${locator}  visible               ${timeout}                    ${message}

# Kiểm tra xem nội dung của phần tử có khớp với giá trị mong đợi hay không.
Element Text Should Be
  [Arguments]               ${locator}  ${expected}           ${message}=${EMPTY}           ${ignore_case}=${EMPTY}
  Get Text                  ${locator}  equal                 ${expected}                   ${message}

# Kiểm tra xem phần tử có bị ẩn trên giao diện người dùng hay không.
Element Should Not Be Visible
  [Arguments]               ${locator}  ${message}=${EMPTY}   ${timeout}=${SHOULD_TIMEOUT}
  Wait For Elements State   ${locator}  hidden                ${timeout}                    ${message}

# Kiểm tra tiêu đề của trang web 
Title Should Be
    [Arguments]    ${expectedTitle}
    Wait Until Element Spin
    ${actualTitle}    Get Title
    Should Be Equal As Strings    ${actualTitle}    ${expectedTitle}

# Reload Page
Reload Page
    Reload

# Nhấn phím Enter
Enter at "${name}" field to Login
    ${element}=    Get Element Form Item By Name    ${name}    //input[contains(@class, "ant-input")]
    Press Keys    ${element}    Enter
    Click Confirm To Action
    Scroll By                 ${None}

# DASHBOARD CỦA TRANG WEB
User look dashboard "${dashboard}"
    Element Text Should Be    //*[@id='name-application']    ${dashboard}

###  -----  Form  -----  ###
# Tạo một văn bản ngẫu nhiên dựa trên loại và giá trị đầu vào.
Get Random Text
  [Arguments]               ${type}                           ${text}
  ${symbol}                 Set Variable                      _RANDOM_
  ${new_text}               Set Variable
  ${containsS}=             Get Regexp Matches                ${text}                       _@(.+)@_                    1
  ${cntS}=                  Get length                        ${containsS}
  ${contains}=              Get Regexp Matches                ${text}                       ${symbol}
  ${cnt}=                   Get length                        ${contains}
  IF  ${cntS} > 0
    ${new_text}=            Set Variable                      ${STATE["${containsS[0]}"]}
    ${symbol}=              Set Variable                      _@${containsS[0]}@_
  ELSE IF  ${cnt} > 0 and '${type}' == 'test name'
    ${random}=              FakerLibrary.Sentence             nb_words=3
    ${words}=               Split String                      ${TEST NAME}                  ${SPACE}
    ${new_text}=            Set Variable                      ${words[0]} ${random}
  ELSE IF  ${cnt} > 0 and '${type}' == 'number'
    ${new_text}=            FakerLibrary.Random Int           min=1000000000000             max=9999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'order number'
    ${new_text}=            FakerLibrary.Random Int           min=0             max=999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'leave date valid'
    ${new_text}=            FakerLibrary.Random Int           min=0             max=16
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'leave date invalid'
    ${new_text}=            FakerLibrary.Random Int           min=17             max=99
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'percentage'
    ${new_text}=            FakerLibrary.Random Int           max=100
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'paragraph'
    ${new_text}=            FakerLibrary.Paragraph
  ELSE IF  ${cnt} > 0 and '${type}' == 'email'
    ${new_text}=            FakerLibrary.Email
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone'
    ${new_text}=            FakerLibrary.Random Int           min=55555555                  max=999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'color'
    ${new_text}=            FakerLibrary.Safe Hex Color
  ELSE IF  ${cnt} > 0 and '${type}' == 'date'
    ${new_text}=            FakerLibrary.Date  	              pattern=%d-%m-%Y
  ELSE IF  ${cnt} > 0 and '${type}' == 'word'
    ${new_text}=            FakerLibrary.Sentence             nb_words=2
  ELSE IF  ${cnt} > 0
    ${new_text}=            FakerLibrary.Sentence
  END
    ${cnt}=                 Get Length                        ${text}
  IF  ${cnt} > 0
    ${text}=                Replace String                    ${text}                       ${symbol}                   ${new_text}
  END
    [Return]    ${text}

# Tìm phần tử trên form dựa trên tên.
Get Element Form Item By Name
  [Arguments]               ${name}                           ${xpath}=${EMPTY}
  [Return]                  xpath=//*[contains(@class, "ant-form-item-label")]/label[text()="${name}"]/../../*[contains(@class, "ant-form-item")]${xpath}

# Nhập giá trị vào trường dữ liệu trên form.
Enter "${type}" in "${name}" with "${text}"
  ${text}=                  Get Random Text                   ${type}                       ${text}
  ${element}=               Get Element Form Item By Name     ${name}                       //input[contains(@class, "ant-input")]
  Clear Text                ${element}
  Fill Text                 ${element}                        ${text}                       True
  ${cnt}=                   Get Length                        ${text}
  IF  ${cnt} > 0
    Set Global Variable     ${STATE["${name}"]}               ${text}
  END

# Click vào trường dữ liệu trên form.
Click in "${name}" field
  ${element}=               Get Element Form Item By Name     ${name}                       //input[contains(@class, "ant-input")]
  Click                     ${element}                        

# Nhập giá trị vào trường Mô tả trên form.
Enter "${type}" in textarea "${name}" with "${text}"
  ${text}=                  Get Random Text                   ${type}                       ${text}
  ${element}=               Get Element Form Item By Name     ${name}                       //textarea
  Clear Text                ${element}
  Fill Text                 ${element}                        ${text}
  ${cnt}=                   Get Length                        ${text}
  IF  ${cnt} > 0
    Set Global Variable     ${STATE["${name}"]}               ${text}
  END

# Nhập giá trị ngày tháng vào trường trên form.
Enter date in "${name}" with "${text}"
  ${text}=                  Get Random Text                   date                          ${text}
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-picker-input")]/input
  Click                     ${element}
  Clear Text                ${element}
  Fill Text                 ${element}                        ${text}
  Press Keys                ${element}                        Tab
  Press Keys                ${element}                        Tab
  ${cnt}=                   Get Length                        ${text}
  IF  ${cnt} > 0
      Set Global Variable   ${STATE["${name}"]}               ${text}
  END

# Chọn một tùy chọn từ một trường select trên form.
Click select "${name}" with "${text}"
  ${text}=                  Get Random Text                   Text                          ${text}
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-select-show-arrow")]
  Wait Until Element Is Visible    ${element}
  Click                     ${element}
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-select-selection-search-input")]
  Fill Text                                                   ${element}                    ${text}
  Click                     xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
  ${cnt}=                   Get Length                        ${text}
  IF  ${cnt} > 0
    Set Global Variable     ${STATE["${name}"]}               ${text}
  END

# Chọn quản lý
Click select ${manager} with "${text}"
  ${text}=                  Get Random Text                   Text                          ${text}
  ${element}=               Get Element Form Item By Name     ${manager}                       //*[contains(@class, "ant-select-show-arrow")]
  Wait Until Element Is Visible    ${element}
  Click                     ${element}
  ${element}=               Get Element Form Item By Name     ${manager}                       //*[contains(@class, "ant-select-selection-search-input")]
  Fill Text                                                   ${element}                    ${text}
  Wait Until Element Is Visible     xpath=//span[contains(text(),'${text}')]
  Click                     xpath=//span[contains(text(),'${text}')]
  ${cnt}=                   Get Length                        ${text}
  IF  ${cnt} > 0
    Set Global Variable     ${STATE["${manager}"]}               ${text}
  END

# Nhập giá trị vào trường edit trên form.
Enter "${type}" in editor "${name}" with "${text}"
  ${text}=                  Get Random Text                   ${type}                       ${text}
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ce-paragraph")]
  Clear Text                                                  ${element}
  Fill Text                                                   ${element}                    ${text}

# Upload file
Select file in "${name}" with "${text}"
  ${element}=               Get Element Form Item By Name     ${name}                       //input[@type = "file"]
  Upload File By Selector   ${element}                        test/upload/${text}

# Chọn một lựa chọn radio trên form.
Click radio "${text}" in line "${name}"
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-radio-button-wrapper")]/span[contains(text(), "${text}")]
  Click                     ${element}

# Bật hoặc tắt một switch trên form.
Click switch "${name}" to be activated
  ${element}=               Get Element Form Item By Name     ${name}                       //button[contains(@class, "ant-switch")]
  Click                     ${element}

# Chọn một tùy chọn từ một trường select dạng cây trên form.
Click tree select "${name}" with "${text}"
  ${text}=                  Get Random Text                   Text                          ${text}
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-tree-select")]
  Click                     ${element}
  Fill Text                 ${element}//input                 ${text}
  Click                     xpath=//*[contains(@class, "ant-select-tree-node-content-wrapper") and @title="${text}"]

# Chọn một danh sách các tùy chọn trên form.
Click assign list "${list}"
  ${words}=                 Split String                      ${list}                       ,${SPACE}
  FOR    ${word}    IN    @{words}
    Click                   xpath=//*[contains(@class, "ant-checkbox-wrapper")]/*[text()="${word}"]
  END
  Click                     xpath=//*[contains(@class, "ant-transfer-operation")]/button[2]

###  -----  Table  -----  ###
# Tìm phần tử trong danh sách dựa trên tên.
Get Element Item By Name
  [Arguments]               ${name}                           ${xpath}=${EMPTY}
  [Return]                  xpath=//*[contains(@class, "item-text") and contains(text(), "${name}")]/ancestor::*[contains(@class, "item")]${xpath}

# Nhấp vào nút trong một hàng của danh sách.
Click on the "${text}" button in the "${name}" item line
  Wait Until Element Spin
  ${element}=               Get Element Item By Name          ${STATE["${name}"]}           //button[@title = "${text}"]
  Click                     ${element}
  Click Confirm To Action

# Tìm phần tử trong bảng dựa trên tên.
Get Element Table Item By Name
  [Arguments]               ${name}                           ${xpath}
  [Return]                  xpath=//*[contains(@class, "ant-table-row")]//*[contains(text(), "${name}")]/ancestor::tr${xpath}

# Nhấp vào nút trong một hàng của bảng.
Click on the "${text}" button in the "${name}" table line
  Wait Until Element Spin
  ${element}=               Get Elements           //button[@title = "${text}"]
  Click                     ${element}[0]
  Click Confirm To Action

###  -----  Tree  -----  ###
# Tìm phần tử trong cây dựa trên tên.
Get Element Tree By Name
  [Arguments]               ${name}                           ${xpath}=${EMPTY}
  [Return]                  xpath=//*[contains(@class, "ant-tree-node-content-wrapper") and @title = "${name}"]/*[contains(@class, "group")]${xpath}

# Xóa một phần tử trong cây đã được tạo trước đó.
Click on the previously created "${name}" tree to delete
  Wait Until Element Spin
  ${element}=               Get Element Tree By Name          ${STATE["${name}"]}
  Scroll To Element         ${element}
  Mouse Move Relative To    ${element}                        0
  Click                     ${element}//*[contains(@class, "la-trash")]
  Click Confirm To Action

# Chỉnh sửa một phần tử trong cây đã được tạo trước đó.
Click on the previously created "${name}" tree to edit
  Wait Until Element Spin
  ${element}=               Get Element Tree By Name          ${STATE["${name}"]}
  Click                     ${element}

###  -----  Element  -----  ###
# Nhấp vào nút có nội dung là "${text}".
Click "${text}" button
  Click                     xpath=//button[@title = "${text}"]
  Click Confirm To Action
  Scroll By                 ${None}

# Nhấp vào tab có nội dung là "${text}".
Click "${text}" tab button
  Click                     xpath=//*[contains(@class, "ant-tabs-tab-btn") and contains(text(), "${text}")]

# Chọn một hàng có nội dung là "${text}".
Select on the "${text}" item line
  Wait Until Element Spin
  ${element}=               Get Element Item By Name          ${text}
  Click                     ${element}

# Nhấp vào menu có nội dung là "${text}".
Click "${text}" menu
  Click                     xpath=//li[span[contains(text(), "${text}")]]
  Wait Until Element Spin

# Nhấp vào submenu có nội dung là "${text}" và điều hướng đến "${url}".
Click "${text}" sub menu to "${url}"
  Wait Until Element Spin
  Click                     xpath=//a[contains(@class, "sub-menu") and descendant::span[contains(text(), "${text}")]]
  ${curent_url}=            Get Url
  Should Contain            ${curent_url}                     ${URL_DEFAULT}${url}

# Nhấp vào submenu có nội dung là "${text}".
Click "${text}" sub menu
  Wait Until Element Spin
  Click                     xpath=//a[contains(@class, "sub-menu") and descendant::span[contains(text(), "${text}")]]
  Wait Until Element Spin
  Wait Until Element Spin

# Kiểm tra xem thông báo lỗi có hiển thị đúng vị trí mong đợi không
Required message "${name}" displayed under "${text}" field
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-form-item-explain-error")]
  Wait Until Element Is Visible         ${element}
  Element Text Should Be    ${element}                        ${text}

# Kiểm tra xem một thông báo hiển thị có chứa nội dung "${message}" hay không.
User look message "${message}" popup
  ${contains}=              Get Regexp Matches                ${message}                    _@(.+)@_                    1
  ${cnt}=                   Get length                        ${contains}
  IF  ${cnt} > 0
    ${message}=             Replace String                    ${message}                    _@${contains[0]}@_          ${STATE["${contains[0]}"]}
  END
  Element Text Should Be    id=swal2-html-container           ${message}
  ${element}=               Set Variable                      xpath=//*[contains(@class, "swal2-confirm")]
  ${passed}                 Run Keyword And Return Status
                            ...   Element Should Be Visible   ${element}
  IF    '${passed}' == 'True'
        Click               ${element}
  END
  Wait Until Element Is Not Exist    ${element}

# Nhấp vào nút xác nhận để thực hiện hành động.
Click Confirm To Action
  ${element}                Set Variable                      xpath=//*[contains(@class, "ant-popover")]//*[contains(@class, "ant-btn-primary")]
  ${count}=                 Get Element Count                 ${element}
  IF    ${count} > 0
    Click                   ${element}
    Sleep                   ${SHOULD_TIMEOUT}
  END

# Chờ đến khi hiệu ứng quay tròn (spin) của phần tử kết thúc.
Wait Until Element Spin
  ${element}                Set Variable                      xpath=//*[contains(@class, "ant-spin-spinning")]
  ${count}=                 Get Element Count                 ${element}
  IF    ${count} > 0
    Wait Until Element Is Not Exist                           ${element}
  END
# -------------------------------------------------------------------------------------------------------------
User look title "${title}"  
    Wait Until Element Spin
    # Sleep    3
    Title Should Be    ${title}

# #############--------------LOGIN----------------#########################
# Kiểm tra xem thông báo lỗi có hiển thị đúng vị trí mong đợi không (hiển thị 2 validation text).
Required message "${name}" field displayed under "${text}"
  ${element}=               Get Element Form Item By Name     ${name}                //*[contains(@class, "ant-picker-input")]/input
  Wait Until Element Is Visible        //div[contains(text(),'${text}')]
  Element Text Should Be    //div[contains(text(),'${text}')]                        ${text}

# Kiểm tra Menu khi đăng nhập thành công
User look menu "${text}"
  Element Text Should Be    xpath=//li[span[contains(text(), "${text}")]]    ${text}
 
# Click vào link "Quên mật khẩu?"
Click "${name}" link
  ${element}=    Set Variable    //button[contains(@class, 'text-blue-600')]    
  Click   ${element}

# Kiểm tra Tiêu đề khi nhấn vào link "Quên mật khẩu?"
User look title form Forgot Password "${title}"
  Element Text Should Be    xpath=//h3[contains(text(),'${title}')]      ${title}

# Form "Quên mật khẩu" biến mất
"${forgotpassword}" form disappears
    Wait Until Element Is Not Exist    //h3[contains(text(),'${forgotpassword}')]

# Click icon "Eye" để hiện thị mật khẩu
Click "Eye" icon to display password
    ${element}=    Set Variable    xpath=//*[contains(@class, 'absolute') and @id='Layer_1']
    Click    ${element}

# Kiểm tra mật khẩu có hiển thị hay không khi click icon "eye"
User look "${name}" field with type "${type}"
    ${element}=        Get Element Form Item By Name        ${name}        //input[contains(@class, "ant-input")]
    ${password_field_type}        Get Attribute        ${element}        type
    Should Be Equal As Strings        ${password_field_type}            ${type}

# Kiểm tra khi reload page
User look "${name}" field empty
    ${element}=    Get Element Form Item By Name     ${name}    //input[contains(@class, "ant-input")]
    Element Text Should Be    ${element}    ${EMPTY}

User look textarea "${name}" field empty
    ${element}=               Get Element Form Item By Name     ${name}                       //textarea
    Element Text Should Be    ${element}    ${EMPTY}

User look select "${name}" field empty
    ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-select-selection-search-input")]
    Element Text Should Be    ${element}    ${EMPTY}
    
# Chọn ngôn ngữ tiếng anh
Change language with "${text}"
    Click    //span[contains(@class, "ant-select-selection-item")]
    Click    //*[contains(@class, "ant-select-item-option-content") and text()="${text}"]

# #############--------------CREATE USER----------------#########################
# Click sub menu "Danh sách" trong menu "Người Dùng"
Click "${list}" submenu in "Người Dùng" menu
    ${element}=        Set Variable        xpath=(//span[text()='${list}'])[2]
    Click     ${element}

# XÓA USER KHI USER ĐÓ CÒN NHỮNG YÊU CẦU NGHỈ PHÉP CẦN PHÊ DUYỆT
Click "${delete}" user has submitted a request for leave that needs to be approved
    Click list Role with "Staff"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//button[@title="${delete}"]
    ${elementCount}    Get Length            ${elements}
    ${randomIndex}=    Evaluate              ${elementCount}-1
    Click     ${elements}[${randomIndex}]
    Click Confirm To Action

# XÓA USER KHI USER ĐÓ ĐANG QUẢN LÝ MỘT USER KHÁC
Click "${delete}" user still managing other people
    Click list Role with "Manager"    
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//button[@title="${delete}"]
    ${elementCount}    Get Length            ${elements}
    ${randomIndex}=    Evaluate              ${elementCount}-1
    Click     ${elements}[${randomIndex}]
    Click Confirm To Action

# Click vào icon "Eye" để hiển thị mật khẩu và nhập lại mật khẩu
Click "Eye" icon to show "Mật khẩu" field and "Nhập lại mật khẩu" field
    ${element}=    Get Elements    xpath=//*[contains(@class, 'absolute') and @id='Layer_1']
    Click    ${element}[0]
    Click    ${element}[1]

# Chon danh sách user ứng với vai trò tương ứng
Click list ${name} with "${text}"
    ${element}=    Set Variable    xpath=//div[contains(@class, 'truncate') and text()='${text}']
    Wait Until Element Is Visible    ${element}
    Click    ${element}
    Wait Until Element Spin
    Wait Until Element Spin

# Nhập từ khóa cần tìm kiếm
Search "${type}" in "${name}" with "${text}"
    Wait Until Element Spin
    Wait Until Element Spin
    ${text}=                  Get Random Text                   ${type}                       ${text}
    ${element}=               Set Variable        //input[@placeholder="${name}"]
    Clear Text                ${element}
    Fill Text                 ${element}                        ${text}                       True
    ${cnt}=                   Get Length                        ${text}
    IF  ${cnt} > 0
        Set Global Variable     ${STATE["${name}"]}               ${text}
    END
    Sleep    4

# Tăng số lượng user được hiển thị lên 40 user
Increase the number of users displayed in the list
    ${element}=        Set Variable    xpath=//span[@class="ant-select-selection-item" and @title="9"]
    Click        ${element}
    ${number}=        Set Variable    //div[@class="ant-select-item-option-content" and text()="45"]
    Wait Until Element Is Visible    ${number}
    Click    ${number}

The page is refreshed with empty fields
    Then User look "Họ và tên" field empty
    And User look "Email" field empty
    And User look "Mật khẩu" field empty
    And User look "Nhập lại mật khẩu" field empty
    And User look "Số điện thoại" field empty

# Hiển thị danh sách
Show list of "${name}"
    Wait Until Element Spin
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    ${count}=    Set Variable    2
    ${stt}=    Set Variable    1
    
    IF  '${name}' == 'users'
        FOR    ${item}    IN    @{elements}
          ${fullname}=        Get Text    //tbody/tr[${count}]/td[1]/div[1]/span[1]
          ${position}=        Get Text    //tbody/tr[${count}]/td[2]
          ${role}=            Get Text    //tbody/tr[${count}]/td[3]
          ${manager}=         Get Text    //tbody/tr[${count}]/td[4]
          ${team}=            Get Text    //tbody/tr[${count}]/td[5]
          ${Email}=           Get Text    //tbody/tr[${count}]/td[6]
          ${phone_number}=    Get Text    //tbody/tr[${count}]/td[7]
          
          IF  '${manager}' == '${EMPTY}'
            ${manager}=    Set Variable    Không có quản lý
          END
            
          IF  '${team}' == '${EMPTY}'
            ${team}=    Set Variable    Không có nhóm
          END
          
          Log To Console        ${stt}. ${fullname} | ${position} | ${role} | ${manager} | ${team} | ${Email} | ${phone_number} |
          Log To Console        ========================================================================================================
          ${count}=    Evaluate    ${count} + 1
          ${stt}=    Evaluate    ${stt} + 1
        END
    
    ELSE IF  '${name}' == 'teams'
        FOR    ${item}    IN    @{elements}
          ${team_name}=        Get Text        //tbody[1]/tr[${count}]/td[1]
          ${manager}=          Get Text        //tbody/tr[${count}]/td[2]/div[1]/span[1]
          Log To Console        ${stt}. ${team_name} || ${manager}
          Log To Console        =======================================
          ${count}=    Evaluate    ${count} + 1
          ${stt}=    Evaluate    ${stt} + 1
        END
    
    ELSE IF  '${name}' == 'codes'
      FOR    ${item}    IN    @{elements}
        ${code}=             Get Text        //tbody[1]/tr[${count}]/td[1]
        ${name_code}=        Get Text        //tbody[1]/tr[${count}]/td[2]
        ${Description}=      Get Text        //tbody[1]/tr[${count}]/td[3]  
        Log To Console        ${stt}. Mã: ${code} || Tên mã: ${name_code} || Mô tả: ${Description}
        Log To Console        ===================================================================================
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
      END
    
    ELSE IF  '${name}' == 'data'
      FOR    ${item}    IN    @{elements}
        ${name_data}=             Get Text        //tbody[1]/tr[${count}]/td[1]
        ${order}=        Get Text        //tbody[1]/tr[${count}]/td[2]
        Log To Console        ${stt}. Tên dữ liệu: ${name_data} || Order: ${order}
        Log To Console        ===================================================================================
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
      END
    END
    ${total}=    Evaluate    ${count} - 2
    Log To Console    Tổng số lượng ${name} là: ${total}

# Không có user nào được hiển thị khi nhập từ khóa tìm kiếm không hợp lệ
No ${name} are shown
    Wait Until Element Spin
    ${element}=    Set Variable    //div[@class="bg-gray-100 text-gray-400 py-4"]
    Wait Until Element Is Visible    ${element}
    ${text}=    Get Text    ${element}
    Run Keyword If  '${text}' == 'Trống'    Log To Console    Không có ${name} nào ứng với từ khóa tìm kiếm

# Chọn Next page hoặc Previous page  
Click "${icon}" to "${next}" page
    ${element}=    Set Variable    //button[@aria-label="${next}"]
    Wait Until Element Is Visible    ${element}
    Click    ${element}
    Wait Until Element Spin

# Kiểm tra class của đối tượng sau khi nhấn nút next page hoặc previous page
Get_Element_Attribute with "${page}"
    ${element}    Set Variable    //button[@aria-label="${page}"]
    Wait Until Element Is Visible    ${element}
    ${attribute}    Get Attribute    ${element}    class
    [Return]    ${attribute}

# #############--------------EDIT USER----------------#########################
# Chọn user cần chỉnh sửa
Select the ${text} with "${name}" to edit
    [Arguments]    
    Wait Until Element Spin
    ${elements}            Get Elements            xpath=//button[@title="Sửa"]
    ${elementCount}    Get Length    ${elements}
    IF  '${name}'=='valid'
        ${randomIndex}=    Evaluate    ${elementCount}-${elementCount}
    ELSE IF  '${name}'=='Còn những yêu cầu nghỉ cần duyệt'
        ${randomIndex}=    Evaluate    ${elementCount}-1
    END
    Click    ${elements}[${randomIndex}]
    Wait Until Element Spin
    Wait Until Element Spin

# Xóa thông tin hiện tại của trường: Ngày sinh hoặc Ngày đầu đi làm
Delete information "${name}"
    IF  '${name}' == 'Ngày sinh'
        ${num}=    Evaluate    0
    ELSE IF  '${name}' != 'Ngày sinh'
        ${num}=    Evaluate    1
    END
    And Enter date in "${name}" with ""
    ${elements}=               Get Elements        //span[@class='ant-picker-clear']
    Click    ${elements}[${num}]
    And Enter date in "${name}" with ""     

# Xóa thông tin hiện tại của trường: Vị trí hoặc Vai trò
Delele select "${name}" field
    IF  '${name}' == 'Vị trí'
        ${num}=    Evaluate    0
    ELSE IF  '${name}' == 'Vai trò'
        ${num}=    Evaluate    1
    END
    ${elements}=               Get Elements        //span[@class='ant-select-clear'] 
    Click    ${elements}[${num}]

Delele select at "Quản lý" field
    ${elements}=               Get Element        //span[@class='ant-select-clear'] 
    Click    ${elements}

# #############--------------STAFF LEAVE MANAGEMENT----------------#########################
# Nhập ngày bắt đầu nghỉ hoặc ngày kết thúc nghỉ
Enter leave date in "${field}" with "${text}"            # NHẬP NGÀY NGHỈ BẮT ĐẦU VÀ KẾT THÚC
  ${text}=                  Get Random Text                   date                          ${text}
  ${element}               Set Variable            xpath=//input[@placeholder="${field}"]
  Click                     ${element}
  Clear Text                ${element}
  Fill Text                 ${element}                        ${text}

# Lấy chuỗi text "Ngày phép còn lại"
Get_Leave_date with "${date}"
    ${element}=        Set Variable     //div[contains(text(), '${date}')]
    Wait Until Element Is Visible    ${element}
    ${text}    Get Text    ${element}
    [Return]    ${text}

User look "${name}" field should be empty
    ${element}        Set Variable       xpath=//span[text()='${name}']
    Wait Until Element Is Visible                    ${element}
    Element Text Should Be        ${element}        ${name}

User look leave date empty with "${field}"        #CREATE STAFF LEAVE MANAGEMENT
    ${element}               Set Variable            xpath=//input[@placeholder="${field}"]
    Wait Until Element Is Visible            ${element}
    Element Text Should Be                   ${element}            ${EMPTY}

User look empty textarea with "${name}"
    ${element}=               Get Element Form Item By Name     ${name}                       //textarea
    Wait Until Element Is Visible        ${element}
    Element Text Should Be    ${element}    ${EMPTY}

User look all field should be empty        #STAFF_LEAVE MANAGER
    And User look "Chọn loại phép" field should be empty
    And User look "Chọn thời gian" field should be empty
    And User look leave date empty with "Ngày bắt đầu"
    And User look leave date empty with "Ngày kết thúc"
    And User look empty textarea with "Lý do"

# Hiển thị danh sách ngày nghỉ đã tạo
Show list of "${name}" leave date
    Sleep    3
    ${elements}=          Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    ${user_count}=        Set Variable        2
    ${stt}=    Set Variable    1
    FOR    ${item}    IN    @{elements}
      ${username}=              Get Text        //tbody/tr[${user_count}]/td[2]/div[1]/span[1]
      
      ${element_manager}=       Get Elements    //tbody/tr[${user_count}]/td[3]/div[1]/span[1]
      ${manager}                Get Text        ${element_manager}[0]     
      
      ${element_type}=          Get Elements    //tbody/tr[${user_count}]/td[4]
      ${type}=                  Get Text        ${element_type}[0]

      ${element_time}=          Get Elements    //tbody/tr[${user_count}]/td[5]
      ${time}=                  Get Text        ${element_time}[0]

      ${element_leave_date}=    Get Elements    //tbody/tr[${user_count}]/td[6]
      ${leave_date}=            Get Text        ${element_leave_date}[0]
      
      ${approvated_date}=       Get Text        //tbody/tr[${user_count}]/td[8]
      ${approvated_by}=         Get Text        //tbody/tr[${user_count}]/td[9]
    
      IF  '${approvated_date}' == ''
        ${status}=    Set Variable    Đang chờ phê duyệt
      END
      
      IF     '${name}'=='approved'
        ${status}=    Set Variable    Đã phê duyệt
      ELSE IF    '${name}'=='rejected'
        ${status}=    Set Variable    Từ chối phê duyệt
      ELSE IF    '${name}'=='pending'
        ${status}=    Set Variable    Đang chờ phê duyệt
      ELSE IF    '${name}'=='created'
        ${status}=    Set Variable    ${EMPTY}
      END

      Log To Console        ${stt}. Họ và tên: ${username} | Quản lý: ${manager} | Loại phép: ${type} | Thời gian: ${time} | Ngày nghỉ: ${leave_date} | Trạng thái: ${status} | Ngày phê duyệt: ${approvated_date} | Người phê duyệt: ${approvated_by}
      Log To Console        ================================================================================================================================================================================================================================================================
      ${user_count}=    Evaluate    ${user_count} + 1
      ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${user_count} - 2
    IF     '${name}'=='created'
      Log To Console    Total number of holidays ${name}: ${total}
    ELSE IF    '${name}'=='approved'
      Log To Console    Total number of ${name} holidays: ${total}
    ELSE IF    '${name}'=='rejected'
      Log To Console    Total number of days off ${name} approval: ${total}
    ELSE IF    '${name}'=='pending'
      Log To Console    Total number of days off ${name} approval: ${total}
    END

# #############--------------PROFILE----------------#########################
Hover to avatar
    Mouse Move Relative To        xpath=//header/div[1]/div[2]/section[1]/div[1]        0

Click "${profile}" to ${name}
    ${element}=        Set Variable        //div[text() = '${profile}']
    Wait Until Element Is Visible          ${element}
    Click    ${element}

# #############--------------ADMIN LEAVE MANAGEMENT----------------#########################
Select the leave date status as ${status}
    ${elements}=        Get Elements         //*[contains(@class, "ant-table-row")]
    ${number}=    Get Length    ${elements}    
    IF     '${status}'=='Pending'
      ${index}=    Evaluate    ${number}-5
    ELSE IF    '${status}'=='Approved'
      ${index}=    Evaluate    ${number}-2
    ELSE IF    '${status}'=='Rejected'
      ${index}=    Evaluate    ${number}-1
    END
    Click   ${elements}[${index}]    left    2
    Wait Until Element Spin

Filter the list of holidays with the status of "${status}"
    Click    //thead/tr[1]/th[7]/div[1]/span[2]/*[1]
    Click    //span[contains(text(),'${status}')]
    Click "Tìm kiếm" button

User can view the details of the holiday ${name}
    Log To Console    Chi tiết ngày nghỉ
    
    ${code}    Get Text    //tbody/tr[1]/td[1]
    Log To Console    Mã: ${code}
    Log To Console    ==================================

    ${fullname}    Get Text    //tbody/tr[2]/td[1]//div[1]/span[1]
    Log To Console    Họ và tên: ${fullname}
    Log To Console    ==================================

    ${manager}    Get Text    //tbody/tr[3]/td[1]//div[1]/span[1]
    Log To Console    Quản lý: ${manager}
    Log To Console    ==================================

    ${type}    Get Text    //tbody/tr[4]/td[1]
    Log To Console    Loại phép: ${type}
    Log To Console    ==================================

    ${time}    Get Text    //tbody/tr[5]/td[1]
    Log To Console    Thời gian: ${time}
    Log To Console    ==================================

    ${leave_date}    Get Text    //tbody/tr[6]/td[1]
    Log To Console    Ngày nghỉ: ${leave_date}
    Log To Console    ==================================

    ${reason}    Get Text    //tbody/tr[7]/td[1]
    Log To Console    Lý do: ${reason}
    Log To Console    ==================================
    
    IF  '${name}' == 'Pending'
        Log To Console    ==========================================
    ELSE IF  '${name}' == 'Approved'
        Verify status
    ELSE IF  '${name}' == 'Rejected'
        Verify status
        ${reason_rejected}    Get Text    //tbody/tr[11]/td[1]
        Log To Console    Lý do từ chối: ${reason_rejected}
    END

Verify status
    ${class_attribute}    Get Attribute    //tbody/tr[8]/td[1]/*[1]    class
    IF  '${class_attribute}' == '${class_approved}'
        ${status}=    Set Variable    Đã phê duyệt
    ELSE IF  '${class_attribute}' == '${class_rejected}'
            ${status}=    Set Variable    Từ chối phê duyệt
    END
    Log To Console    Trạng thái: ${status}
    Log To Console    ==================================
        
    ${approvated_at}    Get Text    //tbody/tr[9]/td[1]
    Log To Console    Ngày phê duyệt: ${approvated_at}
    Log To Console    ==================================

    ${approvated_by}    Get Text    //tbody/tr[10]/td[1]//div[1]/span[1]
    Log To Console    Phê duyệt bởi: ${approvated_by}
    Log To Console    ==================================

Fillter the leave list by leave date with start date: ${start_date} and end date: ${end_date}
    ${element}    Get Element    //thead/tr[1]/th[6]/div[1]/span[2]/*[1]
    Click    ${element}
    And Enter leave date in "Ngày bắt đầu" with "${start_date}"
    And Enter leave date in "Ngày kết thúc" with "${end_date}"
    Press Keys    xpath=//input[@placeholder="Ngày kết thúc"]    Enter
    And Click "Tìm kiếm" button
    Wait Until Element Spin
    Wait Until Element Spin

Fillter the leave list by approvated date with start date: ${start_date} and end date: ${end_date}
    ${element}    Get Element    //thead/tr[1]/th[8]/div[1]/span[2]/*[1]
    Click    ${element}
    And Enter leave date in "Ngày bắt đầu" with "${start_date}"
    And Enter leave date in "Ngày kết thúc" with "${end_date}"
    Press Keys    xpath=//input[@placeholder="Ngày kết thúc"]    Enter
    And Click "Tìm kiếm" button
    Wait Until Element Spin
    Wait Until Element Spin

##=========================CREATE CODE===============================================
User look title form "${text}"
    ${element}    Set Variable    //h1[@class="text-xl font-bold hidden sm:block" and //h1[text() = "${text}"]]
    Wait Until Element Is Visible    ${element}
    Element Text Should Be    ${element}    ${text}

##=========================CREATE DATA===============================================
Select language with "${name}"
    ${element}    Set Variable    //div[@id='rc-tabs-0-tab-1' and text()='${name}']   
    Click    ${element}
Enter information when create data
    And Enter "order number" in "Order" with "_RANDOM_"
    And Enter "text" in "Name" with "_RANDOM_"
    And Enter "text" in textarea "Description" with "_RANDOM_"      
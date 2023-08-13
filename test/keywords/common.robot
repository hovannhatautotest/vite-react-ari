*** Settings ***
Library             Browser
Library             FakerLibrary        locale=en_IN
Library             String

*** Variables ***
${BROWSER}          chromium
${HEADLESS}         ${False}
${BROWSER_TIMEOUT}  60 seconds
${SHOULD_TIMEOUT}   0.1 seconds

${SEARCH_NAME_CODE}    USR0047
${SEARCH_FULLNAME}     Hồ Văn Nhật
${SEARCH_EMAIL}        admin_balan@getnada.com
${SEARCH_PHONE}        0941225407
${SEARCH_ROLE}         Quản trị viên

${URL_DEFAULT}      http://stag.balance.ari.com.vn/#/      # Web internet
# ${URL_DEFAULT}      http://localhost:5173/
${STATE}            Evaluate  json.loads('''{}''')  json

*** Keywords ***

Login to ${user}
  IF  '${user}' == 'Admin'
    Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
  ELSE IF  '${user}' == 'Store'
    Enter "email" in "Tên đăng nhập" with "chstag11111@getnada.com"
  ELSE IF  '${user}' == 'Supplier'
    Enter "email" in "Tên đăng nhập" with "nccstag11111@getnada.com"
  END
  Enter "text" in "Mật khẩu" with "Ari123456#"
  Click "Đăng Nhập" button
  #User look message "Đăng nhập thành công" popup
  Wait Until Element Is Visible    //*[@id='name-application']

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
    Wait Until Element Is Visible    //*[@id='name-application']

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
  ELSE IF  ${cnt} > 0 and '${type}' == 'fullname'
    ${new_text}=            FakerLibrary.Name
  ELSE IF  ${cnt} > 0 and '${type}' == 'test name'
    ${random}=              FakerLibrary.Sentence             nb_words=3
    ${words}=               Split String                      ${TEST NAME}                  ${SPACE}
    ${new_text}=            Set Variable                      ${words[0]} ${random}
  ELSE IF  ${cnt} > 0 and '${type}' == 'name code'
    ${random}=              FakerLibrary.Random Int           min=00000             max=99999
    ${name}=               Set Variable                      USR
    ${new_text}=            Set Variable                      ${name}${random}
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone_invalid'
    ${new_text}=            FakerLibrary.Random Int           min=1000000000000             max=9999999999999
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
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone_7'
    ${new_text}=            FakerLibrary.Random Int           min=0000000                  max=9999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone_invalid'
    ${new_text}=            FakerLibrary.Random Int           min=0000000000000             max=9999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'fax_7'
    ${new_text}=            FakerLibrary.Random Int           min=0000000                  max=9999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'fax_valid'
    ${new_text}=            FakerLibrary.Random Int           min=00000000                  max=99999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'fax_invalid'
    ${new_text}=            FakerLibrary.Random Int           min=1000000000000            max=9999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'number'
    ${new_text}=            FakerLibrary.Random Int           min=55555555                  max=999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'otp'
    ${new_text}=            FakerLibrary.Random Int           min=100000                  max=999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'color'
    ${new_text}=            FakerLibrary.Safe Hex Color
  ELSE IF  ${cnt} > 0 and '${type}' == 'date'
    ${new_text}=            FakerLibrary.Date  	              pattern=%d-%m-%Y
  ELSE IF  ${cnt} > 0 and '${type}' == 'word'
    ${new_text}=            FakerLibrary.Sentence             nb_words=500
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

Click in textarea "${name}" field
  ${element}=               Get Element Form Item By Name     ${name}                       //textarea
  Click                     ${element}

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
#  ${element}=               Get Element Form Item By Name     ${name}                       //button[contains(@class, "ant-switch")]
  ${element}=               Set Variable                       //button[contains(@class, "ant-switch")]
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
  Click                     xpath=//button[contains(text(),'${text}')]
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
  Click                     xpath=//span[contains(text(),'${text}')]
  Wait Until Element Spin

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
  # ${element}=               Set Variable                      xpath=//*[contains(@class, "swal2-confirm")]
  ${element}=               Set Variable                      xpath=//*[contains(@class, "swal2-cancel")]
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
Check Welcome Message Text Is "${welcome}"
  Element Text Should Be   //h1[contains(text(),'${welcome}')]    ${welcome}

# Kiểm tra xem thông báo lỗi có hiển thị đúng vị trí mong đợi không (hiển thị 2 validation text).
Required message "${name}" field displayed under "${text}"
  ${element}=               Get Element Form Item By Name     ${name}                //*[contains(@class, "ant-picker-input")]/input
  Wait Until Element Is Visible        //div[contains(text(),'${text}')]
  Element Text Should Be    //div[contains(text(),'${text}')]                        ${text}

# Kiểm tra Menu khi đăng nhập thành công
User look menu "${text}"
  Element Text Should Be    xpath=//span[contains(text(),'${text}')]    ${text}

# Click vào link "Quên mật khẩu?"
Click "${name}" link
  Click    //a[contains(text(),'${name}')]
  # Click        //button[text()='${name}']

# Kiểm tra Tiêu đề khi nhấn vào link "Quên mật khẩu?"
User look contains title is "${title}"
  IF    '${title}' == 'Quên Mật Khẩu'
    Element Text Should Be        //h1[contains(text(),'${title}')]          ${title}
  ELSE IF    '${title}' != 'Quên Mật Khẩu'
    Element Text Should Be        //p[contains(text(),'${title}')]          ${title}
  END

# Click icon "Eye" để hiện thị mật khẩu
Click "Eye" icon to display password
  Click    xpath=//*[contains(@class, 'text-lg')]

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

##=============================CREATE USER==================================================
# Đến trang tạo mới người dùng
Go to page create user
  Login to Admin
  And Click "Quản lý người dùng" menu
  And Click "Thêm quản trị viên" button

# Hiển thị danh sách
Show list of "${name}"
    Log To Console    ****************List of ${name}****************
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    IF  '${name}' == 'users'
        FOR  ${i}  IN  @{elements}
            ${user_code}    Get Text    //tbody/tr[${count}]/td[1]
            ${fullname}     Get Text    //tbody/tr[${count}]/td[2]
            ${email}        Get Text    //tbody/tr[${count}]/td[3]
            ${phone}        Get Text    //tbody/tr[${count}]/td[4]
            ${role}         Get Text    //tbody/tr[${count}]/td[5]
            Log To Console    ${stt}. Mã người dùng: ${user_code} | Họ và tên: ${fullname} | Email: ${email} | Số điện thoại: ${phone} | Vai trò: ${role}
            Log To Console    ============================================================================================================================================
            ${count}=    Evaluate    ${count} + 1
            ${stt}=    Evaluate    ${stt} + 1
        END
    ELSE IF  '${name}' == 'Stores'
        FOR  ${i}  IN  @{elements}
            ${store_code}     Get Text      //tbody/tr[${count}]/td[1]
            ${store_name}     Get Text      //tbody/tr[${count}]/td[2]
            ${address}        Get Text      //tbody/tr[${count}]/td[3]
            ${store_type}     Get Text      //tbody/tr[${count}]/td[4]
            ${store_user}     Get Text      //tbody/tr[${count}]/td[5]
            ${phone}          Get Text      //tbody/tr[${count}]/td[6]
            Log To Console    ${stt}. Mã cửa hàng: ${store_code} | Tên cửa hàng: ${store_name} | Địa chỉ: ${address} | Loại cửa hàng: ${store_type} | Người đại diện: ${store_user} | Số điện thoại: ${phone}
            Log To Console    ================================================================================================================================================================================
            ${count}=    Evaluate    ${count} + 1
            ${stt}=    Evaluate    ${stt} + 1
        END
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng ${name} là: ${total}

# Tìm kiếm với từ khóa tương ứng
Search "${type}" in "${name}" with "${text}"
    ${text}=                  Get Random Text                   ${type}                       ${text}
    ${element}=               Set Variable        //input[@placeholder="${name}"]
    Clear Text                ${element}
    Fill Text                 ${element}                        ${text}                       True
    ${cnt}=                   Get Length                        ${text}
    IF  ${cnt} > 0
        Set Global Variable     ${STATE["${name}"]}               ${text}
    END
    Wait Until Element Spin
    Sleep    1

# Từ khóa không hợp lệ
No ${name} are shown
    Wait Until Element Spin
    ${element}=    Set Variable    //div[@class="bg-gray-100 text-gray-400 py-4"]
    Wait Until Element Is Visible    ${element}
    ${text}=    Get Text    ${element}
    Run Keyword If  '${text}' == 'Trống'    Log To Console    Không có ${name} nào ứng với từ khóa tìm kiếm

# Chọn Next page hoặc Previous page
Click "${icon}" to "${next}" page
    ${elements}=    Get Elements    //button[contains(@id, '${next}')]
    IF  '${next}' == 'next'
        Click    ${elements}[1]
    ELSE IF  '${next}' == 'prev'
        Click    ${elements}[1]
    ELSE IF  '${next}' != 'next'
        Click    ${elements}[0]
    ELSE IF  '${next}' != 'prev'
        Click    ${elements}[0]
    END
    Wait Until Element Spin

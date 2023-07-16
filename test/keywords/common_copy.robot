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

${URL_DEFAULT}      http://stag.balance.ari.com.vn
${STATE}            Evaluate  json.loads('''{}''')  json

${username_valid}    Hồ Văn Nhật
${email_valid}    hovannhat@gmail.com
${phone_number_valid}    0941225407

${type_class}    

*** Keywords ***

Login to admin
  Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
  Enter "text" in "Mật khẩu" with "Ari123456#"
  Enter at "Mật khẩu" field to Login
  Wait Until Element Is Visible        //*[contains(@id, "name-application")]
  # Click "Đăng nhập" button

Login to Store
  Enter "email" in "Tên đăng nhập" with "chstag11111@getnada.com"
  Enter "text" in "Mật khẩu" with "Ari123456#"
  Enter at "Mật khẩu" field to Login
  Wait Until Element Is Visible        //*[contains(@id, "name-application")]
  # Click "Đăng nhập" button

Login to Supplier
  Enter "email" in "Tên đăng nhập" with "nccstag11111@getnada.com"
  Enter "text" in "Mật khẩu" with "Ari123456#"
  Enter at "Mật khẩu" field to Login
  Wait Until Element Is Visible        //*[contains(@id, "name-application")]
  # Click "Đăng nhập" button

Go to page create user
  Login to admin
  When Click "Người Dùng" menu
  When Click "Tạo mới" sub menu to "/vn/user/add"

Go to "Danh sách Người dùng" page
    Login to admin
    And Click "Người Dùng" menu
    And Click "Danh sách" submenu in "Người Dùng" menu
    
Go to page create team
    Login to Admin
    When Click "Thiết lập" menu
    And Click "Nhóm" sub menu to "/vn/team"
    And Click "Tạo mới" button
    Wait Until Element Spin

Go to "Edit User" page
    Go to "Danh sách Người dùng" page
    Click list Role with "Staff"
    Choose Random user to edit
    Wait Until Element Spin

Enter invalid information
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
    ${actualTitle}    Get Title
    Should Be Equal As Strings    ${actualTitle}    ${expectedTitle}

# Reload Page
Reload Page
    Reload

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

# Kiểm tra xem thông báo lỗi có hiển thị đúng vị trí mong đợi không.
Required message "${name}" displayed under "${text}" field
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-form-item-explain-error")]
  Wait Until Element Is Visible         ${element}
  Element Text Should Be    ${element}                        ${text}

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

# Nhập giá trị vào trường textarea trên form.
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

# Nhập giá trị vào trường edit trên form.
Enter "${type}" in editor "${name}" with "${text}"
  ${text}=                  Get Random Text                   ${type}                       ${text}
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ce-paragraph")]
  Clear Text                                                  ${element}
  Fill Text                                                   ${element}                    ${text}

# 
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
  ${element}=               Get Element Table Item By Name    ${STATE["${name}"]}           //button[@title = "${text}"]
  Click                     ${element}
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
  ${element}=    Set Variable    xpath=//button[text()="${text}"]
  Click         ${element}

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
  Click                     //span[contains(@class, 'text-gray-300') and contains(text(), '${text}')]

# Nhấp vào submenu có nội dung là "${text}" và điều hướng đến "${url}".
Click "${text}" sub menu to "${url}"
  Wait Until Element Spin
  Click                     xpath=//li[contains(@class, 'py-2') and a[text()='${text}']]
  ${curent_url}=            Get Url
  Should Contain            ${curent_url}                     ${URL_DEFAULT}${url}

# Kiểm tra xem một thông báo hiển thị có chứa nội dung "${message}" hay không.
User look message "${message}" popup
  ${contains}=              Get Regexp Matches                ${message}                    _@(.+)@_                    1
  ${cnt}=                   Get length                        ${contains}
  IF  ${cnt} > 0
    ${message}=             Replace String                    ${message}                    _@${contains[0]}@_          ${STATE["${contains[0]}"]}
  END
  ${element}=               Set Variable                      xpath=//*[contains(@id, "swal2-html-container")]
  Element Text Should Be    ${element}           ${message}
  ${passed}                 Run Keyword And Return Status
                            ...   Element Should Be Visible   ${element}
  IF    '${passed}' == 'True'
        Click               ${element}
  END
  # Wait Until Element Is Not Exist    ${element}

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
User look menu "${text}"
  Element Text Should Be        //span[contains(@class, 'text-gray-300') and contains(text(), '${text}')]        ${text}

User look title form Forgot Password "${title}"
  Element Text Should Be    xpath=//h3[contains(text(),'${title}')]      ${title}

Click link "${name}"
  ${element}=    Set Variable    //a[text()="${name}"]
  Click   ${element} 

Required message "${name}" field displayed under "${text}"
  ${element}=               Get Element Form Item By Name     ${name}                //*[contains(@class, "ant-picker-input")]/input
  Wait Until Element Is Visible        //div[contains(text(),'${text}')]
  Element Text Should Be    //div[contains(text(),'${text}')]                        ${text}

User look title "${title}"  
    Wait Until Element Spin
    Title Should Be    ${title}

"${forgotpassword}" form disappears
    Wait Until Element Is Not Exist    //h3[contains(text(),'${forgotpassword}')]

Click "Eye" icon to display password
    ${element}=    Set Variable    xpath=//i[contains(@class, 'la-eye')]
    Click    ${element}

User look "${name}" field EMPTY
    ${element}=    Get Element Form Item By Name     ${name}    //input[contains(@class, "ant-input")]
    Element Text Should Be    ${element}    ${EMPTY}

User look "${name}" field should be empty
    ${element}        Set Variable       xpath=//span[text()='${name}']
    Wait Until Element Is Visible                    ${element}
    Element Text Should Be        ${element}        ${name}

Enter leave date in "${field}" with "${text}"
  ${text}=                  Get Random Text                   date                          ${text}
  ${element}               Set Variable            xpath=//input[@placeholder="${field}"]
  Click                     ${element}
  Clear Text                ${element}
  Fill Text                 ${element}                        ${text}

User look leave date empty with "${field}"
    ${element}               Set Variable            xpath=//input[@placeholder="${field}"]
    Wait Until Element Is Visible            ${element}
    Element Text Should Be                   ${element}            ${EMPTY}

User look empty textarea with "${name}"
    ${element}=               Get Element Form Item By Name     ${name}                       //textarea
    Wait Until Element Is Visible        ${element}
    Element Text Should Be    ${element}    ${EMPTY}

Enter at "${name}" field to Login
    ${element}=    Get Element Form Item By Name    ${name}    //input[contains(@class, "ant-input")]
    Press Keys    ${element}    Enter

Delele select "${name}" field
    ${element}=               Get Element Form Item By Name     ${name}        //*[contains(@class, "ant-select-show-arrow")]
    Click    //span[@class='ant-select-clear'] 

User look all field should be empty
    And User look "Chọn loại phép" field should be empty
    And User look "Chọn thời gian" field should be empty
    And User look leave date empty with "Ngày bắt đầu"
    And User look leave date empty with "Ngày kết thúc"
    And User look empty textarea with "Lý do"

User look "${name}" field with type "${type}"
    ${element}=        Get Element Form Item By Name        ${name}        //input[contains(@class, "ant-input")]
    ${password_field_type}        Get Attribute        ${element}        type
    Should Be Equal As Strings        ${password_field_type}            ${type}

Click "${list}" submenu in "Người Dùng" menu
    ${element}=        Set Variable        xpath=(//span[text()='${list}'])[2]
    Click     ${element}

Click "${delete}" user has submitted a request for leave that needs to be approved
    ${element}=        Get Elements        xpath=//button[@title="${delete}"]
    Wait Until Element Is Visible    ${element}[0]
    Click     ${element}[0]
    Click Confirm To Action

Click "Eye" icon to show "Mật khẩu" field and "Nhập lại mật khẩu" field
    ${element}=    Get Elements    xpath=//*[contains(@class, 'absolute') and @id='Layer_1']
    Click    ${element}[0]
    Click    ${element}[1]

View User List with "${role}"
    Wait Until Element Spin
    ${user_list}=    Get Elements    xpath=//td[@class='ant-table-cell' and text()='${role}']
    Run Keyword If  ${user_list}    View User List Loop    ${role}    ${user_list}
    ...    ELSE    Log To Console    Không tìm thấy user có vai trò là "${role}" nào!

View User List search key in "Họ và tên" field with "${username_valid}"
    Wait Until Element Spin
    ${user_list}=    Get Elements    //span[@class="ml-1" and text()="${username_valid}"]
    Run Keyword If  ${user_list}    View User List Loop    ${username_valid}    ${user_list}
    ...    ELSE    Log To Console    Không tìm thấy user có tên là "${username_valid}" nào!

View User List search key in "${type}" field with "${text}"
    Wait Until Element Spin
    ${user_list}=    Get Elements    //td[contains(text(),'${text}')]
    Run Keyword If  ${user_list}    View User List Loop    ${text}    ${user_list}
    ...    ELSE    Log To Console    Không tìm thấy user có ${type} là "${text}" nào!

View User List Loop
    [Arguments]    ${role}    ${user_list}
    ${user_count}=    Set Variable    0
    ${stt}=    Set Variable    1
    FOR    ${user}    IN    @{user_list}
        ${user_role}    Get Text    ${user}
        Run Keyword If    '${user_role}' == '${role}'    Log To Console     ${stt}. ${user_role}
            ${user_count}=    Evaluate    ${user_count} + 1
            ${stt}=    Evaluate    ${user_count} + 1
    END
    Log To Console    Tổng số lượng user ${user_role}: ${user_count}

No users are shown
    Wait Until Element Spin
    ${element}=    Set Variable    //div[@class="bg-gray-100 text-gray-400 py-4"]
    Wait Until Element Is Visible    ${element}
    ${text}=    Get Text    ${element}
    Run Keyword If  '${text}' == 'Trống'    Log To Console    Không có User nào ứng với từ khóa tìm khiếm
    
Click list Role with "${role}"
    ${element}=    Set Variable    xpath=//div[contains(@class, 'truncate') and text()='${role}']
    Wait Until Element Is Visible    ${element}
    Click    ${element}
    Wait Until Element Spin

Increase the number of users displayed in the list
    Wait Until Element Spin
    ${element}=        Set Variable    xpath=//span[@class="ant-select-selection-item" and @title="8"]
    Click        ${element}
    ${number}=        Set Variable    //div[@class="ant-select-item-option-content" and text()="40"]
    Wait Until Element Is Visible    ${number}
    Click    ${number}

Search "${type}" in "${name}" with "${text}"
    ${text}=                  Get Random Text                   ${type}                       ${text}
    ${element}=               Set Variable        //input[@placeholder="${name}"]
    Clear Text                ${element}
    Fill Text                 ${element}                        ${text}                       True
    ${cnt}=                   Get Length                        ${text}
    IF  ${cnt} > 0
        Set Global Variable     ${STATE["${name}"]}               ${text}
    END
    Sleep    3
  
Click "${icon}" to "${next}" page
    ${element}=    Set Variable    //button[@aria-label="${next}"]
    Wait Until Element Is Visible    ${element}
    Click    ${element}
    Wait Until Element Spin

Get_Element_Attribute with "${page}"
    ${element}    Set Variable    //button[@aria-label="${page}"]
    Wait Until Element Is Visible    ${element}
    ${attribute}    Get Attribute    ${element}    class
    [Return]    ${attribute}

Get_Leave_date with "${date}"
    ${element}=        Set Variable     //div[contains(text(), '${date}')]
    Wait Until Element Is Visible    ${element}
    ${text}    Get Text    ${element}
    [Return]    ${text}

Choose Random User to Edit
    [Arguments]    
    Wait Until Element Spin
    ${elements}            Get Elements            xpath=//button[@title="Sửa"]
    ${elementCount}    Get Length    ${elements}
    ${randomIndex}=    Evaluate    random.randint(0, ${elementCount}-1)
    Click    ${elements}[${randomIndex}]
    Sleep    1

Delete information "${name}"
    ${elements}=               Get Elements        //span[@class='ant-picker-clear']
    Wait Until Element Is Visible    ${elements}
    Run Keyword If    '${name}'=='Ngày sinh'    Click    ${elements}[0]    
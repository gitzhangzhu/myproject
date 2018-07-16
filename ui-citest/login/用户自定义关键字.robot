*** Settings ***
Library           Selenium2Library    #导入第三方库
Library           Collections    #处理列表和字典的库
Library           DateTime
Library           ../login/myLibrary.py
Library           DatabaseLibrary

*** Variables ***
#用户自定义参数

*** Keywords ***
最大化窗口
    #关键字
    Maximize Browser Window

打开浏览器
    [Arguments]    ${loginUrl}
    Open Browser    ${loginUrl}    ${BROWSER}

关闭浏览器
    Close All Browsers

登录
    [Arguments]    ${loginId}    ${username}    ${password}    ${captcha}
    input text    id=loginIdInput    ${loginId}
    Click Button    id=submitButton
    sleep    2
    input text    id=userPhone    ${username}
    input text    id=password    ${password}
    input text    id=captcha    ${captcha}
    Click Button    xpath=//*[@id="credential"]/button

营销
    导入测试数据文件
    导入用户自定义数据文件
    打开浏览器    ${loginUrl}
    最大化窗口
    登录    ${loginId[0]}    ${username}    ${password}    ${captcha}
    Wait Until Page Contains Element    link=营销    15    not found this element
    Click Element    link=营销    #营销
    页面文言匹配    营销方案

新建优惠券方案
    [Arguments]    ${couponName}    ${faceValue}    ${memo}
    Input Text    id=couponName    ${couponName}    #优惠券名称
    Input Text    xpath=//*[@id="couponExt.faceValue"]    ${faceValue}    #券面额
    Input Text    id=memo    ${memo}    #券说明

获取原窗口
    [Arguments]    ${element}    @{items}
    #将原界面句柄以List形式展示
    ${index}=    Set Variable    ${0}
    : FOR    ${item}    IN    @{items}
    \    Return From Keyword If    '${element}'=='${item}'    ${index}
    Return From Keyword    ${-1}

页面文言匹配
    [Arguments]    ${words}
    page should contain    ${words}

导入测试数据文件
    import variables    ${CURDIR}\\Data.py

导入用户自定义数据文件
    import variables    ${CURDIR}\\Self-Data.py

创建随机数
    [Arguments]    ${num}
    #createRandom
    ${random}    evaluate    "".join(random.sample(string.letters+string.digits,int(${num})))    random,string
    [Return]    ${random}

生成随机手机号
    [Arguments]    ${phoneNumber}
    #createphonenumber
    ${phoneNumber}    Evaluate    random.randint(18300000001,18399999999)    random

选择优惠券
    [Arguments]    ${findcouponname}
    #checkbox
    input text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/div[1]/input    ${findcouponname}    #搜索框输入优惠券名臣
    sleep    3
    click button    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/button    #查询
    Wait Until Page Contains    ${findcouponname}    15    no found this coupon
    sleep    5
    Assign Id To Element    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div/div/div/div/div/table/thead/tr/th[1]/span/div/label/span/input    checkcoupon
    Execute JavaScript    window.document.getElementById('checkcoupon').click()
    click element    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[3]/button[2]    #点击保存

选择优惠券单选
    [Arguments]    ${findcouponname}
    #radio
    input text    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/div[1]/input    ${findcouponname}    #搜索框输入优惠券名臣
    sleep    3
    click button    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/button    #查询
    Wait Until Page Contains    ${findcouponname}    15    no found this coupon
    sleep    5
    Assign Id To Element    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div/div/div/div/div/table/tbody/tr/td[1]/span/label/span/input    checkcoupon
    Execute JavaScript    window.document.getElementById('checkcoupon').click()
    click element    xpath=/html/body/div[3]/div/div[2]/div/div[1]/div[3]/button[2]    #点击保存

菜品选择
    click element    xpath=/html/body/div[4]/div/div[2]/div/div[1]/div[2]/div/div[2]/div[1]/div/div[1]/div/div/div/div/div[4]
    sleep    3
    Assign Id To Element    xpath=/html/body/div[4]/div/div[2]/div/div[1]/div[2]/div/div[2]/div[1]/div/div[2]/div[3]/div/div[2]/div/div/div/div/div/div/table/tbody/tr[1]/td[1]/span/label/span/input    selectbox
    Execute JavaScript    window.document.getElementById('selectbox').click()
    click button    xpath=/html/body/div[4]/div/div[2]/div/div[1]/div[3]/button[2]

方案菜品选择
    click element    xpath=/html/body/div[5]/div/div[2]/div/div[1]/div[2]/div/div[2]/div[1]/div/div[1]/div/div/div/div/div[4]
    sleep    3
    Assign Id To Element    xpath=/html/body/div[5]/div/div[2]/div/div[1]/div[2]/div/div[2]/div[1]/div/div[2]/div[3]/div/div[2]/div/div/div/div/div/div/table/tbody/tr[1]/td[1]/span/label/span/input    selectbox
    Execute JavaScript    window.document.getElementById('selectbox').click()
    click button    xpath=/html/body/div[5]/div/div[2]/div/div[1]/div[3]/button[2]

新建代金券
    sleep    3
    ${couponName}    Ran Str    代金券
    input text    id=couponName    ${couponName}    #优惠券名称
    Set Suite Variable    ${couponName}
    input text    id=denominationValue    ${couponValue}    #券面额
    input text    id=couponVaildDataNum    ${datenum}    #动态有效期
    click element    xpath=//*[@id="app-root"]/div/div/div/form/div[2]/div[2]/div[1]/div/div[4]/div[2]/div/div/div[1]/div/span/span    #当天有效
    input text    id=conponStock    ${couponnum}    #优惠券库存
    input text    id=conponUseNotes    ${memo}    #使用说明
    Click Button    class=ant-btn-primary    #保存

删除方案券信息
    [Arguments]    ${mysqlname}    ${connectparams}    ${PlanName}    ${couponName}
    Connect To Database Using Custom Params    ${mysqlname}    ${connectparams}
    ${PlanName}    decode    ${PlanName}    UTF-8
    Execute Sql String    DELETE FROM loyt_plan WHERE brand_id = 101237 and name = "${PlanName}";
    ${couponName}    decode    ${couponName}    UTF-8
    Execute Sql String    DELETE FROM loyt_coupon WHERE brand_id = 101237 and name = "${couponName}";
    Disconnect From Database
    sleep    3

删除方案信息
    [Arguments]    ${mysqlname}    ${connectparams}    ${PlanName}
    Connect To Database Using Custom Params    ${mysqlname}    ${connectparams}
    ${PlanName}    decode    ${PlanName}    UTF-8
    Execute Sql String    DELETE FROM loyt_plan WHERE brand_id = 101237 and name = "${PlanName}";
    Disconnect From Database
    sleep    3

删除优惠券信息
    [Arguments]    ${mysqlname}    ${connectparams}    ${couponName}
    Connect To Database Using Custom Params    ${mysqlname}    ${connectparams}
    ${couponName}    decode    ${couponName}    UTF-8
    Execute Sql String    DELETE FROM loyt_coupon WHERE brand_id = 101237 and name = "${couponName}";
    Disconnect From Database
    sleep    3
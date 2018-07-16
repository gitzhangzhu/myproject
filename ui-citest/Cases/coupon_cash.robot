*** Settings ***
Resource          ../login/用户自定义关键字.txt
Library           ../login/myLibrary.py

*** Test Cases ***
test01_正确输入新建优惠券方案
    [Tags]    coupon_01
    营销
    sleep       8
    #优惠券
    Click Element    xpath=//*[@id="app-root"]/div/div[1]/div[3]/div[1]/div[2]/ul/li[2]/a    #优惠券方案
    sleep    8
    select frame    xpath=//*[@id="app-root"]/div/div[1]/div[3]/div[2]/div/iframe    #跳转iframe
    Wait Until Page Contains Element    xpath=//*[@id="app-root"]/div/div/div/div/div[1]/div[2]/button    15    not found this element
    Click Button    xpath=//*[@id="app-root"]/div/div/div/div/div[1]/div[2]/button    #新建优惠券
    sleep    5
    #基本信息
    #代金券
    ${couponName}    Ran Str    代金券
    input text    id=couponName    ${couponName}    #优惠券名称
    input text    id=denominationValue    ${couponValue}    #券面额
    #券有效期
    #选择动态有效期
    #    默认动态有效期
    #    input text    id=couponVaildDataNum    ${datenum}    #动态有效期
    #选择固定日期
    Click Element    xpath=//span[contains(text(), '固定日期')]
    #可用时段
    #不限时段
    #指定时段
    click element       xpath=//span[contains(text(),'指定时段')]
    #选择星期
    #选择时间
    #同步到微信卡包券
    #使用限制
    sleep       5
    Execute Javascript    window.scrollTo(0, 500)    #向下滑动（在此无用）
    #适用商品
    #全部商品可用
    #    默认全部
    #部分商品可用
    click element    xpath=//*[@id="app-root"]/div/div/div/form/div[2]/div[2]/div[2]/div[1]/div[2]/div/div/div/div[1]/div/div/div    #展开下拉选项
    press key    xpath=//*[@id="app-root"]/div/div/div/form/div[2]/div[2]/div[2]/div[1]/div[2]/div/div/div/div[1]/div/div    \ue015    #键盘向下
    press key    xpath=//*[@id="app-root"]/div/div/div/form/div[2]/div[2]/div[2]/div[1]/div[2]/div/div[1]/div/div[1]/div/div    \\13    #键盘enter

    Assign Id To Element        xpath=//*[@id="app-root"]/div/div/div/form/div[2]/div[2]/div[2]/div[1]/div[2]/div/div[1]/span[2]      selectgoods
    Execute JavaScript          window.document.getElementById('selectgoods').click()
    sleep       3
    菜品选择
    sleep       3

    #部分商品不可用
    #使用场景
    #选择堂食
    click element       xpath=//span[contains(text(), '外卖')]
    sleep    3
    #最低消费
    click element       xpath=//span[contains(text(), '消费满')]
    input text      id=conponLeastCustomer      ${limitcash}     #消费满金额
    #可用门店
    click element       xpath=//*[@id="app-root"]/div/div/div/form/div[2]/div[2]/div[2]/div[4]/div[2]/div/div/div/label[1]/span[2]
    #每人限领
    click element       xpath=//span[contains(text(), '每人限领')]
    input text      id=conponGetLimitNum        ${limitnum}     #限领张数
    input text    id=conponStock    ${couponnum}    #优惠券库存
    input text    id=conponUseNotes    ${memo}    #使用说明
    sleep       5
    Click Button    class=ant-btn-primary    #保存
    sleep       5
    页面文言匹配    ${couponName}    #判断新建优惠券成功
    sleep    5
    删除优惠券信息    ${mysqlname}    ${connectparams}    ${couponName}
    关闭浏览器

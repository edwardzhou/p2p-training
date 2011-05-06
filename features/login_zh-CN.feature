#language: zh-CN

功能: 登录
  只有确认过的用户才能正常登录
  其他其情况应当不能登录

  场景: 无输入登录
    假如 我位于 登录页面
    当 我按下按钮 "登录"
    那么 我应当在页面 登录页面
    而且 我在 "div#notice" 里面应当看到 "邮箱或密码错误"

  @javascript
  场景: 无输入登录 (客户端js校验)
    假如 我位于 登录页面
    当 按下按钮 "登录"
    那么 我应当在页面 登录页面
    而且 我在 "div#field_email" 里面应当看到 "必选字段"
    而且 我在 "div#field_password" 里面应当看到 "必选字段"


  场景: 用户尚未注册
    假如 我位于 登录页面
    当 填入 "test@test.com" 到 "邮箱"
    而且 填入 "123456" 到 "密码"
    而且 我按下按钮 "登录"
    那么 我应当在页面 登录页面
    而且 我在 "div#notice" 里面应当看到 "邮箱或密码错误"

  场景: 用户已注册但尚未激活，且密码不正确
    假如 我有如下用户记录
      |email         |password      |password_confirmation|username    |gender   |true_name    |contact_phone   |
      |abc@abc.com   |abc123        |abc123               |ABC_user     |male     |张三         |88884444        |
    当 我打开 登录页面
    而且 填入 "abc@abc.com" 到 "用户名或邮箱"
    而且 填入 "123456" 到 "密码"
    而且 我按下按钮 "登录"
    那么 我应当在页面 登录页面
    而且 我在 "div#notice" 里面应当看到 "请先激活您的帐号"

  场景: 用户已注册但尚未激活
    假如 我有如下用户记录
      |email         |password      |password_confirmation|username    |gender   |true_name    |contact_phone   |
      |abc@abc.com   |abc123        |abc123               |ABC_user     |male     |张三         |88884444        |
    当 我打开 登录页面
    而且 填入 "abc@abc.com" 到 "用户名或邮箱"
    而且 填入 "abc123" 到 "密码"
    而且 我按下按钮 "登录"
    那么 我应当在页面 登录页面
    而且 我在 "div#notice" 里面应当看到 "请先激活您的帐号"

  场景: 用户已激活
    假如 我有如下用户记录
      |email         |password      |password_confirmation|username    |gender   |true_name    |contact_phone   |confirmed|
      |abc@abc.com   |abc123        |abc123               |ABC_user     |male     |张三         |88884444        | true    |
    当 我打开 登录页面
    而且 填入 "abc@abc.com" 到 "用户名或邮箱"
    而且 填入 "abc123" 到 "密码"
    而且 我按下按钮 "登录"
    那么 我应当在页面 the home page
    而且 我在 "div#notice" 里面应当看到 "登录成功"


  场景: 用用户名登录已激活用户
    假如 我有如下用户记录
      |email         |password      |password_confirmation|username    |gender   |true_name    |contact_phone   |confirmed|
      |abc@abc.com   |abc123        |abc123               |ABC_user     |male     |张三         |88884444        | true    |
    当 我打开 登录页面
    而且 填入 "abc_user" 到 "用户名或邮箱"
    而且 填入 "abc123" 到 "密码"
    而且 我按下按钮 "登录"
    那么 我应当在页面 the home page
    而且 我在 "div#notice" 里面应当看到 "登录成功"

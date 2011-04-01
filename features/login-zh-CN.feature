#language: zh-CN

功能: 登录
  Check login function.

  场景: Login with empty input
    当 我位于 login page
    而且 我在<div#main>里面按下按钮 "登录"
    那么 我应当在页面login page
    而且 我应当见到 "邮箱或密码错误"

#  @javascript
#  Scenario: Login with empty input (client js checking)
#    When I am on login page
#    And I press "登录"
#    Then I should be on login page
#    And I should see "必选字段" within "#field_email"
#    And I should see "必选字段" within "#field_password"
#
#
#  Scenario: Login with non-exist email
#    When I am on login page
#    And I fill in "test@test.com" for "邮箱"
#    And I fill in "123456" for "密码"
#    And I press "登录"
#    Then I should be on login page
#    And I should see "邮箱或密码错误" within "div#notice"
#
#  Scenario: Login with wrong password before confirmation
#    Given I have following user records
#      |email         |password      |password_confirmation|nick_name    |gender   |true_name    |contact_phone   |
#      |abc@abc.com   |abc123        |abc123               |ABC user     |male     |张三         |88884444        |
#    When I go to login page
#    And I fill in "abc@abc.com" for "邮箱"
#    And I fill in "123456" for "密码"
#    And I press "登录"
#    Then I should be on login page
#    And I should see "请先激活您的帐号" within "div#notice"
#
#  Scenario: Login with correct email and password before confirmation
#    Given I have following user records
#      |email         |password      |password_confirmation|nick_name    |gender   |true_name    |contact_phone   |
#      |abc@abc.com   |abc123        |abc123               |ABC user     |male     |张三         |88884444        |
#    When I go to login page
#    And I fill in "abc@abc.com" for "邮箱"
#    And I fill in "abc123" for "密码"
#    And I press "登录"
#    Then I should be on login page
#    And I should see "请先激活您的帐号" within "div#notice"
#
#  Scenario: Login with confirmation
#    Given I have following user records
#      |email         |password      |password_confirmation|nick_name    |gender   |true_name    |contact_phone   |confirmed|
#      |abc@abc.com   |abc123        |abc123               |ABC user     |male     |张三         |88884444        | true    |
#    When I go to login page
#    And I fill in "abc@abc.com" for "邮箱"
#    And I fill in "abc123" for "密码"
#    And I press "登录"
#    Then I should be on the home page
#    And I should see "登录成功" within "div#notice"
#
#
#

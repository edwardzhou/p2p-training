Feature: Login
  Check login function.

  Scenario: Login with empty input
    When I am on login page
    And I press "登录"
    Then I should be on login page
    And I should see "邮箱或密码错误" within "div#notice"
    #And I should see "必选字段" within "#field_email"
    #And I should see "必选字段" within "#field_password"

  @javascript
  Scenario: Login with empty input (client js checking)
    When I am on login page
    And I press "登录"
    Then I should be on login page
    #And I should see "邮箱或密码错误" within "div#notice"
    And I should see "必选字段" within "#field_email"
    And I should see "必选字段" within "#field_password"


  Scenario: Login with non-exist email
    When I am on login page
    And I fill in "test@test.com" for "邮箱"
    And I fill in "123456" for "密码"
    And I press "登录"
    Then I should be on login page
    And I should see "邮箱或密码错误" within "div#notice"

  Scenario: Login with wrong password
    Given I have following user records
      |email         |password      |password_confirmation|nick_name    |gender   |
      |abc@abc.com   |abc123        |abc123               |ABC user     |male     |
    When I go to login page
    And I fill in "abc@abc.com" for "邮箱"
    And I fill in "123456" for "密码"
    And I press "登录"
    Then I should be on login page
    And I should see "邮箱或密码错误" within "div#notice"

  Scenario: Login with correct email and password
    Given I have following user records
      |email         |password      |password_confirmation|nick_name    |gender   |
      |abc@abc.com   |abc123        |abc123               |ABC user     |male     |
    When I go to login page
    And I fill in "abc@abc.com" for "邮箱"
    And I fill in "abc123" for "密码"
    And I press "登录"
    Then I should be on the root page
    And I should see "登录成功" within "div#notice"





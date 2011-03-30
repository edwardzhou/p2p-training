Feature: Login
  Check login function.

  @javascript
  Scenario: Login with empty input
    When I am on login page
    And I press "登录"
    Then I should be on login page
    And I should see "必选字段" within "#field_email"
    And I should see "必选字段" within "#field_password"

  #@javascript
  Scenario: Login with non-exist email
    When I am on login page
    And I fill in "test@test.com" for "邮箱"
    And I fill in "123456" for "密码"
    And I press "登录"
    Then I should be on login page
    And I should see "邮箱或密码错误" within "div.notice"


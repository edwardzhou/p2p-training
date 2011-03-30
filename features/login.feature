Feature: Login
  Check login function.

  @javascript
  Scenario: Login with empty input
    When I am on login page
    And I press "登录"
    Then I should be on login page
    And I should see "必选字段 x" within "#field_email"

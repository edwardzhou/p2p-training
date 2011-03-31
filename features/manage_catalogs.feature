Feature: Manage Catalogs

  Scenario: Show


  Scenario: show catalogs nav bar in index page
    Given I have following catalog records
      |name           |enabled    |
      |programming    |true       |
      |UML            |true       |
    When I am on the home page
    Then I should see "programming" within "div#catalog_nav"
    And I should see "UML" within "div#catalog_nav"






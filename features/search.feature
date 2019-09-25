Feature: Registration flow

#  Scenario: Check successful registration flow
#    Given I am on a registration_page
#    And I select "Add me to the mailing list" for offers and updates
#    And I fill registration form with correct data
#    And I click on a submit registration button
#    Then I should be on a home_page
#    
#  Scenario: Check required fields error messages
#    Given I am on a registration_page
#    And I select "No, thanks" for offers and updates
#    And I click on a submit registration button
##    Then next errors should be shown
##     |errors|Email can't be blank,Password can't be blank,Zipcode can't be blank|
#    Given I fill email field with appropriate value
#    And I click on a submit registration button
#    Then next errors should be shown
#     |errors|Password can't be blank,Zipcode can't be blank|
#    Given I fill password field with "22" value
#    And I click on a submit registration button
#    Then next errors should be shown
#     |errors|Password is too short (minimum is 6 characters),Zipcode can't be blank|
#    Given I fill password field with appropriate value
#    And I click on a submit registration button
#    Then next errors should be shown
#     |errors|Zipcode can't be blank|
#    Given I fill postcode field with appropriate value
#    And I click on a submit registration button
#    Then I should be on a home_page
    
  Scenario: Check SSO flow
    Given I am on a registration_page
    And I click on a login with Facebook button
    Then Facebook login window should be opened
   
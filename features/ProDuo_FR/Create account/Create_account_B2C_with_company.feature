Feature: Check create account functionality
  Background:
    Given open the site


  Scenario Outline:  Create account B2C With Company
    When user is on Create account page
    Then Select Private person option
    Then Select civility from the dropdown <greeting>
    And Fill in the first name field <firstname>
    And Fill in the last name field <lastname>
    And Fill in with a valid email address
    And Confirm the email address
    Then user fills valid landline number
    Then Fill in with a phone number
    And Check the newsletter subscription checkbox
    And Select a checkbox from the preferences
    Then Check the SMS checkbox
    Then Fill in with a valid password
    Then Confirm the password
    When Click on continue button
    Then Start typing address in the address suggestion field <address>
    When Click on add a company checkbox
    Then Select county <country> from the country dropdown
    And Fill in the VAT field with a valid number <vat>
    When Click on use a different shipping address checkbox
    Then Start typing address2 in the address  suggestion field <address2>
    And Click on Create account button button


    Examples:
      |greeting|firstname|lastname|address|country|address2|vat|
      |M.      |Ole      |Boiko   |7  rue |France |3 rue  |00000000190|
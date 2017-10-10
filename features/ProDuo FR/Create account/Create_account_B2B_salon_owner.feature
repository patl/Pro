Feature: Check create account functionality
  Background:
    Given open the site


  Scenario Outline:  Create account B2C simple
    When user is on Create account page
    Then Select Professional option
    Then Select civility from the dropdown B2B
    And Fill ds in the first name field for B2B <firstname>
    And Fill ds in the last name field for B2B <lastname>
    And Fill in with a valid email address for B2B
    And Confirm the email address for B2B
    Then Fill in with a phone number for B2B
    And Check the newsletter subscription checkbox for B2B
    Then Check the SMS checkbox for B2B
    Then Fill in with a valid password for B2B
    Then Confirm the password for B2B
    When Click on continue button for B2B
    Then Select the salon owner profession <ownew> from the dropdown B2B
    Then user press on an activity checkbox for B2B
Then user selects country from VAT drop-down for B2B
Then user fills the VAT field for B2B with <VAT>
And user fills the Société field with some data <data>


    
    Then typing address in the address suggestion field for B2B <address>
    When Click on add a company checkbox
    Then Select France from the country dropdown
    And Fill in the VAT field with a valid number <vat>
    When Click on use a different shipping address checkbox
    Then Start typing address2 in the address  suggestion field <address2>
    And Click on Create account button  button


    Examples:
      |firstname|lastname|address|ownew                           |vat        |data|
      |Ole      |Boiko   |7  rue |propriétaire d’un salon/Institut|00000000190|sometext|
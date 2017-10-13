Feature: Check create account functionality
  Background:
    Given open the site


  Scenario Outline:  Create account B2B at home esthetician
    When user is on Create account page
    Then Select Professional option
    Then Select civility from the dropdown-list B2B <greeting>
    And Fill ds in the first name field for B2B <firstname>
    And Fill ds in the last name field for B2B <lastname>
    And user fills valid birthday for B2B <date>, <month>, <year>
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
    Then user selects country <country> from VAT drop-down for B2B
    Then user fills the VAT field for B2B with <vat>
    And user fills the Société field with some data <data>
    Then typing address in the address suggestion field for B2B <address>
    And fill the phone number landline number for B2B first address
    When press on use a different shipping address checkbox for B2B
    Then Start typing address2 for B2B in the address suggestion field <address2>

    And click on validate button for B2B


    Examples:
    |greeting  |firstname|lastname|date|month|year|address  |ownew               |country     |vat      |data    |address2 |
    |Frau      |Ole      |Boiko   |21  |11   |1991|s 7|Mobile Kosmetiker/in|Deutschland |111111125|sometext|s 3|
Feature: Check create account functionality
  Background:
    Given open the site


  Scenario Outline:  Create account B2B student
    When user is on Create account page
    Then Select Professional option
    Then Select civility from the dropdown-list B2B <greeting>
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
    And user uploads document <docpath> the proof section B2B Salon employee
    Then typing address in the address suggestion field for B2B <address>
    When press on use a different shipping address checkbox for B2B
    Then Start typing address2 for B2B in the address suggestion field <address2>

    And click on validate button for B2B


    Examples:
      |greeting   |firstname|lastname|address|ownew            |address2|docpath|
      |     M.    |Ole      |Boiko   |7  rue |salarié(e) ProDuo|3 rue   |C:\\asd.png|
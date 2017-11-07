Feature: Check create account functionality
  Background:
    Given open the site


  Scenario Outline:  Create account B2C simple
  When user is on Create account page
  Then Select Private person option
  Then Select civility from the dropdown <greeting>
  And Fill in the first name field <firstname>
  And Fill in the last name field <lastname>
  And Fill in with a valid email address
  And Confirm the email address
  Then Fill in with a phone number
  Then Fill in with a valid password
  Then Confirm the password
  When Click on continue button
  Then Start typing address in the address suggestion field <address>
  And Click on Create account button button


    Examples:
    |greeting |firstname|lastname|address|
    |M.       |Ole      |Boiko   |7  rue |
Feature:

  As a User
  I want to be able to create a new account in MedMonitor
  So that I can begin using the service

  Background: User has accessed MedMonitor website

    Given  I am on the MedMonitor home page

  Scenario: Nurse creates new account
    When I attempt to sign up as a "nurse" with email: "cody-r-anderson@gmail.com", full_name: "Cody Anderson", school_id: "24", and password: "pa$$word"
    Then I should see: "Your Account has not yet been approved by an administrator."

  Scenario: Administrator creates new account
    When I attempt to sign up as a "administrator" with email: "cody-m-anderson@gmail.com", full_name: "Cody Anderson", school_id: "24", and password: "password"
    Then I should see: "Welcome! You have signed up successfully."

  Scenario: Parent creates new account
    When I attempt to sign up as a "administrator" with email: "cody-r-andersen@gmail.com", full_name: "Cody Andersen", school_id: "21", and password: "password1"
    Then I should see: "Welcome! You have signed up successfully."


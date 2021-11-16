Feature:

  As a User
  I want to be able to log into MedMonitor
  So that I can securely access my account

  Background: Users Have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | Bob Rogers              | bobby_R@gmail.com          | pa$$word     | 12        |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 14        |

    And the following "Administrators" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | John Smith              | johnsmith1@icloud.com      | password1    | 12        |

    And the following "Parents" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | John Davis              | johndavis1@yahoo.com       | password2    | 17        |

    And  I am on the MedMonitor home page

  Scenario: Nurse logs into system
    When I log in as a "nurse" with email: "bobby_R@gmail.com" and password: "pa$$word"
    Then I should see: "Nurse#homepage"

  Scenario: admin logs into system
    When I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "password1"
    Then I should see: "Administrator#homepage"

  Scenario: parent logs into system
    When I log in as a "parent" with email: "johndavis1@yahoo.com" and password: "password2"
    Then I should see: "Parent#homepage"

  Scenario: Nurse inputs username and password that does not exist
    When I log in as a "nurse" with email: "boby_R@gmail.com" and password: "pa$$word"
    Then I should see: "Invalid Email or password."

  Scenario: Admin inputs username and password that does not exist
    When I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "password"
    Then I should see: "Invalid Email or password."

  Scenario: Parent inputs username and password that does not exist
    When I log in as a "parent" with email: "bobs_burgers@bobsburgers.com" and password: "pass_the_word"
    Then I should see: "Invalid Email or password."

  Scenario: Logged in Nurse tries to access nurse login page
    When I log in as a "nurse" with email: "bobby_R@gmail.com" and password: "pa$$word"
    And I attempt to visit the "nurse" sign in page
    Then I should see: "You are already signed in."

  Scenario: Logged in Nurse tries to access admin login page
    When I log in as a "nurse" with email: "bobby_R@gmail.com" and password: "pa$$word"
    And I attempt to visit the "administrator" sign in page
    Then I should see: "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."

  Scenario: Logged in Nurse tries to access parent login page
    When I log in as a "nurse" with email: "bobby_R@gmail.com" and password: "pa$$word"
    And I attempt to visit the "parent" sign in page
    Then I should see: "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."

  Scenario: Logged in Administrator tries to access administrator login page
    When I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "password1"
    And I attempt to visit the "administrator" sign in page
    Then I should see: "You are already signed in."

  Scenario: Logged in Administrator tries to access administrator login page
    When I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "password1"
    And I attempt to visit the "nurse" sign in page
    Then I should see: "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."

  Scenario: Logged in Administrator tries to access dministrator login page
    When I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "password1"
    And I attempt to visit the "parent" sign in page
    Then I should see: "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."

  Scenario: Logged in Parent tries to access parent login page
    When I log in as a "parent" with email: "johndavis1@yahoo.com" and password: "password2"
    And I attempt to visit the "parent" sign in page
    Then I should see: "You are already signed in."

  Scenario: Logged in Parent tries to access parent login page
    When I log in as a "parent" with email: "johndavis1@yahoo.com" and password: "password2"
    And I attempt to visit the "nurse" sign in page
    Then I should see: "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."

  Scenario: Logged in Parent tries to access parent login page
    When I log in as a "parent" with email: "johndavis1@yahoo.com" and password: "password2"
    And I attempt to visit the "administrator" sign in page
    Then I should see: "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."
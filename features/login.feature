Feature:

  As a nurse
  I want a new page to appear when I hit the "Login" button on the Login page
  So that I know the page is responsive

  Background: movies have been added to RottenPotatoes

    Given the following Nurses have been added to MedTracker:
      | full_name               | username      | password     |
      | Bob Rogers              | bobby_R       | pa$$word     |
      | Sally Milbert           | s-milbert     | PassWord     |

    And the following Administrators have been added to MedTracker:
      | full_name               | username      | password     |
      | John Smith              | johnsmith1    | password1    |

    And  I am on the MedTracker home page

  Scenario: User does not fill out username and password field before hitting login
    When I attempt to login with username: "" and password: "PassWord"
    Then I should see: "Please enter both a username and password"

  Scenario: User inputs username and password that does not exist in db
    When I attempt to login with username: "larry" and password: "PassWord"
    Then I should see: "User with username larry could not be found in the database"

  Scenario: User inputs username and password that corresponds to an admin account
    When I attempt to login with username: "johnsmith1" and password: "password1"
    Then I should see: "Administrator#homepage"

  Scenario: User inputs username and password that corresponds to an nurse account
    When I attempt to login with username: "bobby_R" and password: "pa$$word"
    Then I should see: "Nurse#homepage"


Feature:

  As an Administrator
  I want to have a homepage
  So that I can find the different features available to an admin

  Background: Admins and Nurses have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 3         | true             |
      | Cody Anderson           | c-anderson@hotmail.com     | passwrd      | 3         | false            |

    And the following "Administrators" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | John Smith              | johnsmith1@icloud.com      | password1    | 3         | true             |
      | John Doe                | johndoe1@icloud.com        | password2    | 3         | false            |


    And I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "password1"

  Scenario: Admin visits their homepage
    Then I should see buttons for: "Manage Access,View Reports/Logs"

  Scenario: Admin visits homepage and checks Access Notifications
    Then I should see access alerts for user(s):"Cody Anderson,John Doe" with email(s) "c-anderson@hotmail.com,johndoe1@icloud.com"

Feature:

  As an Administrator
  I want to be able to approve new accounts for my school
  So that I can control access to school data

  Background: Admins and Nurses have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 3         | true             |
      | Cody Anderson           | c-anderson@hotmail.com     | passwrd      | 3         | false            |
      | Luke Hageman            | l-hageman@hotmail.com      | paswerd      | 3         | false            |

    And the following "Administrators" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | John Smith              | johnsmith1@icloud.com      | password1    | 3         | true             |


    And I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "password1"
    And I open the manage access page

  Scenario: Admin visits Administrator Manage Access Page
    Then I should see a user with email "l-hageman@hotmail.com" who needs approval

  Scenario: Admin approves new nurse
    When I approve a new "nurse" with name "Luke Hageman" and email "l-hageman@hotmail.com"
    Then "nurse" with email "l-hageman@hotmail.com" should be approved

Feature:

  As a Parent
  I want to have a homepage
  So that I can find the different features available to a parent

  Background: Parents and students have been added to MedMonitor

    Given the following "Parents" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 3         |

    Given the following students have been added to MedMonitor with parent id 1:
      | full_name               | date_of_birth    | school_id |
      | Jamie Milbert           | 10-01-2009       | 3         |
      | Bobby Milbert           | 10-01-2009       | 3         |


    And I log in as a "parent" with email: "s-milbert@hotmail.com" and password: "PassWord"

  Scenario: Parent visits the parent homepage
    Then I should see the following students: "Jamie Milbert,Bobby Milbert"

  Scenario: Parent clicks "Edit Consent Forms" button for student "Bobby Milbert"
    When I click the "Edit Consent Form" button for student "Bobby Milbert" with id "2"
    Then I should see: "Consent Form"

Feature: Nurse Add Medication

  Background: Nurses, students, and medications have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 14        |

    And the following Students have been added to MedMonitor:
      | full_name               | school_id
      | John Doe                | 14
      | Jane Doe                | 14

    And I log in as a "nurse" with email: "s-milbert@hotmail.com" and password: "PassWord"
    And I am on the Add Medication page


  Scenario: Nurse visits the add medication page
    Then I should see fields for "name of medication,unit of medication,initial amount,student id"




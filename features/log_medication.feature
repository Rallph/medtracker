Feature:

  As a nurse
  I want to log when I distribute medication to a student including medication name, dosage, and date/time given
  So that I can add to a student's history of distributed medication

  Background: Nurses, students, and medications have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 14        |

    And the following Students have been added to MedMonitor:
      | full_name               | school_id
      | John Doe                | 14
      | Jane Doe                | 14

    And I log in as a "nurse" with email: "s-milbert@hotmail.com" and password: "PassWord"
    And I am on the Administer Medication page



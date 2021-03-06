Feature:

  As a nurse
  I want to log when I distribute medication to a student including medication name, dosage, and date/time given
  So that I can add to a student's history of distributed medication

  Background: Nurses, students, and medications have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 14        | true             |

    And the following "Students" have been added to MedMonitor:
      | full_name               | school_id |
      | John Doe                | 14        |
      | Jane Doe                | 14        |

    And the following medications have been added to the school inventory:
      | medication_name     | quantity        | unit         | school_id |
      | Ibuprofen           | 5               | tablets      | 14        |
      | Cough Syrup         | 50              | mL           | 14        |
      | Aspirin             | 4               | tablets      | 2         |

    And I log in as a "nurse" with email: "s-milbert@hotmail.com" and password: "PassWord"
    And I am on the Administer Medication page

  Scenario: Nurse visits administer medication page
    Then I should see fields for "select student,select school medication,dosage,comment,time"

  Scenario: Nurse unsuccessfully administers school medication to a student
    When I administer "1" dose(s) of school medication "Ibuprofen" to student "John Doe"
    Then I should see: "Record not taken. Medication is not approved for that student"

  Scenario: Nurse successfully administers school medication to a student
    When John Doe has been approved to take Ibuprofen
    And I administer "1" dose(s) of school medication "Ibuprofen" to student "John Doe"
    Then I should see: "Medication administered successfully"
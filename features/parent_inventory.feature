Feature: Parent View Current Student Medication Inventory
  As a parent
  I want to view all of the medications in stock for my child
  So that I can efficiently and accurately monitor the medication stock my child needs

  Background:
    Given the following "Parents" have been added to MedMonitor:
      | full_name     | email             | password| school_id |
      | Drew Kain     | dpain05@gmail.com |PASSWORD | 1         |
      | Big Johnny    | bigjohn@gmail.com |PASSWORD | 1         |
      | John Doe      | johnnyboy@gmail.com | PASSWORD | 1      |

    And the following "Students" have been added to MedMonitor:
      | full_name     | school_id   |
      | Ethan Heusel  | 1 |
      | Little Johnny | 1 |

    And the following Parent Student relationships exists:
      | parent_id     | student_id    |
      | 1             | 1             |
      | 2             | 2             |


    And the following "student_medications" have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id | student_id  |
      | Ibuprofen               | 30                         | tablets      | 1         | 1           |
      | Ibuprofen               | 25                         | tablets      | 2         | 1           |
      | Tylenol                 | 250                        | mL           | 1         | 1           |
      | Benadryl                | 15                         | tablets      | 2         | 1           |

    Scenario: Parent logs in then goes to inventory
      When I log in as a "parent" with email: "dpain05@gmail.com" and password: "PASSWORD"
      And I view parent medication inventory
      Then I should see: "Parent Inventory"

    Scenario: Parent view their student's medication inventory
      When I log in as a "parent" with email: "dpain05@gmail.com" and password: "PASSWORD"
      And I view parent medication inventory
      Then I should only see medications belonging to student: "Ethan Heusel"

    Scenario: Parent's student has no approved student medications
      When I log in as a "parent" with email: "bigjohn@gmail.com" and password: "PASSWORD"
      And I view parent medication inventory
      Then I should see: "There are no student medications in stock, if this seems wrong, please contact the school."

    Scenario: Parent attempts to view inventory without having an assigned student
      When I log in as a "parent" with email: "johnnyboy@gmail.com" and password: "PASSWORD"
      And I view parent medication inventory
      Then I should see: "Could not find a student belonging to you. Please contact the school."

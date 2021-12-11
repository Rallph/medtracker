Feature: Parent View Current Student Medication Inventory
  As a parent
  I want to view all of the medications in stock for my child
  So that I can efficiently and accurately monitor the medication stock my child needs

  Background:
    Given the following "Parents" have been added to MedMonitor:
      | full_name     | email       | password      | school_id |
      | Drew Kain     | dpain05@gmail.com |PASSWORD | 1         |

    And the following "Students" have been added to MedMonitor:
      | full_name     | school_id   |
      | Ethan Heusel  | 1 |

    And the following Parent Student relationships exists:
      | parent_id     | student_id    |
      | 1             | 1             |

    And the following "student_medications" have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id | student_id  |
      | Ibuprofen               | 30                         | tablets      | 1         | 1           |
      | Ibuprofen               | 25                         | tablets      | 2         | 2           |
      | Tylenol                 | 250                        | mL           | 1         | 1           |
      | Benadryl                | 15                         | tablets      | 2         | 2           |

    Scenario: Parent logs in then goes to inventory
      When I log in as a "parent" with email: "dpain05@gmail.com" and password: "PASSWORD"
      And I view "parent" medication inventory
      Then I should see: "Parent Inventory"

    Scenario: Parent view their student's medication inventory
      When I log in as a "parent" with email: "dpain05@gmail.com" and password: "PASSWORD"
      And I view "parent" medication inventory
      Then I should only see medication belonging to student "Ethan Heusel"
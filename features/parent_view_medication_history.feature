Feature:

  As a nurse
  I want to log when I distribute medication to a student including medication name, dosage, and date/time given
  So that I can add to a student's history of distributed medication

  Background: Nurses, students, and medications have been added to MedMonitor

    Given the following "Parents" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 3         |

    And the following "Students" have been added to MedMonitor:
      | full_name               | school_id |
      | John Doe                | 3         |

    And the following medications have been added to the school inventory:
      | medication_name     | quantity        | unit         | school_id |
      | Ibuprofen           | 5               | tablets      | 3         |
      | Cough Syrup         | 50              | mL           | 3         |
      | Aspirin             | 4               | tablets      | 3         |

    And the following "school_medications" have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id |
      | Ibuprofen               | 30                         | tablets      | 3         |
      | Ibuprofen               | 25                         | tablets      | 3         |
      | Tylenol                 | 250                        | mL           | 3         |
      | Benadryl                | 15                         | tablets      | 1         |
      | Tranquilizer            | 3                          | blow dart    | 3         |

    And the following "student_medications" have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id | student_id  |
      | Ibuprofen               | 30                         | tablets      | 3         | 1           |
      | Ibuprofen               | 25                         | tablets      | 3         | 1           |
      | Tylenol                 | 250                        | mL           | 3         | 1           |
      | Benadryl                | 15                         | tablets      | 3         | 1           |
      | Tranquilizer            | 3                          | blow dart    | 2         | 5           |

    And the following "school" medications have been administered to "John Doe":
      | date          | time        | change_in_quantity | student_id | nurse_id  | comment |
      | 11/12/2021    | 5:30 PM     | 3                  | 1          | 1         | na      |


    And the following "student" medications have been administered to "John Doe":
      | date          | time        | change_in_quantity | student_medication_id | nurse_id  | comment |
      | 11/12/2021    | 5:30 PM     | 3                  | 1                     | 1         | na      |


    And I log in as a "parent" with email: "s-milbert@hotmail.com" and password: "PassWord"
    And I am on the parent view medication history page

  Scenario: Nurse visits administer medication page
    Then I should see fields for "select student,select school medication,dosage,comment,time"

  Scenario: Nurse successfully administers school medication to a student
    When I administer "1" dose(s) of school medication "Ibuprofen" to student "John Doe"
    Then I should see: "Medication administered successfully"

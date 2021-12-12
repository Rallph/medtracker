Feature:

  As a Parent
  I want to be able to view the medication distribution history of my child
  So that I know that my child is receiving all of their required medications

  Background: Nurses, students, and medications have been added to MedMonitor

    Given the following "Parents" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 3         |

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | Bob Rogers              | bobby_R@gmail.com          | pa$$word     | 3         | true             |

    Given the following students have been added to MedMonitor with parent id 1:
      | full_name               | date_of_birth    | school_id |
      | Jamie Milbert           | 10-01-2009       | 3         |

    And the following school medications have been added to MedMonitor:
      | medication_name         | quantity                   | unit         | school_id |
      | Ibuprofen               | 30                         | tablets      | 3         |
      | Tranquilizer            | 3                          | blow dart    | 3         |

    And the following student medications have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id | student_id  |
      | Ibuprofen               | 30                         | tablets      | 3         | 1           |
      | Tranquilizer            | 3                          | blow dart    | 3         | 1           |

    And the following "school" medications have been administered:
      | date          | time        | change_in_quantity | school_medication_id | student_id | nurse_id  | comment |
      | 11/12/2021    | 5:30 PM     | 3                  | 2                    | 1          | 1         | na      |


    And the following "student" medications have been administered:
      | date          | time        | change_in_quantity | student_medication_id | nurse_id  | comment |
      | 11/12/2021    | 5:30 PM     | 3                  | 1                     | 1         | na      |


    And I log in as a "parent" with email: "s-milbert@hotmail.com" and password: "PassWord"
    And I am on the parent view medication history page

  Scenario: Parent visits the view medication history page
    Then I should see medication history for "Tranquilizer,Ibuprofen"

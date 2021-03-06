Feature:
  As a nurse
  I want to view all of the medications in stock and the amount left of each medication
  So that I can efficiently monitor the medication stock

  Background: Users Have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | Bob Rogers              | bobby_R@gmail.com          | pa$$word     | 1         | true             |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 2         | true             |
      | Jim Beam                | jimmyB@gmail.com           | PASSWORD     | 3         | true             |

    And the school with name: "Kate Wickham Elementary" and district_id: "1" has been added to MedMonitor:
    And the school with name: "West High School" and district_id: "1" has been added to MedMonitor:
    And the school with name: "City High High School" and district_id: "1" has been added to MedMonitor:

    And the following "Administrators" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | John Smith              | johnsmith1@icloud.com      | password1    | 1         | true             |

    And the following "Parents" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | John Davis              | johndavis1@yahoo.com       | password2    | 1         |

    And the following "school_medications" have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id |
      | Ibuprofen               | 30                         | tablets      | 1         |
      | Ibuprofen               | 25                         | tablets      | 2         |
      | Tylenol                 | 250                        | mL           | 1         |
      | Benadryl                | 15                         | tablets      | 2         |
      | Tranquilizer            | 3                          | blow dart    | 1         |

    And the following "student_medications" have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id | student_id  |
      | Ibuprofen               | 30                         | tablets      | 1         | 1           |
      | Ibuprofen               | 25                         | tablets      | 2         | 2           |
      | Tylenol                 | 250                        | mL           | 2         | 3           |
      | Benadryl                | 15                         | tablets      | 2         | 4           |
      | Tranquilizer            | 3                          | blow dart    | 2         | 5           |
    And the following students have been added to MedMonitor:
      | full_name               | date_of_birth              | school_id    |
      | John Doe                | 08-24-2011                 | 1            |
    #And I am on the nurse inventory page
    # test difference in login into site as background
    #And I log in as a "nurse" with email: "bobby_R@gmail.com" and password: "pa$$word"

  Scenario: Nurse logs in then goes to inventory
    When I log in as a "nurse" with email: "bobby_R@gmail.com" and password: "pa$$word"
    And I view "nurse" medication inventory
    Then I should see: "Nurse Inventory"


  Scenario: Nurse views school medication
    When I log in as a "nurse" with email: "bobby_R@gmail.com" and password: "pa$$word"
    And I view "nurse" medication inventory
    Then I should only see medications belonging to school_name: "Kate Wickham Elementary"

  Scenario: Nurse views empty inventory
    When I log in as a "nurse" with email: "jimmyB@gmail.com" and password: "PASSWORD"
    And I view "nurse" medication inventory
    Then I should see: "Inventory is Empty."

  Scenario: Nurse views student medications
    When I log in as a "nurse" with email: "bobby_R@gmail.com" and password: "pa$$word"
    And I view "nurse" medication inventory
    Then I should only see medications belonging to student_name: "John Doe"


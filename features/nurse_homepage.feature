Feature:

  As a nurse
  I want to have a homepage
  So that I can find the different features available to a nurse

  Background: Nurses, students, and inventory have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 3         | true             |

    And the following medications have been added to the school inventory:
      | medication_name     | quantity        | unit         | school_id |
      | Ibuprofen           | 5               | tablets      | 3         |
      | Cough Syrup         | 50              | mL           | 3         |
      | Aspirin             | 4               | tablets      | 2         |

    And I log in as a "nurse" with email: "s-milbert@hotmail.com" and password: "PassWord"

  Scenario: Nurse visits the nurse homepage
    Then I should see buttons for: "Administer Medicine"

  Scenario: Nurse visits nurse homepage and checks low medicine count

    Then I should see medicine alerts for "Ibuprofen,Cough Syrup" with quantities "5 tablets,50 mL"

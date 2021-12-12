Feature: Nurse Add Medication

  Background: Nurses, students, and medications have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id | account_approved |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 14        | t               |

    And the following "Students" have been added to MedMonitor:
      | full_name               | school_id
      | John Doe                | 14
      | Jane Doe                | 14

    And I log in as a "nurse" with email: "s-milbert@hotmail.com" and password: "PassWord"
    And I am on the Add Medication page


    # Capybara not responding to javascript
#  Scenario: Nurse visits the add medication page
#    When The student box is checked
#    Then I should see fields for "name of medication,unit of measurement,initial amount"

  Scenario: Nurse adds a school medication to the inventory
    When I enter a school medication as name: "Ibuprofen", unit: "tablets", initial amount: "30"
    Then I should see: "Medication added successfully"

  Scenario: Nurse doesn't enter the name field
    When I enter a school medication as name: "", unit: "tablets", initial amount: "30"
    Then I should see: "Medication not added. Name of medication was not specified."

  Scenario: Nurse doesn't enter the unit field
    When I enter a school medication as name: "Ibuprofen", unit: "", initial amount: "30"
    Then I should see: "Medication not added. Unit of medication was not specified."

  Scenario: Nurse doesn't enter the initial value field
    When I enter a school medication as name: "Ibuprofen", unit: "tablets", initial amount: ""
    Then I should see: "Medication not added. Initial amount of medication was not specified."

  # Capybara not responding to javascript
#  Scenario: Nurse adds a student medication to the inventory
#    When The student box is checked
#    When I enter a student medication as name: "Amoxicillin", unit: "tablets", initial amount: "10", student id: "1"
#    Then I should see: "Student medication added successfully"



Feature: Admin Add Student

  Background: Administrators, students, and parents have been added to MedMonitor

    Given the following "Administrators" have been added to MedMonitor:
      | full_name               | email                          | password     | school_id | account_approved |
      | lebron james             | lebron@gmail.com              | 123456       | 123       | t                |

    And the following "Students" have been added to MedMonitor:
      | full_name               | school_id
      | melo anthony            | 12345
      | nick had                | 12345
    And I log in as a "administrator" with email: "lebron@gmail.com " and password: "123456"
    And I am on the Add Student page

  Scenario: Admin adds a student to the database
    When I enter a student's information as name: "James Bond", school id: "12345", date of birth: "12/07/2021", parent email: "kmema@uiowa.edu"
    Then I should see: "Student info added successfully"
  Scenario: Admin doesn't enter the name field
    When I enter a student's information as name: "", school id: "12345", date of birth: "12/07/2021", parent email: "kmema@uiowa.edu"
    Then I should see: "Student not specified."
  Scenario: Admin doesn't enter the school id field
    When I enter a student's information as name: "James Bond", school id: "", date of birth: "12/07/2021", parent email: "kmema@uiowa.edu"
    Then I should see: "School ID was not specified."
  Scenario: Admin doesn't enter the DOB id field
    When I enter a student's information as name: "James Bond", school id: "12345", date of birth: "", parent email: "kmema@uiowa.edu"
    Then I should see: "Date of Birth was not specified"
  Scenario: Admin doesn't enter the parent email field
    When I enter a student's information as name: "James Bond", school id: "12345", date of birth: "12/07/2021", parent email: ""
    Then I should see: "Parent email was not specified."
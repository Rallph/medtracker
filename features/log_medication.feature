Feature:

  As a nurse
  I want to log when I distribute medication to a student including medication name, dosage, and date/time given
  So that I can add to a student's history of distributed medication

  Background: Nurses, students, and medications have been added to MedMonitor

    Given the following Nurses have been added to MedMonitor:
      | full_name               | school_id
      | Sally Milbert           | 1

    And the following Students have been added to MedMonitor:
      | full_name               | school_id
      | John Doe                | 1
      | Jane Doe                | 1

    And I am on the Administer Medication page

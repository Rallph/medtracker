Feature:
  As a parent/guardian
  I want to view and edit my child's medication consent form
  So that I can control what medication my child takes

  Background:
    Given the following parents have been added to MedTracker:
      | full_name               | email                      | password     | school_id |
      | John Smith              | johnsmith1@icloud.com      | 123456       | 1         |

    And the following students have been added to MedTracker:
      | full_name               | date_of_birth              | school_id    |
      | Danny Smith             | 08-24-2011                 | 1            |

    And the following school medications have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id |
      | Ibuprofen               | 30                         | tablets      | 1         |
      | Aspirin                 | 25                         | tablets      | 1         |
      | Tylenol                 | 250                        | mL           | 1         |
      | Benadryl                | 15                         | tablets      | 1         |

    And the following student medications have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id | student_id  |
      | Clarinex                | 30                         | tablets      | 1         | 1           |
      | Astelin                 | 25                         | tablets      | 2         | 1           |
      | Optivar                 | 250                        | mL           | 1         | 1           |
      | Elestat                 | 15                         | tablets      | 2         | 1           |

    And student "1" has been approved for the following school medications: "1,3"

    And student "1" has been approved for the following student medications: "1,2,3"

    And I log in as a "parent" with email: "johnsmith1@icloud.com" and password: "123456"
    And I visit the consent form page

  Scenario: Parent visits the medication consent form page
    Then I should see "Danny Smith" in the page title
    And I should see "Ibuprofen,Tylenol" approved in the school medication table
    And I should see "Aspirin,Benadryl" non-approved in the school medication drop down
    And I should see "Clarinex,Astelin,Optivar" approved in the student medication table
    And I should see "Elestat" non-approved in the student medication drop down

  Scenario: Parent approves a medicine



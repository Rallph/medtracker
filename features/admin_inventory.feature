Feature:

  As an administrator
  I want to view all of the medications in stock at my school
  So that I can efficiently monitor the school medications in stock

  Background:
    Given the following districts have been added to MedMonitor:
      | district_name |
      | ICCSD         |
      | CRCSD         |
    And the following schools have been added to MedMonitor:
      | school_name   | district_id   |
      | kate wickham elementary  | 1  |
      | cedar central elementary | 2  |

    And the following "Administrators" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | John Smith              | johnsmith1@icloud.com      | 123456       | 1         |
      | Dan Faulk               | danfaulk@gmail.com         | 123456       | 2         |

    And the following students have been added to MedMonitor:
      | full_name               | date_of_birth              | school_id    |
      | Danny Bishop            | 08-24-2011                 | 1            |
      | Margie Jenkins          | 04-23-2010                 | 2            |

    And the following "school_medications" have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id |
      | Ibuprofen               | 30                         | tablets      | 1         |
      | Ibuprofen               | 25                         | tablets      | 2         |
      | Tylenol                 | 250                        | mL           | 1         |
      | Benadryl                | 15                         | tablets      | 2         |

    And the following "student_medications" have been added to inventory:
      | medication_name         | quantity                   | unit         | school_id | student_id  |
      | Ibuprofen               | 30                         | tablets      | 1         | 1           |
      | Ibuprofen               | 25                         | tablets      | 2         | 2           |
      | Tylenol                 | 250                        | mL           | 1         | 1           |
      | Benadryl                | 15                         | tablets      | 2         | 2           |

    Scenario: Admin logs in then goes to inventory
      When I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "123456"
      And I view "administrator" medication inventory
      Then I should see: "Admin Inventory"

    Scenario: Admin view school medication inventory
      When I log in as a "administrator" with email: "johnsmith1@icloud.com" and password: "123456"
      And I view "administrator" medication inventory
      Then I should only see medications belonging to school_name: "kate wickham elementary school"


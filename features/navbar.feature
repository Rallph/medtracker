Feature:

  As a User
  I want to use the navigation bar
  So that I can navigate to my current homepage or log out

  Background: Users Have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | Bob Rogers              | bobby_r@gmail.com          | pa$$word     | 12        |

#    And the following "Administrators" have been added to MedMonitor:
#      | full_name               | email                      | password     | school_id |
#      | John Smith              | johnsmith1@icloud.com      | password1    | 12        |

#    And the following "Parents" have been added to MedMonitor:
#      | full_name               | email                      | password     | school_id |
#      | John Davis              | johndavis1@yahoo.com       | password2    | 17        |

#    And  I am on the MedMonitor home page

  Scenario: On the homepage
    When I am on the MedMonitor home page
    Then I should not see login information or logout option

  Scenario: On the nurse homepage
    When I log in as a "nurse" with email: "bobby_r@gmail.com" and password: "pa$$word"
    Then I should see 'Nurse logged in as "bobby_r@gmail.com"' and logout option

  Scenario: Logout as nurse
    When I log in as a "nurse" with email: "bobby_r@gmail.com" and password: "pa$$word"
    And I press the logout button
    Then I should be redirected to the MedMonitor home page
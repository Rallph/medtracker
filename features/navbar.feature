Feature:

  As a User
  I want to use the navigation bar
  So that I can navigate to my current homepage or log out

  Background: Users Have been added to MedMonitor

    Given the following "Nurses" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | Bob Rogers              | bobby_R@gmail.com          | pa$$word     | 12        |
      | Sally Milbert           | s-milbert@hotmail.com      | PassWord     | 14        |

    And the following "Administrators" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | John Smith              | johnsmith1@icloud.com      | password1    | 12        |

    And the following "Parents" have been added to MedMonitor:
      | full_name               | email                      | password     | school_id |
      | John Davis              | johndavis1@yahoo.com       | password2    | 17        |

    And  I am on the MedMonitor home page

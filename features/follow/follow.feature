Scenario: User A is following user B
    Given I am logged in user A account
    And I follow user B
    When I log in user B account
    And I access my store
    And I click followers
    Then I see that user A is following me

    Scenario: Number of followers
    Given I am logged in user B account
    And user A follows my store
    When I access my store
    Then I see that I have at least one follower

    Scenario: User A is not following user B
    Given I am logged in user A account
    And I do not follow user B
    When I access my store
    And I click following
    Then I see that I am not following user B
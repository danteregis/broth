Feature: Send an invite
  In order to have friends use the site
  A user
  Should be able to send invites
  
  Background:
    Given site settings have been enabled for "beta_invites"
  
  Scenario: A user sends an invite
    Given I am signed up and signed in as "email@person.com/password"
    When I go to the new invite page
    And I fill in "email" with "joe@myfriend.com"
    And I press "Send Invite"
    Then I should see "Your invite has been sent"
  
  Scenario: A user sends an invite
    Given I am signed out
    When I go to the new invite page
    And I fill in "email" with "joe@myfriend.com"
    And I press "Request Invite"
    Then I should see "Your invite request has been sent to a site admin."
  
  
  
Feature: Integration functional testing of Redmine user rights
  As a Redmine user
  I want to be able to create projects, create issues, assign developers to issues, submit time and close issues and projects
  So I can be sure that development life cycle is correctly represented in Redmine

  Scenario: Project Admin creates a project assigns a developer to it. Developer completes task and closes it.
    Given I am not logged in visitor

    When I register 'admin' user via Redmine 'UI'
    Then I see the 'admin' user is registered
     And I become logged in as 'admin' user

    When I create a project
    Then I see that project is created on 'UI' level
     And I see that project is created on 'API' level

    When I register 'developer' user via Redmine 'API'
    Then I see the 'developer' user is registered

    When I add 'developer' user as a member of the project
    Then I can can see 'developer' user in the project member list

    When I create an issue and assign 'developer' user to created issue
    Then I see the issue is created
     And I see 'developer' user is assigned to the issue

    When I logout
    Then I am not logged in visitor

    When I login as 'developer' user
    Then I become logged in as 'developer' user

    When I track time for the assigned issue
    Then I see the time is tracked properly

    When I close the issue
    Then I see the issue was closed

    When I logout
    Then I am not logged in visitor

    When I login as 'admin' user
    Then I become logged in as 'admin' user

    When I close the project
    Then I see it was successfully closed
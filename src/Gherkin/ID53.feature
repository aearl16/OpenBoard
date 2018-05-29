Feature: Create Backlog

Background: Backlog has to be created before it can be associated with the appropriate Board. Backlogs can be assicated with other Boards for maximum flexibility. User has knowledge of the menu options.

Scenario: Create Backlog
Given User selects --Create and --Backlog options
When User hits enter key
Then a new Backlog is created in the database and user gets a message that the action has completed

Scenario: User sleects create but doesn't select --Backlog option
Given that --Create is a valid option
When User hits enter key
Then User recieves and error that does not crash the program (To Replace with Custom error messages)

Scenario: User enters and invalid command
Given user does not enter the correct command
When user hits enter key
Then help menu print onto the screen with Menu options
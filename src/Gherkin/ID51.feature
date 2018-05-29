Feature: Add Backlog

Background: User knows the menu and selects the necssary menu entries

Scenario: User selects --Add option and --Backlog with ID = 1 and Board ID = 1
Given Board and Baclog ID 1 Exists
When user hits enter key
Then Board with ID 1 gets associated with Backlog ID 1
Then User gets a printout that states the action has completed

Scenario: User selects --Add option and no --Backlog
Given Add is a valid option
When User hits enter key
Then User recieves and error that does not crash the program (To Replace with Custom error messages)

Scenario: User selects --Add and --Backlog with ID 1, 2
Given Backlog ID 1 is valid and Board ID is not valid
When user hits enter key
Then User recieves and error that does not crash the program (To Replace with Custom error messages)

Scenario: User selects --A option and --Backlog with ID = 1 and Board ID = 1
Given Board and Baclog ID 1 Exists
When user hits enter key
Then Board with ID 1 gets associated with Backlog ID 1
Then User gets a printout that states the action has completed

Scenario: User selects --Add option and --Backlog but does not enter IDs
Given Board IDs not entered
When user hits enter key
Then User recieves and error that does not crash the program (To Replace with Custom error messages)

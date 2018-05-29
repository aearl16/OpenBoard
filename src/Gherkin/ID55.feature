Feature: Delete Board

Background: Users need to be able to delete boards that are no longer needed. User has knowledge of the menu and the menu options.

Scenario: Delete Board Yes scenario
Given user enter --Delete and --Board and Board ID 1 where 1 is a valid board
When User hits enter key
Then User is prompted whether or not they want to delete the board
When y or Y is entered
Then The board is deleted and the user Gets a message that the action is completed

Scenario: Delete Board No scenario
Given user enter --Delete and --Board and Board ID 1 where 1 is a valid board
When User hits enter key
Then User is prompted whether or not they want to delete the board
When n or N is entered
Then The board is deleted and the user Gets a message that the action is canceled

Scenario: Delete Board that doesn't exist
Given user enter --Delete and --Board and Board ID where the ID does not exists
When User hits the enter key
Then the user is prompted whether or not they want to delete the board
When y or Y is entered
Then an error is thrown that does not crash the program (Custome error messages to be added)

Scenario: Delete Board missing ID
Given user enter --Delete and --Board and Board ID where the ID is missing
When User hits the enter key
Then an error is thrown that does not crash the program (Custome error messages to be added) 
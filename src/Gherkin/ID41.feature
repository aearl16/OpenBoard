Feature: Create Board

Background: User already has the program set up and knows the command line options

Scenario: Create new board
Given User types option --Create and then --Board
When User presses enter
Then User gets success method if creation was successful

Scenario: Print all boards
Given User types option --ShowAll or --SA and then --Board
When User presses enter
Then user gets a listing of boards and their information

Scenario: User types command wrong
Given whatever option the user types in
When enter key is pressed
Then help menu is printed

Scenario: User types a partial command
Given whatever option the user types in
When enter key is pressed
Then help menu is printed
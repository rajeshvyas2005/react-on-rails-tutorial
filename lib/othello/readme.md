## INTRODUCTION
Simulate the game of Bowling(Play).Current implemented game can be played by a
single player without any error. All input are standard input.

# HOW TO PLAY BOWLING AND ITS RULE CHECK WIKI
Please check wiki links for full description.
https://en.wikipedia.org/wiki/Ten-pin_bowling

## READ CAREFULLY
This game I have implemented as per Bowling rule.
ADDITIONAL RULE-
RULE 1- Second row of each frame will show score of the frame.
RULE 2- If Strike, Spare occur then score of previous frame will update too.
RULE 3- Each time board will redraw however in final draw it will update all
RULE 4- There is always shown count of knocked pin down number not symbol like 'X', '/', '-' etc.
individual frame score.

# ENVIRONMENT
To run this program you should have sufficient permission to execute file.
Rails Version - Rails 5.1.4
Ruby Version - ruby 2.5.0p0

FILE EXECUTION(PLAYING START)-
- Download file bowling_game.rb
- Download file bowling.rb
- Put them into your project lib directory
- Execute the file by just typing `ruby bowling.rb`
- Enter the input and see if it goes smoothly

TODO:
- Write RSpec data for the game to check all cases.
- Create API to use these lib files.
- Implement with simple GUI with bootstrap and display symbol instead knocked pin number.

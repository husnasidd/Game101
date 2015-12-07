Feature: View your score
  As a player
  So that I can know how of my answers are correct
  I want to see my score
  
Background: questions have been added to database

    Given the following categories exist:
    | category   | prompt               | answer   | image        |
    | Shapes     | What shape is this?  | circle   | circle.png   |
    | Shapes     | What shape is this?  | triangle | triangle.png |
    | Shapes     | What shape is this?  | square   | square.png   |
    | Animals    | What animal is this? | dog      | dog.gif      |
    | Animals    | What animal is this? | cat      | cat.jpg      |
    | Animals    | What animal is this? | fish     | fish.jpg     |
    | Colors     | What color is this?  | blue     | blue.png     |
    | Colors     | What color is this?  | pink     | pink.png     |
    | Colors     | What color is this?  | green    | green.png    |

Scenario: Sad Path for ending a Game
  Given I am done with the quiz
  Then I should not see three answer choices
  And I should see "Start New Game"

Scenario: Seeing a Score 
  Given I am done with the quiz
  Then I should see "That was a wonderful game!"
  Then I should see "Score:"
  Then I should see "Start New Game"

Scenario: Starting a new Game
  Given I am done with the quiz
  Then I should see a link "Start New Game"
  When I follow "Start New Game"
  Then I should see "All Categories"
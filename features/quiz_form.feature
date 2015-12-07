Feature: Submit an answer 
  As a player
  So that I can play the game 
  I want to submit an answer 
  
Background: questions have been added to database

    Given the following categories exist:
    | category   | prompt               | answer   |  
    | Shapes     | What shape is this?  | circle   |
    | Shapes     | What shape is this?  | triangle |
    | Shapes     | What shape is this?  | square   |
    | Animals    | What animal is this? | dog      | 
    | Animals    | What animal is this? | cat      |
    | Animals    | What animal is this? | fish     |
    | Colors     | What color is this?  | blue     | 
    | Colors     | What color is this?  | pink     |
    | Colors     | What color is this?  | green    |
    

Scenario: Submiting an answer 
  When I am taking the quiz 
  When I select an answer 
  When I press "Submit"
  Then I should see feedback
  
  
  
  
    

Feature: Display an image
  As a player
  So that I can guess an answer
  I want to see an image
  
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
    

Scenario: Seeing a Color image 
  Given I am on the categories page
  When I follow "Questions on Colors"
  Then I should see an image
  
Scenario: Seeing an Animal image 
  Given I am on the categories page
  When I follow "Questions on Animals"
  Then I should see an image
  
Scenario: Seeing a Shape image 
  Given I am on the categories page
  When I follow "Questions on Shapes"
  Then I should see an image
  

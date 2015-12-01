# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = [{:category => "Colors", :image => "blue.png", :prompt=> "What color is this?", :answer => "blue"},
          {:category =>"Colors", :image => "green.png", :prompt=> "What color is this?", :answer => "green"},
          {:category => "Colors", :image => "pink.png", :prompt=> "What color is this?", :answer => "pink"},
          {:category =>"Colors", :image => "yellow.png", :prompt=> "What color is this?", :answer => "yellow"},
          {:category => "Colors", :image => "white.png", :prompt=> "What color is this?", :answer => "white"},
          {:category =>"Colors", :image => "black.png", :prompt=> "What color is this?", :answer => "black"},
    	  {:category => "Shapes", :image => 'circle.png', :prompt=> "What shape is this?", :answer => "circle"},
    	  {:category => "Shapes", :image => 'triangle.png', :prompt=> "What shape is this?", :answer => "triangle"},
    	  {:category => "Shapes", :image => 'square.png', :prompt=> "What shape is this?", :answer => "square"},
    	  {:category => "Shapes", :image => 'rectangle.png', :prompt=> "What shape is this?", :answer => "rectangle"},
    	  {:category => "Shapes", :image => 'diamond.png', :prompt=> "What shape is this?", :answer => "diamond"},
    	  {:category => "Shapes", :image => 'star.png', :prompt=> "What shape is this?", :answer => "star"},
    	  {:category => "Shapes", :image => 'heart.png', :prompt=> "What shape is this?", :answer => "heart"},
    	  {:category => "Animals", :image => 'dog.png', :prompt=> "What animal is this?", :answer => "dog"},
    	  {:category => "Animals", :image => 'cat.png', :prompt=> "What animal is this?", :answer => "cat"},
    	  {:category => "Animals", :image => 'fish.png', :prompt=> "What animal is this?", :answer => "fish"},
    	  {:category => "Animals", :image => 'dinosaur.png', :prompt=> "What animal is this?", :answer => "dinosaur"},
    	  {:category => "Animals", :image => 'bird.png', :prompt=> "What animal is this?", :answer => "bird"},
    	  {:category => "Animals", :image => 'chicken.png', :prompt=> "What animal is this?", :answer => "chicken"},

  	 ]

questions.each do |question|
  Question.create!(question)
end

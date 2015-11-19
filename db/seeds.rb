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
    	  {:category => "Shapes", :image => 'link', :prompt=> "What shape is this?", :answer => "circle"},
    	  {:category => "Shapes", :image => 'link', :prompt=> "What shape is this?", :answer => "triangle"},
    	  {:category => "Shapes", :image => 'link', :prompt=> "What shape is this?", :answer => "square"},
    	  {:category => "Shapes", :image => 'link', :prompt=> "What shape is this?", :answer => "rectangle"},
    	  {:category => "Animals", :image => 'link', :prompt=> "What animal is this?", :answer => "dog"},
    	  {:category => "Animals", :image => 'link', :prompt=> "What animal is this?", :answer => "cat"},
    	  {:category => "Animals", :image => 'link', :prompt=> "What animal is this?", :answer => "fish"},
  	 ]

questions.each do |question|
  Question.create!(question)
end

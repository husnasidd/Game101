require 'spec_helper'
require 'rails_helper'
require 'questions_controller'

describe "Routes", :type => :routing do
    
#get '/questions/id' => 'questions#show'
  it "routes /questions/id to questions#show" do
    expect(get: "/questions/id").to route_to(
      controller: "questions",
      action: "show",
      id: "id"
    )
    end
    
#post '/questions/id' => 'questions#show'
  it "routes /questions/id to questions#show" do
    expect(post: "/questions/id").to route_to(
      controller: "questions",
      action: "show"
    )
    end
    
#get 'questions/id/categories' => 'questions#categories'  
  it "routes /questions/id/categories to questions#categories" do
    expect(get: "/questions/id").to route_to(
      controller: "questions",
      action: "show",
      id: "id"
    )
    end
    
#post 'questions/answer/id' => 'questions#check_answer'
    it "routes /questions/id/categories to questions#categories" do
    expect(post: "/questions/id").to route_to(
      controller: "questions",
      action: "show"
    )
    end
    

end

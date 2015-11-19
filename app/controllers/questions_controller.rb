class QuestionsController < ApplicationController
     attr_accessor :all_categories
    
    def show
        session[:category] = params[:category]
        @all_questions = Question.where(category: session[:category])
        @question = @all_questions.sample
        @answer = @question.answer
        session[:answer] = @answer
        
        optionsArray = @all_questions.uniq.pluck(:answer)
        @option1 = optionsArray.sample
        @option2 = optionsArray.sample
        while @option1 == @answer
            @option1 = optionsArray.sample
        end

        while(@option1 == @option2 || @option2 == @answer)
            @option2 = optionsArray.sample
        end

        @answerChoices = Array.new
        @answerChoices.push(@answer)
        @answerChoices.push(@option1)
        @answerChoices.push(@option2)
        @answerChoices.shuffle
        session[:all_answers] = @answerChoices
    end
    
    
    def categories
        @all_categories = get_all_categories
    end
    
    def index
        @all_categories = get_all_categories
    end
    
    def get_all_categories
        @all_categories = Question.uniq.pluck(:category)
        return @all_categories
    end

    
    def check_answer
        if(params[:answer] == session[:answer])
            flash[:notice] = "Correct"
            
        else
            flash[:notice] = "Incorrect"
        end
    end
    
    
    
end

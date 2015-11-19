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
        session[:game_counter] = 0
        session[:correct_counter] = 0
        session[:incorrect_counter] = 0
        @all_categories = get_all_categories
    end
    
    def index
        reset_session
        @all_categories = get_all_categories
    end
    
    def get_all_categories
        reset_session
        @all_categories = Question.uniq.pluck(:category)
        return @all_categories
    end

    def check_answer
        @numberOfQuestions = 5
        #When you fist start game_counter will be nil so you need to set to 0
        if session[:game_counter] == nil
            session[:game_counter] = 0
            session[:correct_counter] = 0
            session[:incorrect_counter] = 0
        end
        
        if session[:game_counter] >= 5 
            session[:game_counter] = 0
        end
        
        # set flash early so it can say game is over at the end of the 5th attempt
        if session[:game_counter] == 4
            flash.now[:warning] = "Game Over! #{view_context.link_to('View your result summary', questions_game_id_path)}".html_safe
        end
        
        if(params[:answer] == session[:answer])
            flash[:notice] = "Correct"

            session[:correct_counter] = session[:correct_counter] + 1
            session[:game_counter] = session[:game_counter] + 1

        else
            flash[:notice] = "Incorrect"
            session[:incorrect_counter] = session[:incorrect_counter] + 1
            session[:game_counter] = session[:game_counter] + 1
        end
    end
    
    def end_game
        @numberOfQuestions = 5
    end
    
end

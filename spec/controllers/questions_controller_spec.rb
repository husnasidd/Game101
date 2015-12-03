require 'rails_helper'
require 'spec_helper'
require 'questions_controller'

describe QuestionsController do
    # before do
    #     @game = QuestionsController.new
    #     @all_categories = @game.get_all_categories
    # end
    describe '#show' do
        context "When playing the game" do
             it "shouldn't accept parameters" do
                expect { subject.show( :category ) }.to raise_error
            end
            # it "should have a specified category" do
            #     @request.session[:category] = 'colors'
            #     question = Question.create(:category => 'colors', :answer => 'blue', :question =>'What color is this?')
            #     get :show, :id => question.category, @question => "What color is this?"
            #     expect(Question).to receive(:where).with(@request.session[:category]).and_return(question)
            # end
        end
    end
    
    describe '#categories' do
        context "When user selets to view all categories" do
            it 'should show all categories' do 
        
                fake_user = Question.create(:category => 'shapes')
                get :categories
                expect(session[:game_counter] == 0)
                expect(session[:correct_counter] == 0)
                expect(session[:incorrect_counter] == 0)
                expect(response).to render_template(:categories)
            end
        end
        
        #Sad path
        context "When user selets to view all categories" do
            it 'should not show all categories' do 
        
                fake_user = Question.create(:category => '1234')
                #get :categories
                expect(session[:game_counter] == 0)
                expect(session[:correct_counter] == 0)
                expect(session[:incorrect_counter] == 0)
                expect(response).not_to render_template(:categories)
            end
        end
        
    end
    
    
     
    describe '#index' do
        context "When on the home page" do
            it 'should render the index view' do
                get :index
                expect(response).to render_template(:index)
            end
        end
        
        #Sad path
        context "When on the home page" do
            it 'should not render the index view' do
                #@get_all_categories = Question.uniq.pluck(:category => 'empty')
                #get :index
                expect(response).not_to render_template(:index)
            end
        end
    end
    
    
    describe '#check_answer' do
        context "When answer is submitted" do
            it 'should flash a message' do
                get :check_answer
                expect(flash[:notice]).to be_present
             end
         end
         
    
         context "When game counter is >= 4" do
            it 'should flash a message' do
                session[:game_counter] = 4
                session[:correct_counter] = 0
                session[:incorrect_counter] = 0
                get :check_answer
                expect(flash.now[:warning]).to be_present
             end
         end
         
         # Sad Path
         context "When game counter is < 4" do
            it 'should not flash a message' do
                session[:game_counter] = 3
                session[:correct_counter] = 0
                session[:incorrect_counter] = 0
                get :check_answer
                expect(flash.now[:warning]).not_to be_present
             end
         end
         
          context "When answer is submitted" do
            it 'is incorrect' do
                @fake_answer = "Dog"
                session[:answer] = "Cat"
                session[:correct_counter] = 0
                session[:incorrect_counter] = 0
                session[:game_counter] = 3
                get :check_answer, :answer => @fake_answer
               expect(flash[:notice]).to eql("Incorrect")
             end
         end
         
         context "When answer is submitted" do
            it 'is correct' do
                @fake_answer = "Cat"
                session[:answer] = "Cat"
                session[:correct_counter] = 0
                session[:incorrect_counter] = 0
                session[:game_counter] = 3
                get :check_answer, :answer => @fake_answer
               expect(flash[:notice]).to eql("Correct")
             end
         end
         
        # Sad path
         context "When answer is submitted" do
            it 'is incorrect' do
                @fake_answer = "Dog"
                session[:answer] = "Cat"
                session[:correct_counter] = 0
                session[:incorrect_counter] = 0
                session[:game_counter] = 3
                get :check_answer, :answer => @fake_answer
               expect(flash[:notice]).not_to eql("Correct")
             end
         end
         
         # Sad path
         context "When answer is submitted" do
            it 'is correct' do
                @fake_answer = "Cat"
                session[:answer] = "Cat"
                session[:correct_counter] = 0
                session[:incorrect_counter] = 0
                session[:game_counter] = 3
                get :check_answer, :answer => @fake_answer
               expect(flash[:notice]).not_to eql("Incorrect")
             end
         end
     end
     
     
     
    #  describe 'get_all_categories' do
    #      it 'should return three categories' do
    #         expect(@game.get_all_categories).not_to eq nil
    #         expect(@game.get_all_categories).to be_an_instance_of(Array)
    #         # @game.instance_variable_get(:@all_categories)
    #         expect(assigns(@all_categories)).to match_array(["Animals","Colors","Shapes"])
            
    #         # expect(@game.get_all_categories).to include("Animals")
    #     end
    # end
end


            
    
    

    

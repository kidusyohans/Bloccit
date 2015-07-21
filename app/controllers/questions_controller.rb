class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def create
      @question = Question.new(question_params)
      
      if @question.save
          redirect_to @question, notice: "Your question was saved"
      else
          flash[:error] = "Your quesiton failed to create."
          redirect_to questions_path
      end
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def update
      @question = Question.find(params[:id])
      
      if @question.update_attributes(question_params)
          redirect_to @question, notice: "Question updated succesfully"
      else
          flash[:error] = "Something went wrong"
          render :edit
      end
  end
  
  def resolved 
    @question = Question.resolved
  end
  
  private
  
  def question_params
      params.require(:question).permit(:title, :body, :resolved)
  end
end

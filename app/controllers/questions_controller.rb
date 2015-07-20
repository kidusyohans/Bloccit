class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
  end

  def new
    @questions = Question.new
  end

  def edit
    @questions = Question.find(params[:id])
  end
  
  def resolved 
    @questions = Question.resolved
  end
end

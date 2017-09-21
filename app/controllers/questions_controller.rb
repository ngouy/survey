class QuestionsController < ApplicationController

  def index
    render json: Question.all.map, include: :answers
  end

  def show
    render json: Question.where(id: params[:id]).first, include: :answers
  end

  def sub_tree
    render json: Question.find(params[:id]).sub_tree
  end

end

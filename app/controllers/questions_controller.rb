class QuestionsController < ApplicationController

  def index
    render json: Question.all.map, include: :answers
  end

  def show
    render json: Question.where(id: params[:id]).first, include: :answers
  end

end

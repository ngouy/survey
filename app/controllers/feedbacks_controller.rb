class FeedbacksController < ApplicationController

  def index
    render json: Feedback.all.map, include: :choices
  end

  def show
    render json: Feedback.where(id: params[:id]).first, include: :answers
  end

end
class FeedbacksController < ApplicationController

  def index
    render json: Feedback.all
  end

  def show
    render json: Feedback.where(id: params[:id]).eager_load(:choices).first, include: [:answers, :choices]
  end

end
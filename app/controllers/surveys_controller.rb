class SurveysController < ApplicationController

  def index
    render json: Survey.all.map
  end

  def show
    render json: Survey.where(id: params[:id]).first, include: :questions
  end

end
class SurveysController < ApplicationController

  def index
    render json: Survey.all.map
  end

  def show
    render json: Survey.where(id: params[:id]).first, include: :questions
  end

  def tree
    render json: Survey.find(params[:id]).ordered_questions.first.sub_tree
  end

end
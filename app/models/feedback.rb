class Feedback < ApplicationRecord

  belongs_to :survey
  has_many   :choices

  validates_presence_of :survey_id

  def new_answer(answer)
    Choice.create!(feedback: self, answer: answer)
  end

  def next_question
    Choice.all
          .joins(answer: :question)
          .order("questions.position DESC")
          .last
          .answer
          .next_question
  end


end
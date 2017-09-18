class Feedback < ApplicationRecord

  belongs_to :survey
  has_many   :choices

  validates_presence_of :survey_id

  def completed?
    !!self.completed_at
  end

  def new_answer(answer)
    Choice.create!(feedback: self, answer: answer)
    if answer.is_leaf?
      self.update_attributes(completed_at: DateTime.now)
    else
      self.update_attributes(completed_at: nil)
    end
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
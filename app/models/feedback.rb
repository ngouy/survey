class Feedback < ApplicationRecord

  belongs_to :survey
  has_many   :choices
  has_many   :answers, through: :choices

  validates_presence_of :survey_id

  def completed?
    !!self.completed_at
  end

  def new_answer(answer)
    self.choices << Choice.create!(feedback: self, answer: answer)
    if answer.is_leaf?
      self.update_attributes(completed_at: DateTime.now)
    else
      self.update_attributes(completed_at: nil)
    end
  end

  def next_question
    return survey.ordered_questions.first if self.choices.empty?
    self.choices
        .joins(answer: :question)
        .order("questions.position DESC")
        .first
        .answer
        .next_question
  end


end
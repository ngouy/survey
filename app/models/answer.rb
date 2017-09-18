class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :next_question, foreign_key: :next_question_id, class_name: Question, optional: true

  # Not relevant but existing relationships. Can be usefull for some statistics
  # has_many   :choices
  # has_many   :feedbacks, through :choices

  validates_presence_of :question_id, :text
  validates :text, uniqueness: { scope: :question_id }

  def is_leaf?
    return !next_question
  end

end
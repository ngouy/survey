class Choice < ApplicationRecord

  belongs_to :feedback
  belongs_to :answer

  validates_presence_of :feedback_id, :answer_id
  validates :answer, uniqueness: { scope: :survey_id }

end
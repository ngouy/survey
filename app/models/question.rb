class Question < ApplicationRecord

  belongs_to :survey
  has_many   :answers

  validates_presence_of :survey_id, :text
  validates :text, uniqueness: { scope: :survey_id }

end
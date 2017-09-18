class Feedback < ApplicationRecord

  belongs_to :survey
  has_many   :choices

  validates_presence_of :survey_id, :text

end
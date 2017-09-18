class Survey < ApplicationRecord

  has_many :questions
  has_many :feedbacks

  validates :name, presence: true, uniqueness: true

end
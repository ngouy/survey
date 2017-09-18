class Survey < ApplicationRecord

  has_many :questions
  has_many :feedbacks

  has_many :ordered_questions, -> { order('position ASC') }, class_name: Question

  validates :name, presence: true, uniqueness: true

  def add_question(text, position: nil)
    Question.create!(survey: self, text: text, position: position)
  end

  def add_questions(questions)
    questions.each { |question| add_question(question) }
  end

end
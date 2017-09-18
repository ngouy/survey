class Question < ApplicationRecord

  belongs_to :survey
  has_many   :answers

  validates_presence_of :survey_id, :text
  validates :text,     uniqueness: { scope: :survey_id }
  validates :position, uniqueness: { scope: :survey_id }

  before_validation do
    ActiveRecord::Base.transaction do
      self.position ||= survey.ordered_questions.last.try(:position).to_i + 1
      ActiveRecord::Base.connection.execute('SET CONSTRAINTS unique_survey_id_and_position_on_questions DEFERRED')
      ActiveRecord::Base.connection.execute("UPDATE questions SET position = position + 1 WHERE position >= #{self.position} AND survey_id = '#{self.survey_id}'")
    end
  end

  def add_answer(text, next_question_id: nil)
    Answer.create!(question: self, text: text, next_question_id: next_question_id)
  end

  def add_answers(answers)
    answers.each { |answer| add_answer(answer) }
  end

  def switch_position(question)
    return if question.survey_id != self.survey_id
    ActiveRecord::Base.transaction do
      ActiveRecord::Base.connection.execute('SET CONSTRAINTS unique_survey_id_and_position_on_questions DEFERRED')
      old_position = self.position
      self.position = question.position
      question.position = old_position
      self.save!
      question.save!
    end
  end

  def self.switch_position(question_1, question_2)
    question_1.switch_position(question_2)
  end

end
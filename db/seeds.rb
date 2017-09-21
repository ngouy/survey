# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



survey = Survey.create!(name: "Test Survey")

def get_question(answer_id, depth, survey, answer_count=nil)
  answer_count ||= rand(5 - depth)
  return nil if answer_count == 0
  question = survey.add_question("question_#{depth}_from_answer#{answer_id}")
  [answer_count, 2].max.times do |index|
    answer = question.add_answer "question_#{question.id}_answer_#{index}"
    answer.next_question = get_question(answer.id, depth + 1, survey)
    answer.save!
  end
  question
end

get_question("first_question", 0, survey, 4)

10.times do
  feedback = Feedback.create!(survey: survey)
  while feedback.next_question do
    feedback.new_answer(feedback.next_question.answers.to_a.sample)
  end
end



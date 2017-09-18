# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

survey = Survey.create!(name: "Test Survey")

survey.add_questions([
  "question_0",
  "question_1",
  "question_2",
  "question_3",
]);

questions = survey.ordered_questions

3.times do |question_index|
  4.times { |index| questions[question_index].add_answer("question_#{question_index}_answer_#{index}", next_question_id: questions[question_index + 1].id) }
end

4.times { |index| questions[3].add_answer "question_3_answer_#{index}" }

# make the last first question's answer a leaf
questions.first.answers.last.update_attributes(next_question_id: nil)


10.times do
  feedback = Feedback.create!(survey: survey)
  while feedback.next_question do
    feedback.new_answer(feedback.next_question.answers.to_a.sample)
  end
end



# README

- git clone this repo
- use ruby 2.4.1 (`$> rvm use ruby-2.4.1`)
- `$> bundle install`
- `$> rake db:create ; rake  db:migrate ; rake  db:seed`
- `$> rails s`
- there are 8 enpoints
  - app/feedbacks(/:feedback_id)
  - app/surveys(/:survey_id)
  - app/questions(/:question_id)
  - app/survey_trees/:survey_id
  - app/question_sub_trees/:question_id

There are some instance/class methods to create/update surveys/questionnary and answers.

A user answer a survey through Feedback model (none but Feedback model's methods are used as a user interface)

The seed file isn't appropriate, but I populate the databse in order to have data to display through API

I ran out of time to did this API with JSON API spec, but ideally it must be done with it.
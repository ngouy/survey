class CreateSurveys < ActiveRecord::Migration[5.0]

  def change

    create_table :surveys, id: :uuid do |t|
      t.text :name, null: false

      t.timestamps
    end

    create_table :questions, id: :uuid do |t|
      t.uuid    :survey_id,    null: false
      t.string  :text,         null: false

      t.timestamps
    end
    add_foreign_key :questions, :surveys

    create_table :answers, id: :uuid do |t|
      t.uuid    :question_id, null: false
      t.uuid    :next_question_id
      t.string  :text,        null: false

      t.timestamps
    end
    add_foreign_key :answers, :questions
    add_foreign_key :answers, :questions, column: :next_question_id

    create_table :feedbacks, id: :uuid do |t|
      t.uuid :survey_id

      t.timestamps
    end
    add_foreign_key :feedbacks, :surveys

    create_table :choices, id: :uuid do |t|
      t.uuid :feedback_id
      t.uuid :answer_id

      t.timestamps
    end
    add_foreign_key :choices, :feedbacks
    add_foreign_key :choices, :answers

  end


end
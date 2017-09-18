class CreateSurveys < ActiveRecord::Migration[5.0]

  def change

    create_table :surveys, id: :uuid do |t|
      t.text :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_table :questions, id: :uuid do |t|
      t.uuid    :survey_id,    null: false
      t.string  :text,         null: false

      t.timestamps
    end
    add_foreign_key :questions, :surveys
    add_index :questions, [:survey_id, :text], unique: true

    create_table :answers, id: :uuid do |t|
      t.uuid    :question_id, null: false
      t.uuid    :next_question_id
      t.string  :text,        null: false

      t.timestamps
    end
    add_foreign_key :answers, :questions
    add_foreign_key :answers, :questions, column: :next_question_id
    add_index :answers, [:text, :question_id], unique: true

    create_table :feedbacks, id: :uuid do |t|
      t.uuid :survey_id, null: false

      t.timestamps
    end
    add_foreign_key :feedbacks, :surveys

    create_table :choices, id: :uuid do |t|
      t.uuid :feedback_id, null: false
      t.uuid :answer_id,   null: false

      t.timestamps
    end
    add_foreign_key :choices, :feedbacks
    add_foreign_key :choices, :answers
    add_index :choices, [:feedback_id, :answer_id], unique: true

  end


end
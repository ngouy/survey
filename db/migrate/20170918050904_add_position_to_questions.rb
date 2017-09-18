class AddPositionToQuestions < ActiveRecord::Migration[5.0]

  CONSTRAINT_NAME = "unique_survey_id_and_position_on_questions"

  def up
    add_column :questions, :position, :integer, null: false

    execute <<-EOSQL
      ALTER TABLE questions
      ADD CONSTRAINT #{CONSTRAINT_NAME}
      UNIQUE (survey_id, position)
      DEFERRABLE INITIALLY IMMEDIATE;
    EOSQL
  end

  def down
    execute <<-EOSQL
      ALTER TABLE questions
      DROP CONSTRAINT #{CONSTRAINT_NAME}
    EOSQL

    remove_column :questions, :position
  end

end

class AddCompletedAtToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :completed_at, :datetime
  end
end

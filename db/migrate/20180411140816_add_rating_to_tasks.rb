class AddRatingToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :rating, :integer
  end
end

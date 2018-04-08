class ChangeStateFromIntegerToStringFromTasks < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :state, :string
  end
end

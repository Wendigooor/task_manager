class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.references :assignee, index: true, foreign_key: { to_table: :users }
      t.references :family, index: true
      t.time :estimate
      t.integer :state
      t.boolean :public, default: true
      t.string :description

      t.timestamps
    end
  end
end

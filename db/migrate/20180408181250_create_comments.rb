class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.string :body
      t.integer :commentable_id
      t.string :commentable_type
      t.references :task, index: true

      t.timestamps
    end
  end
end

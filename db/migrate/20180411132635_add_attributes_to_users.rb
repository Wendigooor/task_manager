class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :birthday, :date
    add_column :users, :address, :string
    add_column :users, :avatar, :string
  end
end

class DropTableRole < ActiveRecord::Migration[5.1]
  def up
    drop_table :roles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

class FixCategorizations < ActiveRecord::Migration
  def up
    remove_column :categorizations, :user_id, :integer, null: false
    add_column :categorizations, :logo_id, :integer, null: false
  end

  def down
    add_column :categorizations, :user_id, :integer, null: false
    remove_column :categorizations, :logo_id, :integer, null: false
  end
end

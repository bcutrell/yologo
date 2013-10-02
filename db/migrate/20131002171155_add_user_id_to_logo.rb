class AddUserIdToLogo < ActiveRecord::Migration
  def change
    add_column :logos, :user_id, :integer
  end
end

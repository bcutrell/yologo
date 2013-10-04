class AddStateToLogo < ActiveRecord::Migration
  def change
    add_column :logos, :state, :string
  end
end

class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.string :title, null: false
      t.string :logo, null: false
      
      t.timestamps
    end
  end
end

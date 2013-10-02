class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :logo_id, null: false
      t.text :comment
      t.integer :vote, null: false

      t.timestamps
    end
  end
end

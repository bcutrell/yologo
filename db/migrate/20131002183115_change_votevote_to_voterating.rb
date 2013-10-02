class ChangeVotevoteToVoterating < ActiveRecord::Migration
  def change
    remove_column :votes, :vote
    add_column :votes, :rating, :integer, null: false
  end
end

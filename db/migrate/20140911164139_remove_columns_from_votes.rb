class RemoveColumnsFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :user_id, :integer
    remove_column :votes, :total, :integer
  end
end

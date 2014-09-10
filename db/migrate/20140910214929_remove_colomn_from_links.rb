class RemoveColomnFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :votes, :integer, default: 0
  end
end

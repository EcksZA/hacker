class RenameColumnInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :comments, :comment
  end
end

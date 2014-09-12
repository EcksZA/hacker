class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comments
      t.integer :link_id
    end
  end
end

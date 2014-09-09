class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.integer :user_id
    end
  end
end

class AddUserIdToDonuts < ActiveRecord::Migration[5.0]
  def change
    add_column :donuts, :user_id, :integer
    add_index :donuts, :user_id
  end
end

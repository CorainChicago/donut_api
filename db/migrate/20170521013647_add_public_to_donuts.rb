class AddPublicToDonuts < ActiveRecord::Migration[5.0]
  def change
    add_column :donuts, :public, :boolean, :default => true
  end
end

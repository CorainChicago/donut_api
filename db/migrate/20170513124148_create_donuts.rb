class CreateDonuts < ActiveRecord::Migration[5.0]
  def change
    create_table :donuts do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :shop_id
      t.text :review

      t.timestamps
    end
  end
end

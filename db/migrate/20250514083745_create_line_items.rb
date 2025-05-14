class CreateLineItems < ActiveRecord::Migration[7.2]
  def change
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end
end

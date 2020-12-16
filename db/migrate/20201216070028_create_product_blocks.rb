class CreateProductBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :product_blocks do |t|
      t.string :hash
      t.string :previous_hash
      t.string :upc
      t.boolean :scanned_value

      t.timestamps
    end
  end
end

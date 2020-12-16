class RemoveScannedValueFromProductBlocks < ActiveRecord::Migration[6.0]
  def change

    remove_column :product_blocks, :scanned_value, :boolean
  end
end

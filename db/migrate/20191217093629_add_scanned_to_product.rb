class AddScannedToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :scanned, :boolean, default: false
  end
end

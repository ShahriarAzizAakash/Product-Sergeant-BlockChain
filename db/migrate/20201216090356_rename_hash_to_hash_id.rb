class RenameHashToHashId < ActiveRecord::Migration[6.0]
  def change
    rename_column :product_blocks, :hash, :hash_id
  end
end

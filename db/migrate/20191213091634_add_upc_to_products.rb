class AddUpcToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :upc, :string, presence: true, uniqueness: true, length: {maximum: 12}, numericality: {only_integer: true}
  end
end

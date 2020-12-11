class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :origin
      t.string :vendor
      t.date :expiry_date

      t.timestamps
    end
  end
end

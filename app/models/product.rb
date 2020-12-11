class Product < ApplicationRecord
    validates_uniqueness_of :upc, on: :create, message: "must be unique"
    validates_numericality_of :upc, on: :create, message: "is not a number"
end

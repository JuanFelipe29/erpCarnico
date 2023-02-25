class ProcessedProduct < ApplicationRecord
  belongs_to :name_of_products
  belongs_to :product_type
end

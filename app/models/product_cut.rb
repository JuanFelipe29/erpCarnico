class ProductCut < ApplicationRecord
  belongs_to :cut
  belongs_to :processed_products
end

class SaleDetail < ApplicationRecord
  belongs_to :sales
  belongs_to :product_cut
end

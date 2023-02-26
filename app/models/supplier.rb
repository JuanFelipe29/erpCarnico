class Supplier < ApplicationRecord
  validates :name, :nit, presence: true
  validates :nit, uniqueness: true
end

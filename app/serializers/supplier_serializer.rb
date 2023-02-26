class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :name, :nit, :email, :phone, :created_at, :updated_at
end
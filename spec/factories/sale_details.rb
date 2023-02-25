FactoryBot.define do
  factory :sale_detail do
    sales { nil }
    product_cut { nil }
    quantity { 1 }
    unit_price { 1.5 }
  end
end

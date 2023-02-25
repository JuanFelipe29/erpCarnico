FactoryBot.define do
  factory :inventory do
    product_cut { nil }
    quantity { 1 }
    waste { 1 }
    available { false }
  end
end

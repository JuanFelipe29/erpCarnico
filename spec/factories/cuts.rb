FactoryBot.define do
  factory :cut do
    piece { nil }
    cut_name { nil }
    start_date_maturation { "2023-02-25" }
    end_date_maturation { "2023-02-25" }
    maturing { false }
    available { false }
    cut_type { nil }
  end
end

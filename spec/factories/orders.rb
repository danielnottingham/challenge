FactoryBot.define do
  factory :order do
    user

    sequence(:starting_point) { |n| "Av. Oliveira Paiva, #{n}" }
    sequence(:ending_point) { |n| "Av. Washington Soares, #{n}" }
    request_time { Time.zone.now }
    estimated_value_cents { 1 }
  end
end

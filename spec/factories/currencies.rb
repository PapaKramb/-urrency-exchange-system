FactoryBot.define do
  factory :currency do
    name { "Dollar USA" }
    code { "USD" }
    prices { 70 }
  end
end

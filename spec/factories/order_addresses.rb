FactoryBot.define do
  factory :order_address do
    postcode               { '123-4567' }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    city                   { '横浜市神奈川区' }
    address1               { '鶴屋町1-1' }
    address2               { '横浜ビル101' }
    telephone              { '08012121212' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

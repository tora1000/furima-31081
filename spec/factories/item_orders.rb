FactoryBot.define do
  factory :item_order do
    post_number { '123-4567' }
    prefecture_id { 2 }
    city { '札幌' }
    address { '1-1' }
    address_buiding { '1-1' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

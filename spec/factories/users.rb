FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'Aaa000' }
    password_confirmation { password }
    first_name            { '虎太朗' }
    last_name             { '杉山' }
    first_name_kana       { 'コタロウ' }
    last_name_kana        { 'スギヤマ' }
    birthday              { '1990-01-01' }
  end
end

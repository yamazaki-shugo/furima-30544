FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { 'a123456' }
    password_confirmation { password }
    first_name_zen { '山田' }
    last_name_zen { '三郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'サブロウ' }
    birth_day { '1955/03/03' }
  end
end

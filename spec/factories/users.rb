FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name { person.first.kanji }
    family_name { person.family.kanji }
    first_name_kana { person.first.katakana }
    family_name_kana { person.family.katakana }
    birthday { Faker::Date.backward }
  end
end
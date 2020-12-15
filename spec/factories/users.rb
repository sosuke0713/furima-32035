FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"password0000"}
    # password_confirmation {password}
    familyname            {"松田"}
    family_hurigana       {"マツダ"}
    firstname             {"創介"}
    first_hurigana        {"ソウスケ"}
    birth                 {"2020-7-13"}

  end
end
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :texte_de_chat do
    type_de_texte "MyString"
    chat nil
    texte "MyString"
  end
end

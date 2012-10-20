# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :monnaie do
    iso "MyString"
    pourcent_vers_cad 1.5
  end
end

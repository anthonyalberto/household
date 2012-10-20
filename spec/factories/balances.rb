# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :balance do
    nom "MyString"
    montant_cents 1
    fini false
  end
end

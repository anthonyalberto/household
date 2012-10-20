# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mouvement do
    payeur nil
    texte "MyString"
    montant_cents 1
    type_de_mouvement nil
    fini false
    pourcent_a_facturer_a_lautre 1.5
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :balance_utilisateur do
    utilisateur nil
    montant_cents 1
    mois 1
    annee 1
  end
end

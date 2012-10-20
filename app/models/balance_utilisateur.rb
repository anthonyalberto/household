class BalanceUtilisateur < ActiveRecord::Base
  belongs_to :utilisateur
  attr_accessible :annee, :mois, :montant_cents, :utilisateur_id

  monetize :montant_cents
end

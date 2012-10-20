class MouvementRecurrent < ActiveRecord::Base
  belongs_to :payeur
  belongs_to :type_de_mouvement
  attr_accessible :fini, :frequence_manuelle, :montant_cents, :pourcent_a_facturer_a_lautre, :payeur, :type_de_mouvement

  monetize :montant_cents
end

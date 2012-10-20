class Mouvement < ActiveRecord::Base
  belongs_to :payeur, class_name: "Utilisateur"
  belongs_to :type_de_mouvement
  attr_accessible :fini, :montant, :pourcent_a_facturer_a_lautre, :texte, :payeur_id, :type_de_mouvement_id

  validates :montant, :pourcent_a_facturer_a_lautre, :payeur, :type_de_mouvement, presence: true

  monetize :montant_cents

  def self.frequences
    %W{toutes_les_deux_semaines une_fois_par_mois une_fois_tous_les_deux_mois}
  end
end

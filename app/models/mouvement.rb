class Mouvement < ActiveRecord::Base
  belongs_to :payeur, class_name: "Utilisateur"
  belongs_to :type_de_mouvement
  attr_accessible :fini, :montant_cents, :pourcent_a_facturer_a_lautre, :texte, :payeur, :type_de_mouvement

  monetize :montant_cents

  def self.options_for_frequence
    %W{toutes_les_deux_semaines une_fois_par_mois une_fois_tous_les_deux_mois}
  end
end

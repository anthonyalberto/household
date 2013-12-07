class Mouvement < ActiveRecord::Base
  belongs_to :payeur, class_name: "Utilisateur"
  belongs_to :type_de_mouvement
  belongs_to :balance
  attr_accessible :fini, :montant, :pourcent_a_facturer_a_lautre, :texte, :payeur_id, :type_de_mouvement_id, :montant_cents, :revenu, :balance_id, :pourcent_a_facturer_a_lautre

  validates :montant, :pourcent_a_facturer_a_lautre, :payeur, :type_de_mouvement, :balance, presence: true

  monetize :montant_cents

  validates :montant, numericality: {greater_than: 0}

  after_create :impact_balance
  before_validation :set_balance
  before_save :set_percentage


  def self.frequences
    %W{\  toutes_les_deux_semaines une_fois_par_mois une_fois_tous_les_deux_mois}
  end

  private

  def impact_balance

    if pourcent_a_facturer_a_lautre > 0 && !revenu
      montant_a_balancer = montant * pourcent_a_facturer_a_lautre / 100
      if payeur_id == 1
        balance.montant += montant_a_balancer
      else
        balance.montant -= montant_a_balancer
      end
      balance.save
    end

  end

  def set_balance
    Rails.logger.error("IN SET BALANCE")
    self.balance_id = Balance.current.id if new_record?
    Rails.logger.error("IN SET BALANCE #{balance_id}")
  end

  def set_percentage
    if revenu?
      self.pourcent_a_facturer_a_lautre = 0
    end
  end
end

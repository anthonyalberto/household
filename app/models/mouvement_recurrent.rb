class MouvementRecurrent < ActiveRecord::Base
  belongs_to :payeur, class_name: "Utilisateur"
  belongs_to :type_de_mouvement
  attr_accessible :frequence_manuelle, :montant, :pourcent_a_facturer_a_lautre, :payeur_id, :type_de_mouvement_id, :frequence_automatique

  monetize :montant_cents

  validates :payeur, :type_de_mouvement, :montant_cents, presence: true
  validate :check_frequency

  validates :montant, numericality: {greater_than: 0}

  private
  def check_frequency
    if frequence_manuelle.blank? && frequence_automatique.blank?
      self.errors[:base] << "Specifier une frequence automatique ou manuelle"
      return false
    elsif frequence_manuelle.present? && frequence_automatique.present?
      self.errors[:base] << "Specifier une frequence automatique ou manuelle, pas les deux"
      return false
    else
      return true
    end
  end
end

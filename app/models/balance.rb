#encoding: utf-8
class Balance < ActiveRecord::Base
  attr_accessible :fini, :montant_cents, :nom, :montant
  monetize :montant_cents

  has_many :mouvements

  def recalculate!
    self.montant = Money.new(0)
    mouvements.where("pourcent_a_facturer_a_lautre > 0").each do |mouvement|
      if mouvement.payeur_id == 1
        self.montant += mouvement.montant * mouvement.pourcent_a_facturer_a_lautre / 100
      else
        self.montant -= mouvement.montant * mouvement.pourcent_a_facturer_a_lautre / 100
      end
    end
    self.update_attribute(:montant_cents, montant_cents)
  end


  def clore!
    Mouvement.where(fini: 0).update_all(fini: 1)
    self.nom = "Balance terminée le #{Date.today}"
    self.save
    Balance.create({nom: "Balance courante", fini: 0, montant_cents: 0}, without_protection: true)
  end

  def self.current
    Balance.where(fini: false).order("id desc").first
  end

  def montant_inverse
    montant.to_f - 2*montant.to_f
  end

end

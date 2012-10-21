class Balance < ActiveRecord::Base
  attr_accessible :fini, :montant_cents, :nom, :montant
  monetize :montant_cents

  def recalculate
    #TODO
  end

  def self.current
    Balance.where(fini: false).order("id desc").first
  end

  def montant_inverse
    montant.to_f - 2*montant.to_f
  end

end

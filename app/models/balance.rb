class Balance < ActiveRecord::Base
  attr_accessible :fini, :montant_cents, :nom
  monetize :montant_cents

end

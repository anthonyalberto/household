class TypeDeMouvement < ActiveRecord::Base
  attr_accessible :image, :nom, :position, :revenu

  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader
end

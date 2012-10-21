#encoding: utf-8
class Chat < ActiveRecord::Base
  attr_accessible :image, :name

  has_many :texte_de_chats

  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader

  def pensee_random
    texte_de_chats.where(type_de_texte: "Pensée").sample.texte
  end
end

# encoding: utf-8
class TexteDeChat < ActiveRecord::Base
  belongs_to :chat
  attr_accessible :texte, :type_de_texte, :chat_id

  validates :texte, :type_de_texte, :chat, presence: true

  def self.type_de_textes
    %W{Pensée Winner}
  end

end

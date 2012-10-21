class CreateTexteDeChats < ActiveRecord::Migration
  def change
    create_table :texte_de_chats do |t|
      t.string :type_de_texte
      t.references :chat
      t.string :texte

      t.timestamps
    end
    add_index :texte_de_chats, :chat_id
  end
end

class CreateTypeDeMouvements < ActiveRecord::Migration
  def change
    create_table :type_de_mouvements do |t|
      t.string :nom, null: false
      t.integer :position, null: false
      t.string :image, null: false
      t.boolean :revenu, null: false, default: 0

      t.timestamps
    end
    add_index :type_de_mouvements, :revenu
    add_index :type_de_mouvements, [:revenu, :position]
  end
end

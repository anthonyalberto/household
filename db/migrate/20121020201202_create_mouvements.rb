class CreateMouvements < ActiveRecord::Migration
  def change
    create_table :mouvements do |t|
      t.references :payeur, null: false
      t.string :texte
      t.integer :montant_cents, null: false
      t.references :type_de_mouvement
      t.references :balance
      t.boolean :fini, null: false, default: 0
      t.float :pourcent_a_facturer_a_lautre, null: false, default: 50
      t.boolean :revenu, null: false, default: 0
      t.timestamps
    end
    add_index :mouvements, :payeur_id
    add_index :mouvements, :balance_id
    add_index :mouvements, :type_de_mouvement_id
    add_index :mouvements, :fini
    add_index :mouvements, [:payeur_id, :fini]
    add_index :mouvements, [:payeur_id, :type_de_mouvement_id]
    add_index :mouvements, [:payeur_id, :type_de_mouvement_id, :fini]
  end
end

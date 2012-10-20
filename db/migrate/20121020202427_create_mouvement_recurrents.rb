class CreateMouvementRecurrents < ActiveRecord::Migration
  def change
    create_table :mouvement_recurrents do |t|
      t.references :payeur, null: false
      t.integer :montant_cents, null: false
      t.references :type_de_mouvement, null: false
      t.boolean :fini, null: false, default: 0
      t.float :pourcent_a_facturer_a_lautre, null: false, default: 50
      t.string :frequence_manuelle
      t.string :frequence_automatique

      t.timestamps
    end
    add_index :mouvement_recurrents, :payeur_id
    add_index :mouvement_recurrents, :type_de_mouvement_id
    add_index :mouvement_recurrents, :fini
    add_index :mouvement_recurrents, [:payeur_id, :fini]
    add_index :mouvement_recurrents, [:payeur_id, :type_de_mouvement_id]
    add_index :mouvement_recurrents, [:payeur_id, :type_de_mouvement_id, :fini], name: "recurrent_payeur_et_type_de_mouvement_et_fini"
  end
end

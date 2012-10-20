class CreateBalanceUtilisateurs < ActiveRecord::Migration
  def change
    create_table :balance_utilisateurs do |t|
      t.references :utilisateur, null: false
      t.integer :montant_cents, null: false
      t.integer :mois, null: false
      t.integer :annee, null: false

      t.timestamps
    end
    add_index :balance_utilisateurs, :utilisateur_id
  end
end

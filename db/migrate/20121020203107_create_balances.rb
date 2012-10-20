class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.string :nom, null: false
      t.integer :montant_cents, null: false
      t.boolean :fini, null: false, default: 0

      t.timestamps
    end
    add_index :balances, :fini

  end
end

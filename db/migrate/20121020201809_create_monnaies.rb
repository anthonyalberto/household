class CreateMonnaies < ActiveRecord::Migration
  def change
    create_table :monnaies do |t|
      t.string :iso, null: false
      t.float :pourcent_vers_cad, null: false, default: 100

      t.timestamps
    end
    add_index :monnaies, :iso
  end
end

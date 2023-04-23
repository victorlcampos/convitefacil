class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :admin_uid
      t.string :invite_uid
      t.text :description
      t.text :address

      t.timestamps
    end
    add_index :parties, :admin_uid
    add_index :parties, :invite_uid
  end
end

class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.string :family_name
      t.references :party, null: false, foreign_key: true
      t.string :invite_uid, index: true

      t.timestamps
    end
  end
end

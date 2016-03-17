class CreateRulingParties < ActiveRecord::Migration
  def change
    create_table :ruling_parties do |t|
      t.references :political_party, index: true, foreign_key: true
      t.integer :leader_id
      t.date :mandate_start
      t.date :mandate_end

      t.timestamps null: false
    end
  end
end

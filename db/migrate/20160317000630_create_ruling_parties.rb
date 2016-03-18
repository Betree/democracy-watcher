class CreateRulingParties < ActiveRecord::Migration
  def change
    create_table :ruling_parties do |t|
      t.references :campaign, index: true, foreign_key: true
      t.date :mandate_start
      t.date :mandate_end

      t.timestamps null: false
    end
  end
end

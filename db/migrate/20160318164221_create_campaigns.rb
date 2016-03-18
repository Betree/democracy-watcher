class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.date :vote_date
      t.references :political_party, index: true, foreign_key: true
      t.integer :leader_id
      t.timestamps null: false
    end
  end
end

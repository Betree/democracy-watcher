class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.date :vote_date
      t.belongs_to :political_party, index: true
      t.integer :leader_id
      t.timestamps null: false
    end
  end
end

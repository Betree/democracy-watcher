class CreateLeaderStatementSources < ActiveRecord::Migration[5.0]
  def change
    create_table :leader_statement_sources do |t|
      t.belongs_to :leader_statement, null: false
      t.belongs_to :source, null: false

      t.timestamps
    end
  end
end

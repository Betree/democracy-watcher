class CreateStatementSources < ActiveRecord::Migration[5.0]
  def change
    create_table :statement_sources do |t|
      t.belongs_to :statement, null: false
      t.belongs_to :source, null: false

      t.timestamps
    end
  end
end

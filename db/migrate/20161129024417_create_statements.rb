class CreateStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :statements do |t|
      t.belongs_to  :leader, null: false

      t.string      :statement, null: false
      t.integer     :status, null: false
      t.date        :date_statement, null: true
      t.text        :description, null: true

      t.timestamps
    end
  end
end

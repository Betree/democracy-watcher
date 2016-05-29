class CreateRulingParties < ActiveRecord::Migration
  def change
    create_table :ruling_parties do |t|
      t.belongs_to  :political_party, index: true, null: true # May be null, for example in a dictatorship
      t.belongs_to  :leader, references: :politician, null: true  # Politician ruling the country. May be null (in a direct democracy for example)
      t.integer     :rule_type, null: false # Defines if rule is for the entire country, a state, just a city...etc

      t.date        :mandate_start, null: false # We always know when a mandate starts
      t.date        :mandate_end, null: true # ...but not necessarily when it ends (which is not always a good sign :O)

      t.string      :banner, null: true

      t.timestamps null: false

      add_foreign_key :ruling_parties, :politicians, column: :leader_id
    end
  end
end

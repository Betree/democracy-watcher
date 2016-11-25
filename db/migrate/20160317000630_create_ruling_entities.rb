class CreateRulingEntities < ActiveRecord::Migration
  def change
    create_table :ruling_entities do |t|
      t.belongs_to  :group, index: true, null: true # Leading group (usually leader's group)
      t.belongs_to  :leader, null: true  # Leader - may be null (in a direct democracy for example)

      t.date        :mandate_start, null: false # We always know when a mandate starts
      t.date        :mandate_end, null: true # ...but not necessarily when it ends (which is not always a good sign :O)

      t.string      :banner, null: true
      t.text        :description, null: true

      t.timestamps  null: false
    end

    add_foreign_key :ruling_entities, :leaders, column: :leader_id
  end
end

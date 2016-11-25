class CreateStatistics < ActiveRecord::Migration[5.0]
  def change
    create_table :statistics do |t|
      t.belongs_to  :ruling_entity, index: true, foreign_key: true, null: false

      t.text :description, null: true

      # Graph specific options
      t.integer :graph_type, null: true # If null, no chart will be generated and only description will be shown
      t.text :json_options, null: true
      t.text :json_data, null: true

      t.timestamps
    end
  end
end

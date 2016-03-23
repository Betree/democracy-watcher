class CreatePromises < ActiveRecord::Migration
  def change
    create_table :promises do |t|
      t.references  :ruling_party, index: true, foreign_key: true, null: false
      t.integer     :category, null: true # Economy, education...etc let's say null category means "Other"
      t.string      :title, null: false
      t.text        :description, null: true

      t.timestamps null: false
    end
  end
end

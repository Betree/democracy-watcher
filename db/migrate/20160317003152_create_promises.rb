class CreatePromises < ActiveRecord::Migration
  def change
    create_table :promises do |t|
      t.references :ruling_party, index: true, foreign_key: true
      t.string :category
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end

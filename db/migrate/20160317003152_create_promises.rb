class CreatePromises < ActiveRecord::Migration
  def change
    create_table :promises do |t|
      t.references :campaign, index: true, foreign_key: true
      t.integer :category
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end

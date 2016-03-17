class CreatePromiseSources < ActiveRecord::Migration
  def change
    create_table :promise_sources do |t|
      t.references :promise, index: true, foreign_key: true
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end

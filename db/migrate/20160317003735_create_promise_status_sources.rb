class CreatePromiseStatusSources < ActiveRecord::Migration
  def change
    create_table :promise_status_sources do |t|
      t.references :promise_status, index: true, foreign_key: true
      t.string :media
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end

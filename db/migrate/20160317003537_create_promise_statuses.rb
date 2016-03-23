class CreatePromiseStatuses < ActiveRecord::Migration
  def change
    create_table :promise_statuses do |t|
      t.references :promise, index: true, foreign_key: true, null: false
      t.string :title, null: false
      t.text :description, null: true
      t.date :date_start

      t.timestamps null: false
    end
  end
end

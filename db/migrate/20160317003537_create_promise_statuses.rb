class CreatePromiseStatuses < ActiveRecord::Migration
  def change
    create_table :promise_statuses do |t|
      t.references :promise, index: true, foreign_key: true
      t.string :title
      t.string :details
      t.date :date_start

      t.timestamps null: false
    end
  end
end

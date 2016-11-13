class CreatePromiseSources < ActiveRecord::Migration
  def change
    create_table :promise_sources do |t|
      t.belongs_to :promise, index: true, null: false
      t.belongs_to :source, index: true, null: false

      t.timestamps null: false
    end
  end
end

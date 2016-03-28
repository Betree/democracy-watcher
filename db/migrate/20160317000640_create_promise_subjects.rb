class CreatePromiseSubjects < ActiveRecord::Migration
  def change
    create_table :promise_subjects do |t|
      t.integer     :category, null: false # Economy, education...etc let's say null category means "Other"
      t.string      :title, null: true

      t.timestamps null: false
    end
  end
end

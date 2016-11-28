class CreatePromiseSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :promise_subjects do |t|
      t.integer     :category, null: false # Economy, education...etc
      t.string      :title, null: true

      t.timestamps null: false
    end
  end
end

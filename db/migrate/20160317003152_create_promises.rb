class CreatePromises < ActiveRecord::Migration[5.0]
  def change
    create_table :promises do |t|
      t.belongs_to  :ruling_entity, index: true, foreign_key: true, null: false
      t.belongs_to  :subject, references: :promise_subject, null: false
      t.integer     :status, null: false
      t.string      :title, null: false
      t.text        :description, null: true

      t.timestamps null: false
    end
    add_foreign_key :promises, :promise_subjects, column: :subject_id, index: true
  end
end

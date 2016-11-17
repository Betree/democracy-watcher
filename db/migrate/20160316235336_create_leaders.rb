class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end

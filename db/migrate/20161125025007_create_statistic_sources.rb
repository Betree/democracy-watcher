class CreateStatisticSources < ActiveRecord::Migration[5.0]
  def change
    create_table :statistic_sources do |t|
      t.belongs_to :statistic, index: true, null: false
      t.belongs_to :source, index: true, null: false

      t.timestamps
    end
  end
end

class CreatePromiseStatusSources < ActiveRecord::Migration
  def change
    create_table :promise_status_sources do |t|
      t.references  :promise_status, index: true, foreign_key: true
      t.string      :media, null: false
      t.string      :title, null: false
      t.string      :url, null: true  # We should always give a source but url may be nullable (eg. offline newspaper)

      t.timestamps null: false
    end
  end
end

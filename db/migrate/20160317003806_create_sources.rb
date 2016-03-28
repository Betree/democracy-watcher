class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.references  :promise, index: true, foreign_key: true
      t.integer     :source_type, null: false  # Source may be for the promise or for its status
      t.string      :media, null: false  # Name of the media (NY Times...etc)
      t.string      :title, null: false  # Title of the article / video ...etc
      t.string      :url, null: true  # Url may be nullable (eg. offline newspaper)

      t.timestamps null: false
    end
  end
end

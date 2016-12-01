class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string      :media # Name of the media (NY Times...etc)
      t.string      :title # Title of the article / video ...etc
      t.string      :url # Url may be nullable (eg. offline newspaper)

      t.timestamps null: false
    end
  end
end

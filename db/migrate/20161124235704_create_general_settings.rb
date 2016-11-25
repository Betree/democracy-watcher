class CreateGeneralSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :general_settings do |t|
      t.text :welcome_message

      t.timestamps
    end
  end
end

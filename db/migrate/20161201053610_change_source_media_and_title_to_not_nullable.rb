class ChangeSourceMediaAndTitleToNotNullable < ActiveRecord::Migration[5.0]
  def change
    # Change the column to not allow null
    change_column :sources, :media, :string, :null => true
    change_column :sources, :title, :string, :null => true
  end
end

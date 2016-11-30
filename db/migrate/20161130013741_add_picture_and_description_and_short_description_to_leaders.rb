class AddPictureAndDescriptionAndShortDescriptionToLeaders < ActiveRecord::Migration[5.0]
  def change
    add_column :leaders, :picture, :string
    add_column :leaders, :short_description, :text
    add_column :leaders, :description, :text
  end
end

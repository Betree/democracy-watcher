class AddPictureAndDescriptionToLeaders < ActiveRecord::Migration[5.0]
  def change
    add_column :leaders, :picture, :string
    add_column :leaders, :description, :text
  end
end

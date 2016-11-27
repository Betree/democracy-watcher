class GeneralSettings < ActiveRecord::Base
  # Config for Rails Admin.
  rails_admin do
    field :welcome_message, :ck_editor
  end
end

class GeneralSettingsValidator < ActiveModel::Validator
  # This validator ensure we only have one entry in GeneralSettings
  def validate(record)
    record.errors[:base] << 'Maximum of one GeneralSetting entry' unless GeneralSettings.all.length == 0
  end
end

class GeneralSettings < ActiveRecord::Base
  # Ensure we always have only one entry
  validates_with GeneralSettingsValidator, on: :create

  # Config for Rails Admin.
  rails_admin do
    field :welcome_message, :ck_editor
  end
end

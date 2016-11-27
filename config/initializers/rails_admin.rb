RailsAdmin.config do |config|

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  config.actions do
    dashboard
    index
    new do
      except 'GeneralSettings'
    end
    export
    bulk_delete do
      except 'GeneralSettings'
    end
    show
    edit
    delete do
      except 'GeneralSettings'
    end
    show_in_app do
      except 'GeneralSettings'
      except 'Source'
      except 'Leader'
      except 'Group'
    end
  end

  # Exclude models we don't want to see
  config.excluded_models << 'StatisticSource'
  config.excluded_models << 'PromiseSource'

  # Configure models navigation
  def set_parent_model(config, model, parent_model)
    config.model model do
      parent parent_model
    end
  end

  set_parent_model(config, 'Statistic', RulingEntity)
  set_parent_model(config, 'Promise', RulingEntity)
  set_parent_model(config, 'PromiseSubject', Promise)

  # Configure navigation order
  def set_model_position(config, model, position)
    config.model model do
      weight position
    end
  end

  set_model_position(config, 'GeneralSettings', 1)
  set_model_position(config, 'RulingEntity', 2)
  set_model_position(config, 'Group', 3)
  set_model_position(config, 'Leader', 4)
  set_model_position(config, 'Source', 5)
end

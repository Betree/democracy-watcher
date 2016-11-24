class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :get_last_ruling_entities

  def get_last_ruling_entities(nb_entities)
    # TODO: Cache that
    RulingEntity.order(:mandate_start => :desc).limit(nb_entities).eager_load(:leader, :group)
  end
end

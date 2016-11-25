class StaticPagesController < ApplicationController
  def about
    @welcome_message = GeneralSettings.first.welcome_message
  end
end
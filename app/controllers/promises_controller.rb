class PromisesController < ApplicationController
  layout 'ruling_entity_data'

  def index
    @ruling_entity = RulingEntity.find(params[:ruling_entity_id])
    @promises = @ruling_entity.promises.eager_load(:subject, :sources)
    render 'index'
  end

end

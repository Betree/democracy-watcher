class StatisticsController < ApplicationController
  layout 'ruling_entity_data'

  def index
    @ruling_entity = RulingEntity.find(params[:ruling_entity_id])
    @statistics = @ruling_entity.statistics.eager_load(:sources)
    render 'index'
  end

end

class RulingEntitiesController < ApplicationController

  # Show currently ruling group
  def show_current
    current_entity = RulingEntity.select(:id).for_date(Date.current).first
    redirect_to ruling_entity_path(current_entity.id)
  end

  def show
    entity = RulingEntity.eager_load(:group, :leader).find(params[:id])
    show_ruling_entity(entity)
  end

  def show_ruling_entity(ruling_entity)
    if ruling_entity
      @ruling_entity = ruling_entity
      render 'show', layout: 'ruling_entity_data'
    else
      render component: 'FullPageMessage', props: {title: I18n.t('no_gov'), type: 'alert'}, status: :not_found
    end
  end

  def index
    @ruling_entities = RulingEntity.eager_load(:group, :leader)
    if @ruling_entities.length > 0
      render 'index'
    else
      render component: 'FullPageMessage', props: {title: I18n.t('no_gov'), type: 'notice'}
    end
  end

  def ruling_entity_params
    params.require(:ruling_entities).permit(:leader, :promises)
  end
end

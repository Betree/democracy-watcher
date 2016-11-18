class RulingEntitiesController < ApplicationController

  # Show currently ruling group
  def show_current
    show_ruling_entity(RulingEntity.for_date(Date.current).eager_load(:group, :leader).first)
  end

  def show
    entity = RulingEntity.where(id: params[:id]).eager_load(:group, :leader).first
    if entity.is_current
      redirect_to :root
    else
      show_ruling_entity(entity)
    end
  end

  def show_ruling_entity(ruling_entity)
    if ruling_entity
      @ruling_entity = ruling_entity
      @promises = ruling_entity.promises.eager_load(:subject, :sources)
      render 'show'
    else
      render component: 'FullPageMessage', props: {title: I18n.t('no_gov'), type: 'alert'}
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

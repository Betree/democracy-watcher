class RulingPartiesController < ApplicationController

  # Show current ruling party
  def show_current
    show_ruling_entity(RulingParty.for_date(Date.current).eager_load(:political_party, :leader).first)
  end

  def show
    entity = RulingParty.where(id: params[:id]).eager_load(:political_party, :leader).first
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
    @ruling_parties = RulingParty.eager_load(:political_party, :leader)
    if @ruling_parties.length > 0
      render component: 'RulingEntitiesList', props: { ruling_entities: @ruling_parties }
    else
      render component: 'FullPageMessage', props: {title: I18n.t('no_gov'), type: 'notice'}
    end
  end

  def ruling_party_params
    params.require(:ruling_parties).permit(:leader, :promises)
  end
end

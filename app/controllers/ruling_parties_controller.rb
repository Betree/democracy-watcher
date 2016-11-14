class RulingPartiesController < ApplicationController

  # Show current national ruling party
  def show_current_national
    params[:rule_type] = 'national'
    show_current
  end

  # Show current ruling party
  def show_current
    params[:period] = Date.current
    show
  end

  def show
    @ruling_party = RulingParty.eager_load(:political_party, :leader)
                          .where(rule_type: params[:rule_type])
                          .for_date(params[:period]).first
    if @ruling_party
      render('show')
    else
      render component: 'FullPageMessage', props: {title: I18n.t('no_gov'), type: 'alert'}
    end
  end

  def index
    @ruling_parties = RulingParty.eager_load(:political_party, :leader).where(rule_type: params[:rule_type])
    if @ruling_parties.length > 0
      render component: 'RulingEntitiesList', props: { ruling_entities: @ruling_parties }
    else
      render component: 'FullPageMessage', props: {title: I18n.t('no_gov'), type: 'notice'}
    end
  end

  def ruling_party_params
    params.require(:ruling_party).permit(:leader, :promises)
  end
end

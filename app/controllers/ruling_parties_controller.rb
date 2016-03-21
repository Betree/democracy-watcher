class RulingPartiesController < ApplicationController
  def show_current
    # Show current ruling party
    @ruling_party = RulingParty.for_date(Date.current).first
    render 'show'
  end

  def ruling_party_params
    params.require(:ruling_party).permit(:leader, :promises)
  end
end

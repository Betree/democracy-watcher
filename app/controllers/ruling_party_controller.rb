class RulingPartyController < ApplicationController
  def show
    # Get current ruling party
    @ruling_party = RulingParty.for_date(Date.current).first
  end
end

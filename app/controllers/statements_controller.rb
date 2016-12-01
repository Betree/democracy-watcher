class StatementsController < ApplicationController
  def index
    @leader = Leader.eager_load(:statements).find(params[:leader_id])
  end
end

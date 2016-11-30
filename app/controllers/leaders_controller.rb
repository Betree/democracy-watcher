class LeadersController < ApplicationController
  def index
    @leaders = Leader.with_statements_count
  end
end
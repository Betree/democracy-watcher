class LeadersController < ApplicationController
  def index
    @leaders = Leader.with_statements_count.ordered_by_statements_count_desc
  end
end
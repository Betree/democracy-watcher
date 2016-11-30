require 'rails_helper'

RSpec.describe LeadersController, type: :controller do
  describe 'GET index' do
    it 'assigns @leaders with statements_count' do
      leader = Leader.create name: Forgery::Name.full_name

      # Creating three statements
      LeaderStatement.create leader: leader, statement: Forgery::LoremIpsum.sentence, status: 1
      LeaderStatement.create leader: leader, statement: Forgery::LoremIpsum.sentence, status: 1
      LeaderStatement.create leader: leader, statement: Forgery::LoremIpsum.sentence, status: 1

      get :index

      index_first_leader = assigns(:leaders).first

      expect(index_first_leader).to eq(leader)
      expect(index_first_leader.statements_count).to eq(3)
    end
  end
end


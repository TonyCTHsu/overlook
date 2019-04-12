require 'rails_helper'

describe Overlook::Abilities, type: :request do
  describe 'GET api/abilities' do
    it do
      expect(Ability).to receive(:all).and_return([Ability.new({ hero: {} })])

      get '/api/abilities'

      expect(response.status).to eq(200)
    end
  end

  describe 'GET api/abilities/:ability_id' do
    it do
      expect(Ability).to receive(:find).with(1).and_return([Ability.new({ hero: {} })])

      get '/api/abilities/1'

      expect(response.status).to eq(200)
    end
  end
end

require 'rails_helper'

describe Overlook::Heros, type: :request do
  describe 'GET api/heros' do
    it do
      expect(Hero).to receive(:all).and_return([Hero.new({})])

      get '/api/heros'

      expect(response.status).to eq(200)
    end
  end

  describe 'GET api/heros/:hero_id' do
    it do
      expect(Hero).to receive(:find).with(1).and_return(Hero.new(abilities: []))

      get '/api/heros/1'

      expect(response.status).to eq(200)
    end
  end

  describe 'GET api/heros/:hero_id/abilities' do
    it do
      expect(Hero).to receive(:find).with(1).and_return(Hero.new(abilities: []))

      get '/api/heros/1/abilities'

      expect(response.status).to eq(200)
    end
  end

  describe 'GET api/heros/:hero_id/abilities/:ability_id' do
    it do
      expect(Hero).to receive(:find).with(1).and_return(Hero.new(abilities: [{id: 2}]))

      get '/api/heros/1/abilities/2'

      expect(response.status).to eq(200)
    end
  end
end

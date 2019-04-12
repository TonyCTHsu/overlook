require 'rails_helper'

describe OverwatchService do
  after(:each) do
    Rails.cache.clear
  end

  describe '#get_heros' do
    it do
      cache = ActiveSupport::Cache.lookup_store(:memory_store)
      allow(Rails).to receive(:cache).and_return(cache)
      client = double(get: Faraday::Response.new(body: { data: [{ id: 1 }]}))
      service = described_class.new(client)

      result = service.get_heros

      expect(result).to eq([{ id: 1 }])
      expect(client).to have_received(:get).with('hero')
      expect(cache.exist?('hero')).to be(true)
    end
  end

  describe '#get_hero' do
    it do
      cache = ActiveSupport::Cache.lookup_store(:memory_store)
      allow(Rails).to receive(:cache).and_return(cache)
      client = double(get: Faraday::Response.new(body: { id: 1 }))
      service = described_class.new(client)

      result = service.get_hero(1)

      expect(result).to eq({ id: 1 })
      expect(client).to have_received(:get).with('hero/1')
      expect(cache.exist?('hero/1')).to be(true)
    end
  end

  describe '#get_abilities' do
    it do
      cache = ActiveSupport::Cache.lookup_store(:memory_store)
      allow(Rails).to receive(:cache).and_return(cache)
      client = double(get: Faraday::Response.new(body: { data: [{ id: 1 }]}))
      service = described_class.new(client)

      result = service.get_abilities

      expect(result).to eq([{ id: 1 }])
      expect(client).to have_received(:get).with('ability')
      expect(cache.exist?('ability')).to be(true)
    end
  end

  describe '#get_ability' do
    it do
      cache = ActiveSupport::Cache.lookup_store(:memory_store)
      allow(Rails).to receive(:cache).and_return(cache)
      client = double(get: Faraday::Response.new(body: { id: 1 }))
      service = described_class.new(client)

      result = service.get_ability(1)

      expect(result).to eq({ id: 1 })
      expect(client).to have_received(:get).with('ability/1')
      expect(cache.exist?('ability/1')).to be(true)
    end
  end
end

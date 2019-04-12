require 'rails_helper'

describe Hero do
  describe '.all' do
    it do
      overwatch = double(get_heros: [{ id: 1 }])
      expect(OverwatchService).to receive(:new).and_return(overwatch)

      heros = described_class.all

      expect(heros).to all(be_a(described_class))
      expect(heros.length).to eq(1)
      expect(overwatch).to have_received(:get_heros).with(no_args).once
    end
  end

  describe '.find' do
    it do
      overwatch = double(get_hero: { id: 1 })
      expect(OverwatchService).to receive(:new).and_return(overwatch)

      hero = described_class.find(1)

      expect(hero).to be_an(described_class)
      expect(hero.id).to eq(1)
      expect(overwatch).to have_received(:get_hero).with(1).once
    end
  end

  describe '#id' do
    it do
      hero = described_class.new(id: 1)
      expect(hero.id).to eq(1)
    end
  end

  describe '#name' do
    it do
      hero = described_class.new(name: 'Ana')
      expect(hero.name).to eq('Ana')
    end
  end

  describe '#real_name' do
    it do
      hero = described_class.new(real_name: 'Ana Amari')
      expect(hero.real_name).to eq('Ana Amari')
    end
  end

  describe '#health' do
    it do
      hero = described_class.new(health: 200)
      expect(hero.health).to eq(200)
    end
  end

  describe '#armour' do
    it do
      hero = described_class.new(armour: 0)
      expect(hero.armour).to eq(0)
    end
  end

  describe '#shield' do
    it do
      hero = described_class.new(shield: 0)
      expect(hero.shield).to eq(0)
    end
  end

  describe '#abilities' do
    it do
      hero = described_class.new(abilities: [{ id: 1 }])
      expect(hero.abilities).to all(be_an(Ability))
      expect(hero.abilities.length).to eq(1)
    end
  end
end

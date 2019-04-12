require 'rails_helper'

describe Ability do
  describe '.all' do
    it do
      overwatch = double(get_abilities: [{ id: 1 }])
      expect(OverwatchService).to receive(:new).and_return(overwatch)

      abilities = described_class.all

      expect(abilities).to all(be_a(described_class))
      expect(abilities.length).to eq(1)
      expect(overwatch).to have_received(:get_abilities).with(no_args).once
    end
  end

  describe '.find' do
    it do
      overwatch = double(get_ability: { id: 1 })
      expect(OverwatchService).to receive(:new).and_return(overwatch)

      ability = described_class.find(1)

      expect(ability).to be_an(described_class)
      expect(ability.id).to eq(1)
      expect(overwatch).to have_received(:get_ability).with(1).once
    end
  end

  describe '#id' do
    it do
      ability = described_class.new(id: 1)
      expect(ability.id).to eq(1)
    end
  end

  describe '#name' do
    it do
      ability = described_class.new(name: 'Sleep Dart')
      expect(ability.name).to eq('Sleep Dart')
    end
  end

  describe '#description' do
    it do
      ability = described_class.new(description: 'fires a dart')
      expect(ability.description).to eq('fires a dart')
    end
  end

  describe '#is_ultimate' do
    it do
      ability = described_class.new(is_ultimate: true)
      expect(ability.is_ultimate).to eq(true)
    end
  end

  describe '#hero' do
    it do
      ability = described_class.new(hero: { id: 2 })
      expect(ability.hero).to be_a(Hero)
    end
  end
end

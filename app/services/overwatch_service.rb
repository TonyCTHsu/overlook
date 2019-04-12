class OverwatchService
  def initialize(client = OverwatchClient.new)
    @client = client
  end

  def get_heros
    fetch('hero')[:data]
  end

  def get_hero(hero_id)
    fetch("hero/#{hero_id}")
  end

  def get_abilities
    fetch('ability')[:data]
  end

  def get_ability(ability_id)
    fetch("ability/#{ability_id}")
  end

  private

  attr_reader :client

  def fetch(path)
    cache(path) { client.get(path).body }
  end

  def cache(key, expires_in: 1.hour)
    Rails.cache.fetch(key, expires_in: expires_in) do
      yield
    end
  end
end

class OverwatchService
  def initialize(client = OverwatchClient.new)
    @client = client
  end

  def get_heros
    response_body = fetch('hero')

    response_body[:data].map { |data| Hero.new(data) }
  end

  def get_hero(hero_id)
    response_body = fetch("hero/#{hero_id}")

    Hero.new(response_body)
  end

  def get_abilities
    response_body = fetch('ability')

    response_body[:data].map { |data| Ability.new(data) }
  end

  def get_ability(ability_id)
    response_body = fetch("ability/#{ability_id}")

    Ability.new(response_body)
  end

  private

  attr_reader :client

  def fetch(path)
    cache(path) { client.get(path).body }
  end

  def cache(key, expires_in: 1.minutes)
    Rails.cache.fetch(key, expires_in: expires_in) do
      yield
    end
  end
end

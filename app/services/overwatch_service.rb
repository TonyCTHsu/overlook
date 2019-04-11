class OverwatchService
  def initialize(client = OverwatchClient.new)
    @client = client
  end

  def get_heros
    client.get('hero')
  end

  def get_hero(hero_id)
    client.get("hero/#{hero_id}")
  end

  def get_abilities
    client.get('ability')
  end

  def get_ability(ability_id)
    client.get("ability/#{ability_id}")
  end

  private

  attr_reader :client
end

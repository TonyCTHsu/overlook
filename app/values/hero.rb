class Hero
  def self.all
    OverwatchService.new.get_heros.map { |attributes| new(attributes) }
  end

  def self.find(id)
    new(OverwatchService.new.get_hero(id))
  end

  def initialize(data)
    @data = data
  end

  def id
    @data[:id]
  end

  def name
    @data[:name]
  end

  def real_name
    @data[:real_name]
  end

  def health
    @data[:health]
  end

  def armour
    @data[:armour]
  end

  def shield
    @data[:shield]
  end

  def abilities
    @abilities ||= @data[:abilities].map { |attributes| Ability.new(attributes) }
  end
end

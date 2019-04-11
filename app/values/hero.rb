class Hero
  def self.find(id)
    new(OverwatchService.new.get_hero(id).body)
  end

  attr_reader :data

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
end

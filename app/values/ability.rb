class Ability
  def self.find(id)
    new(OverwatchService.new.get_ability(id).body)
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

  def description
    @data[:description]
  end

  def is_ultimate
    @data[:is_ultimate]
  end

  def hero
    @hero ||= Hero.new(@data[:hero])
  end
end

module Entities
  class AbilityDetail < Entities::Ability
    expose :hero, using: Hero
  end
end

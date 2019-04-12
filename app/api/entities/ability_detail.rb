module Entities
  class AbilityDetail < Entities::Ability
    expose :hero, using: Entities::Hero
  end
end

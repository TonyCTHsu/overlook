module Entities
  class HeroDetail < Entities::Hero
    expose :abilities, using: Ability
  end
end

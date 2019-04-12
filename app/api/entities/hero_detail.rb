module Entities
  class HeroDetail < Entities::Hero
    expose :abilities, using: Entities::Ability
  end
end

module Entities
  class Ability < Grape::Entity
    expose :id
    expose :name
    expose :description
    expose :is_ultimate
  end
end

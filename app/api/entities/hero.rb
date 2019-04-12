module Entities
  class Hero < Grape::Entity
    expose :id
    expose :name
    expose :real_name
    expose :health
    expose :armour
    expose :shield
  end
end

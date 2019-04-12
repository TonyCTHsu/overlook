module Overlook
  class API < Grape::API
    format :json
    prefix :api

    mount Heros
    mount Abilities
  end
end

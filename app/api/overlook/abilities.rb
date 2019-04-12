module Overlook
  class Abilities < Grape::API
    resources :abilities do
      desc 'Return a list of abilities'
      get do
        abilities = Ability.all

        present abilities, with: API::Entities::AbilityDetail
      end

      desc 'Return an ability'
      params do
        requires :ability_id, type: Integer
      end
      route_param :ability_id do
        get do
          ability = Ability.find(params[:ability_id])

          present ability, with: API::Entities::AbilityDetail
        end
      end
    end
  end
end

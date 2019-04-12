module Overlook
  class Heros < Grape::API
    resources :heros do
      desc 'Return a list of heros'
      get do
        heros = Hero.all

        present heros, with: API::Entities::Hero
      end

      desc 'Return a hero information'
      params do
        requires :hero_id, type: Integer
      end
      route_param :hero_id do
        get do
          hero = Hero.find(params[:hero_id])

          present hero, with: API::Entities::HeroDetail
        end

        resources :abilities do
          desc 'Return all abilities of a hero'
          get do
            hero = Hero.find(params[:hero_id])

            present hero.abilities, with: API::Entities::Ability
          end

          desc 'Return an specific ability of a hero'
          params do
            requires :ability_id, type: Integer
          end
          route_param :ability_id do
            get do
              hero = Hero.find(params[:hero_id])
              ability = hero.abilities.find { |a| a.id == params[:ability_id] }

              present ability, with: API::Entities::Ability
            end
          end
        end
      end
    end
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @pokemons = Pokemon.where(name: params[:query])
    else
      @pokemons = Pokemon.geocoded
      @markers = @pokemons.map do |pokemon|
      {
        lat: pokemon.latitude,
        lng: pokemon.longitude
      }
      end
    end
  end

  def battle
    @user = current_user
    @pokemons = current_user.deck_pokemons
    @oponent = Pokemon.order('RANDOM()').first
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @pokemons = Pokemon.where(name: params[:query])
    else
      @pokemons = Pokemon.all
    end
  end

  def battle
    @user = current_user
    @pokemons = current_user.deck_pokemons
    @oponent = Pokemon.order('RANDOM()').first
  end
end

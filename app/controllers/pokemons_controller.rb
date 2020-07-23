class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(params_pokemon) 
    @pokemon.user = current_user 
    if @pokemon.save
      redirect_to @pokemon, notice: 'Pokemon was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @pokemon.update(params_pokemon)
      redirect_to @pokemon, notice: 'Pokemon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pokemon.destroy
    redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.'
  end
  
  
  
  
  private
  
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def params_pokemon
    params.require(:pokemon).permit(:name,:location,:element,:life,:attack,:photo,:user_id)
  end
end

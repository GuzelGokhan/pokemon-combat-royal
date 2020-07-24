class DecksController < ApplicationController
before_action :set_pokemon , only: [:new,:create]

  def show
    @deck = Deck.find(params[:id])
  end
  
  def new
    @deck = Deck.new
    @deck.pokemon = @pokemon
  end

  def create
    @deck = Deck.new(params_deck)
    @deck.pokemon = @pokemon 
    @deck.user = current_user
    if @deck.save
      flash[:success] = "Deck successfully created"
      redirect_to @deck
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def params_deck
    params.require(:deck).permit(:start,:end, :user_id, :pokemon_id)
  end
  
end

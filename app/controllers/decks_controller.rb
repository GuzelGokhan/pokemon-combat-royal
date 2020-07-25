class DecksController < ApplicationController
before_action :set_pokemon , only: [:new,:create]

  def index
    @user = current_user
    @decks = Deck.where(user: @user)
  end
  

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

  def destroy
    @deck = Deck.find(params[:id])
    if @deck.destroy
      flash[:success] = 'Deck was successfully deleted.'
      redirect_to decks_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to decks_path
    end
  end
  
  
  private

  def check_decks(deck,pokemon)
    pokemon.decks.each do |elem|
      if elem.start.eql?(deck.start)
        return false
      end
    end
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def params_deck
    params.require(:deck).permit(:start_date,:end_date, :user_id, :pokemon_id)
  end
  
end

class CardsController < ApplicationController
  # GET /cards
  # GET /cards?completed=true
  # GET /cards?completed=false

  def index
    if params[:completed] == "true"
      @cards = Card.where(completed: true)
    elsif params[:completed] == "false"
      @cards = Card.where(completed: false)
    else
      @cards = Card.all
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @cards }
    end
  end

  def show
    @card = Card.find(params[:id])
    render json: @card
  end

  def create
    Rails.logger.info(params)
    @card = Card.create(card_params)
    render json: @card
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
    render json: @card
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    render nothing: true
  end

  private
  def card_params
    params.require(:card).permit(:description, :completed)
  end

end

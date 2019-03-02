class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
    @students = Student.all
  end
  
  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to @card
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      @students = Student.all
      render :new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private
  def card_params
    params.require(:card).permit(:student_id, :price, :classes)
  end

end

class BeersController < ApplicationController
  before_action :beer, only: [:edit, :show, :update, :destroy, :add_to_want]
  def index
    @beers = Beer.all
  end

  def have
    @beers = Beer.where(wall_of_beer_id: 1)
  end

  def want
    @beers = Beer.where(want_id: 1)
  end

  def dont_have
    @beers = Beer.where(want_id: nil)
  end

  def show
  end

  def new
    @beer = Beer.new(name: params[:name], alcohol_percent: params[:alcohol_percent], country: params[:country])
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.save
    redirect_to beers_path
  end

  def edit
  end

  def update
    @beer.update(beer_params)
    redirect_to beers_path
  end

  def wanted

  end

  def add_to_want
    @beer.want_id = 1
    @beer.save
    redirect_to dont_have_beers_path
  end

  def destroy
    @beer.destroy
    redirect_to beers_path
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :alcohol_percent, :country)
  end

  def beer
    @beer = Beer.find(params[:id])
  end
end

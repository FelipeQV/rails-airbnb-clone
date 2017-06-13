class FlatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
   @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flats_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private
  def flats_params
    params.require(:flat).permit(:title, :price, :address, :description, :bedrooms, :capacity, :category, :photo)
  end

end

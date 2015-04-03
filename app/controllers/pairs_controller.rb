class PairsController < ApplicationController

  def new
  end

  def create
    
  end

  def index
    @pairs = Pair.all
  end

  def show
  end

  def destroy
  end


  #helper method for create
  def pair_params
    params.require(:user).permit(:id, :members, :languages)
  end

end
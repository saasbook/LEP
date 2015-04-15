class PairsController < ApplicationController

  def new
  end

  def create
    
  end

  def index
    @pairs = Pair.all
  end

  def show
    @pair = Pair.find(params[:pair_id])
    @user = User.find(params[:id])
  end

  def edit
    @pair = Pair.find(params[:pair_id])
    @user = User.find(params[:id])
  end

  def destroy
  end

  def add
  end

  def remove
  end

  #helper method for create
  def pair_params
    params.require(:user).permit(:id, :members, :languages)
  end

end

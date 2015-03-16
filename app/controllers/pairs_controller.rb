class PairsController < ApplicationController
	def new
  end

  def create
    @pair = Pair.new(group_params)
    redirect_to pair_path(@pair)
  end

  def index
    @pairss = Pair.all
  end

  def edit
    @pair = Pair.find(params[:id])
  end

  def show
    @pair = Pair.find(params[:id])
  end

  def destroy
    @pair = Pair.find(params[:id])
    @pair.destroy
    redirect_to pairs_path
  end

  def pair_params
    params.require(:group).permit(:id, :name, :languages)
  end
end

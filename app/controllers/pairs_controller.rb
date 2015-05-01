class PairsController < ApplicationController
  
  def new
    @pair = Pair.new
  end

  def create
    # @pair = Pair.new(pair_params)
    # #id, members, languages
    # @pair.languages = [params[:lang1], params[:lang2]]
    # print "***********************************", @pair.languages
    # @pair.save!
    # redirect_to pairs_path
  end

  def index
    @pairs = Pair.all
    @user = User.find(params[:id])
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
    params.require(:pair).permit(:id, :members, :languages)
  end

end

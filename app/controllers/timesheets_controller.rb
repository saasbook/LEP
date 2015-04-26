class TimesheetsController < ApplicationController

  def new
    @user = User.find(session[:id])
  end

  def create
    @user = User.find(session[:user_id])
    redirect_to user_timesheet_path(@user)
  end

  def edit
    @user = User.find(session[:user_id])
    @timesheet = Timesheet.find(params[:id]) 
  end

  def index
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
  end

  def update
    redirect_to user_timesheet_path(@user)
  end

  def destroy
    @user = User.find(session[:user_id])
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy
    redirect_to user_timesheet_path(@user)
  end

  def timesheet_params
    params.require(:timesheet).permit()
  end
end

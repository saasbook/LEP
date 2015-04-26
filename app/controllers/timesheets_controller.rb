class TimesheetsController < ApplicationController

  before_filter :check_email

  def new
    @user = User.find(session[:id])
  end

  def create
    @user = User.find(session[:id])
  end

  def edit
    @user = User.find(session[:id])
    @timesheet = Timesheet.find(params[:id]) 
  end

  def index
    @user = User.find(session[:id])
  end

  def show
    @user = User.find(session[:id])
  end

  def edit
    @user = User.find(session[:id])
  end

  def update
  end

  def destroy
  end


end

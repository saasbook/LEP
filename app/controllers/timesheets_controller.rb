class TimesheetsController < ApplicationController

  before_filter :check_email
  before_filter :check_permissions

  def check_permissions
    if params[:user_id] && session[:id]
      @user = User.where(:id => session[:id])
      @admin = @user.pluck(:admin)[0]
      if ((params[:user_id].to_s != session[:id].to_s) && (!@admin))
        redirect_to user_timesheets_path(session[:id])
      end
      #todo: FILL THIS IN, add verification for timesheets id
    end
  end

  def new
    @user = User.find(session[:id])
  end

  def create
    @user = User.find(session[:id])
    redirect_to user_timesheet_path(@user)
  end

  def edit
    @user = User.find(session[:id])
    @timesheet = Timesheet.find(params[:id]) 
  end

  def index
    @user = User.find(session[:id])
    @timesheets = Timesheet.where(:user_id => @user.id).order('date')
    debugger
  end

  def show
    @user = User.find(session[:id])
    @timesheet = Timesheet.find(params[:id]).sort
  end

  def update
    redirect_to user_timesheet_path(@user)
  end

  def destroy
    @user = User.find(session[:id])
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy
    redirect_to user_timesheet_path(@user)
  end

  def timesheet_params
    params.require(:timesheet).permit()
  end
end

class TimesheetsController < ApplicationController

  before_filter :check_email
  before_filter :check_permissions

  def check_permissions
    if params[:user_id] && session[:id]
      @user = User.where(:id => session[:id])
      @admin = @user.pluck(:admin)[0]
      @timesheet = Timesheet.where(:id => params[:id])[0]
      if !@admin 
        if (params[:user_id].to_s != session[:id].to_s)
          redirect_to user_timesheets_path(session[:id])
        end
        if (not @timesheet.nil?) && (params[:user_id] != @timesheet.user_id.to_s)
          redirect_to user_timesheets_path(session[:id])
        end
      end
    end
  end

  def new
    @user = User.find(session[:id])
    @timesheet = Timesheet.new()
    @action = 'create'
    @method = 'post'
  end

  def create
    @user = User.find(session[:id])
    if check_params
      @timesheet = Timesheet.new(timesheet_params)
      @timesheet.user_id = @user.id
      begin
        @timesheet.save!
        flash[:notice] = "You have successfully added a timesheet."
        redirect_to user_timesheets_path(@user)
        return
      rescue ActiveRecord::RecordInvalid => e
        flash[:warning] = e.record.errors.to_a 
      end
    end
    redirect_to new_user_timesheet_path(@user)
  end

  def edit
    @user = User.find(session[:id])
    @timesheet = Timesheet.find(params[:id]) 
    @action = 'update'
    @method = 'put'
  end

  def index
    @user = User.find(session[:id])
    @timesheets = Timesheet.where(:user_id => @user.id).order('date')
  end

  def show
    @user = User.find(session[:id])
  end

  def update
    @timesheet = Timesheet.find(params[:id]) 
    @timesheet.update(timesheet_params)
    if check_params
      begin
        @timesheet.save!
        flash[:notice] = "You have successfully edited a timesheet."
        redirect_to user_timesheets_path(@user)
        return
      rescue ActiveRecord::RecordInvalid => e
        flash[:warning] = e.record.errors.to_a 
      end
    else
      redirect_to edit_user_timesheet_path(@user, @timesheet)
    end
  end

  def destroy
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy!
    flash[:notice] = "You have successfully deleted a timesheet."
    redirect_to user_timesheets_path(@user)
  end

  def check_params
    date = params[:timesheet][:date]
    if date.nil? or date.empty?
      flash[:warning] = "Date should be in MM/DD/YYYY format."
      return false
    end
    if params[:timesheet][:language].downcase == "select one"
      flash[:warning] = "Please select a language."
      return false
    end
    return true
  end

  def timesheet_params
    params.require(:timesheet).permit(:hours, :language, :date)
  end

end

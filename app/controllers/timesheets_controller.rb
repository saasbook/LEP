class TimesheetsController < ApplicationController

  before_filter :check_email
  before_filter :check_permissions

  def check_permissions
    if params[:user_id] && session[:id]
      @user = User.where(:id => session[:id])
      @admin = @user.pluck(:admin)[0]
      @timesheet = Timesheet.where(:id => params[:id])[0]
    end
    if !@admin && (not (user_permitted && timer_info_permitted))
      redirect_to user_timesheets_path(session[:id])
    end
  end
  
  def user_permitted
    if (params[:user_id].to_s != session[:id].to_s)
      return false
    end
    return true
  end

  def timer_info_permitted
    if (@timesheet.nil?) && (not params[:id].nil?)
      return false
    end
    if (not @timesheet.nil?) && (params[:user_id] != @timesheet.user_id.to_s)
      return false
    end
    return true
  end

  def new
    @user = User.find(session[:id])
    @timesheet = Timesheet.new()
    @action = 'create'
    @method = 'post'
  end

  def update_database(flash_msg)
    begin
      @timesheet.save!
      flash[:notice] = flash_msg
      redirect_to user_timesheets_path(@user)
      return true
    rescue ActiveRecord::RecordInvalid => e
      flash[:warning] = e.record.errors.to_a[0]
      return false
    end
  end

  def create
    @user = User.find(session[:id])
    if check_params
      @timesheet = Timesheet.new(timesheet_params)
      @timesheet.user_id = @user.id
      flash_msg = "you have successfully added a timesheet."
      if update_database(flash_msg)
        return
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
    redirect_to user_timesheets_path(@user)
  end

  def update
    @timesheet = Timesheet.find(params[:id]) 
    if check_params
      @timesheet.update(timesheet_params)
      flash_msg = "You have successfully edited a timesheet."
      if update_database(flash_msg)
        return
      end
    end
    redirect_to edit_user_timesheet_path(@user, @timesheet)
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

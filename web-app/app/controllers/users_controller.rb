class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  layout 'user'
  def index
  end

  def show
  end

  def edit
  end

  def new
      @user = User.new
      @alarm_categories = AlarmCategory.all
      @alarms = Alarm.all
  end

  def create
    raise
    @user = User.new(users_params)
    if @user.save
    create_alarms(params['alarm'])
    redirect_to root_path, notice: t("user.created")
    end
  end

  def update
    if @user.update(users_params)
      UserAlarm.where(user_id: @user.id).delete_all
      create_alarms(params['alarm'])
      redirect_to users_path, notice: t("user.updated")
    else
        redirect_to users_path, notice: t("user.not_updated")
    end
  end

  def destroy
    UserAlarm.where(user_id: @user.id).delete_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path notice: t("user.deleted") }
      format.json { head :no_content }
    end
  end

  private 

  def set_user
       @user = User.find(params[:id])
  end

  def  create_alarms(param_alarm)
    if param_alarm
        param_alarm.keys.each do |alarm_name|
          if param_alarm[alarm_name] == '1'
            UserAlarm.create(user_id: @user.id, alarm_id: Alarm.find_by(name: alarm_name).id)
          end
        end
      end
  end
  
  def users_params
    params.require(:user).permit(:email, :phone_number, :gender, :year_of_birth, :lenguage, :email_actived, :sms_actived)
  end
end

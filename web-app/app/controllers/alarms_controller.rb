class AlarmsController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  before_action :set_alarm, only: [:edit, :update, :destroy]
  
  layout 'dashboard'
  def index
      @alarms = Alarm.where('description=? OR description=?', 'weather', 'general')
  end

  def show
  end

  def edit
  end

  def destroy
    UserAlarm.where(alarm_id: @alarm.id).delete_all
    @alarm.destroy
    respond_to do |format|
      flash[:notice] =t("alert.deleted")
      format.html { redirect_to alarms_path }
      format.json { head :no_content }
    end
  end

  def dasboard
    session['dashboard'] = params[:value]
    redirect_to alarms_path
  end

  def force
    alarm = Alarm.find(get_alarm(params[:value]))
    ApiWeatherHazards.perform_async(alarm.end_point, alarm.description, alarm.name)
    flash[:notice] = t("alert.sent") 
    redirect_to alarms_path
  end

  def create
    if get_alarm(params[:dashboard])
      alarm = Alarm.find(get_alarm(params[:dashboard][:message]))
      ApiGeneralHazards.perform_async(alarm.id, params[:dashboard][:description])
      flash[:notice] = t("alert.sent") 
    else
      redirect_to alarms_path
    end
  end

  private 
  def set_alarm
       @alarm = Alarm.find(params[:id])
  end

  def get_alarm(id)
    if id.to_s=="1" || id.to_s == "2"
      Alarm.where('description=?', 'meeting').first
    else
      Alarm.where('description=?', 'risks').first
    end
  end
end

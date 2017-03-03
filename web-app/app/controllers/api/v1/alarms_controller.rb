module Api
  module V1
    class AlarmsController < Api::BaseController
        include JsonResponses
        skip_before_filter :verify_authenticity_token  
        swagger_controller :alarms, "Alarm Management", resource_path: "/api/alarms"
        
        swagger_api :index do
            summary "Fetches all Alarms items"
            notes "This lists all the alarms"
            response :ok, "Success"
            response :unauthorized
            response :not_acceptable, "The request you made is not acceptable"
        end

        def index
            alarms = Alarm.all
            respond_to do |format|
                format.json {render :json => generate_success({:alarms=> get_alarms(alarms)}), status: :ok} 
            end
        end

        private 
        def get_alarms(alarms)
            return alarms.collect do |alarm|
                {id: alarm.id,
                name: alarm.name,
                name_es: alarm.name_es,
                description:  alarm.description,
                end_point: alarm.end_point,
                alarm_category: AlarmCategory.find(alarm.alarm_category_id).to_json,
                created_at: alarm.created_at,
                updated_at: alarm.updated_at
                }
            end
        end 

    end
  end
end

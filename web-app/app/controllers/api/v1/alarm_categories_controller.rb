module Api
  module V1
    class AlarmCategoriesController < Api::BaseController
        include JsonResponses
        skip_before_filter :verify_authenticity_token  
        swagger_controller :alarms, "Alarm Category Management", resource_path: "/api/alarm_categories"
        
        swagger_api :index do
            summary "Fetches all Alarm categories items"
            notes "This lists all the alarm categories type"
            response :ok, "Success"
            response :unauthorized
            response :not_acceptable, "The request you made is not acceptable"
        end

        def index
            alarms = AlarmCategory.all
            respond_to do |format|
                format.json {render :json => generate_success({:alarms=> get_alarm_categories(alarms)}), status: :ok} 
            end
        end

        private 
        def get_alarm_categories(alarms)
            return alarms.collect do |alarm|
                {id: alarm.id,
                name: alarm.name,
                name_es: alarm.name_es,
                description:  alarm.description,
                created_at: alarm.created_at,
                updated_at: alarm.updated_at
                }
            end
        end 

    end
  end
end

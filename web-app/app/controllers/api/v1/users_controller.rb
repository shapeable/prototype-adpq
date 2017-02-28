module Api
  module V1
    class UsersController < Api::BaseController
        include JsonResponses
        skip_before_filter :verify_authenticity_token  
        swagger_controller :users, "User Management", resource_path: "/api/users"
        
        swagger_api :index do
            summary "Fetches all User items"
            notes "This lists all the active users"
            response :ok, "Success"
            response :unauthorized
            response :not_acceptable, "The request you made is not acceptable"
        end

        def index
            users = User.all
            respond_to do |format|
                format.json {render :json => generate_success({:users=> get_users(users), status: :ok})} 
            end
        end

        swagger_api :create do
            summary "Fetches all User items"
            notes "This lists all the active users"
            param :user, :email, :string, :required, "User email"
            param :user, :phone_number, :string, :required, "User phone number"
            param :user, :gender, :string, :required, "User gender"
            param :user, :year_of_birth, :integer, :required, "User year of birth"
            param :user, :lenguage, :string, :required, "User lenguage"
            param :user, :email_actived, :boolean, :required, "User email actived"
            param :user, :sms_actived, :boolean, :required, "User SMS actived"
            param :alarm, :name, :array, :required, "Array alarms name"
            param :alarm, :actived, :array, :required, "Array alarms actived"
            response :ok, "Success"
            response :unauthorized
            response :not_acceptable, "The request you made is not acceptable"
        end

        def create
            if params[:user]
                user = User.new(users_params)
                if user.save
                    if params['alarm']
                        params['alarm'].keys.each do |alarm_name|
                            if params['alarm'][alarm_name] == true
                                alarm = Alarm.find_by(name: alarm_name)
                                unless alarm.nil?
                                    UserAlarm.create(user_id: user.id, alarm_id: alarm.id)
                                end
                            end
                        end
                    end
                    respond_to do |format|
                        format.json {render :json => generate_success({:user_id=> user.id, :alarms=>get_alarms(user)}), status: :created} 
                    end
                end
            else
                 respond_to do |format|
                    format.json {render :json => generate_error(t("api.error_params")), status: :not_acceptable} 
                end
            end
        end

    private 
    def get_users(users)
        return users.collect do |user|
            {id: user.id,
            email: user.email,
            phone_number:  user.phone_number,
            gender: user.gender,
            year_of_birth: user.year_of_birth,
            lenguage: user.lenguage,
            email_actived: user.email_actived,
            sms_actived: user.sms_actived,
            created_at: user.created_at,
            updated_at: user.updated_at
            }
        end
      end 

    def get_alarms(users)
        return Alarm.where(user_id, user.id).each do |alarm|
            {id: alarm.id,
            name: alarm.name,
            description:  alarm.description,
            end_point: alarm.end_point,
            alarm_category_id: alarm.alarm_category_id,
            created_at: alarm.created_at,
            updated_at: alarm.updated_at
            }
        end
      end 

    def users_params
        params.require(:user).permit(:email, :phone_number, :gender, :year_of_birth, :lenguage, :email_actived, :sms_actived)
    end

    end
  end
end

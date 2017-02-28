module Api
  module V1
    class UsersController < Api::BaseController
        include JsonResponses
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

    end
  end
end

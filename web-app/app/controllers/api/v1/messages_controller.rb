module Api
  module V1
    class MessagesController < Api::BaseController
        include JsonResponses
        skip_before_filter :verify_authenticity_token  
        swagger_controller :messages, "Messages Management"
        
        swagger_api :create do
            summary "Create new message"
            notes "This lists all the active messages"
            param :message, :type, :string, :required, "type"
            param :comment, :description, :string, :required, "description"
            response :created, "Created"
            response :unauthorized
            response :not_acceptable, "The request you made is not acceptable"
        end

        def create
            if params[:message]
                unless Alarm.find_by(name: params[:message][:type]).nil?
                    ApiGeneralHazards.perform_async(params[:message][:type], params[:message][:description])
                    respond_to do |format|
                        format.json {render :json => generate_success({:comment=> get_comment(comment)}), status: :created} 
                    end
                else
                    respond_to do |format|
                        format.json {render :json => generate_error(t("api.error_params")), status: :not_acceptable} 
                    end
                end
            else
                respond_to do |format|
                    format.json {render :json => generate_error(t("api.error_params")), status: :not_acceptable} 
                end
            end
        end
    end
  end
end

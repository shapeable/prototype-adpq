module Api
  module V1
    class CommentsController < Api::BaseController
        include JsonResponses
        skip_before_filter :verify_authenticity_token  
        swagger_controller :comments, "Comments Management", resource_path: "/api/comments"
        
        swagger_api :index do
            summary "Fetches all Comments items"
            notes "This lists all the active comments"
            response :ok, "Success"
            response :unauthorized
            response :not_acceptable, "The request you made is not acceptable"
        end

        def index
            comments = Comment.all
            respond_to do |format|
                format.json {render :json => generate_success({:comments=> get_comments(comments)}), status: :ok} 
            end
        end

        swagger_api :create do
            summary "Create new comment"
            notes "This lists all the active users"
            param :comment, :description, :string, :required, "comment"
            response :created, "Created"
            response :unauthorized
            response :not_acceptable, "The request you made is not acceptable"
        end

        def create
            if params[:comment]
                comment = Comment.new(comments_params)
                if comment.save
                    respond_to do |format|
                        format.json {render :json => generate_success({:comment=> get_comment(comment)}), status: :created} 
                    end
                end
            else
                 respond_to do |format|
                    format.json {render :json => generate_error(t("api.error_params")), status: :not_acceptable} 
                end
            end
        end

        private 
        def comments_params
            params.require(:comment).permit(:description)
        end

        def get_comments(comments)
            return comments.collect do |comment|
                get_comment(comment)
            end
        end 

        def get_comment(comment)
        return {id: comment.id,
                description: comment.description,
                created_at: comment.created_at,
                updated_at: comment.updated_at,
                }
        end


    end
  end
end

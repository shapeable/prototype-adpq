class PagesController < ApplicationController
  def landing
  end

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
    redirect_to root_path, notice: t("comment.created")
    end
  end

  def login
  end

  private
  def comments_params
    params.require(:comment).permit(:description)
  end
  def dashboard
  end
end

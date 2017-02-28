class UsersController < ApplicationController
  before_filter :set_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def new
      @user = User.new
  end

  def create
    raise
    @user = User.new(users_params)
    if @user.save
    redirect_to users_path, notice: t("user.created")
    end
  end

  def update
    if @user.update(users_params)
        redirect_to users_path, notice: t("user.updated")
    else
        redirect_to users_path, notice: t("user.not_updated")
    end
  end

  def destroy
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
  
  def users_params
    params.require(:user).permit(:email, :phone_number, :gender, :year_of_birth, :lenguage, :email_actived, :sms_actived)
  end
end

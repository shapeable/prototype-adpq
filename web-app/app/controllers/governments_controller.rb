class GovernmentsController < ApplicationController
  layout 'user'
  def index
  end

  def dasboard
    session['dashboard'] = params[:value]
    redirect_to governments_path
  end
end

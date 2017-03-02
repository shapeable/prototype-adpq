class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :set_locale
  def set_locale
    if params[:locale]
      session['locale'] = params[:locale]
    end
      I18n.locale = session['locale'] || I18n.default_locale
  end
end

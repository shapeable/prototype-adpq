class ApplicationController < ActionController::Base.send(:include, MessagesModule)
  protect_from_forgery with: :exception
end

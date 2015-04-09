class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  before_action :set_locale
 
def set_locale
  I18n.locale = :nl#= params[:locale] || I18n.default_locale #sets locale
end

def default_url_options(options = {})  #adds locale to url query string
  { locale: I18n.locale }.merge options #
end

end

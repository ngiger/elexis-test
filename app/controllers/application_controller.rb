class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :set_locale
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    # params[:locale] ||= 'de'
    I18n.locale = :de # params[:locale]
  end
end

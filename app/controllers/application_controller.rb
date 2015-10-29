class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_contact_form

  protected

  def set_contact_form
    @contact = Contact.new
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def authenticate_admin
    unless current_user.admin?
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end


end

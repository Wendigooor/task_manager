class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, notice: exception.message }
    end
  end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email,
                                                                      :password,
                                                                      :password_confirmation,
                                                                      :current_password,
                                                                      :first_name,
                                                                      :last_name,
                                                                      :nickname,
                                                                      :birthday,
                                                                      :avatar,
                                                                      :avatar_cache,
                                                                      :remove_avatar) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,
                                                               :last_name,
                                                               :email,
                                                               :password,
                                                               :password_confirmation) }
  end
end

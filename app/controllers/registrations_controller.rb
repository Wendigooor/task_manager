class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # POST /resource
  def create
    super
    resource.create_family(params[:user][:role]) if resource.persisted?
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,
                                                               :last_name,
                                                               :email,
                                                               :password,
                                                               :password_confirmation) }
  end

end

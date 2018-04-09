class Users::OmniauthCallbacksController < ApplicationController

  def facebook
    @user = from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  def failure
    redirect_to root_path
  end

private

  def from_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.confirmed_at = DateTime.current
    end
  end

end

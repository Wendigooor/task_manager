class Users::InvitationsController < Devise::InvitationsController
  private

  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    resource
  end
end

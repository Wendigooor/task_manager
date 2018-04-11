class RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super
    FamilyCreatorService.new(resource, params[:family]).perform
  end

end

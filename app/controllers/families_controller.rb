class FamiliesController < ApplicationController
  load_and_authorize_resource

  def show
    @users = UserDecorator.decorate_collection(@family.users)
  end

end

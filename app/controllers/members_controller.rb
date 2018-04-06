class MembersController < ApplicationController
  before_action :set_family

  def new
    @user = User.new
  end

  def create
    Registration.invite_member_to_family(params[:user], @family)
    redirect_to @family
  end

  def destroy
    Role.find_by(family: @family, user: params[:id]).destroy
    redirect_to @family
  end

private

  def set_family
    @family = Family.find(params[:family_id])
  end

end
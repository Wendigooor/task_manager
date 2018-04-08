class MembersController < ApplicationController
  before_action :set_family

  def new
    @user = User.new
  end

  def create
    FamilyMemberInvitationService.new(params[:user], @family).perform
    redirect_to @family
  end

  def destroy
    FamilyMemberRemoverService.new(params[:id], @family).perform
    redirect_to @family
  end

private

  def set_family
    @family = Family.find(params[:family_id])
  end

end

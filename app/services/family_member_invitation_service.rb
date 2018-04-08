class FamilyMemberInvitationService

  def initialize(user_params, family)
    @user_params = user_params
    @family = family
  end

  def perform
    user =
      if @user_params[:id].present?
        User.find(@user_params[:id])
      else
        User.invite!(email: @user_params[:email])
      end

    user.add_role(@user_params[:role], @family)
  end

end

class FamilyCreatorService

  def initialize(user, family_params)
    @user = user
    @family_params = family_params
  end

  def perform
    return if @user.new_record?

    family =
      if @family_params[:id].present?
        Family.find(@family_params[:id])
      else
        Family.create(name: @family_params[:name])
      end

    @user.add_role(:admin, family)
  end

end

module Registration

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.confirmed_at = DateTime.current
    end
  end


  def create_family(family_params)
    family =
      if family_params[:id].present?
        Family.find(family_params[:id])
      else
        Family.create(name: family_params[:name])
      end

    self.add_role(:admin, family)
  end

  def self.invite_member_to_family(user_params, family)
    user =
      if user_params[:id].present?
        User.find(user_params[:id])
      else
        User.invite!(email: user_params[:email])
      end

    user.add_role(user_params[:role], family)
  end

  def self.remove_member_from_family(user_id, family)
    if user_id.present?
      user = User.find(user_id)
      User::ROLES.each do |role|
        user.remove_role(role, family)
      end
    end
  end

end

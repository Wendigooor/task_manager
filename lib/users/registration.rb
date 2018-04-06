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

      Role.create(family: family, user: self, name: :admin)
    end

    def self.invite_member_to_family(user_params, family)
      user =
        if user_params[:id].present?
          User.find(user_params[:id])
        else
          User.invite!(email: user_params[:email])
        end

      Role.create(user: user, family: family, name: user_params[:role])
    end

end

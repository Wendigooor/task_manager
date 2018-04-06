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

end

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


    def create_family(role)
      family = Family.create(name: "#{self.last_name}'s Family")
      Role.create(family: family, user: self, name: role)
    end

end

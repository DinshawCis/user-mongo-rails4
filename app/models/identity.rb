class Identity
	include Mongoid::Document
	field :provider, type: String
	field :uid, type: String
	# embedded_in :user
	belongs_to :user
	validates_presence_of :user_id, :uid, :provider
	validates_uniqueness_of :uid, :scope => :provider

	def self.find_for_oauth(auth)
		identity = find_by(provider: auth.provider, uid: auth.uid)
		identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
		identity
	end
	# def self.from_omniauth(auth)
 #    identity = where(auth.slice(:provider, :uid)).first_or_create do |identity|
 #      identity.provider = auth.provider
 #      identity.uid = auth.uid
 #      # identity.token = auth.credentials.token
 #      # identity.secret = auth.credentials.secret if auth.credentials.secret
 #      # identity.expires_at = auth.credentials.expires_at if auth.credentials.expires_at
 #      # identity.email = auth.info.email if auth.info.email
 #      # identity.image = auth.info.image if auth.info.image
 #      # identity.nickname = auth.info.nickname
 #      # identity.first_name = auth.info.first_name
 #      # identity.last_name = auth.info.last_name
 #    end
 #    identity.save!

 #    if !identity.persisted?
 #      redirect_to root_url, alert: "Something went wrong, please try again."
 #    end
 #    identity
 #  end


 #  def find_or_create_user(current_user)
 #    if current_user && self.user == current_user
 #      # User logged in and the identity is associated with the current user
 #      return self.user
 #    elsif current_user && self.user != current_user
 #      # User logged in and the identity is not associated with the current user
 #      # so lets associate the identity and update missing info
 #      self.user = current_user
 #      self.user.email ||= self.email
 #      # self.user.image ||= self.image
 #      # self.user.first_name ||= self.first_name
 #      # self.user.last_name ||= self.last_name
 #      self.user.skip_reconfirmation!
 #      self.user.save!
 #      self.save!
 #      return self.user
 #    elsif self.user.present?
 #      # User not logged in and we found the identity associated with user
 #      # so let's just log them in here
 #      return self.user
 #    else
 #      # No user associated with the identity so we need to create a new one
 #      self.build_user(
 #        email: self.email,
 #        # image: self.image,
 #        # first_name: self.first_name,
 #        # last_name: self.last_name,
 #        # roles: [AppConfig.default_role]
 #      )
 #      self.user.save!(validate: false)
 #      self.save!
 #      return self.user
 #    end
 #  end

 #  def create_user

 #  end
end

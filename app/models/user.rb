class User < ActiveRecord::Base
  has_one :user_rols
  has_many :band_members
  has_many :bands, :through => :band_members
  #validates_presence_of :document_number

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.name = auth.info.name
  		user.oauth_token = auth.credentials.token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  		user.save!
  	end
  end
end

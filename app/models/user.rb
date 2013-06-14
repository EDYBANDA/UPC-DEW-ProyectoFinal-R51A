class User < ActiveRecord::Base
  has_one :user_rols
  has_many :band_members
  has_many :comments
  has_many :bands, :through => :band_members

  attr_accessible :name, :last_name, :maternal_name, :gender, :document_type, :document_number, :email, :password_digest

  before_save :encrypt_password

  validates :name, :presence => true
  validates :last_name, :presence => true, :unless => :comes_from_facebook?
  validates :maternal_name, :presence => true, :unless => :comes_from_facebook?
  validates :gender, :presence => true, :unless => :comes_from_facebook?  
  validates :document_type, :presence => true, :unless => :comes_from_facebook?  
  validates :document_number, :confirmation => true, :presence => true, :uniqueness => true, :unless => :comes_from_facebook?
  validates :email, email_format: { message: "doesn't look like an email address" }, :uniqueness => true, :unless => :comes_from_facebook?
  validates :password_digest, :confirmation => true, :presence => true, :unless => :comes_from_facebook?
  validates :document_number_confirmation, :presence => true, :unless => :comes_from_facebook?, :on => :create
  validates :password_digest_confirmation, :presence => true, :unless => :comes_from_facebook?, :on => :create

  def encrypt_password
    if password_digest.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password_digest, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def comes_from_facebook?
    self.uid?
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.first_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.email = auth.info.email
      valida = find_by_email(auth.info.email)     
      if valida
        nil
      else
        user.save!
      end 
    end
  end

end

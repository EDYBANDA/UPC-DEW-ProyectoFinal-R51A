class User < ActiveRecord::Base
  has_one :user_rols
  has_many :band_members
  has_many :comments
  has_many :bands, :through => :band_members

  attr_accessible :name, :last_name, :maternal_name, :gender, :document_type, :document_number, :email, :password_digest

  before_save :encrypt_password

  validates :name, :presence => true
  validates :last_name, :presence => true
  validates :maternal_name, :presence => true
  validates :gender, :presence => true  
  validates :document_type, :presence => true  
  validates :document_number, :confirmation => true, :presence => true, :uniqueness => true
  validates :email, email_format: { message: "doesn't look like an email address" }, :uniqueness => true
  validates :password_digest, :confirmation => true, :presence => true

  def encrypt_password
    if password_digest.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password_digest, password_salt)
    end
  end

end

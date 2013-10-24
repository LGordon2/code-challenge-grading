class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  has_many :submissions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence:true, uniqueness: {case_sensitive: false}
  validates :password, presence:true, confirmation: true
  
  VALID_EMAIL_REGEX = %r{[a-zA-Z]+\.[a-zA-Z]+\@orasi\.com}
  validates_format_of :username, :with => VALID_EMAIL_REGEX , :message => "must be Orasi email address."

  def self.authenticate(username, password)
    user = User.find_by_username(username.downcase)
    return user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) ? user : nil
  end

  def encrypt_password
	if password.present?
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end
  end
end

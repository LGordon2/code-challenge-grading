class User < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence:true, uniqueness: {case_sensitive: false}
  validates :password, presence:true, confirmation: true
  
  VALID_EMAIL_REGEX = %r{[a-zA-Z]+\.[a-zA-Z]+\@orasi\.com}
  validates_format_of :username, :with => VALID_EMAIL_REGEX , :message => "must be Orasi email address."

  def self.authenticate(username, password)
    user = User.find_by_username(username.downcase)
    return user && user.password == password ? user : nil
  end
end

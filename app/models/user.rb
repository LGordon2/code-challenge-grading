class User < ActiveRecord::Base
  has_many :submissions
  validates :username, presence:true, uniqueness: {case_sensitive: false}

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  VALID_EMAIL_REGEX = %r{[a-zA-Z]+\.[a-zA-Z]+\@orasi\.com}
  validates_format_of :username, :with => VALID_EMAIL_REGEX , :message => "must be Orasi email address."




  def self.authenticate(username, password)
    user = User.find_by_username(username.downcase)
    return user && user.password == password ? user : nil
  end
end

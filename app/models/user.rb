class User < ActiveRecord::Base
  validates :username, presence:true, uniqueness: {case_sensitive: false}

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
   validates_uniqueness_of :username
  validates_presence_of :username
  VALID_EMAIL_REGEX = %r{[a-zA-Z]+\.[a-zA-Z]+\@orasi\.com}
  validates_format_of :username, :with => VALID_EMAIL_REGEX , :message => "must be Orasi email address."




  def self.authenticate(username, password)
    user = User.find_by_username(username.downcase)
    return user && user.password == password ? user : nil
  end
end

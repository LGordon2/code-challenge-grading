class User < ActiveRecord::Base
  validates :username, presence:true, uniqueness: {case_sensitive: false}

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == password
      user
    else
      nil
    end
  end
end

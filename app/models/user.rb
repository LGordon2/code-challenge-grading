require 'net/ldap'

class User < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence:true, uniqueness: {case_sensitive: false}
  
  VALID_EMAIL_REGEX = %r{[a-zA-Z]+\.[a-zA-Z]+\@orasi\.com|[a-zA-Z]+\.[a-zA-Z]+}
  validates_format_of :username, :with => VALID_EMAIL_REGEX , :message => "must be Orasi email address or Orasi Active Directory credentials."

  #TODO this needs clean up bad...
  def self.authenticate(username, password)
    
     if username.downcase.include?  '@orasi.com'
	first_part_username,_ = username.split('@') 
     else     
	 first_part_username = username
     end

     ldap = Net::LDAP.new :host => '10.238.242.32',
     :port => 389,
     :auth => {
           :method => :simple,
           :username => "ORASI\\#{first_part_username}",
           :password => password
     }
     if ldap.bind 
       user = User.find_by_username(first_part_username.downcase)
       if user 
         return user 
       else 
         user = User.new
         user.username = first_part_username.downcase
         user.first_name,user.last_name = first_part_username.downcase.split('.')
         user.save
         return user
       end
     end
     return nil
  end
end

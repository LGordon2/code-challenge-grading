class User < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A\w+\.\w+\z/, message: "Username must be in the form FirstName.LastName"}
  validates :first_name, presence: true
  validates :last_name, presence: true

  
  attr_accessor :display_name

  def self.find_or_create(username)
    #Find the user by their username
    user = User.find_by(username: username.downcase)
    
    #If the user doesn't exist make a new user.  Split their username to get their first name and last name
    if user.nil?
      user = User.new
      user.username = username.downcase
      user.first_name,user.last_name = user.username.split('.')
    end
    
    user.save
    return user
  end
  
  def retrieve_picture(ldap)
    filter = Net::LDAP::Filter.eq("mail", self.username.downcase+"@orasi.com")
    treebase = "dc=orasi, dc=com"
    f = File.open(Rails.root.join('public', 'photos', self.first_name+self.last_name+'.jpg'), 'w')
    thumbnail_array = ldap.search(:base => treebase, :filter => filter).first["thumbnailphoto"].first
    thumbnail_array.each_line {|line| f.puts line} unless thumbnail_array.nil? 
    f.close
    self.photo='/photos/' + self.first_name+self.last_name+'.jpg'
  end
  

	def self.all_admin_email_addresses
		admins_names = User.where('admin=? OR admin=?','true','t').pluck(:username)
		admins_emails = admins_names.map{|name|(name.include?"@orasi.com") ? name: name + "@orasi.com"}
		admins_emails
	end
	
	def display_name
	  self.first_name.capitalize + " " + self.last_name.capitalize
	end
	
end

require 'net/ldap'

class User < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence:true, uniqueness: {case_sensitive: false}

  attr_accessor :display_name

  def self.authenticate(username, password)
    return unless username =~ /^\w+\.\w+$/
    
    return if password == ""
    
    ldap = Net::LDAP.new :host => '10.238.242.32',
    :port => 389,
    :auth => {
      :method => :simple,
      :username => "ORASI\\#{username}",
      :password => password
    }
    if ldap.bind
      #Find the user by their username
      user = User.find_by(username: username.downcase)
      user.touch
      #If the user doesn't exist make a new user.  Split their username to get their first name and last name
      if user.nil?
        user = User.new
        user.username = username.downcase
        user.first_name,user.last_name = user.username.split('.')
      end
      
      #Get their picture.
      filter = Net::LDAP::Filter.eq("mail", user.username.downcase+"@orasi.com")
      treebase = "dc=orasi, dc=com"
      f = File.open(Rails.root.join('public', 'photos', user.first_name+user.last_name+'.jpg'), 'w')
      thumbnail_array = ldap.search(:base => treebase, :filter => filter).first["thumbnailphoto"].first
      thumbnail_array.each_line {|line| f.puts line} unless thumbnail_array.nil? 
      f.close
      user.photo = '/photos/'+File.basename(f) if user.photo.nil? or user.photo.empty?
      user.save
      
      return user
    end
    return nil
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

class User < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  attr_accessor :display_name

  def self.find_or_create(username)
    #Find the user by their username
    user = User.find_by(username: username.downcase)
    
    #If the user doesn't exist make a new user.  Split their username to get their first name and last name
    if user.nil?
      user = User.new
      user.username = username.downcase
      user.first_name,user.last_name = user.username.split('.')
      user.username = "#{user.first_name}#{user.last_name}".downcase if user.first_name.length==1
    end
    
    user.save
    return user
  end
  
  def validate_against_ad(password)
    #Do authentication against the AD.
    return false if password.blank?
    unless Rails.env.production?
      self.first_name,self.last_name = self.username.downcase.split(".") if self.first_name.blank? or self.last_name.blank?
      self.email = "#{self.username.downcase}@orasi.com" if self.email.blank?
      return true
    end
    
    ldap = Net::LDAP.new :host => '10.238.242.32',
    :port => 389,
    :auth => {
      :method => :simple,
      :username => "ORASI\\#{self.username}",
      :password => password
    }
    validated = ldap.bind
    if validated and (self.first_name.blank? or self.last_name.blank?)
    
      filter = Net::LDAP::Filter.eq("samaccountname", self.username)
      treebase = "dc=orasi, dc=com"
      self.first_name,self.last_name=ldap.search(
        base: treebase,
        filter: filter,
        attributes: %w[displayname]
      ).first.displayname.first.downcase.split(" ")
      self.email=ldap.search(
        base: treebase,
        filter: filter,
        attributes: %w[mail]
      ).first.mail.first.downcase
    end
    
    self.retrieve_picture(ldap) if validated
    return validated
  end
  
  def retrieve_picture(ldap)
    filter = Net::LDAP::Filter.eq("samaccountname", self.username.downcase)
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

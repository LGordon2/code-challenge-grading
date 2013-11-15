require 'net/ldap'

class User < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence:true, uniqueness: {case_sensitive: false}

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
      #Checking for old username style.
      if user = User.find_by(username: username.downcase+"@orasi.com")
        user.username = username.downcase
        user.save
      end
      
      #Find the user by their username
      user = User.find_by(username: username.downcase)

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
      ldap.search(:base => treebase, :filter => filter).first["thumbnailphoto"].first.each_line {|line| f.puts line}
      f.close
      user.photo = '/photos/'+File.basename(f) if user.photo.nil? or user.photo.empty?
      user.save
      
      return user
    end
    return nil
  end
end

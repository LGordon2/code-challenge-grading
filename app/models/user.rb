require 'net/ldap'

class User < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence:true, uniqueness: {case_sensitive: false}

  def self.authenticate(username, password)
    return if password == ""
    logger.info username
    first_part_username,_ = username.split('@')
    ldap = Net::LDAP.new :host => '10.238.242.32',
    :port => 389,
    :auth => {
      :method => :simple,
      :username => "ORASI\\#{first_part_username}",
      :password => password
    }
    if ldap.bind
      user = User.find_by(username: username.downcase)

      if user.nil?
        user = User.new
        user.username = username.downcase
        user.first_name,user.last_name = user.username.split('@').first.split('.')
      end
      if user.photo.nil?
        filter = Net::LDAP::Filter.eq("mail", username.downcase)
        treebase = "dc=orasi, dc=com"
        f = File.open(Rails.root.join('public', 'photos', user.first_name+user.last_name+'.jpg'), 'w')
        ldap.search(:base => treebase, :filter => filter).first["thumbnailphoto"].first.each_line {|line| f.puts line}
        f.close
        user.photo = '/photos/'+File.basename(f)
      end
      user.save
      return user
    end
    return nil
  end
end

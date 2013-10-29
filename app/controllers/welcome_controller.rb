class WelcomeController < ApplicationController
  skip_before_filter :require_login
  
  def current_user_photo_file
    f = Tempfile.new(['test','.jpg'], Rails.root.join('app','assets','images'),:encoding => 'utf-8')
    f.puts current_user.photo
    f.close
    return f.path
  end
end

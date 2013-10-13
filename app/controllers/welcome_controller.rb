class WelcomeController < ApplicationController
  skip_before_filter :require_login
  def login
    
  end
end

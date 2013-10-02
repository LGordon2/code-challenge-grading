class SilverController < ApplicationController
  def submit
  end

  def result
    @uploaded_file_text = params['script'].read
  end
end

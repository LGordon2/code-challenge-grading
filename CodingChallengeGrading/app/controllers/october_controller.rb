class OctoberController < ApplicationController
  def bronze
  end

  def silver
    @uploaded_file_text = "test"
  end

  def gold
  end
  
  def result
    @uploaded_file_text = "test"
  end
  
  layout 'submit', except: [:result]
end

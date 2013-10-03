class ChallengeMonthController < ApplicationController
  def result
  end
  
  layout Proc.new { |controller| controller.request.request_method == 'GET' ? 'submit' : 'result'}
end

class SilverController < ApplicationController
  def submit
  end

  def result
    @uploaded_file_text = params['script'].read
    @test_case1 = File.read('res/test_case1.vbs')
  end
end

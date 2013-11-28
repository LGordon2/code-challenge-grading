class SeptemberController < ChallengeMonthController

  def bronze
	@comment_reply = Comment.new
  end

  def silver
	@comment_reply = Comment.new
  end

  def gold
	@comment_reply = Comment.new
  end

end

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not be able to make comment without month and league" do
    comment = Comment.new
    comment.comment = "This is a test"
    assert !comment.save
    comment.month = "october"
    assert !comment.save
    comment.month = nil
    comment.league = "silver"
    assert !comment.save
    comment.month = "october"
    assert comment.save
  end
end

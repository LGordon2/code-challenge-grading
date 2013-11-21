class CommentMailer < ActionMailer::Base
  
	default from: "CodeChallenge@Orasi.com"

	def new_comment(user, comment)
		@user = user 
		@url = 'http://example.com/login'
		@comment = comment
		mail(to: User.all_admin_email_addresses, subject: "Comment Posted for #{comment.month.capitalize} #{comment.league.capitalize}")
	end
	def updated_comment(user, old_comment, new_comment)
		@user = user 
		@url = 'http://example.com/login'
		@old_comment = old_comment
		@new_comment = new_comment
		
		mail(to: User.all_admin_email_addresses, subject: "Comment Edited for #{comment.month.capitalize} #{comment.league.capitalize}")
	end
	def deleted_comment(user, comment, deleter)
		@user = user 
		@comment = comment
		@deleter = deleter
		mail(to: User.all_admin_email_addresses, subject: "Comment Deleted for #{comment.month.capitalize} #{comment.league.capitalize}")
	end
end

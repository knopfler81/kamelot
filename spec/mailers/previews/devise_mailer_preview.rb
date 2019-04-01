class DeviseMailerPreview < ActionMailer::Preview

	def confirmation_instructions
		user = User.last
		Devise::Mailer.confirmation_instructions(user)
	end

	def email_changed
		user = User.last
		Devise::Mailer.email_changed(user)
	end

	def reset_password
		user = User.last
		Devise::Mailer.reset_password(user)
	end

	def unlock_instructions
		user = User.last
		Devise::Mailer.unlock_instructions(user)
	end
end
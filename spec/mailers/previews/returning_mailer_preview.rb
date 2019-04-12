class ReturningMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/returning_mailer/we_are_sorry
  def send_returning
  	returning = Returning.first
    ReturningMailer.send_returning(returning)
  end


  def received_returning
		returning = Returning.first
	  ReturningMailer.received_returning(returning)
  end

end

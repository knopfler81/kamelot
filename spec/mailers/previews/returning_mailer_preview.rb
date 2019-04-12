class ReturningMailerPreview < ActionMailer::Preview

  def asked_returning
		returning = Returning.first
	  ReturningMailer.asked_returning(returning)
  end

  def received_returning
		returning = Returning.first
	  ReturningMailer.received_returning(returning)
  end
  
  def send_returning
  	returning = Returning.first
    ReturningMailer.send_returning(returning)
  end
  
end

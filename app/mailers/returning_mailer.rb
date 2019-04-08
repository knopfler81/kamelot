class ReturningMailer < ApplicationMailer

	def send_returning(returning)
	  @returning = returning

	  mail( to: Company.instance.email, subject: "Un retour de marchandise a été demandé")
	end


	def received_returning(returning)
		@returning = returning
		mail(to: @returning.user.email, subject: "Nous avons bien reçu votre retour")
	end

end
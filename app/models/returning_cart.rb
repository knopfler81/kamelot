class ReturningCart

	delegate :sub_total, to: :returning

	def initialize(token:)
	  @token = token
	end

	def returning
	  @returning ||= Returning.find_or_initialize_by(token: @token, status: 0) do |returning|
	    returning.sub_total = 0
	  end
	end
end
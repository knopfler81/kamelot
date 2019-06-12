class Clients::ReturningsController < Clients::ApplicationController
	before_action :find_returning, except: :index

	def index
		@client_returnings = Returning.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
	end
	
	def edit
	end

	def show
		respond_to do |format|
		  format.html { }
		  format.pdf do
		    html = render_to_string(template: "clients/returnings/show.pdf.erb", layout: "layouts/clients/application.pdf.erb", orientation: "Landscape", page_size: 'A4', encoding:"UTF-8" )
		    pdf = WickedPdf.new.pdf_from_string(html)
		    send_data(pdf, filename: "retour_#{@returning.number}.pdf", type: "application/pdf", disposition: 'attachment')     
		  end
		end
	end

	def update
		if @returning.update_attributes(returning_params)
			if @returning.status == "pending"
				redirect_to clients_order_returning_path(@returning), notice: "Votre retour a été demandé"
			else
				redirect_to clients_order_returning_path(@returning), notice: "YO!"
			end
		end
	end

	private

	def find_returning
		@returning = Returning.find(params[:id])
	end
	
	def returning_params
		params.require(:returning).permit(:order_id, :limit_date, :status, :number, :reason, :user_id)
	end
end
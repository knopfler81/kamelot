class Admin::StickersController < Admin::ApplicationController
	protect_from_forgery
	before_action :authenticate_user!, only: [:new, :create,:destroy , :update, :edit]
	before_action :find_sticker, only: [:show]
	before_action :find_product

	def new
		@sticker = Sticker.new
	end

	def create
		@sticker = Sticker.new(sticker_params)
		if @sticker.save!
			redirect_to admin_product_sticker_path(@product, @sticker), notice: "Weeeeeee"
		end
	end

	def show
	  respond_to do |format|
	    format.html { }
	    format.pdf do 
	      html = render_to_string(
	      	template: "admin/stickers/show.pdf.erb", 
	      	layout: "layouts/admin/application.pdf.erb",
	      	viewport_size: '1280x1024',
	      )
	      pdf = WickedPdf.new.pdf_from_string(html)
	      send_data(pdf, filename: "sticker_##{@product.id}.pdf", type: "application/pdf", disposition: 'attachment')     
	    end
	  end
	end

	private

	 def sticker_params
	 	params.require(:sticker).permit(:quantity, :product_id)
	 end

	 def find_sticker
	 	@sticker = Sticker.find(params[:id])
	 end

	 def find_product
	 	@product = Product.friendly.find(params[:product_id])
	 end
	 
end
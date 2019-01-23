class Admin::SizesController < ApplicationController

	before_action :find_size

	def edit
	end


	def update
		@size.update_attributes(size_params)
	end

	def increase
		@size.re_add_in_stock
		if @size.save
			redirect_to admin_products_path, notice: "L'article a été remis en stock !"
		end
	end

	def decrease
		@size.remove_from_stock
		if @size.save
			redirect_to admin_products_path, notice: "Hop ! une vente de faite !"
		end
	end

	private

	def size_params
		params.require(:size).permit(:size_params, :quantity, :product_id)
	end

	def find_size
		@size = Size.find(params[:id])
	end	

end

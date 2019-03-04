class Admin::SuppliersController < Admin::ApplicationController

	before_action :find_supplier, only: [:show, :edit, :update]

	def index
		@suppliers = Supplier.all
	end

	def show
		@supplier = Supplier.find(params[:id])
	end


	def new
		@supplier = Supplier.new
	end

	def create
		@supplier = Supplier.new(supplier_params)
		if @supplier.save
			redirect_to admin_supplier_path(@supplier)
		else
			render :new
		end
	end

	def edit
	end 

	def update
		if @supplier.update_attributes(supplier_params)
			redirect_to  admin_supplier_path(@supplier)
		else
			render :edit
		end
	end

	private 

	def supplier_params
		params.require(:supplier).permit(:company, :address, :zipcode, :city, :country, :phone_number, :email)
	end


	def find_supplier
		@supplier = Supplier.find(params[:id])
	end
end

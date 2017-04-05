class ServicesController < ApplicationController

    def index
		@services=Service.all
		#@review = Review.new
		#@reviews = @service.reviews
	end

	def new
		@service=Service.new
	end

	def create
		@service= Service.new(service_params)
		if @service.save
			redirect_to service_path(@service), notice: "successfully done"
		else
			render action: "new"
		end
    end


	def show
		begin
			@service=Sevice.find(params[:id])
		rescue ActiveRecord::RecordNotFound
	    	redirect_to services_path, notice: "Record Not Found"
	    end
	end

	def edit
		@service=Service.find(params[:id])
	end

	def update
		@service=Service.find(params[:id])
		if service.save
				redirect_to services_path, notice: "successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@service = Service.find(params[:id])
		@service.destroy
			redirect_to service_path(@service), notice: "successfully destroyed"
	end

	private
	
	def service_params
		params[:service].permit(:name)
	end
end
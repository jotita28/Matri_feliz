class ServicesController < ApplicationController
    def index 
    end
    def new 
    @service = Service.new()
    end
    
    def create
        @service = Service.new(services_params)
        @service.save 
        redirect_to root_path
    end
    
    private 

    def services_params
        params.require(:service).permit(:name, :detail, :price, :photo)
    end
end

class BikesController < ApplicationController
  
    def new 
        @bike = Bike.new
    end
    
    def create
        @bike = Bike.new(number: params[:bike][:number], location: params[:bike][:location])
        @bike.save
    end
end
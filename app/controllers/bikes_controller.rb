class BikesController < ApplicationController
    before_action :authenticate_user!

    def index
        @bikes = params[:search].present? ? Bike.where(['lower(location) LIKE ?', "%#{params[:search]}%".downcase]) : nil
    end
  
    def new 
        @bike = Bike.new
    end
    
    def create
        @bike = Bike.new(number: params[:bike][:number], location: params[:bike][:location])
        @bike.save
    end
end
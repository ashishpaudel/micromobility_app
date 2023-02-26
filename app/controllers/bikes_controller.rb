class BikesController < ApplicationController
    before_action :authenticate_user!

    def index
        @bikes = params[:search].present? ? Bike.where(['lower(location) LIKE ?', "%#{params[:search]}%".downcase]) : nil
    end
  
    def new 
        @bike = Bike.new
    end
    
    def create
        @bike = Bike.new(number: params[:number], location: params[:location])
        @bike.save
        flash[:notice] = "bike created successfully"
        redirect_to :root
    end

    def show
        @bike = Bike.find(params[:id])
    end
end
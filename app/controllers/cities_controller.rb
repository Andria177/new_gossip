class CitiesController < ApplicationController

def index

end

def show
  @current_city = City.find(params[:id])
end

end

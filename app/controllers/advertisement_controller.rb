class AdvertisementController < ApplicationController
  def index
     @Advertisement = Advertisement.all
  end

  def show
     @Advertisement = Advertisement.find(params[:id])
  end
end

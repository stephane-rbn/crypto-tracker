class HomeController < ApplicationController
  def index
    StartScrap.new.perform
    @cryptocurrencies = Cryptocurrency.all
    unless params[:cryptocurrency_id].nil?
      @currency = Cryptocurrency.find(params[:cryptocurrency_id])
    end
  end
end

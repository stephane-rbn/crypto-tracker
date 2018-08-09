class HomeController < ApplicationController
  def index
    @cryptocurrencies = Cryptocurrency.all
    unless params[:cryptocurrency_id].nil?
      @currency = Cryptocurrency.find(params[:cryptocurrency_id])
    end
  end
end

class HomeController < ApplicationController
  def index
    @cryptocurrencies = Cryptocurrency.all
  end

  def save
    StartScrap.new.perform
    @cryptocurrencies = Cryptocurrency.all
    redirect_to root_path
  end

  def display
    @cryptocurrencies = Cryptocurrency.all

    unless params[:cryptocurrency_id].nil?
      @currency = Cryptocurrency.find(params[:cryptocurrency_id])
    end

    render :index
  end
end

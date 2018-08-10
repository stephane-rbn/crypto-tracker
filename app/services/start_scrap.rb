require 'nokogiri'
require 'open-uri'

class StartScrap
  def initialize
    @doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  end

  def perform
    save_currencies(build_hash(all_currencies, all_prices))
  end

  private

  def save_currencies(currencies)
    if Cryptocurrency.all.empty?
      currencies.each do |name, value|
        break if value == '$?'
        currency = Cryptocurrency.new(name: name, value: value)
        currency.save
      end
    else
      currencies.each do |name, value|
        break if value == '$?'
        currency = Cryptocurrency.find_by(name: name)
        currency.value = value
        currency.save
      end
    end
  end

  def all_currencies
    currencies = []

    @doc.css('.currency-name-container').each do |element|
      currencies << element.text
    end

    currencies
  end

  def all_prices
    prices = []

    @doc.css('a[class = price]').each do |element|
      prices << element.text
    end

    prices
  end

  def build_hash(currencies, prices)
    currencies_hash = {}

    currencies.each_with_index do |currency, index|
      currencies_hash[currency] = prices[index]
    end

    currencies_hash
  end
end

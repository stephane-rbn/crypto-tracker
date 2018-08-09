# Cryptocurrency tracker

Just another cryptocurrency tracker app built with Ruby on Rails.
To get data, my app scraps the [CoinMarketCap](https://coinmarketcap.com/all/views/all/) platform.

### Installation:

Requirement: you need an internet connection.

- clone this repository
- run `bundle install --without production`
- run `rails db:migrate`
- have some fun

### Issue with this app

If you get an error that looks like `undefined "value=" method for Nil class`, you should run `rails db:drop && rails db:migrate` and it will fix this unknown issue.

On Heroku, run this terrible command:

`heroku restart && heroku pg:reset DATABASE && heroku run rails db:migrate`

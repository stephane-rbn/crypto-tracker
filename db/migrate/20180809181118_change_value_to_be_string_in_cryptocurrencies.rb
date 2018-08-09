class ChangeValueToBeStringInCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    change_column :cryptocurrencies, :value, :string
  end
end

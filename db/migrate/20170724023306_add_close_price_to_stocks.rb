class AddClosePriceToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :close_price, :decimal, precision: 8, scale: 2
  end
end

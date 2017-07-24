class AddDateToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :date, :date
  end
end

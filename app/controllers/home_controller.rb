class HomeController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def search
    start_date = 3.month.ago.strftime("%Y-%m-%d")
    end_date = Date.today.strftime("%Y-%m-%d")

    client = YQuotes::Client.new

    df = client.get_quote(stock_params[:symbol], { p: 'd', s: start_date, e: end_date })

    df.each(:row) do |row|
      @stock = Stock.find_or_create_by(symbol: stock_params[:symbol].upcase, date: row.date)
      @stock.symbol = stock_params[:symbol].upcase
      @stock.date = row.date
      @stock.close_price = row.close
      @stock.save
    end

    respond_to do |format|
      format.js
    end
  end

  private
  def stock_params
    params.permit(:symbol)
  end
end

class HomeController < ApplicationController
  def index
  end

  def search
    @symbol = params[:symbol]
    @duration = params[:duration] || 30
    @stock_data = get_stock_data.as_json.html_safe

    respond_to do |format|
      format.js
    end
  end

  private

  def get_stock_data
    HTTParty.get("http://dev.markitondemand.com/Api/v2/InteractiveChart/json?parameters=#{api_params}")
  end

  def api_params
    { "Normalized": false,
      "NumberOfDays": @duration,
      "DataPeriod": "Day",
      "Elements": [
        {
          "Symbol": @symbol,
          "Type": "price",
          "Params": ["ohlc"]
        }
      ]
    }.to_json
  end
end

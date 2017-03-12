class HomeController < ApplicationController
  def index
    @symbol = params[:symbol]
    @duration = params[:duration]

    puts plot_chart
  end

  def plot_chart
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

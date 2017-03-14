class HomeController < ApplicationController
  def index
    #puts plot_chart
  end

  def search
    @symbol = params[:symbol]
    @duration = params[:duration] || 30

    head :no_content
  end

  private

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

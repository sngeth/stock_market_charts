class HomeController < ApplicationController
  def index
  end

  def search
    @stock = Stock.find_or_create_by(symbol: params[:symbol])

    respond_to do |format|
      format.js
    end
  end

  private
  def stock_params
    params.permit(:symbol)
  end
end

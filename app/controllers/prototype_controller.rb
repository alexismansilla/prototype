class PrototypeController < ApplicationController
  def index
    render json: { message: 'Hello World' }
  end

  def show
    @session = headers
    @bus_travel = BusTravelService.new(params: params).perform
    @search_result = SearchResultService.new(bus_travel: @bus_travel).perform
  end
end

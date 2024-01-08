class PrototypeController < ApplicationController
  def index
    render json: { message: 'Hello World' }
  end

  def show
    @session = headers
    @bus_travel = BusTravelService.new(params: params).perform
    @search_result = SearchResultService.new(bus_travel: @bus_travel).perform
  end

  def redirect_to_rr
    redirect_to "http://local.recorrido.cl:3000/es?client_token=#{params['client_token']}", allow_other_host: true
  end
end

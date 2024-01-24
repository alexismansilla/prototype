class PrototypeController < ApplicationController
  skip_forgery_protection if: -> { action_name == 'show' }

  def index
    render json: { message: 'Hello World' }
  end

  def show
    @session = headers
    @bus_travel = BusTravelService.new(params: params).perform
    @search_result = SearchResultService.new(bus_travel: @bus_travel).perform
    @client_token = headers
  end

  def redirect_to_rr
    redirect_to "http://local.recorrido.cl:3000/es", allow_other_host: true,
                headers: { 'Client-Token' =>  params['client_token'] }
  end
end

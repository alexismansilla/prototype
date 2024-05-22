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
    redirect_post "#{ENV.fetch("BASE_URL_RR")}/es/confirm-booking", params: { 'client_token' =>  params[:client_token] }
  end
end

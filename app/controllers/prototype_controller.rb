class PrototypeController < ApplicationController
  def index
    render json: { message: 'Hello World' }
  end

  def show
    @session = headers
    @bus_travel = BusTravelService.new.perform
  end
end

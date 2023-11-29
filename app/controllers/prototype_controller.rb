class PrototypeController < ApplicationController
  def index
    render json: { message: 'Hello World' }
  end

  def show
    @session = headers['Cookie']
  end
end

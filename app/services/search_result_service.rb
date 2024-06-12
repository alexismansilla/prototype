class SearchResultService
  BUS_OPERATION_ID = ENV.fetch("BUS_OPERATION_ID", 40)

  attr_reader :bus_travel

  def initialize(bus_travel:)
    @bus_travel = JSON.parse(bus_travel)
  end

  def perform
    url = "#{ENV.fetch("BASE_URL_RR")}/api/busbud/es/bus_travels/#{bus_travel_id}/directions/outbound/bus_operators/#{BUS_OPERATION_ID}/search_results.json"

    response = request(url)

    response.body
  end

  private

  def bus_travel_id
    bus_travel['id']
  end

  def request(url)
    connection = Faraday.new(url: url) do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end
    connection.get(url)
  end
end

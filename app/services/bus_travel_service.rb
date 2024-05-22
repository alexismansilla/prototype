class BusTravelService
  attr_reader :params

  def initialize(params:)
    @params = params
  end

  def perform
    url = "#{ENV.fetch("BASE_URL_RR")}/api/busbud/es/bus_travels.json"

    data = {
      bus_travel: {
        departure_city_id: params[:departure_city_id],
        destination_city_id: params[:destination_city_id],
        departure_date: params[:departure_date]
      }
    }
    response = request(url, data)

    return response.body
  end

  private

  def request(url, data)
    connection = Faraday.new(url: url) do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end

    connection.post do |req|
      req.body = data.to_json
    end
  end
end

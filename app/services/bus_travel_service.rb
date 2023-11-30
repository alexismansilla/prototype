class BusTravelService
  def perform
    url = 'http://local.recorrido.cl:3000/api/v2/es/bus_travels.json'

    data = {
      bus_travel: {
        departure_city_id: 9333,
        destination_city_id: 9343,
        departure_date: '01-12-2023'
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

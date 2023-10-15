require 'base64'
require 'json'
require 'net/https'

module Heartrails
  class GeoAPI
    BASE_URL = 'https://geoapi.heartrails.com/api'

    def self.get_prefectures(format = 'json')
      uri = URI.parse("#{BASE_URL}/#{format}?method=getPrefectures")
      response = Net::HTTP.get_response(uri)
      parse_response(response, 'prefecture')
    end

    def self.get_cities(prefecture, format = 'json')
      uri = URI.parse("#{BASE_URL}/#{format}?method=getCities&prefecture=#{URI.encode_www_form_component(prefecture)}")
      response = Net::HTTP.get_response(uri)
      parse_response(response, 'location').map{ | row | row['city'] }
    end

    private

    def self.parse_response(response, field)
      JSON.parse(response.body)['response'][field]
    end
  end
end
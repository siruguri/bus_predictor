module Fetchers
  class AcTransit
    def self.fetch(stop_id)
      #54700, 53888
      uri = URI("https://proxy-prod.511.org/api-proxy/api/v1/transit/stop/?stopcode=#{stop_id}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.ssl_version = :TLSv1
      http.ciphers = "ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:-LOW"
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
      request = Net::HTTP::Get.new uri
      request['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36'
      request['Accept'] = 'application/json, text/plain, */*'
      request['Referer'] = request['Origin'] = 'http://511.org'
      response = http.request request; hash = JSON.parse(response.body)
      
      #hash = JSON.parse test_str
      departures = {}
      hash['Routes'][0]['Routes'].each do |r|
        route_id = r['Code']; # NL
        departures[route_id] = r['Departures'].map { |i| i.to_i} 
      end

      departures
    end
  end
end

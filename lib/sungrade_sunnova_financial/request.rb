require 'faraday'

module SungradeSunnovaFinancial
  class Request
    attr_reader :settings, :requires_access_token, :base_url_meth

    def initialize(settings:, requires_access_token: true, base_url_meth: :base_api_url)
      @settings = settings
      @requires_access_token = requires_access_token
      @base_url_meth = base_url_meth
    end

    %w[get head delete post put patch].each do |meth|
      define_method(meth) do |url: nil, body: {}, headers: {}, &blk|
        run_request(verb: meth, url: url, body: body, headers: headers, &blk)
      end
    end

    def run_request(verb:, url:, body:, headers:)
      response = connection.send(verb, url, body, headers) do |req|
        if requires_access_token
          req.headers.merge!({
            "Authorization" => "Bearer #{settings.access_token}"
          })
        end
        yield(req) if block_given?
      end
      if settings.verify_response && (response.status >= 400 || response.status < 100)
        raise UnsuccessfulRequest.new(response: response)
      end
      response
    end

    def connection
      @connection ||= Faraday.new(url: settings.send(base_url_meth)) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
        faraday.use(Faraday::Response::Logger) if settings.show_connection_logs
      end
    end
  end
end

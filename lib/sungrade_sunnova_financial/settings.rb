module SungradeSunnovaFinancial
  class Settings
    attr_writer *Configuration::FIELDS
    attr_reader :configuration, :verify_response
    attr_writer :access_token

    def initialize(configuration: Configuration.instance, verify_response: true, **opts)
      @configuration = configuration
      @verify_response = verify_response
      opts.each do |meth, val|
        if respond_to?("#{meth}=")
          self.send("#{meth}=", val)
        end
      end
    end

    def base_token_url
      with_required(__method__) do
        @base_token_url || configuration.base_token_url
      end
    end

    def base_api_url
      with_required(__method__) do
        @base_api_url || configuration.base_api_url
      end
    end

    def client_id
      with_required(__method__) do
        @client_id || configuration.client_id
      end
    end

    def client_secret
      with_required(__method__) do
        @client_secret || configuration.client_secret
      end
    end

    def redirect_uri
      with_required(__method__) do
        @redirect_uri || configuration.redirect_uri
      end
    end

    def api_version
      with_required(__method__) do
        @api_version || configuration.api_version
      end
    end

    def show_connection_logs
      @show_connection_logs || configuration.show_connection_logs
    end

    def access_token
      raise NoAccessTokenSet.new("an access token is required for this request") unless @access_token
      @access_token
    end

    private

    def with_required(attribute)
      result = yield
      return result if result
      raise RequiredSettingMissing.new("#{attribute} is a required attribute needed for this request")
    end
  end
end

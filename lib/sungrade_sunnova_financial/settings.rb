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

    Configuration::FIELDS.each do |meth|
      define_method(meth) do
        with_required(meth) do
          if var = instance_variable_get("@#{meth}")
            var
          else
            configuration.send(meth)
          end
        end
      end
    end

    def access_token
      raise NoAccessTokenSet.new("an access token is required for this request") unless @access_token
      @access_token
    end

    private

    def with_required(attribute)
      result = yield
      return result if attribute.to_s == "show_connection_logs"
      return result if result
      raise RequiredSettingMissing.new("#{attribute} is a required attribute needed for this request")
    end
  end
end

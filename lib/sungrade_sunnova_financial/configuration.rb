module SungradeSunnovaFinancial
  class Configuration
    FIELDS = [
      :base_token_url,
      :stage,
      :api_version,
      :base_api_url,
      :client_id,
      :client_secret,
      :redirect_uri,
      :show_connection_logs,
      :logger
    ]
    attr_accessor *FIELDS
    class << self
      def instance
        @instance ||= new
      end
    end
  end
end

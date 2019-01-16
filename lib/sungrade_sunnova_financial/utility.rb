module SungradeSunnovaFinancial
  class Utility
    class << self
      def property_utilities(settings:, lead_id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/utilities")
        end
      end
    end
  end
end

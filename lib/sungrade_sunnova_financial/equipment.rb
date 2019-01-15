module SungradeSunnovaFinancial
  class Equipment
    class << self
      def list_all(settings:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/equipment")
        end
      end
    end
  end
end
